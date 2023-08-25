<%
IncludeModel("Modulo")

Public Model

Public ViewData

Class ModuloController

    Private Sub Class_Initialize()
        Set ViewData = Server.CreateObject("Scripting.Dictionary")
    End Sub

    Private Sub Class_Terminate()
    End Sub

    Public Sub List()
        Dim objh

        Set objh = (new Helper)("Modulo")

        Set Model = objh.SelectAll()

        View "List"
    End Sub

    Public Sub Create()
        Set Model = new Modulo

        View "Create"
    End Sub

    Public Sub CreatePost(args)
        Dim obj, objh

        Set objh = (new Helper)("Modulo")

        Set obj = objh.PopulateObjectFromArgs(args, Array("NmModulo", "DsModulo", "Situacao", "Icone", "UrlPath", "OrigemDados", "OcultarNulo", "AnaliseCritica", "Ordem"))

        objh.Insert(obj)

        RedirectToAction "List", "Modulo", Array()
    End Sub

    Public Sub Edit(vars)
        Dim objh

        Set objh = (new Helper)("Modulo")

        Set Model = objh.SelectById(vars("id"))

        View "Edit"
    End Sub

    Public Sub EditPost(args)
        Dim obj, objh

        Set objh = (new Helper)("Modulo")

        Set obj = objh.PopulateObjectFromArgs(args, Array("NmModulo", "DsModulo", "Situacao", "Icone", "UrlPath", "OrigemDados", "OcultarNulo", "AnaliseCritica", "Ordem"))

            obj.CdModulo = args("CdModulo")

        objh.Update(obj)

        RedirectToAction "List", "Modulo", Array()
    End Sub

    Public Sub Delete(vars)
        Dim objh

        Set objh = (new Helper)("Modulo")

        Set Model = objh.SelectById(vars("id"))

        View "Delete"
    End Sub

    Public Sub DeletePost(args)
        Dim objh

        Set objh = (new Helper)("Modulo")

        res = objh.Delete(args("CdModulo"))

        If res Then
            RedirectToAction "List", "Modulo", Array()
        Else
            RedirectToAction "Delete", "Modulo", Array("id="&CStr(args("id")))
        End If
    End Sub

    Public Sub Details(vars)
        Dim objh

        Set objh = (new Helper)("Modulo")

        Set Model = objh.SelectById(vars("id"))

        View "Details"
    End Sub
End Class
%>