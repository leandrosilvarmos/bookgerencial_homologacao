<%
IncludeModel("Permissao")

Public Model

Public ViewData

Class PermissaoController

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
            Set Model = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_PERMISSAO_SPR", iif(vCdUsuario="","0",CStr(vCdUsuario)) & "," & iif(vCdGrupoPermissao="","0",CStr(vCdGrupoPermissao)),True)
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

        ViewData.Add "Controllers", ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_CONTROLLER_SPR", iif(vCdGrupoPermissao="","0",CStr(vCdGrupoPermissao))&","&iif(vCdUsuario="","0",CStr(vCdUsuario)),True)

        ViewData.Add "Modulos", ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_MODULO_PERM_SPR", iif(vCdGrupoPermissao="","0",CStr(vCdGrupoPermissao))&","&iif(vCdUsuario="","0",CStr(vCdUsuario)),True)

        Set Model = new Permissao

        Model.CdUsuario        = vCdUsuario
        Model.CdGrupoPermissao = vCdGrupoPermissao

        View "Create"
    End Sub

    Public Sub CreatePost(args)
        Dim obj, objh

        Set objh = (new Helper)("Permissao")

        Set obj = objh.PopulateObjectFromArgs(args, Array("CdGrupoPermissao", "CdUsuario", "CdSistema", "Criar", "Listar", "Visualizar", "Editar", "Deletar", "CdUsuarioAlt", "DtAlteracao", "Situacao", "CdController", "CdItem"))

        obj.CdSistema = CdSistema

        obj.CdUsuarioAlt = Session("CdUsuario")
        obj.DtAlteracao = "SYSDATE"

        objh.Insert(obj)

        RedirectToAction "ListMsg", "Permissao", Array("id=" & obj.CdUsuario, "CdGrupoPermissao=" & obj.CdGrupoPermissao)
    End Sub

    Public Sub Edit(vars)
        IncludeModel("GrupoPermissao")
        IncludeModel("Modulo")

        Dim objh, objGrupoPermissao, objModulo, vCdGrupoPermissao, vCdUsuario

        Set objh = (new Helper)("Permissao")

        Set Model = objh.SelectById(vars("id"))

        If Not IsNothing(Model) Then
            ViewData.Add "Usuario", ExecCommandText("SELECT FCAP(U.NOME) AS NOME FROM USUARIO U WHERE U.CD_USUARIO = " & Nvl(Model.CdUsuario, "0"),True)

            Set objGrupoPermissao = (new Helper)("GrupoPermissao")
            ViewData.Add "GrupoPermissao", objGrupoPermissao.SelectBy(Array("CdGrupoPermissao", "NmGrupo"), Array(GetFiltroObj("","CdGrupoPermissao", "=", CStr(Nvl(Model.CdGrupoPermissao,"0")))), Array())

            ViewData.Add "Controller", ExecCommandText("SELECT C.CD_CONTROLLER, C.DS_CONTROLLER FROM CONTROLLER C WHERE C.CD_CONTROLLER = " & Nvl(Model.CdController, "0"),True)

            If Not IsEmpty(Model.CdItem) Then
                Set objModulo = (new Helper)("Modulo")
                ViewData.Add "Modulo", objModulo.SelectBy(Array("CdModulo", "NmModulo"), Array(GetFiltroObj("","CdModulo", "=", CStr(Nvl(Model.CdItem, "-1")))), Array())
            End If
        End If

        View "Edit"
    End Sub

    Public Sub EditPost(args)
        Dim obj, objh

        Set objh = (new Helper)("Permissao")

        Set obj = objh.PopulateObjectFromArgs(args, Array("Criar", "Listar", "Visualizar", "Editar", "Deletar", "CdUsuarioAlt", "DtAlteracao", "Situacao"))

            obj.CdPermissao = args("CdPermissao")

            obj.CdUsuarioAlt = Session("CdUsuario")
            obj.DtAlteracao = "SYSDATE"

        objh.Update(obj)

        RedirectToAction "ListMsg", "Permissao", Array("id=" & args("CdUsuario"), "CdGrupoPermissao=" & args("CdGrupoPermissao"))
    End Sub

    Public Sub Delete(vars)
        IncludeModel("GrupoPermissao")
        IncludeModel("Modulo")

        Dim objh, objGrupoPermissao, objModulo, vCdGrupoPermissao, vCdUsuario

        Set objh = (new Helper)("Permissao")

        Set Model = objh.SelectById(vars("id"))

        If Not IsNothing(Model) Then
            ViewData.Add "Usuario", ExecCommandText("SELECT FCAP(U.NOME) AS NOME FROM USUARIO U WHERE U.CD_USUARIO = " & Nvl(Model.CdUsuario, "0"),True)

            Set objGrupoPermissao = (new Helper)("GrupoPermissao")
            ViewData.Add "GrupoPermissao", objGrupoPermissao.SelectBy(Array("CdGrupoPermissao", "NmGrupo"), Array(GetFiltroObj("","CdGrupoPermissao", "=", CStr(Nvl(Model.CdGrupoPermissao,"0")))), Array())

            ViewData.Add "Controller", ExecCommandText("SELECT C.CD_CONTROLLER, C.DS_CONTROLLER FROM CONTROLLER C WHERE C.CD_CONTROLLER = " & Nvl(Model.CdController, "0"),True)

            If Not IsEmpty(Model.CdItem) Then
                Set objModulo = (new Helper)("Modulo")
                ViewData.Add "Modulo", objModulo.SelectBy(Array("CdModulo", "NmModulo"), Array(GetFiltroObj("","CdModulo", "=", CStr(Nvl(Model.CdItem, "-1")))), Array())
            End If

            ViewData.Add "UsuarioAlt", ExecCommandText("SELECT FCAP(U.NOME) AS NOME FROM USUARIO U WHERE U.CD_USUARIO = " & Nvl(Model.CdUsuarioAlt, "0"),True)
        End If

        View "Delete"
    End Sub

    Public Sub DeletePost(args)
        Dim objh

        Set objh = (new Helper)("Permissao")

        res = objh.Delete(args("CdPermissao"))

        If res Then
            RedirectToAction "ListMsg", "Permissao", Array("id=" & args("CdUsuario"), "CdGrupoPermissao=" & args("CdGrupoPermissao"))
        Else
            RedirectToAction "Delete", "Permissao", Array("id="&CStr(args("id")))
        End If
    End Sub

    Public Sub Details(vars)
        IncludeModel("GrupoPermissao")
        IncludeModel("Modulo")

        Dim objh, objGrupoPermissao, objModulo, vCdGrupoPermissao, vCdUsuario

        Set objh = (new Helper)("Permissao")

        Set Model = objh.SelectById(vars("id"))

        If Not IsNothing(Model) Then
            ViewData.Add "Usuario", ExecCommandText("SELECT FCAP(U.NOME) AS NOME FROM USUARIO U WHERE U.CD_USUARIO = " & Nvl(Model.CdUsuario, "0"),True)

            Set objGrupoPermissao = (new Helper)("GrupoPermissao")
            ViewData.Add "GrupoPermissao", objGrupoPermissao.SelectBy(Array("CdGrupoPermissao", "NmGrupo"), Array(GetFiltroObj("","CdGrupoPermissao", "=", CStr(Nvl(Model.CdGrupoPermissao,"0")))), Array())

            ViewData.Add "Controller", ExecCommandText("SELECT C.CD_CONTROLLER, C.DS_CONTROLLER FROM CONTROLLER C WHERE C.CD_CONTROLLER = " & Nvl(Model.CdController, "0"),True)

            If Not IsEmpty(Model.CdItem) Then
                Set objModulo = (new Helper)("Modulo")
                ViewData.Add "Modulo", objModulo.SelectBy(Array("CdModulo", "NmModulo"), Array(GetFiltroObj("","CdModulo", "=", CStr(Nvl(Model.CdItem, "-1")))), Array())
            End If

            ViewData.Add "UsuarioAlt", ExecCommandText("SELECT FCAP(U.NOME) AS NOME FROM USUARIO U WHERE U.CD_USUARIO = " & Nvl(Model.CdUsuarioAlt, "0"),True)
        End If

        View "Details"
    End Sub
End Class
%>