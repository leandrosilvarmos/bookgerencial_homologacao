<%
'===============================================================
'==   Models
'===============================================================
    Class NavigationSubItem
        Private p_actionName
        Private p_descricao
        Private p_icone
        Private p_permissao

        Public Property Get ActionName()
            ActionName = p_actionName
        End Property

        Public Property Let ActionName(val)
            p_actionName = val
        End Property

        Public Property Get Descricao()
            Descricao = p_descricao
        End Property

        Public Property Let Descricao(val)
            p_descricao = val
        End Property

        Public Property Get Icone()
            Icone = p_icone
        End Property

        Public Property Let Icone(val)
            p_icone = val
        End Property

        Public Property Get Permissao()
            Permissao = p_permissao
        End Property

        Public Property Let Permissao(val)
            p_permissao = val
        End Property
    End Class

    Class NavigationItem
        Private p_actionName
        Private p_controllerName
        Private p_descricao
        Private p_icone
        Private p_route
        Private p_permissao

        Public SubItens

        Public Property Get ActionName()
	        ActionName = p_actionName
        End Property

        Public Property Let ActionName(val)
	        p_actionName = val
        End Property

        Public Property Get ControllerName()
	        ControllerName = p_controllerName
        End Property

        Public Property Let ControllerName(val)
	        p_controllerName = val
        End Property

        Public Property Get Descricao()
	        Descricao = p_descricao
        End Property

        Public Property Let Descricao(val)
	        p_descricao = val
        End Property

        Public Property Get Icone()
	        Icone = p_icone
        End Property

        Public  Property Let Icone(val)
	        p_icone = val
        End Property

        Public Property Get Route()
	        Route = p_route
        End Property

        Public Property Let Route(val)
	        p_route = val
        End Property

        Public Property Get Permissao()
	        Permissao = p_permissao
        End Property

        Public Property Let Permissao(val)
	        p_permissao = val
        End Property
    End Class

    Class NavigationGroup
        Private p_descricao
        Private p_icone

        Public Itens

        Public Property Get Descricao()
	        Descricao = p_descricao
        End Property

        Public Property Let Descricao(val)
	        p_descricao = val
        End Property

        Public Property Get Icone()
	        Icone = p_icone
        End Property

        Public Property Let Icone(val)
	        p_icone = val
        End Property
    End Class

    Class NavigationController
        Private p_value
        Private p_descricao
        Private p_grupo

        Public Property Get Value()
	        Value = p_value
        End Property

        Public  Property Let Value(val)
	        p_value = val
        End Property

        Public Property Get Descricao()
	        Descricao = p_descricao
        End Property

        Public  Property Let Descricao(val)
	        p_descricao = val
        End Property

        Public Property Get Grupo()
	        Grupo = p_grupo
        End Property

        Public  Property Let Grupo(val)
	        p_grupo = val
        End Property
    End Class

'===============================================================
'==   Itens
'===============================================================
Public Menus, Permissoes

Public Function CarregaMenusJson()
    Dim oJSON, jsonString, idGrupo, idItem, idSub, vIsPermissao, vLoad

    vLoad = True

    If IsNavigationFile Then
        If FileExists("json\navigation.json") Then
            jsonString = FileToString(Server.MapPath("Json") & "\navigation.json", "ISO-8859-1")
        Else
            vLoad = False
        End If
    Else
        jsonString = GetNavigationItensJson().jsString
    End If

    idItem = 0
    idSub = 0
    vIsPermissao = False

    Set oJSON = New aspJSON

    If vLoad Then
        oJSON.loadJSON(jsonString)
    End If

    Set Menus = Server.CreateObject("Scripting.Dictionary")

    If Not IsEmpty(oJSON.data("grupos")) Then
        For Each r In oJSON.data("grupos")
            Set g = oJSON.data("grupos").item(r)
                
            Dim objGrupo
            Set objGrupo = New NavigationGroup

            objGrupo.Descricao = g.item("descricao")
            objGrupo.Icone = g.item("icone")
                
            Set objGrupo.Itens = Server.CreateObject("Scripting.Dictionary")
                
            For Each r2 In g.item("itens")
                Set i = g.item("itens").item(r2)

                Dim objItem
                Set objItem = New NavigationItem
                    
                objItem.ControllerName = i.item("controllerName")
                objItem.Descricao = i.item("descricao")

                If VerificarPermissao(i.item("controllerName"), i.item("permissao")) Then
                    objItem.ActionName = i.item("actionName")
                    objItem.Route = i.item("route")
                    objItem.Permissao = i.item("permissao")
                End If
            
                Set objItem.SubItens = Server.CreateObject("Scripting.Dictionary")

                For Each r3 In i.item("subItens")
                    Set s = i.item("subItens").item(r3)
                    
                    If VerificarPermissao(i.item("controllerName"), s.item("permissao")) Then
                        Dim objSubItem
                        Set objSubItem = New NavigationSubItem

                        objSubItem.ActionName = s.item("actionName")
                        objSubItem.Descricao = s.item("descricao")
                        objSubItem.Icone = s.item("icone")
                        objSubItem.Permissao = s.item("permissao")

                        objItem.SubItens.Add idSub, objSubItem
                    End If

                    idSub = idSub + 1
                Next

                If Not IsEmpty(objItem.ActionName) Or objItem.SubItens.Count > 0 Then
                    objGrupo.Itens.Add idItem, objItem
                End If

                idItem = idItem + 1
            Next

            Menus.Add idGrupo, objGrupo

            idGrupo = idGrupo + 1
        Next
    End If
