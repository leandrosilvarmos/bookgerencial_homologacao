<%
IncludeModel("Login")

Public Model

Public ViewData

Class LoginController

    Private Sub Class_Initialize()
        Set ViewData = Server.CreateObject("Scripting.Dictionary")
    End Sub

    Private Sub Class_Terminate()
    End Sub

    Public Sub Entrar()
        'SetHttpReferer()

        View "Entrar"
    End Sub

    Public Sub EntrarMsg(args)
        ViewData.Add "Erro", args("mensagem")
        ViewData.Add "Alert", args("alert")

        Entrar()
    End Sub

    Public Sub EntrarPost(args)
        Dim vUsuario, vSenha, vLogin, vMensagem, vAlert
        
        vUsuario  = Trim(args("DsLogin"))
        vSenha    = Trim(args("DsSenha"))
        vMensagem = ""
        vAlert    = "danger"
        
        If vUsuario <> "" And vSenha <> "" Then
            Set vLogin = ExecProcedure("BOOK_GERENCIAL_PKG.VERIFICAR_LOGIN_USUARIO_SPR", "'" & vUsuario & "','" & vSenha & "'", True)
        
            If vLogin.Count > 0 Then
                If vLogin.GetValue("SUCESSO",0) = "S" Then
                	If vLogin.GetValue("HEVA",0) = "S" Then
                		Response.Redirect "HTTP://bookgerencial.hva.org.br"
                	End If

                    Session("CdUsuario") = vLogin.GetValue("CD_USUARIO",0)
                    Session("NmUsuario") = vLogin.GetValue("NOME",0)

                    Response.Cookies(CookieName)("CdUsuario") = Session("CdUsuario")
                    Response.Cookies(CookieName)("NmUsuario") = Session("NmUsuario")

                    If IsTest Then Session("IsTest") = true End If
                        
                    GravarLogAcesso vLogin.GetValue("CD_USUARIO",0), vUsuario, "A", vLogin.GetValue("MENSAGEM",0) 'A - Acesso liberado

                    'If Session("http_referer") <> "" Then
                    '    Response.Redirect("?" & Session("http_referer"))
                    'Else
                        RedirectToAction "Index", "Home", Array()
                    'End If
                Else
                    Dim vCdUsuario
                        
                    vCdUsuario = vLogin.GetValue("CD_USUARIO",0)

                    If vLogin.GetValue("SUCESSO",0) = "N;SITUACAO" Then
                        vAlert = "warning"
                    End If

                    vMensagem = vLogin.GetValue("MENSAGEM",0)
                        
                    GravarLogAcesso iif(vCdUsuario = "", "NULL", vCdUsuario), vUsuario, "B", vMensagem 'B - Acesso bloqueado
                End If
            End If
        Else
            vMensagem = "msgLoginEmpty"
        End If

        RedirectToAction "EntrarMsg", "Login", Array("partial=true", "mensagem="&vMensagem, "alert="&vAlert)
    End Sub

    Public Sub Sair
        Session.Abandon()
        
        Response.Cookies(CookieName) = ""

        RedirectToAction "Entrar", "Login", Array("partial=true")
    End Sub

    Function SetHttpReferer()
        Dim vUrl

        vUrl = Request.ServerVariables("http_referer")

        If vUrl <> "" Then
            Dim arrUrl

            arrUrl = Split(vUrl, "?")

            If Ubound(arrUrl) > 0 Then
                vUrl = arrUrl(1)
            Else
                vUrl = ""
            End If
        End If

        If InStr(1, vUrl, "controller=Login") = 0 Then
            Session("http_referer") = vUrl
        End If
    End Function

    Public Sub List()
        Dim objh

        Set objh = (new Helper)("Login")

        Set Model = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_LOGIN_SPR", "",True)

        View "List"
    End Sub

    Public Sub Create()
        Set Model = new Login

        ViewData.add "Usuarios", ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_USUARIO_SPR", "NULL",True)

        View "Create"
    End Sub

    Public Sub CreatePost(args)
        Dim obj, objh

        Dim vVerifLoginBool, vVerifLogin, vMensagem, vAlert

        Set objh = (new Helper)("Login")

        Set obj = objh.PopulateObjectFromArgs(args, Array("CdUsuario","DsLogin","Situacao","DsSenha", "CdUsuarioAlt"))
        
        obj.CdUsuarioAlt = Session("CdUsuario")

        If IsNothing(obj.DsSenha) Or IsEmpty(obj.DsSenha) Or obj.DsSenha = "" Then
            obj.DsSenha =  "123456"
        End If

        Set vVerifLogin = ExecProcedure("BOOK_GERENCIAL_PKG.VERIFICAR_LOGIN_EXISTENTE_SPR", "'"&obj.DsLogin&"',0",True)

        vMensagem = ""

        If IsNothing(vVerifLogin) Then
            vVerifLoginBool = False
            vMensagem = "Falha ao verificar Login!"
        Else
            If vVerifLogin.GetValue("RESPOSTA",0) = "S" Then
                vVerifLoginBool = False
                vMensagem = "msgLoginExistente"
            Else
                If vVerifLogin.GetValue("MENSAGEM",0) <> "" Then
                    vVerifLoginBool = False
                    vMensagem = vVerifLogin.GetValue("MENSAGEM",0)
                Else
                    vVerifLoginBool = True
                    vMensagem = ""
                End If
            End If
        End If

        If vVerifLoginBool Then
            objh.Insert(obj)

            RedirectToAction "List", "Login", Array()
        Else
            Set Model = obj

            ViewData.Add "Erro", vMensagem
            ViewData.Add "Alert", "error"

            ViewData.add "Usuarios", ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_USUARIO_SPR", "NULL",True)

            View "Create"
        End If
    End Sub

    Public Sub Edit(vars)
        Dim objh

        Set objh = (new Helper)("Login")

        Set Model = objh.SelectById(vars("id"))

        If Not IsNothing(Model) Then
            If  Model.CdUsuario <> "" Then
                ViewData.add "Usuario", ExecCommandText("SELECT FCAP(U.NOME) AS NOME FROM USUARIO U WHERE U.CD_USUARIO = " & Model.CdUsuario,True)
            End If
        End If

        View "Edit"
    End Sub

    Public Sub EditPost(args)
        Dim obj, objh, vUsuarioOld, vVerifLogin

        Set objh = (new Helper)("Login")

        Set obj = objh.PopulateObjectFromArgs(args, Array("DsLogin","Situacao","DtAlteracao","CdUsuarioAlt", "DsSenha"))

            obj.Cdusuario = args("CdUsuario")

            obj.CdLogin = args("CdLogin")

            obj.CdUsuarioAlt = Session("CdUsuario")

            obj.DtAlteracao = "SYSDATE"

        If IsNothing(obj.DsSenha) Or IsEmpty(obj.DsSenha) Or obj.DsSenha = "" Then
            obj.UpdateMetadata =  Array("DsLogin","Situacao","DtAlteracao","CdUsuarioAlt")
        End If

        Set vVerifLogin = ExecProcedure("BOOK_GERENCIAL_PKG.VERIFICAR_LOGIN_EXISTENTE_SPR", "'"&obj.DsLogin&"',"&Nvl(obj.CdLogin,"NULL"),True)

        vMensagem = ""

        If IsNothing(vVerifLogin) Then
            vVerifLoginBool = False
            vMensagem = "Falha ao verificar Login!"
        Else
            If vVerifLogin.GetValue("RESPOSTA",0) = "S" Then
                vVerifLoginBool = False
                vMensagem = "msgLoginExistente"
            Else
                If vVerifLogin.GetValue("MENSAGEM",0) <> "" Then
                    vVerifLoginBool = False
                    vMensagem = vVerifLogin.GetValue("MENSAGEM",0)
                Else
                    vVerifLoginBool = True
                    vMensagem = ""
                End If
            End If
        End If

        If vVerifLoginBool Then
            objh.Update(obj)

            RedirectToAction "List", "Login", Array()
        Else
            Set Model = obj

            ViewData.Add "Erro", vMensagem
            ViewData.Add "Alert", "error"

            ViewData.add "Usuario", ExecCommandText("SELECT FCAP(U.NOME) AS NOME FROM USUARIO U WHERE U.CD_USUARIO = " & Model.CdUsuario,True)

            View "Edit"
        End If
    End Sub

    Public Sub Delete(vars)
        Dim objh

        Set objh = (new Helper)("Login")

        Set Model = objh.SelectById(vars("id"))

        If  Model.CdUsuario <> "" Then
            ViewData.add "Usuario", ExecCommandText("SELECT FCAP(U.NOME) AS NOME FROM USUARIO U WHERE U.CD_USUARIO = " & Model.CdUsuario,True)
        End If

        If  Model.CdUsuarioAlt <> "" Then
            ViewData.add "UsuarioAlt", ExecCommandText("SELECT FCAP(U.NOME) AS NOME FROM USUARIO U WHERE U.CD_USUARIO = " & Model.CdUsuarioAlt,True)
        End If

        View "Delete"
    End Sub

    Public Sub DeletePost(args)
        Dim objh

        Set objh = (new Helper)("Login")

        res = objh.Delete(args("CdLogin"))

        If res Then
            RedirectToAction "List", "Login", Array()
        Else
            RedirectToAction "Delete", "Login", Array("id="&CStr(args("id")))
        End If
    End Sub

    Public Sub Details(vars)
        Dim objh

        Set objh = (new Helper)("Login")

        Set Model = objh.SelectById(vars("id"))

        If  Model.CdUsuario <> "" Then
            ViewData.add "Usuario", ExecCommandText("SELECT FCAP(U.NOME) AS NOME FROM USUARIO U WHERE U.CD_USUARIO = " & Model.CdUsuario,True)
        End If

        If  Model.CdUsuarioAlt <> "" Then
            ViewData.add "UsuarioAlt", ExecCommandText("SELECT FCAP(U.NOME) AS NOME FROM USUARIO U WHERE U.CD_USUARIO = " & Model.CdUsuarioAlt,True)
        End If

        View "Details"
    End Sub

    Public Sub AlterarSenha()
        AlterarSenhaMsg(null)
    End Sub

    Public Sub AlterarSenhaMsg(args)
        If Not IsNull(args) Then
            ViewData.Add "Erro", args("mensagem")
            ViewData.Add "Alert", args("alert")
        End If

        Dim objh, vCdLogin

        Set vCdLogin = ExecCommandText("SELECT MAX(L.CD_LOGIN) AS CD_LOGIN FROM BOOK_LOGIN L WHERE L.CD_USUARIO = " & Session("CdUsuario"),True)

        Set objh = (new Helper)("Login")

        If Not IsNull(vCdLogin.GetValue("CD_LOGIN",0)) Then
            Set Model = objh.SelectById(vCdLogin.GetValue("CD_LOGIN",0))

            If Not IsNothing(Model) Then
                If  Model.CdUsuario <> "" Then
                    ViewData.add "Usuario", ExecCommandText("SELECT FCAP(U.NOME) AS NOME FROM USUARIO U WHERE U.CD_USUARIO = " & Model.CdUsuario,True)
                End If
            End If

            View "AlterarSenha"
        Else
            RedirectToAction "Index", "Home", Array()
        End If
    End Sub

    Public Sub AlterarSenhaPost(args)
        Dim obj, objh, vVerifSenhaBool, vMensagem

        Set objh = (new Helper)("Login")

        Set obj = objh.PopulateObjectFromArgs(args, Array("DsSenha","DtAlteracao","CdUsuarioAlt"))

            obj.Cdusuario = args("CdUsuario")

            obj.CdLogin = args("CdLogin")

            obj.CdUsuarioAlt = Session("CdUsuario")

            obj.DtAlteracao = "SYSDATE"

        vMensagem = ""
        vVerifSenhaBool = True

        If IsNothing(obj.DsSenha) Or IsEmpty(obj.DsSenha) Or obj.DsSenha = "" _
           Or IsNothing(args("DsSenhaConfirm")) Or IsEmpty(args("DsSenhaConfirm")) Or args("DsSenhaConfirm") = "" Then
            vVerifSenhaBool = False
            vMensagem = "msgLoginSenhaEmpty"
        End If

        If args("DsSenhaConfirm") <> obj.DsSenha Then
            vVerifSenhaBool = False
            vMensagem = "msgLoginSenhaDiferente"
        End If

        If vVerifSenhaBool Then
            objh.Update(obj)

            RedirectToAction "AlterarSenhaMsg", "Login", Array("mensagem=msgLoginSenhaSucesso","alert=success")
        Else
            RedirectToAction "AlterarSenhaMsg", "Login", Array("mensagem="&vMensagem,"alert=error")
        End If
    End Sub

End Class
%>
