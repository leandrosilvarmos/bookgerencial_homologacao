<!--#include file="Utils/mvcLib.asp" -->

<%
'==================================================================================
'   Configura��es do sistema
'==================================================================================
'
'   Title (string): T�tulo do Sistema
'
'   CdSistema (int): C�digo do Sistema
'       De acordo com registro no banco - tabela 'SISTEMA', campo 'CD_SISTEMA'
'
'   Layout (string): Caminho f�sico do arquivo de layout da p�gina
'       Se n�o definido utiliza caminho especificado na constante 'defaultLayout'
'
'   IsTest (boolean): Modo de teste
'       True - Base de testes; tratamento de erros desabilitado
'       False (default) - Base de produ��o; tratamento de erros habilitado
'
'   IsNavigationFile (boolean): Itens de navega��o (menus e links) do arquivo
'       True - Carregar itens de navega��o do arquivo (\Json\navigation.json)
'       False (default) - Carregar itens de navega��o do banco de dados (procedure 'OBTER_CONTROLLERS_ACTIONS_SPR')   
'
'   IsVerificarPermissoes (boolean): Verifica��o de Permiss�es
'       True (default) - Habilitar a verifica��o de permiss�es, permitir acesso somente se tiver permiss�o
'       False - Desabilitar verifica��o de permiss�es, permitir acesso sem ter permiss�o
'
'   IsVerificarLogin (boolean): Verifica��o de Login (Session("CdUsuario"))
'       True (default) - Habilitar a verifica��o de login, permitir acesso somente se logado
'       False - Desabilitar verifica��o de login, permitir acesso sem estar logado
'
'   IsCookie (boolean): Verificar o uso de Cookies
'       True - Habilitar o uso de Cookies
'       False - Desabilitar o uso de Cookies
'
'   LoginPage (string): Caminho virtual da p�gina de login
'       Se n�o definido utiliza caminho especificado na constante 'defaultLogin'
'
'   EmailTest (string): Endere�o de email para envio de emails no modo teste (IsTest = True)
'       Se n�o definido utiliza email especificado na constante 'defaultEmailTest'
'
'   CookieName (string): Nome do cookie principal
'       Se n�o definido utiliza caminho especificado na constante 'defaultCookieName'
'
'==================================================================================
'   Defini��es e Declara��es Globais
'==================================================================================
    If Not IsTest Then
        On Error Resume Next
    End If

    Session.LCID = 1046

    Response.Buffer = True
    Response.Clear()

    Const defaultController = "Home"
    Const defaultAction     = "Index"
    Const defaultLayout     = "/_mvc/Views/Shared/_Layout.asp"
    Const defaultLogin      = "?controller=Login&action=Entrar&partial=true"
    Const defaultActionList = "Index,List,Details,Create,Edit,Delete"
    Const defaultEmailTest  = "wesley.ormundo@hesap.org.br"
    Const defaultCookieName = "Intranet"
    Const defaultVerifLogin = True
    Const defaultVerifPerm  = True

    If IsEmpty(EmailTest) Or IsNull(EmailTest) Or (EmailTest = "") Then
        EmailTest = defaultEmailTest
    End If

'==================================================================================
'   Verifica��o de Login
'==================================================================================
    If IsEmpty(LoginPage) Or IsNull(LoginPage) Or (LoginPage = "") Then
        LoginPage = defaultLogin
    End If

    If IsEmpty(IsVerificarLogin) Or IsNull(IsVerificarLogin) Or (IsVerificarLogin = "") Then
        IsVerificarLogin = defaultVerifLogin
    End If

    If IsEmpty(IsVerificarPermissoes) Or IsNull(IsVerificarPermissoes) Or (IsVerificarPermissoes = "") Then
        IsVerificarPermissoes = defaultVerifPerm
    End If

    If IsEmpty(CookieName) Or IsNull(CookieName) Or (CookieName = "") Then
        CookieName = defaultCookieName
    End If

    If UCase(Request.QueryString("controller")) <> UCase("Login") And UCase(Request.QueryString("controller")) <> UCase("Erro") And UCase(Request.QueryString("controller")) <> UCase("Help") Then
        If IsVerificarLogin Then
            If IsCookie Then
                For Each cookie in Request.Cookies(CookieName)
                    Session(cookie) = Request.Cookies(CookieName)(cookie)
                Next
            End If

            If len(Session("CdUsuario")) = 0 Then
                Response.Redirect LoginPage
            End If
        End If
    End If

    CarregaPermissoes()

'==================================================================================
'   Defini��o - Controller e Action
'==================================================================================
    Public ControllerName
    Public Controller, Action

    Controller = Trim(CStr(Request.QueryString("controller")))
    Action     = actionClean(Trim(CStr(Request.QueryString("action"))))

    If IsEmpty(Controller) Or IsNull(Controller) Or (Controller = "") Then
        Controller = defaultController
    End If

    If IsEmpty(Action) Or IsNull(Action) Or (Action = "") Then
        Action = defaultAction
    End If

    ControllerName = Controller & "Controller"

    If (ControllersExists(ControllerName)) Then
        If ControllerName = "ErroController" Or ControllerName = "HelpController" Then
            Include("/_mvc/Controllers/" & ControllerName & ".asp")
        Else
            Include("Controllers/" & ControllerName & ".asp")
        End If
    End If

'==================================================================================
'   Renderiza��o da p�gina
'==================================================================================
    Dim partial, IsPrint

    partial = Request.QueryString("partial")

    IsPrint = Request.QueryString("print")

    If IsEmpty(IsPrint) Or IsNull(IsPrint) Or IsPrint = "" Then
        IsPrint = false
    End If

    If Not(IsEmpty(partial) Or IsNull(partial)) Then
        If Not Route() Then
            result = RouteDebug()
        End If
    Else
        If IsEmpty(Layout) Or IsNull(Layout) Then
            Layout = defaultLayout
        End If

        CarregaMenusJson()

        If Not VerificarPermissoesPadroes(Controller, Action) Then
            RedirectToAction defaultAction, defaultController, Array()
        End If

        Include(Layout)
    End If

    If Not IsTest Then
        VerificarErros()
    End If

    ClearAllObjects

    If Not IsTest Then
        On Error Goto 0
    End If
%>
