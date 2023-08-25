<!--#include file="utils.asp" -->

<%
Function Route()
    Dim vars

    Set vars = CollectVariables()

    If Not (ControllersExists(ControllerName)) Then
        Response.Clear
        Response.Status="401 Unauthorized"
        Response.Write(response.Status)
        Response.End
    End If

    Route = False

    Dim controllerInstance
    Set controllerInstance = Eval ( " new " +  ControllerName)

    Dim actionCallString

    If (Instr(1,action,"Post",1)>0) Then
        actionCallString = " controllerInstance." + action + "(Request.Form)"
    ElseIf Not (IsNothing(vars)) Then
        actionCallString = " controllerInstance." + action + "(vars)"
    Else
        actionCallString = " controllerInstance." + action + "()"
    End If

    Eval (actionCallString)

    Route = true
End Function


Function RouteDebug ()
    Dim controller, action , vars

    controller  = Request.QueryString("controller")
    action      = Request.QueryString("action")

    Response.Write(controller)
    Response.Write(action)

    Dim key, keyValue

    For Each key In Request.Querystring
        keyValue = Request.Querystring(key)

        'ignore service keys
        If InStr(1,"controller, action, partial, print",key,1)=0 Then
            Response.Write( key + " = " + keyValue )
        End If
    Next
End Function

Function CollectVariables
    Dim key, keyValue

    Set results = Server.CreateObject("Scripting.Dictionary")

    For Each key In Request.Querystring
        keyValue = Request.Querystring(key)

        'ignore service keys
        If InStr(1,"controller, action, partial, print",key,1)=0 Then
            results.Add key,keyValue
        End If
    Next

    If results.Count=0 Then
        Set CollectVariables = Nothing
    Else
        Set CollectVariables = results
    End If
End Function

Function actionClean(strtoclean)
    Dim objRegExp, outputStr

    Set objRegExp = New RegExp

    outputStr = strtoclean

    objRegExp.IgnoreCase = True
    objRegExp.Global = True
    objRegExp.Pattern = "\W"

    outputStr = objRegExp.Replace(outputStr, "")

    actionClean = outputStr
End Function

Function JsonResult()
    Response.ContentType = "application/json"
End Function

Function View(pAction)
    If Controller = "Erro" Or Controller = "Help" Then
        Include("/_mvc/Views/"&Controller&"/"&pAction&".asp")
    Else
        Include("Views/"&Controller&"/"&pAction&".asp")
    End IF
End Function

Function RedirectToAction(pAction, pController, pArgs())
    Dim StrArgs

    StrArgs = ""

    For Each arg In pArgs
        StrArgs = StrArgs & "&" & CStr(arg)
    Next

    Response.Redirect("?controller="&pController&"&action="&pAction&StrArgs)
End Function

Function ControllersExists(pControllerName)
    If pControllerName = "ErroController" Or pControllerName = "HelpController"  Then
        ControllersExists = FileExists("/_mvc/Controllers/" & pControllerName & ".asp")
    Else
        ControllersExists = FileExists("Controllers/" & pControllerName & ".asp")
    End If
End Function

Function IncludeModel(pModel)
    Include("Models/"&pModel&".asp")
End Function

Function RenderBody()
    If Not Route() Then
        result = RouteDebug ()
    End If
End Function

Function RederStyles()
    If FileExists("Content/css/controllers/"&Controller&"CSS.asp") Then
        Include("Content/css/controllers/"&Controller&"CSS.asp")
    End If
End Function

Function RederScripts()
    If FileExists("Content/js/controllers/"&Controller&"JS.asp") Then
        Include("Content/js/controllers/"&Controller&"JS.asp")
    End If
End Function

Function IsLinkActive(pController, pAction)
    If pAction = "" Then
        pAction = Action
    End If

    If Controller = pController And (Action = pAction Or Action = pAction & "Post" Or Action = pAction & "Msg") Then
        IsLinkActive = "active"
    Else
        IsLinkActive = ""
    End If
