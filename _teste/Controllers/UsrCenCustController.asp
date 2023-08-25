<%
IncludeModel("UsrCenCust")

Public Model

Public ViewData

Class UsrCenCustController

    Private Sub Class_Initialize()
        Set ViewData = Server.CreateObject("Scripting.Dictionary")
    End Sub

    Private Sub Class_Terminate()
    End Sub

    Public Sub List()
        ListMsg(Nothing)
    End Sub

    Public Sub ListMsg(args)
        IncludeModel("GrupoPermissao")

        Dim objh, objGrupoPermissao, vCdGrupoPermissao, vCdUsuario

        If Not IsNothing(args) Then
            If Not lcase(args("id")) = "null" Then
                vCdUsuario = args("id")
            Else
                vCdUsuario = ""
            End If

            If Not lcase(args("CdGrupoPermissao")) = "null" Then
                vCdGrupoPermissao = args("CdGrupoPermissao")
            Else
                vCdGrupoPermissao = ""
            End If
        Else
            vCdUsuario        = ""
            vCdGrupoPermissao = ""
        End If

        ViewData.Add "CdUsuario", iif(vCdUsuario <> "", vCdUsuario, null)
        ViewData.Add "CdGrupoPermissao", iif(vCdGrupoPermissao <> "", vCdGrupoPermissao, null)

        Set objGrupoPermissao = (new Helper)("GrupoPermissao")

        ViewData.Add "GruposPermissao", objGrupoPermissao.SelectBy(Array("CdGrupoPermissao", "NmGrupo"), Array(GetFiltroObj("","CdSistema", "=", CStr(CdSistema))), Array())

        ViewData.Add "Logins", ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_LOGIN_SPR", "",True)

        If vCdUsuario <> "" Or vCdGrupoPermissao <> "" Then
            Set Model = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_CENTRO_CUSTO_SPR", iif(vCdUsuario="","0",CStr(vCdUsuario)) & "," & iif(vCdGrupoPermissao="","0",CStr(vCdGrupoPermissao)),True)
        End If

        View "List"
    End Sub

    Public Sub Create(vars)
        IncludeModel("GrupoPermissao")

        Dim objGrupoPermissao, vCdGrupoPermissao, vCdUsuario

        If Not IsNothing(vars) Then
            If Not lcase(vars("id")) = "null" Then
                vCdUsuario = vars("id")
            Else
                vCdUsuario = ""
            End If

            If Not lcase(vars("CdGrupoPermissao")) = "null" Then
                vCdGrupoPermissao = vars("CdGrupoPermissao")
            Else
                vCdGrupoPermissao = ""
            End If
        Else
            vCdUsuario        = ""
            vCdGrupoPermissao = ""
        End If

        If vCdUsuario <> "" Then
            ViewData.Add "Usuario", ExecCommandText("SELECT FCAP(U.NOME) AS NOME FROM USUARIO U WHERE U.CD_USUARIO = " & vCdUsuario,True)
        End If

        If vCdGrupoPermissao <> "" Then
            Set objGrupoPermissao = (new Helper)("GrupoPermissao")

            ViewData.Add "GrupoPermissao", objGrupoPermissao.SelectBy(Array("CdGrupoPermissao", "NmGrupo"), Array(GetFiltroObj("","CdGrupoPermissao", "=", CStr(vCdGrupoPermissao))), Array())
        End If

        ViewData.Add "CentroCustos", ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_CEN_CUSTO_USR_SPR", iif(vCdUsuario="","0",CStr(vCdUsuario))&","&iif(vCdGrupoPermissao="","0",CStr(vCdGrupoPermissao)),True)

        Set Model = new UsrCenCust

        Model.CdUsuario        = vCdUsuario
        Model.CdGrupoPermissao = vCdGrupoPermissao

        View "Create"
    End Sub

    Public Sub CreatePost(args)
        Dim obj, objh

        Set objh = (new Helper)("UsrCenCust")

        Set obj = objh.PopulateObjectFromArgs(args, Array("CdGrupoPermissao", "CdUsuario", "Situacao", "CdCentroCusto"))

        objh.Insert(obj)

        RedirectToAction "ListMsg", "UsrCenCust", Array("id=" & obj.CdUsuario, "CdGrupoPermissao=" & obj.CdGrupoPermissao)
    End Sub

    Public Sub Edit(vars)
        IncludeModel("GrupoPermissao")
        IncludeModel("CentroCusto")

        Dim objh, objGrupoPermissao, objModulo, vCdGrupoPermissao, vCdUsuario

        Set objh = (new Helper)("UsrCenCust")

        Set Model = objh.SelectById(vars("id"))

        If Not IsNothing(Model) Then
            ViewData.Add "Usuario", ExecCommandText("SELECT FCAP(U.NOME) AS NOME FROM USUARIO U WHERE U.CD_USUARIO = " & Nvl(Model.CdUsuario, "0"),True)

            Set objGrupoPermissao = (new Helper)("GrupoPermissao")
            ViewData.Add "GrupoPermissao", objGrupoPermissao.SelectBy(Array("CdGrupoPermissao", "NmGrupo"), Array(GetFiltroObj("","CdGrupoPermissao", "=", CStr(Nvl(Model.CdGrupoPermissao,"0")))), Array())

            Set objCentroCusto = (new Helper)("CentroCusto")
            ViewData.Add "CentroCusto", objCentroCusto.SelectBy(Array("CdCentroCusto", "NmCentroCusto"), Array(GetFiltroObj("","CdCentroCusto", "=", CStr(Nvl(Model.CdCentroCusto, "-1")))), Array())
        End If

        View "Edit"
    End Sub

    Public Sub EditPost(args)
        Dim obj, objh

        Set objh = (new Helper)("UsrCenCust")

        Set obj = objh.PopulateObjectFromArgs(args, Array("Situacao"))

            obj.CdControle = args("CdControle")

        objh.Update(obj)

        RedirectToAction "ListMsg", "UsrCenCust", Array("id=" & args("CdUsuario"), "CdGrupoPermissao=" & args("CdGrupoPermissao"))
    End Sub

    Public Sub Delete(vars)
        IncludeModel("GrupoPermissao")
        IncludeModel("CentroCusto")

        Dim objh, objGrupoPermissao, objCentroCusto, vCdGrupoPermissao, vCdUsuario

        Set objh = (new Helper)("UsrCenCust")

        Set Model = objh.SelectById(vars("id"))

        If Not IsNothing(Model) Then
            ViewData.Add "Usuario", ExecCommandText("SELECT FCAP(U.NOME) AS NOME FROM USUARIO U WHERE U.CD_USUARIO = " & Nvl(Model.CdUsuario, "0"),True)

            Set objGrupoPermissao = (new Helper)("GrupoPermissao")
            ViewData.Add "GrupoPermissao", objGrupoPermissao.SelectBy(Array("CdGrupoPermissao", "NmGrupo"), Array(GetFiltroObj("","CdGrupoPermissao", "=", CStr(Nvl(Model.CdGrupoPermissao,"0")))), Array())

            Set objCentroCusto = (new Helper)("CentroCusto")
            ViewData.Add "CentroCusto", objCentroCusto.SelectBy(Array("CdCentroCusto", "NmCentroCusto"), Array(GetFiltroObj("","CdCentroCusto", "=", CStr(Nvl(Model.CdCentroCusto, "-1")))), Array())
        End If

        View "Delete"
    End Sub

    Public Sub DeletePost(args)
        Dim objh

        Set objh = (new Helper)("UsrCenCust")

        res = objh.Delete(args("CdControle"))

        If res Then
            RedirectToAction "ListMsg", "UsrCenCust", Array("id=" & args("CdUsuario"), "CdGrupoPermissao=" & args("CdGrupoPermissao"))
        Else
            RedirectToAction "Delete", "UsrCenCust", Array("id="&CStr(args("id")))
        End If
    End Sub

    Public Sub Details(vars)
        IncludeModel("GrupoPermissao")
        IncludeModel("CentroCusto")

        Dim objh, objGrupoPermissao, objCentroCusto, vCdGrupoPermissao, vCdUsuario

        Set objh = (new Helper)("UsrCenCust")

        Set Model = objh.SelectById(vars("id"))

        If Not IsNothing(Model) Then
            ViewData.Add "Usuario", ExecCommandText("SELECT FCAP(U.NOME) AS NOME FROM USUARIO U WHERE U.CD_USUARIO = " & Nvl(Model.CdUsuario, "0"),True)

            Set objGrupoPermissao = (new Helper)("GrupoPermissao")
            ViewData.Add "GrupoPermissao", objGrupoPermissao.SelectBy(Array("CdGrupoPermissao", "NmGrupo"), Array(GetFiltroObj("","CdGrupoPermissao", "=", CStr(Nvl(Model.CdGrupoPermissao,"0")))), Array())

            Set objCentroCusto = (new Helper)("CentroCusto")
            ViewData.Add "CentroCusto", objCentroCusto.SelectBy(Array("CdCentroCusto", "NmCentroCusto"), Array(GetFiltroObj("","CdCentroCusto", "=", CStr(Nvl(Model.CdCentroCusto, "-1")))), Array())
        End If

        View "Details"
    End Sub
End Class
%>