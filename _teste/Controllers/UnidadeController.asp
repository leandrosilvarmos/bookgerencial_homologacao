<%
IncludeModel("Unidade")

Public Model

Public ViewData

Class UnidadeController

    Private Sub Class_Initialize()
        Set ViewData = Server.CreateObject("Scripting.Dictionary")
    End Sub

    Private Sub Class_Terminate()
    End Sub

    Public Sub List()
        Dim objh

        Set objh = (new Helper)("Unidade")

        Set Model = objh.SelectAll()

        View "List"
    End Sub

    Public Sub Create()
        Set Model = new Unidade

        View "Create"
    End Sub

    Public Sub CreatePost(args)
        Dim obj, objh

        Set objh = (new Helper)("Unidade")

        Set obj = objh.PopulateObjectFromArgs(args, Array("NmUnidade", "DsUnidade", "Sigla", "UrlLogo", "UrlFoto", "Ordem", "Situacao", "Certificacoes", "DsMissao", "DsVisao", "DsValores", "UrlMapaEstrategico"))

        If Not IsNothing(obj.Certificacoes) Then
            obj.Certificacoes = Replace(Replace(obj.Certificacoes," ",""),","," ")
        End If

        objh.Insert(obj)

        RedirectToAction "List", "Unidade", Array()
    End Sub

    Public Sub Edit(vars)
        Dim objh

        Set objh = (new Helper)("Unidade")

        Set Model = objh.SelectById(vars("id"))

        If Not IsNothing(Model) Then
            If Not IsNothing(Model.Certificacoes) Then
                Model.Certificacoes = Replace(Model.Certificacoes, " ", ",")
            End If
        End If

        View "Edit"
    End Sub

    Public Sub EditPost(args)
        Dim obj, objh

        Set objh = (new Helper)("Unidade")

        Set obj = objh.PopulateObjectFromArgs(args, Array("NmUnidade", "DsUnidade", "Sigla", "UrlLogo", "UrlFoto", "Ordem", "Situacao", "Certificacoes", "DsMissao", "DsVisao", "DsValores", "UrlMapaEstrategico"))

            obj.CdUnidade = args("CdUnidade")

        If Not IsNothing(obj.Certificacoes) Then
            obj.Certificacoes = Replace(Replace(obj.Certificacoes," ",""),","," ")
        End If

        objh.Update(obj)

        RedirectToAction "List", "Unidade", Array()
    End Sub

    Public Sub Delete(vars)
        Dim objh

        Set objh = (new Helper)("Unidade")

        Set Model = objh.SelectById(vars("id"))

        If Not IsNothing(Model) Then
            If Not IsNothing(Model.Certificacoes) Then
                Model.Certificacoes = Replace(Model.Certificacoes, " ", ",")
            End If
        End If

        View "Delete"
    End Sub

    Public Sub DeletePost(args)
        Dim objh

        Set objh = (new Helper)("Unidade")

        res = objh.Delete(args("CdUnidade"))

        If res Then
            RedirectToAction "List", "Unidade", Array()
        Else
            RedirectToAction "Delete", "Unidade", Array("id="&CStr(args("id")))
        End If
    End Sub

    Public Sub Details(vars)
        Dim objh

        Set objh = (new Helper)("Unidade")

        Set Model = objh.SelectById(vars("id"))

        If Not IsNothing(Model) Then
            If Not IsNothing(Model.Certificacoes) Then
                Model.Certificacoes = Replace(Model.Certificacoes, " ", ",")
            End If
        End If

        View "Details"
    End Sub
End Class
%>