End Function

Public Function GetNavigationItensJson()
    Dim retorno, vCdSistema, vCdUsuario, arrGrupo, arrController, arrAction

    If IsEmpty(CdSistema) Or IsNull(CdSistema) Then
        vCdSistema = -1
    Else
        vCdSistema = CdSistema
    End If

    If len(Session("CdUsuario")) > 0 Then
        vCdUsuario = CStr(Session("CdUsuario"))
    Else
        vCdUsuario = "NULL"
    End If

    Set retorno = jsObject()
    Set arrGrupo = jsArray()
    Set arrController = jsArray()
    Set arrAction = jsArray()

    Dim vMenus, vCdGrupo, vCdGrupoNext, vCdController, vCdControllerNext

    Set vMenus = ExecProcedure("OBTER_CONTROLLERS_ACTIONS_SPR", CStr(vCdUsuario) & "," & CStr(vCdSistema), True)

    If Not IsNothing(vMenus) Then
        For i = 0 To (vMenus.Count - 1) Step 1
            vCdGrupo = vMenus.GetValue("CD_GRUPO_CONTROLLER",i)
            vCdController = vMenus.GetValue("CD_CONTROLLER",i)

            If i < (vMenus.Count - 1) Then
                vCdGrupoNext = vMenus.GetValue("CD_GRUPO_CONTROLLER",i+1)
                vCdControllerNext = vMenus.GetValue("CD_CONTROLLER",i+1)
            Else
                vCdGrupoNext = ""
                vCdControllerNext = ""
            End If

            If CStr(vMenus.GetValue("INICIAL",i)) <> "1" Then
                Dim objActionJs

                Set objActionJs = jsObject()

                objActionJs("actionName") = vMenus.GetValue("NM_ACTION",i)
                objActionJs("descricao") = vMenus.GetValue("DS_ACTION",i)
                objActionJs("icone") = vMenus.GetValue("ICONE_ACTION",i)
                objActionJs("permissao") = vMenus.GetValue("PERMISSAO",i)

                Set arrAction(null) = objActionJs
            End If

            If vCdController <> vCdControllerNext Then
                Dim objControllerJs

                Set objControllerJs = jsObject()

                objControllerJs("controllerName") = vMenus.GetValue("NM_CONTROLLER",i)
                objControllerJs("descricao") = vMenus.GetValue("DS_CONTROLLER",i)
                
                If CStr(vMenus.GetValue("INICIAL",i)) = "1" Then
                    objControllerJs("actionName") = vMenus.GetValue("NM_ACTION",i)
                    objControllerJs("route") = iif(vMenus.GetValue("ROUTE",i) = "1", True, False)
                    objControllerJs("permissao") = vMenus.GetValue("PERMISSAO",i)
                Else
                    objControllerJs("actionName") = ""
                    objControllerJs("route") = false
                    objControllerJs("permissao") = ""
                End If

                Set objControllerJs("subItens") = arrAction
        
                Set arrController(null) = objControllerJs

                Set arrAction = jsArray()
            End If

            If vCdGrupo <> vCdGrupoNext Then
                Dim objGrupoJs

                Set objGrupoJs = jsObject()

                objGrupoJs("descricao") = vMenus.GetValue("DESCRICAO",i)
                objGrupoJs("icone") = vMenus.GetValue("ICONE_GRUPO",i)
                Set objGrupoJs("itens") = arrController
        
                Set arrGrupo(null) = objGrupoJs

                Set arrController = jsArray()
            End If
        Next

        Set retorno("grupos") = arrGrupo
    End If
    
    Set arrGrupo = Nothing
    Set arrController = Nothing
    Set arrAction = Nothing

    Set GetNavigationItensJson = retorno
