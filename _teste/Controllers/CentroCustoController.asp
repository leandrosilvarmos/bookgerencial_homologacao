<%
IncludeModel("CentroCusto")

Public Model

Public ViewData

Class CentroCustoController

    Private Sub Class_Initialize()
        Set ViewData = Server.CreateObject("Scripting.Dictionary")
    End Sub

    Private Sub Class_Terminate()
    End Sub

    Public Sub List()
        Dim objh

        Set objh = (new Helper)("CentroCusto")

        Set Model = objh.SelectAll()

        ViewData.Add "Unidades", ExecCommandText("SELECT U.CD_UNIDADE, U.NM_UNIDADE, U.SIGLA FROM BOOK_UNIDADE U", True)

        View "List"
    End Sub

    Public Sub Create()
        IncludeModel("Unidade")

        Dim objhUnidade

        Set Model = new CentroCusto

        Set objhUnidade = (new Helper)("Unidade")

        ViewData.Add "Unidades", objhUnidade.SelectAll()

        View "Create"
    End Sub

    Public Sub CreatePost(args)
        Dim obj, objh

        Set objh = (new Helper)("CentroCusto")

        Set obj = objh.PopulateObjectFromArgs(args, Array("CdCentroCusto", "NmCentroCusto", "DsCentroCusto", "Situacao", "CdUnidade"))

        objh.Insert(obj)

        RedirectToAction "List", "CentroCusto", Array()
    End Sub

    Public Sub Edit(vars)
        IncludeModel("Unidade")

        Dim objh, objhUnidade

        Set objh = (new Helper)("CentroCusto")

        Set Model = objh.SelectById(vars("id"))

        Set objhUnidade = (new Helper)("Unidade")

        ViewData.Add "Unidades", objhUnidade.SelectAll()

        View "Edit"
    End Sub

    Public Sub EditPost(args)
        Dim obj, objh

        Set objh = (new Helper)("CentroCusto")

        Set obj = objh.PopulateObjectFromArgs(args, Array("NmCentroCusto", "DsCentroCusto", "Situacao", "CdUnidade"))

            obj.CdCentroCusto = args("CdCentroCusto")

        objh.Update(obj)

        RedirectToAction "List", "CentroCusto", Array()
    End Sub

    Public Sub Delete(vars)
        IncludeModel("Unidade")

        Dim objh, objhUnidade

        Set objh = (new Helper)("CentroCusto")

        Set Model = objh.SelectById(vars("id"))

        Set objhUnidade = (new Helper)("Unidade")

        If Not IsNothing(Model) Then
            ViewData.Add "Unidade", objhUnidade.SelectBy(Array("CdUnidade", "NmUnidade"), Array(GetFiltroObj("","CdUnidade", "=", CStr(Nvl(Model.CdUnidade,"null")))), Array())
        End If

        View "Delete"
    End Sub

    Public Sub DeletePost(args)
        Dim objh

        Set objh = (new Helper)("CentroCusto")

        res = objh.Delete(args("CdCentroCusto"))

        If res Then
            RedirectToAction "List", "CentroCusto", Array()
        Else
            RedirectToAction "Delete", "CentroCusto", Array("id="&CStr(args("id")))
        End If
    End Sub

    Public Sub Details(vars)
        IncludeModel("Unidade")

        Dim objh, objhUnidade

        Set objh = (new Helper)("CentroCusto")

        Set Model = objh.SelectById(vars("id"))

        Set objhUnidade = (new Helper)("Unidade")

        If Not IsNothing(Model) Then
            ViewData.Add "Unidade", objhUnidade.SelectBy(Array("CdUnidade", "NmUnidade"), Array(GetFiltroObj("","CdUnidade", "=", CStr(Nvl(Model.CdUnidade,"null")))), Array())
        End If

        View "Details"
    End Sub
End Class
%>