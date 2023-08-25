<%
IncludeModel("UsrGrupoPerm")

Public Model

Public ViewData

Class UsrGrupoPermController

    Private Sub Class_Initialize()
        Set ViewData = Server.CreateObject("Scripting.Dictionary")
    End Sub

    Private Sub Class_Terminate()
    End Sub

    Public Sub List()
        ListMsg(Nothing)
    End Sub

    Public Sub ListMsg(args)
        Dim vCdUsuario

        If Not IsNothing(args) Then
            If Not lcase(args("id")) = "null" Then
                vCdUsuario = args("id")
            Else
                vCdUsuario = ""
            End If
        Else
            vCdUsuario = ""
        End If

        ViewData.Add "CdUsuario", iif(vCdUsuario <> "", vCdUsuario, null)

        ViewData.Add "Logins", ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_LOGIN_SPR", "",True)

        If vCdUsuario <> "" Then
            Set Model = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_USR_GRUPO_PERM_SPR", iif(vCdUsuario="","0",CStr(vCdUsuario)),True)
        End If
        View "List"
    End Sub

    Public Sub Create(vars)
        Dim vCdUsuario

        If Not IsNothing(vars) Then
            If Not lcase(vars("id")) = "null" Then
                vCdUsuario = vars("id")
            Else
                vCdUsuario = ""
            End If
        Else
            vCdUsuario = ""
        End If

        If vCdUsuario <> "" Then
            ViewData.Add "Usuario", ExecCommandText("SELECT FCAP(U.NOME) AS NOME FROM USUARIO U WHERE U.CD_USUARIO = " & vCdUsuario,True)
        End If

        ViewData.Add "GruposPermissao", ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_GRP_PERM_USR_SPR", iif(vCdUsuario="","0",CStr(vCdUsuario)),True)

        Set Model = new UsrGrupoPerm

        Model.CdUsuario = vCdUsuario

        View "Create"
    End Sub

    Public Sub CreatePost(args)
        Dim obj, objh

        Set objh = (new Helper)("UsrGrupoPerm")

        Set obj = objh.PopulateObjectFromArgs(args, Array("CdGrupoPermissao", "CdUsuario", "Situacao", "CdUsuarioAlt", "DtAlteracao"))

        obj.CdUsuarioAlt = Session("CdUsuario")
        obj.DtAlteracao = "SYSDATE"

        objh.Insert(obj)

        RedirectToAction "ListMsg", "UsrGrupoPerm", Array("id="&obj.CdUsuario)
    End Sub

    Public Sub Edit(vars)
        Dim objh

        Set objh = (new Helper)("UsrGrupoPerm")

        Set Model = objh.SelectById(vars("id"))

        If Not IsNothing(Model) Then
            ViewData.Add "Usuario", ExecCommandText("SELECT FCAP(U.NOME) AS NOME FROM USUARIO U WHERE U.CD_USUARIO = " &  iif(Model.CdUsuario="","0",CStr(Model.CdUsuario)),True)

            ViewData.Add "GrupoPermissao", ExecCommandText("SELECT GP.CD_GRUPO_PERMISSAO, GP.NM_GRUPO FROM GRUPO_PERMISSAO GP WHERE GP.CD_GRUPO_PERMISSAO = " &  iif(Model.CdGrupoPermissao="","0",CStr(Model.CdGrupoPermissao)),True) 
        End If

        View "Edit"
    End Sub

    Public Sub EditPost(args)
        Dim obj, objh

        Set objh = (new Helper)("UsrGrupoPerm")

        Set obj = objh.PopulateObjectFromArgs(args, Array("Situacao", "CdUsuarioAlt", "DtAlteracao"))

            obj.CdControle = args("CdControle")

            obj.CdUsuarioAlt = Session("CdUsuario")
            obj.DtAlteracao = "SYSDATE"

        objh.Update(obj)

        RedirectToAction "ListMsg", "UsrGrupoPerm", Array("id=" & args("CdUsuario"))
    End Sub

    Public Sub Delete(vars)
        Dim objh

        Set objh = (new Helper)("UsrGrupoPerm")

        Set Model = objh.SelectById(vars("id"))

        If Not IsNothing(Model) Then
            ViewData.Add "Usuario", ExecCommandText("SELECT FCAP(U.NOME) AS NOME FROM USUARIO U WHERE U.CD_USUARIO = " &  iif(Model.CdUsuario="","0",CStr(Model.CdUsuario)),True)

            ViewData.Add "GrupoPermissao", ExecCommandText("SELECT GP.CD_GRUPO_PERMISSAO, GP.NM_GRUPO FROM GRUPO_PERMISSAO GP WHERE GP.CD_GRUPO_PERMISSAO = " &  iif(Model.CdGrupoPermissao="","0",CStr(Model.CdGrupoPermissao)),True) 

            ViewData.Add "UsuarioAlt", ExecCommandText("SELECT FCAP(U.NOME) AS NOME FROM USUARIO U WHERE U.CD_USUARIO = " & Nvl(Model.CdUsuarioAlt, "0"),True)
        End If

        View "Delete"
    End Sub

    Public Sub DeletePost(args)
        Dim objh

        Set objh = (new Helper)("UsrGrupoPerm")

        res = objh.Delete(args("CdControle"))

        If res Then
            RedirectToAction "ListMsg", "UsrGrupoPerm", Array("id=" & args("CdUsuario"))
        Else
            RedirectToAction "Delete", "UsrGrupoPerm", Array("id="&CStr(args("id")))
        End If
    End Sub

    Public Sub Details(vars)
        Dim objh

        Set objh = (new Helper)("UsrGrupoPerm")

        Set Model = objh.SelectById(vars("id"))

        If Not IsNothing(Model) Then
            ViewData.Add "Usuario", ExecCommandText("SELECT FCAP(U.NOME) AS NOME FROM USUARIO U WHERE U.CD_USUARIO = " &  iif(Model.CdUsuario="","0",CStr(Model.CdUsuario)),True)

            ViewData.Add "GrupoPermissao", ExecCommandText("SELECT GP.CD_GRUPO_PERMISSAO, GP.NM_GRUPO FROM GRUPO_PERMISSAO GP WHERE GP.CD_GRUPO_PERMISSAO = " &  iif(Model.CdGrupoPermissao="","0",CStr(Model.CdGrupoPermissao)),True) 

            ViewData.Add "UsuarioAlt", ExecCommandText("SELECT FCAP(U.NOME) AS NOME FROM USUARIO U WHERE U.CD_USUARIO = " & Nvl(Model.CdUsuarioAlt, "0"),True)
        End If

        View "Details"
    End Sub
End Class
%>