End Function

Public Function GetNavigationItens()
    Dim retorno, strgrupo, stritens

    retorno = ""
    strgrupo = ""
    stritens = ""

    For Each grupo in Menus.Items

        If Not IsNull(grupo.itens) And grupo.itens.Count > 0 Then
            strgrupo = strgrupo & "<li class='*grp_active*'>"
            strgrupo = strgrupo & "<a href='#'><i class='fa " & grupo.icone & "'></i>"
            strgrupo = strgrupo & "<span class='nav-label'>" & grupo.descricao & "</span>"
            strgrupo = strgrupo & "<span class='fa arrow'></span></a>"

            strgrupo = strgrupo & "<ul class='nav nav-second-level'>"

            For Each item In grupo.itens.Items
                If Not item.route Then
                    Dim active

                    active = IsLinkActive(item.controllerName, item.actionName)

                    For Each subitem In item.subItens.Items
                        Dim subActive 
                        subActive = IsLinkActive(item.controllerName, subitem.actionName)

                        If subActive <> "" Then
                            active = subActive
                            Exit For
                        End If
                    Next

                    stritens = stritens & "<li class='" & active & "'>"
                    stritens = stritens & "<a href='" & Html.ActionUrl(item.controllerName, item.actionName, "") & "'>"
                    stritens = stritens & item.descricao
                    stritens = stritens & "</a></li>"

                    If active <> "" Then 
                        strgrupo = Replace(strgrupo, "*grp_active*", active)
                    End If
                End If
            Next

            strgrupo = strgrupo & stritens

            strgrupo = strgrupo & "</ul>"

            If stritens = "" Then
                strgrupo = ""
            End If

            strgrupo = Replace(strgrupo, "*grp_active*", "")

            strgrupo = strgrupo & "</li>"

            retorno = retorno & strgrupo

            stritens = ""
            strgrupo = ""
        End If

    Next

    GetNavigationItens = retorno
End Function

'===============================================================
'==   Permissoes
'===============================================================
Public Function CarregaPermissoes()
    Dim vCdSistema, vCdUsuario, vPermissoes

    If IsVerificarPermissoes Then
        If IsEmpty(CdSistema) Or IsNull(CdSistema) Then
            vCdSistema = -1
        Else
            vCdSistema = CdSistema
        End If

        If len(Session("CdUsuario")) > 0 Then
            vCdUsuario = CStr(Session("CdUsuario"))
        Else
            vCdUsuario = "NULL"
        End If

        Set vPermissoes = ExecProcedure("OBTER_PERMISSOES_SPR", CStr(vCdUsuario)  & "," & CStr(vCdSistema), True)

        If Not IsNothing(vPermissoes) Then
            Set Permissoes = Server.CreateObject("Scripting.Dictionary")

            For i = 0 To (vPermissoes.Count - 1) Step 1
                Permissoes.Add vPermissoes.GetValue("NM_CONTROLLER",i), vPermissoes.GetValue("PERMISSOES",i)
            Next
        End If
    Else
        Set Permissoes = Server.CreateObject("Scripting.Dictionary")
    End If

    Set vPermissoes = Nothing
End Function

Public Function VerificarPermissao(pController, pPermissao)
    Dim vPermissoes, ret

    ret = False
    vPermissoes = Empty

    If IsVerificarPermissoes Then
        If IsEmpty(pPermissao) Or IsNull(pPermissao) Or pPermissao = "" Then
            ret = True
        Else
            If Not IsEmpty(Permissoes) Then
                vPermissoes = Permissoes.Item(pController)
            End If

            If Not IsEmpty(vPermissoes) And Not IsNull(vPermissoes) Then
                For Each vPermissao In Split(vPermissoes,",")
                    If vPermissao = pPermissao Then
                        ret = True
                        Exit For
                    End If
                Next
            End If
        End IF
    Else
        ret = True
    End IF

    VerificarPermissao = ret
End Function

