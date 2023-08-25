<%
IncludeModel("GrupoPermissao")

Public Model

Public ViewData

Class GrupoPermissaoController

    Private Sub Class_Initialize()
        Set ViewData = Server.CreateObject("Scripting.Dictionary")
    End Sub

    Private Sub Class_Terminate()
    End Sub

    Public Sub List()
        Dim objh

        Set objh = (new Helper)("GrupoPermissao")

        Set Model = objh.SelectBy(Array("CdGrupoPermissao","NmGrupo", "DsGrupo", "Situacao"), Array(GetFiltroObj("","CdSistema", "=", CStr(CdSistema))), Array())

        View "List"
    End Sub

    Public Sub Create()
        Set Model = new GrupoPermissao

        View "Create"
    End Sub

    Public Sub CreatePost(args)
        Dim obj, objh

        Set objh = (new Helper)("GrupoPermissao")

        Set obj = objh.PopulateObjectFromArgs(args, Array("NmGrupo", "DsGrupo", "Situacao", "CdUsuarioAlt", "DtAlteracao", "CdSistema"))

        obj.CdSistema = CdSistema

        obj.CdUsuarioAlt = Session("CdUsuario")
        obj.DtAlteracao = "SYSDATE"

        objh.Insert(obj)

        RedirectToAction "List", "GrupoPermissao", Array()
    End Sub

    Public Sub Edit(vars)
        Dim objh

        Set objh = (new Helper)("GrupoPermissao")

        Set Model = objh.SelectById(vars("id"))

        View "Edit"
    End Sub

    Public Sub EditPost(args)
        Dim obj, objh

        Set objh = (new Helper)("GrupoPermissao")

        Set obj = objh.PopulateObjectFromArgs(args, Array("NmGrupo", "DsGrupo", "Situacao", "CdUsuarioAlt", "DtAlteracao"))

            obj.CdGrupoPermissao = args("CdGrupoPermissao")

            obj.CdUsuarioAlt = Session("CdUsuario")
            obj.DtAlteracao = "SYSDATE"

        objh.Update(obj)

        RedirectToAction "List", "GrupoPermissao", Array()
    End Sub

    Public Sub Delete(vars)
        Dim objh

        Set objh = (new Helper)("GrupoPermissao")

        Set Model = objh.SelectById(vars("id"))

        If Not IsNothing(Model) Then
            ViewData.Add "UsuarioAlt", ExecCommandText("SELECT FCAP(U.NOME) AS NOME FROM USUARIO U WHERE U.CD_USUARIO = " & Nvl(Model.CdUsuarioAlt, "0"),True)
        End If

        View "Delete"
    End Sub

    Public Sub DeletePost(args)
        Dim objh

        Set objh = (new Helper)("GrupoPermissao")

        res = objh.Delete(args("CdGrupoPermissao"))

        If res Then
            RedirectToAction "List", "GrupoPermissao", Array()
        Else
            RedirectToAction "Delete", "GrupoPermissao", Array("id="&CStr(args("id")))
        End If
    End Sub

    Public Sub Details(vars)
        Dim objh

        Set objh = (new Helper)("GrupoPermissao")

        Set Model = objh.SelectById(vars("id"))

        If Not IsNothing(Model) Then
            ViewData.Add "UsuarioAlt", ExecCommandText("SELECT FCAP(U.NOME) AS NOME FROM USUARIO U WHERE U.CD_USUARIO = " & Nvl(Model.CdUsuarioAlt, "0"),True)
        End If

        View "Details"
    End Sub
End Class
%>