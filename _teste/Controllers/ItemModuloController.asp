<%
IncludeModel("ItemModulo")

Public Model

Public ViewData

Class ItemModuloController

    Private Sub Class_Initialize()
        Set ViewData = Server.CreateObject("Scripting.Dictionary")
    End Sub

    Private Sub Class_Terminate()
    End Sub

    Public Sub List()
        ListMsg(Nothing)
    End Sub

    Public Sub ListMsg(args)
        IncludeModel("Modulo")

        Dim objh, objhItemSuperior, objhModulo, vCdModulo, vCdItemSuperior, vItemSuperior

        If Not IsNothing(args) Then
            If Not lcase(args("id")) = "null" Then
                vCdModulo = CInt(args("id"))
            Else
                vCdModulo = ""
            End If

            If Not lcase(args("CdSuperior")) = "null" Then
                vCdItemSuperior = args("CdSuperior")
            Else
                vCdItemSuperior = ""
            End If
        Else
            vCdItemSuperior = ""
        End If

        ViewData.Add "CdModulo", vCdModulo
        ViewData.Add "CdItemSuperior", vCdItemSuperior

        Set objhModulo = (new Helper)("Modulo")

        ViewData.Add "Modulos", objhModulo.SelectBy(Array("CdModulo", "NmModulo"), Array(), Array(GetOrderByObj("CdModulo", "ASC")))

        If vCdModulo <> "" Then
            If vCdItemSuperior = "" Then
                vCdItemSuperior = "null"
            Else
                Set objhItemSuperior = (new Helper)("ItemModulo")

                ViewData.Add "ItemSuperior", objhItemSuperior.SelectBy(Array("CdItem", "NmItem", "CdItemSuperior"), Array(GetFiltroObj("","CdItem", "=", CStr(vCdItemSuperior))), Array())
            End If

            ViewData.Add "Unidades", ExecCommandText("SELECT U.CD_UNIDADE, U.NM_UNIDADE, U.SIGLA FROM BOOK_UNIDADE U", True)

            Set objh = (new Helper)("ItemModulo")

            Set Model = objh.SelectBy(Array("CdItem", "NmItem", "DsItem", "Tipo","Ordem", "Situacao", "CdModulo", "CdUnidade", "CdItemSuperior"), Array(GetFiltroObj("","CdModulo","=",CStr(iif(IsNull(vCdModulo),"NULL",vCdModulo))), GetFiltroObj("AND","CdItemSuperior", iif(IsNull(vCdItemSuperior) Or lcase(vCdItemSuperior) = "null", "is", "="),CStr(iif(IsNull(vCdItemSuperior),"NULL",vCdItemSuperior)))), Array())
        End If

        View "List"
    End Sub

    Public Sub Create(args)
        IncludeModel("Modulo")
        IncludeModel("Unidade")
        IncludeModel("CentroCusto")

        Dim objhModulo, objhItemSuperior, objhUnidade, objhCentroCusto, vCdModulo, vCdItemSuperior

        If Not IsNothing(args) Then
            If Not lcase(args("id")) = "" Then
                vCdModulo = CInt(args("id"))
            Else
                vCdModulo = "null"
            End If

            If Not lcase(args("CdSuperior")) = "" Then
                vCdItemSuperior = args("CdSuperior")
            Else
                vCdItemSuperior = "null"
            End If
        Else
            vCdModulo = "null"
            vCdItemSuperior = "null"
        End If

        Set Model = new ItemModulo

        Model.CdModulo = iif(vCdModulo = "null", "", vCdModulo)

        Model.CdItemSuperior = iif(vCdItemSuperior = "null", "", vCdItemSuperior)

        Set objhModulo = (new Helper)("Modulo")
        Set objhItemSuperior = (new Helper)("ItemModulo")
        Set objhUnidade = (new Helper)("Unidade")
        Set objhCentroCusto = (new Helper)("CentroCusto")

        ViewData.Add "ItemSuperior", objhItemSuperior.SelectBy(Array("CdItem", "NmItem", "CdItemSuperior"), Array(GetFiltroObj("","CdItem", "=", CStr(vCdItemSuperior))), Array())
        ViewData.Add "Modulo", objhModulo.SelectBy(Array("CdModulo", "NmModulo"), Array(GetFiltroObj("","CdModulo", "=", CStr(vCdModulo))), Array())
        ViewData.Add "Unidades", objhUnidade.SelectAll()
        ViewData.Add "CentroCustos", ExecCommandText("SELECT C.CD_CENTRO_CUSTO AS CdCentroCusto, C.CD_CENTRO_CUSTO || ' - ' || C.NM_CENTRO_CUSTO AS CdNmCentroCusto, U.CD_UNIDADE AS CdUnidade, U.SIGLA AS Unidade FROM BOOK_CENTRO_CUSTO C LEFT JOIN BOOK_UNIDADE U ON U.CD_UNIDADE = C.CD_UNIDADE WHERE C.CD_CENTRO_CUSTO <> -1 ORDER BY U.SIGLA, C.CD_CENTRO_CUSTO", True)

        View "Create"
    End Sub

    Public Sub CreatePost(args)
        Dim obj, objh

        Set objh = (new Helper)("ItemModulo")

        Set obj = objh.PopulateObjectFromArgs(args, Array("NmItem", "DsItem", "Tipo", "Funcao", "Formatacao", "Formula", "DsQuery", "Ordem", "Situacao", "CdModulo", "CdUnidade", "CdItemSuperior", "QtdCasasDecimais", "Estilo", "OcultarNulo", "Trimestral", "OrigemDados", "AH", "ExibirTotal", "Frequencia", "MetaComparacao", "MetaValor", "MetaComplemento", "CdCentroCusto"))

        objh.Insert(obj)

        If Not IsNothing(obj.Estilo) Then
            obj.Estilo = Replace(Replace(obj.Estilo," ",""),","," ")
        End If

		ExecProcedure "BOOK_GERENCIAL_PKG.ALTERAR_ORDEM_ITEM_SPR", obj.CdItem & "," & obj.Ordem & ",'S'", false

        RedirectToAction "ListMsg", "ItemModulo", Array("id=" & obj.CdModulo,"CdSuperior=" & obj.CdItemSuperior)
    End Sub

    Public Sub Edit(vars)
        IncludeModel("Modulo")
        IncludeModel("Unidade")
        IncludeModel("CentroCusto")

        Dim objh, objhModulo, objhItemSuperior, objhUnidade, objhCentroCusto

        Set objh = (new Helper)("ItemModulo")

        Set objhModulo = (new Helper)("Modulo")
        Set objhItemSuperior = (new Helper)("ItemModulo")
        Set objhUnidade = (new Helper)("Unidade")
        Set objhCentroCusto = (new Helper)("CentroCusto")

        Set Model = objh.SelectById(vars("id"))

        If Not IsNothing(Model) Then
            ViewData.Add "ItemSuperior", objhItemSuperior.SelectBy(Array("CdItem", "NmItem", "CdItemSuperior"), Array(GetFiltroObj("","CdItem", "=", CStr(Nvl(Model.CdItemSuperior,"null")))), Array())
            ViewData.Add "Modulo", objhModulo.SelectBy(Array("CdModulo", "NmModulo"), Array(GetFiltroObj("","CdModulo", "=", CStr(Nvl(Model.CdModulo,"null")))), Array())

            If Not IsNothing(Model.Estilo) Then
                Model.Estilo = Replace(Model.Estilo, " ", ",")
            End If
        End If

        ViewData.Add "Unidades", objhUnidade.SelectAll()
        ViewData.Add "CentroCustos", ExecCommandText("SELECT C.CD_CENTRO_CUSTO AS CdCentroCusto, C.CD_CENTRO_CUSTO || ' - ' || C.NM_CENTRO_CUSTO AS CdNmCentroCusto, U.CD_UNIDADE AS CdUnidade, U.SIGLA AS Unidade FROM BOOK_CENTRO_CUSTO C LEFT JOIN BOOK_UNIDADE U ON U.CD_UNIDADE = C.CD_UNIDADE WHERE C.CD_CENTRO_CUSTO <> -1 ORDER BY U.SIGLA, C.CD_CENTRO_CUSTO", True)

        View "Edit"
    End Sub

    Public Sub EditPost(args)
        Dim obj, objh

        Set objh = (new Helper)("ItemModulo")

        Set obj = objh.PopulateObjectFromArgs(args, Array("NmItem", "DsItem", "Tipo", "Funcao", "Formatacao", "Formula", "DsQuery", "Ordem", "Situacao", "CdModulo", "CdUnidade", "CdItemSuperior", "QtdCasasDecimais", "Estilo", "OcultarNulo", "Trimestral", "OrigemDados", "AH", "ExibirTotal", "Frequencia", "MetaComparacao", "MetaValor", "MetaComplemento", "CdCentroCusto"))

            obj.CdItem = args("CdItem")

        If Not IsNothing(obj.Estilo) Then
            obj.Estilo = Replace(Replace(obj.Estilo," ",""),","," ")
        End If

		ExecProcedure "BOOK_GERENCIAL_PKG.ALTERAR_ORDEM_ITEM_SPR", obj.CdItem & "," & obj.Ordem & ",'N'", false

		objh.Update(obj)

        RedirectToAction "ListMsg", "ItemModulo", Array("id=" & obj.CdModulo,"CdSuperior=" & obj.CdItemSuperior)
    End Sub

    Public Sub Delete(vars)
        IncludeModel("Modulo")
        IncludeModel("Unidade")
        IncludeModel("CentroCusto")

        Dim objh, objhModulo, objhItemSuperior, objhUnidade, objhCentroCusto

        Set objh = (new Helper)("ItemModulo")

        Set objhModulo = (new Helper)("Modulo")
        Set objhItemSuperior = (new Helper)("ItemModulo")
        Set objhUnidade = (new Helper)("Unidade")
        Set objhCentroCusto = (new Helper)("CentroCusto")

        Set Model = objh.SelectById(vars("id"))

        If Not IsNothing(Model) Then
            ViewData.Add "ItemSuperior", objhItemSuperior.SelectBy(Array("CdItem", "NmItem", "CdItemSuperior"), Array(GetFiltroObj("","CdItem", "=", CStr(Nvl(Model.CdItemSuperior,"null")))), Array())
            ViewData.Add "Modulo", objhModulo.SelectBy(Array("CdModulo", "NmModulo"), Array(GetFiltroObj("","CdModulo", "=", CStr(Nvl(Model.CdModulo,"null")))), Array())
            ViewData.Add "Unidade", objhUnidade.SelectBy(Array("CdUnidade", "NmUnidade"), Array(GetFiltroObj("","CdUnidade", "=", CStr(Nvl(Model.CdUnidade,"null")))), Array())
            ViewData.Add "CentroCusto", objhCentroCusto.SelectBy(Array("CdCentroCusto", "NmCentroCusto"), Array(GetFiltroObj("","CdCentroCusto", "=", CStr(Nvl(Model.CdCentroCusto,"null")))), Array())

            If Not IsNothing(Model.Estilo) Then
                Model.Estilo = Replace(Model.Estilo, " ", ",")
            End If
        End If

        View "Delete"
    End Sub

    Public Sub DeletePost(args)
        Dim objh

        Set objh = (new Helper)("ItemModulo")

        res = objh.Delete(args("CdItem"))

        If res Then
            RedirectToAction "ListMsg", "ItemModulo", Array("id="&CStr(args("CdModulo")),"CdSuperior="&CStr(args("CdItemSuperior")))
        Else
            RedirectToAction "Delete", "ItemModulo", Array("id="&CStr(args("id")))
        End If
    End Sub

    Public Sub Details(vars)
        IncludeModel("Modulo")
        IncludeModel("Unidade")
        IncludeModel("CentroCusto")

        Dim objh, objhModulo, objhItemSuperior, objhUnidade, objhCentroCusto

        Set objh = (new Helper)("ItemModulo")

        Set objhModulo = (new Helper)("Modulo")
        Set objhItemSuperior = (new Helper)("ItemModulo")
        Set objhUnidade = (new Helper)("Unidade")
        Set objhCentroCusto = (new Helper)("CentroCusto")

        Set Model = objh.SelectById(vars("id"))

        If Not IsNothing(Model) Then
            ViewData.Add "ItemSuperior", objhItemSuperior.SelectBy(Array("CdItem", "NmItem", "CdItemSuperior"), Array(GetFiltroObj("","CdItem", "=", CStr(Nvl(Model.CdItemSuperior,"null")))), Array())
            ViewData.Add "Modulo", objhModulo.SelectBy(Array("CdModulo", "NmModulo"), Array(GetFiltroObj("","CdModulo", "=", CStr(Nvl(Model.CdModulo,"null")))), Array())
            ViewData.Add "Unidade", objhUnidade.SelectBy(Array("CdUnidade", "NmUnidade"), Array(GetFiltroObj("","CdUnidade", "=", CStr(Nvl(Model.CdUnidade,"null")))), Array())
            ViewData.Add "CentroCusto", objhCentroCusto.SelectBy(Array("CdCentroCusto", "NmCentroCusto"), Array(GetFiltroObj("","CdCentroCusto", "=", CStr(Nvl(Model.CdCentroCusto,"null")))), Array())

            If Not IsNothing(Model.Estilo) Then
                Model.Estilo = Replace(Model.Estilo, " ", ",")
            End If
        End If

        View "Details"
    End Sub
End Class
%>