Public Function VerificarPermissaoAction(pControllerName, pActionName)
    Dim vRetorno

    vRetorno = False
    
    If IsVerificarPermissoes Then
        If Not IsEmpty(Menus) Then
            For Each grupo In Menus.Items
                For Each item In grupo.itens.Items
                    If item.controllerName = pControllerName Then
                        If item.actionName = pActionName Or item.actionName & "Post" = pActionName Or item.actionName & "Msg" = pActionName Then                   
                            vRetorno = True
                            Exit For
                        End If

                        For Each subitem In item.subItens.Items
                            If subitem.actionName = pActionName Or subitem.actionName & "Post" = pActionName Or subitem.actionName & "Msg" = pActionName Then
                                vRetorno = True
                            End If

                            If vRetorno = True Then
                                Exit For
                            End If
                        Next
                    End If
                Next

                If vRetorno = True Then
                    Exit For
                End If
            Next
        End If
    Else
        ret = True
    End IF

    VerificarPermissaoAction = vRetorno
End Function

Public Function VerificarPermissoesPadroes(pControllerName, pActionName)
    Dim vRetorno

    vRetorno = True

    If IsVerificarPermissoes Then
        If pControllerName <> defaultController Then
            Dim find
        
            find = False
        
            For Each vAction In Split(defaultActionList,",")
                If vAction = pActionName Or vAction & "Post" = pActionName Or vAction & "Msg" = pActionName Then
                    find = True
                    Exit For
                End If
            Next

            If find Then
                vRetorno = VerificarPermissaoAction(pControllerName, pActionName)
            End If
        End If
    End If

    VerificarPermissoesPadroes = vRetorno
End Function

'===============================================================
'==   ViewLayout
'===============================================================
Public Function GetBreadcrumbs(pId)
    Dim retorno

    retorno = ""

    If IsLinkActive("Home", "Index") = "active" Then
        retorno = "<ol class='breadcrumb'>"

        retorno = retorno & "<li>"
        retorno = retorno & "<strong>Início</strong>"
        retorno = retorno & "</li>"

        retorno = retorno & "</ol>"
    Else
        For Each grupo In Menus.Items
            For Each item In grupo.itens.Items
                If IsLinkActive(item.controllerName, item.actionName) <> "" Then
                    retorno = retorno & "<ol class='breadcrumb'>"

                    retorno = retorno & "<li>"
                    retorno = retorno & "<a href='#'>" + grupo.descricao + "</a>"
                    retorno = retorno & "</li>"
                    retorno = retorno & "<li class='active'>"
                    retorno = retorno & "<strong>" + item.descricao + "</strong>"
                    retorno = retorno & "</li>"

                    retorno = retorno & "</ol>"

                    GetBreadcrumbs = retorno
                End If

                For Each subitem In item.subItens.Items
                    If IsLinkActive(item.controllerName, subitem.actionName) <> "" Then
                        retorno = retorno & "<ol class='breadcrumb'>"

                        retorno = retorno & "<li>"
                        retorno = retorno & "<a href='#'>" & grupo.descricao & "</a>"
                        retorno = retorno & "</li>"
                        retorno = retorno & "<li>"

                        If item.route Then
                            retorno = retorno & "<a href='" & Html.ActionUrl(item.controllerName, item.actionName, "&id=" & pId) & "'>" & item.descricao & "</a>"
                        Else
                            retorno = retorno & "<a href='" & Html.ActionUrl(item.controllerName, item.actionName, "") & "'>" & item.descricao & "</a>"
                        End If

                        retorno = retorno & "</li>"
                        retorno = retorno & "<li class='active'>"
                        retorno = retorno & "<strong>" & subitem.descricao & "</strong>"
                        retorno = retorno & "</li>"

                        retorno = retorno & "</ol>"

                        GetBreadcrumbs = retorno
                    End If
                Next
            Next
        Next
    End If

    GetBreadcrumbs = retorno
End Function

Public Function GetTitle(ReturnHtml)
    Dim vControllerName, vActionName
    
    vControllerName = Controller
    
    vActionName = Action

    GetTitle = GetTitleII(vControllerName, vActionName, ReturnHtml)
End Function