End Function

Function GetStrRoute()
    Dim key, keyValue, strRoute

    strRoute = ""

    For Each key In Request.Querystring
        keyValue = Request.Querystring(key)

        'ignore service keys
        If InStr(1,"controller, action, partial, print",key,1)=0 Then
            If strRoute <> "" Then
                strRoute = strRoute & ";"
            End If

            strRoute = strRoute & key & "=" & keyValue
        End If
    Next

    GetStrRoute = strRoute
End Function

Public Function VerificarErros()
    If Controller <> "Erro" Then
        If Err.Number <> 0 Then
            Dim vErrNumber, vErrDescription, vErrSource, vRoute, vExcecao, vCdExcecao

            vErrNumber      = Err.Number
            vErrDescription = Trim(Err.Description)
            vErrSource      = Trim(Err.Source)

            vRoute          = GetStrRoute()

            Set vExcecao = GravarLogExcecao(vErrNumber, vErrDescription, vErrSource, Controller, Action, vRoute)

            If Not IsEmpty(vExcecao.values) Then
                vCdExcecao = vExcecao.GetValue("CD_LOG_EXCECAO",0)

                RedirectToAction "Index", "Erro", Array("partial=true","CdLogExcecao="&vCdExcecao)
            End If

            RedirectToAction "Index", "Erro", Array("partial=true","errController="&Controller,"errAction="&Action, "errRoute="&vRoute,"errNumber="&vErrNumber,"errDescription="&vErrDescription,"errSource="&vErrSource)
        End If
    End If
End Function