Public Function GetTitleII(pControllerName, pActionName, ReturnHtml)
    Dim retorno

    retorno = ""

    If pControllerName = "Home" Then
        retorno = iif(ReturnHtml, "<h2>Início</h2>", "Início")
    ElseIf pControllerName = "Erro" Then
        retorno = iif(ReturnHtml, "<h2>Erro</h2>", "Erro")
    ElseIf pControllerName = "Help" Then
            retorno = iif(ReturnHtml, "<h2>Help</h2>", "Help")
    Else
        For Each grupo In Menus.Items
            For Each item In grupo.itens.Items
                If item.controllerName = pControllerName Then
                    If ReturnHtml Then
                        retorno = "<h2>" & item.descricao
                        For Each subitem In item.subItens.Items
                            If subitem.actionName = pActionName Then
                                retorno = retorno & "   <small>" & subitem.descricao & "</small>"
                            End If
                        Next
                        retorno = retorno & "</h2>"
                    Else
                        retorno = item.descricao
                    End If
                End If
            Next
        Next
    End If

    GetTitleII = retorno
End Function

'===============================================================
'==   ActionLink
'===============================================================
Public Function GetActionLinkV(pActionName, pPrintText)
    Dim vControllerName

    vControllerName = Controller

    GetActionLinkV = GetActionLinkBase(pActionName, vControllerName, "", "", "", pPrintText, True)
End Function

Public Function GetActionLinkIV(pActionName, pId, pPrintText)
    Dim vControllerName

    vControllerName = Controller

    GetActionLinkIV = GetActionLinkIII(pActionName, vControllerName, pId, pPrintText)
End Function

Public Function GetActionLinkIII(pActionName, pControllerName, pId, pPrintText)
    GetActionLinkIII = GetActionLinkII(pActionName, pControllerName, "", pId, pPrintText)
End Function

Public Function GetActionLinkII(pActionName, pControllerName, pText, pId, pPrintText)
    GetActionLinkII = GetActionLink(pActionName, pControllerName, pText, "", pId, pPrintText)
End Function

Public Function GetActionLink(pActionName, pControllerName, pText, pIcone, pId, pPrintText)
    GetActionLink = GetActionLinkBase(pActionName, pControllerName, pText, pIcone, pId, pPrintText, false)
End Function

Public Function GetActionLinkBase(pActionName, pControllerName, pText, pIcone, pId, pPrintText, pChrId)
    Dim vText, vId, vRetorno

    vRetorno = ""
    vText = ""
    vId = ""

    If pChrId Then
        vId = "id={id}"
    Else
        If pId <> "" And Not IsNull(pId) Then
            vId = "id=" & pId
        End If
    End If

    For Each grupo In Menus.Items
        For Each item In grupo.itens.Items
            If item.controllerName = pControllerName Then
                If item.actionName = pActionName Or item.actionName & "Post" = pActionName Or item.actionName & "Msg" = pActionName Then
                    Dim vIcone

                    vIcone = item.icone

                    If pIcone <> "" Then
                        vIcone = pIcone
                    End If

                    If pText <> "" Then
                        If pPrintText Then
                            vText = pText
                        End If
                                        
                        vRetorno = eHtml.ActionLink(" " + vText, pControllerName, pActionName, vId, "class='fa fa-lg " & vIcone & "' title=" & pText)
                        Exit For
                    End If

                    If pPrintText Then
                        vText = item.descricao
                    End If
                                        
                    vRetorno = eHtml.ActionLink(" " + vText, pControllerName, pActionName, vId, "class='fa fa-lg " & vIcone & "' title=" & item.descricao)
                    Exit For
                End If

                For Each subitem In item.subItens.Items
                    If subitem.actionName = pActionName Or subitem.actionName & "Post" = pActionName Or subitem.actionName & "Msg" = pActionName Then
                        vIcone = subitem.icone

                        If pIcone <> "" Then
                            vIcone = pIcone
                        End If

                        If pText <> "" Then
                            If pPrintText Then
                                vText = pText
                            End If
                                                
                            vRetorno = eHtml.ActionLink(" " + vText, pControllerName, pActionName, vId, "class='fa fa-lg " & vIcone & "' title=" & pText)
                            Exit For
                        End If

                        If pPrintText Then
                            vText = subitem.descricao
                        End If

                        vRetorno = eHtml.ActionLink(" " + vText, pControllerName, pActionName, vId, "class='fa fa-lg " & vIcone & "' title=" & subitem.descricao)
                        Exit For
                    End If

                    If vRetorno <> "" Then
                        Exit For
                    End If
                Next
            End If
        Next

        If vRetorno <> "" Then
            Exit For
        End If
    Next

    GetActionLinkBase = vRetorno
End Function
%>