Function ClearAllObjects()
    Set action = Nothing
    Set actionCallString = Nothing
    Set active = Nothing
    Set aj_dicttype = Nothing
    Set aj_item = Nothing
    Set aj_keyvals = Nothing
    Set aj_label = Nothing
    Set arrAction = Nothing
    Set arrController = Nothing
    Set arrGrupo = Nothing
    Set arrIndex = Nothing
    Set arrRows = Nothing
    Set arrUrl = Nothing
    Set bFI = Nothing
    Set charcode = Nothing
    Set charmap = Nothing
    Set checked = Nothing
    Set ClassName = Nothing
    Set Collection = Nothing
    Set cols = Nothing
    Set ColTypes = Nothing
    Set Columns = Nothing
    Set controller = Nothing
    Set controllerInstance = Nothing
    Set controllerName = Nothing
    Set Count = Nothing
    Set data = Nothing
    Set depth = Nothing
    Set descricao = Nothing
    Set Display = Nothing
    Set eHtml = Nothing
    Set elChild = Nothing
    Set elRoot = Nothing
    Set execResult = Nothing
    Set find = Nothing
    Set first = Nothing
    Set fso = Nothing
    Set haystack = Nothing
    Set Html = Nothing
    Set i = Nothing
    Set idGrupo = Nothing
    Set idItem = Nothing
    Set idSub = Nothing
    Set index = Nothing
    Set Itens = Nothing
    Set j = Nothing
    Set jsc = Nothing
    Set jsonString = Nothing
    Set JsonTexts = Nothing
    Set key = Nothing
    Set keyPair = Nothing
    Set keyPairs = Nothing
    Set keyValue = Nothing
    Set Kind = Nothing
    Set last = Nothing
    Set level = Nothing
    Set limiter = Nothing
    Set lisItem = Nothing
    Set List = Nothing
    Set Menus = Nothing
    Set Model = Nothing
    Set names = Nothing
    Set obj = Nothing
    Set objActionJs = Nothing
    Set objAfericao = Nothing
    Set objControllerJs = Nothing
    Set objEmail = Nothing
    Set objEnum = Nothing
    Set objGrupo = Nothing
    Set objGrupoJs = Nothing
    Set objh = Nothing
    Set objItem = Nothing
    Set objJson = Nothing
    Set objMatch = Nothing
    Set ObjModel = Nothing
    Set objName = Nothing
    Set objRegEx = Nothing
    Set objRegExp = Nothing
    Set objStream = Nothing
    Set objSubItem = Nothing
    Set objUsuario = Nothing
    Set oConn = Nothing
    Set oConnection = Nothing
    Set oJSON = Nothing
    Set optChecked = Nothing
    Set optSelected = Nothing
    Set optText = Nothing
    Set optValue = Nothing
    Set outputStr = Nothing
    Set parameter = Nothing
    Set Permissoes = Nothing
    Set QuotedVars = Nothing
    Set record = Nothing
    Set records = Nothing
    Set rendered = Nothing
    Set resStr = Nothing
    Set results = Nothing
    Set ret = Nothing
    Set retorno = Nothing
    Set retValue = Nothing
    Set rs = Nothing
    Set rsProc = Nothing
    Set s = Nothing
    Set selectSQL = Nothing
    Set Sequence = Nothing
    Set StrArgs = Nothing
    Set strData = Nothing
    Set strgrupo = Nothing
    Set stritens = Nothing
    Set strlen = Nothing
    Set strReturn = Nothing
    Set strSQL = Nothing
    Set strSQLId = Nothing
    Set strVars = Nothing
    Set subActive = Nothing
    Set Table = Nothing
    Set td = Nothing
    Set Texts = Nothing
    Set TypeLib = Nothing
    Set vAction = Nothing
    Set vActionName = Nothing
    Set vAlert = Nothing
    Set valor = Nothing
    Set valores = Nothing
    Set Value = Nothing
    Set ValueEl = Nothing
    Set vars = Nothing
    Set vBtnEdit = Nothing
    Set vBtnDelete = Nothing
    Set vBtnDetails = Nothing
    Set vCargos = Nothing
    Set vCdCargo = Nothing
    Set vCdCompetencia = Nothing
    Set vCdCompetenciaTemp = Nothing
    Set vCdController = Nothing
    Set vCdControllerNext = Nothing
    Set vCdGrupo = Nothing
    Set vCdGrupoNext = Nothing
    Set vCdPergunta = Nothing
    Set vCdPerguntaTemp = Nothing
    Set vCdRespAuto = Nothing
    Set vCdRespGestor = Nothing
    Set vCdResposta = Nothing
    Set vCdSistema = Nothing
    Set vCdTipoCompetencia = Nothing
    Set vCdTipoCompetenciaTemp = Nothing
    Set vCdUsuario = Nothing
    Set vClass = Nothing
    Set vColumnIndex = Nothing
    Set vController = Nothing
    Set vControllerName = Nothing
    Set vDescricao = Nothing
    Set vDsCompetencia = Nothing
    Set vDsPergunta = Nothing
    Set vDsTipoCompetencia = Nothing
    Set vEtapa = Nothing
    Set vIcone = Nothing
    Set vId = Nothing
    Set ViewData = Nothing
    Set vLogin = Nothing
    Set vMensagem = Nothing
    Set vMenus = Nothing
    Set vNmCompetencia = Nothing
    Set vNmTipoCompetencia = Nothing
    Set vNome = Nothing
    Set vOrdem = Nothing
    Set vPath = Nothing
    Set vPreenchimento = Nothing
    Set vRet = Nothing
    Set vRetorno = Nothing
    Set vRetStr = Nothing
    Set vSenha = Nothing
    Set vSqlOrder = Nothing
    Set vStr = Nothing
    Set vStrCampos = Nothing
    Set vStrColumns = Nothing
    Set vStrFiltro = Nothing
    Set vText = Nothing
    Set vType = Nothing
    Set vUrl = Nothing
    Set vUsuario = Nothing
    Set vValor = Nothing
    Set xmlDoc = Nothing
    Set xmlStr = Nothing
End Function
%>
