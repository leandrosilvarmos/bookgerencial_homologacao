<div id="tbCustos" class="jqGrid_wrapper">
    <div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="gbox_table_list_1" dir="ltr" style="width: 100%;">
        <div class="ui-jqgrid-view" id="gview_table_list_1" style="width: 100%;">
            <div class="ui-state-default ui-jqgrid-hdiv" style="width: 100%; cursor: default;">
                <div class="ui-jqgrid-hbox">
                    <table class="ui-jqgrid-htable" style="width: 100%;" role="grid" cellspacing="0" cellpadding="0" border="0">
                        <thead>
                            <%
                               vMeses      = True
                               vTotalAnual = True
                               vMediaAnual = True

                               View "Header"
                            %>
                        </thead>
                    </table>
                </div>
            </div>
            <div class="ui-jqgrid-bdiv" style="height: 640px; width: 100%;">
                <table tabindex="0" cellspacing="0" cellpadding="0" border="0" role="grid" class="ui-jqgrid-btable" style="width: 100%;">
                    <tbody>
                        <%
                                Dim vWidth

                                vWidth = 200

                                If Not IsNothing(Model) Then
                                    If Model.GetMaxValue("NM_ITEM_LENGTH") < 20 Then
                                        vWidth = 200
                                    Else
                                        vWidth = (Model.GetMaxValue("NM_ITEM_LENGTH") * 7.5) + (Model.GetMaxValue("NIVEL") * 8)
                                    End If

                                    If vWidth > 500 Then
                                        vWidth = 500
                                    ElseIf vWidth < 200 Then
                                        vWidth = 200
                                    End If
                                End If

                                vWidth = Replace(CStr(vWidth),",",".")
                        %>

                        <tr class="jqgfirstrow" role="row" style="height: auto">
                            <td role="gridcell" style="height: 0px; width: <%=vWidth%>px"></td>
                            <%
                                    If vDescricao Then
                            %>
                            <td role="gridcell" style="height: 0px; width: 200px;"></td>
                            <% 
                                    End If
                            %>
                            <td role="gridcell" style="height: 0px; width: 130px;"></td>
                            <td role="gridcell" style="height: 0px; width: 130px;"></td>
                            <td role="gridcell" style="height: 0px; width: 130px;"></td>
                            <td role="gridcell" style="height: 0px; width: 130px;"></td>
                            <td role="gridcell" style="height: 0px; width: 130px;"></td>
                            <td role="gridcell" style="height: 0px; width: 130px;"></td>
                            <td role="gridcell" style="height: 0px; width: 130px;"></td>
                            <td role="gridcell" style="height: 0px; width: 130px;"></td>
                            <td role="gridcell" style="height: 0px; width: 130px;"></td>
                            <td role="gridcell" style="height: 0px; width: 130px;"></td>
                            <td role="gridcell" style="height: 0px; width: 130px;"></td>
                            <td role="gridcell" style="height: 0px; width: 130px;"></td>
                            <td role="gridcell" style="height: 0px; width: 65px;"></td>
                            <td role="gridcell" style="height: 0px; width: 130px;"></td>
                        </tr>
                        <%
                                If Not IsNothing(Model) Then
                                    Dim vCentroCustoTemp, vCustoDiretoIndireto(12), vRateioCCAux(12), vTotalGeral(12), vPDTotal(12)

                                    vCentroCustoTemp = ""

                                    For i = 0 To (Model.Count - 1) Step 1
                                        If Model.GetValue("IS_ITEM",i) = "S" Then
                                            Dim vNivel, vCdItem, vNmItem, vDsItem, vTipo, vFuncao, vFormatacao, vFormula, vCdItemSuperior, vQtdCasasDecimais, vEstilo, vOcultarNulo, vCentroCusto, vNmCentroCusto, vDsCentroCusto

                                            Dim vJan, vFev, vMar, vAbr, vMai, vJun, vJul, vAgo, vSet, vOut, vNov, vDez

                                            Dim vSub, vExibir, vTotal
        
                                            vNivel            = Model.GetValue("NIVEL",i)
                                            vCdItem           = Model.GetValue("CD_ITEM",i)
                                            vNmItem           = Model.GetValue("NM_ITEM",i)
                                            vDsItem           = Model.GetValue("DS_ITEM",i)
                                            vTipo             = Model.GetValue("TIPO",i)
                                            vFuncao           = Model.GetValue("FUNCAO",i)
                                            vFormatacao       = Model.GetValue("FORMATACAO",i)
                                            vFormula          = Model.GetValue("FORMULA",i)
                                            vCdItemSuperior   = Model.GetValue("CD_ITEM_SUPERIOR",i)
                                            vQtdCasasDecimais = Model.GetValue("QTD_CASAS_DECIMAIS",i)
                                            vEstilo           = Model.GetValue("ESTILO",i)
                                            vOcultarNulo      = Model.GetValue("OCULTAR_NULO",i)
                                            vCentroCusto      = Model.GetValue("CD_CENTRO_CUSTO",i)
                                            vNmCentroCusto    = Model.GetValue("NM_CENTRO_CUSTO",i)
                                            vDsCentroCusto    = Model.GetValue("DS_CENTRO_CUSTO",i)

                                            vJan = iif(vFormatacao <> "T", FormatarValor(Model.GetValue("JAN",i), vFormatacao, vFormula, "JAN", i, vQtdCasasDecimais), Model.GetValue("JAN_TXT",i))
                                            vFev = iif(vFormatacao <> "T", FormatarValor(Model.GetValue("FEV",i), vFormatacao, vFormula, "FEV", i, vQtdCasasDecimais), Model.GetValue("FEV_TXT",i))
                                            vMar = iif(vFormatacao <> "T", FormatarValor(Model.GetValue("MAR",i), vFormatacao, vFormula, "MAR", i, vQtdCasasDecimais), Model.GetValue("MAR_TXT",i))
                                            vAbr = iif(vFormatacao <> "T", FormatarValor(Model.GetValue("ABR",i), vFormatacao, vFormula, "ABR", i, vQtdCasasDecimais), Model.GetValue("ABR_TXT",i))
                                            vMai = iif(vFormatacao <> "T", FormatarValor(Model.GetValue("MAI",i), vFormatacao, vFormula, "MAI", i, vQtdCasasDecimais), Model.GetValue("MAI_TXT",i))
                                            vJun = iif(vFormatacao <> "T", FormatarValor(Model.GetValue("JUN",i), vFormatacao, vFormula, "JUN", i, vQtdCasasDecimais), Model.GetValue("JUN_TXT",i))
                                            vJul = iif(vFormatacao <> "T", FormatarValor(Model.GetValue("JUL",i), vFormatacao, vFormula, "JUL", i, vQtdCasasDecimais), Model.GetValue("JUL_TXT",i))
                                            vAgo = iif(vFormatacao <> "T", FormatarValor(Model.GetValue("AGO",i), vFormatacao, vFormula, "AGO", i, vQtdCasasDecimais), Model.GetValue("AGO_TXT",i))
                                            vSet = iif(vFormatacao <> "T", FormatarValor(Model.GetValue("SET",i), vFormatacao, vFormula, "SET", i, vQtdCasasDecimais), Model.GetValue("SET_TXT",i))
                                            vOut = iif(vFormatacao <> "T", FormatarValor(Model.GetValue("OUT",i), vFormatacao, vFormula, "OUT", i, vQtdCasasDecimais), Model.GetValue("OUT_TXT",i))
                                            vNov = iif(vFormatacao <> "T", FormatarValor(Model.GetValue("NOV",i), vFormatacao, vFormula, "NOV", i, vQtdCasasDecimais), Model.GetValue("NOV_TXT",i))
                                            vDez = iif(vFormatacao <> "T", FormatarValor(Model.GetValue("DEZ",i), vFormatacao, vFormula, "DEZ", i, vQtdCasasDecimais), Model.GetValue("DEZ_TXT",i))

                                            For Each vCdSub In Split(Model.GetValue("PATH_CD_ITEM",i),";")
                                                If vCdSub <> "" And vCdSub <> CStr(vCdItem) Then
                                                    vSub = vSub & " sub" & vCdSub
                                                End If
                                            Next

                                            If vCentroCustoTemp <> vCentroCusto Then
                                                If vCentroCustoTemp <> "" Then 
                        %>
                        <tr role="row" class="separador ui-widget-content jqgrow ui-row-ltr">
                            <!--td role="gridcell" colspan="<%=vQtdColunas%>"></td>-->
                            <td role="gridcell" style="border: none;"></td>
                        </tr>
                        <% 
                                                End If 
                        %>
                        <tr role="row" class="nvl0 tpG ui-widget-content jqgrow ui-row-ltr">
                            <td role="gridcell" class="ativo" colspan="4">Centro de Custos:&nbsp;&nbsp;&nbsp;<%=iif(Len(CStr(vCentroCusto)) > 1, vCentroCusto & " - ", "")%><%=vNmCentroCusto%></td>
                            <td role="gridcell" style="text-align: left;" colspan="4">Un. Produção:&nbsp;&nbsp;&nbsp;<%=vDsCentroCusto%></td>
                            <td role="gridcell" colspan="7"></td>
                        </tr>
                        <% 
                                            End If
                        %>
                        <tr role="row" class="nvl<%=vNivel%> tp<%=vTipo%> <%=vSub%> <%=vEstilo%> ui-widget-content jqgrow ui-row-ltr">
                            <td role="gridcell" class="ativo" data-value="<%=vCdItem%>"><%=vNmItem%></td>
                            <td role="gridcell"><span title="<%=vNmItem%> (JAN): <%=vJan%>"><%=vJan%></span></td>
                            <td role="gridcell"><span title="<%=vNmItem%> (FEV): <%=vFev%>"><%=vFev%></span></td>
                            <td role="gridcell"><span title="<%=vNmItem%> (MAR): <%=vMar%>"><%=vMar%></span></td>
                            <td role="gridcell"><span title="<%=vNmItem%> (ABR): <%=vAbr%>"><%=vAbr%></span></td>
                            <td role="gridcell"><span title="<%=vNmItem%> (MAI): <%=vMai%>"><%=vMai%></span></td>
                            <td role="gridcell"><span title="<%=vNmItem%> (JUN): <%=vJun%>"><%=vJun%></span></td>
                            <td role="gridcell"><span title="<%=vNmItem%> (JUL): <%=vJul%>"><%=vJul%></span></td>
                            <td role="gridcell"><span title="<%=vNmItem%> (AGO): <%=vAgo%>"><%=vAgo%></span></td>
                            <td role="gridcell"><span title="<%=vNmItem%> (SET): <%=vSet%>"><%=vSet%></span></td>
                            <td role="gridcell"><span title="<%=vNmItem%> (OUT): <%=vOut%>"><%=vOut%></span></td>
                            <td role="gridcell"><span title="<%=vNmItem%> (NOV): <%=vNov%>"><%=vNov%></span></td>
                            <td role="gridcell"><span title="<%=vNmItem%> (DEZ): <%=vDez%>"><%=vDez%></span></td>
                            <%
                                vTotal = 0

                                If IsNumeric(vJan) Then vTotal = vTotal + vJan End If
                                If IsNumeric(vFev) Then vTotal = vTotal + vFev End If
                                If IsNumeric(vMar) Then vTotal = vTotal + vMar End If
                                If IsNumeric(vAbr) Then vTotal = vTotal + vAbr End If
                                If IsNumeric(vMai) Then vTotal = vTotal + vMai End If
                                If IsNumeric(vJun) Then vTotal = vTotal + vJun End If
                                If IsNumeric(vJul) Then vTotal = vTotal + vJul End If
                                If IsNumeric(vAgo) Then vTotal = vTotal + vAgo End If
                                If IsNumeric(vSet) Then vTotal = vTotal + vSet End If
                                If IsNumeric(vOut) Then vTotal = vTotal + vOut End If
                                If IsNumeric(vNov) Then vTotal = vTotal + vNov End If
                                If IsNumeric(vDez) Then vTotal = vTotal + vDez End If

                                vTotal = FormatarValor(vTotal, vFormatacao, null, null, i, vQtdCasasDecimais)
                            %>
                            <td role="gridcell"></td>
                            <td role="gridcell" class="tdAnual"><span title="<%=vNmItem%> (TOTAL): <%=vTotal%>"><%=vTotal%></span></td>
                        </tr>
                        <%                 
                                            vCentroCustoTemp = vCentroCusto

                                            If CStr(vCdItem) = "355" Then '--355 - Custos Diretos e Indiretos
                                                If IsNumeric(vJan) Then vCustoDiretoIndireto(0) = Nvl(vCustoDiretoIndireto(0),0) + vJan End If
                                                If IsNumeric(vFev) Then vCustoDiretoIndireto(1) = Nvl(vCustoDiretoIndireto(1),0) + vFev End If
                                                If IsNumeric(vMar) Then vCustoDiretoIndireto(2) = Nvl(vCustoDiretoIndireto(2),0) + vMar End If
                                                If IsNumeric(vAbr) Then vCustoDiretoIndireto(3) = Nvl(vCustoDiretoIndireto(3),0) + vAbr End If
                                                If IsNumeric(vMai) Then vCustoDiretoIndireto(4) = Nvl(vCustoDiretoIndireto(4),0) + vMai End If
                                                If IsNumeric(vJun) Then vCustoDiretoIndireto(5) = Nvl(vCustoDiretoIndireto(5),0) + vJun End If
                                                If IsNumeric(vJul) Then vCustoDiretoIndireto(6) = Nvl(vCustoDiretoIndireto(6),0) + vJul End If
                                                If IsNumeric(vAgo) Then vCustoDiretoIndireto(7) = Nvl(vCustoDiretoIndireto(7),0) + vAgo End If
                                                If IsNumeric(vSet) Then vCustoDiretoIndireto(8) = Nvl(vCustoDiretoIndireto(8),0) + vSet End If
                                                If IsNumeric(vOut) Then vCustoDiretoIndireto(9) = Nvl(vCustoDiretoIndireto(9),0) + vOut End If
                                                If IsNumeric(vNov) Then vCustoDiretoIndireto(10) = Nvl(vCustoDiretoIndireto(10),0) + vNov End If
                                                If IsNumeric(vDez) Then vCustoDiretoIndireto(11) = Nvl(vCustoDiretoIndireto(11),0) + vDez End If
                                                If IsNumeric(vTotal) Then vCustoDiretoIndireto(12) = Nvl(vCustoDiretoIndireto(12),0) + vTotal End If
                                            ElseIf CStr(vCdItem) = "356" Then '--356 - Rateio dos C.C Auxiliares
                                                If IsNumeric(vJan) Then vRateioCCAux(0) = Nvl(vRateioCCAux(0),0) + vJan End If
                                                If IsNumeric(vFev) Then vRateioCCAux(1) = Nvl(vRateioCCAux(1),0) + vFev End If
                                                If IsNumeric(vMar) Then vRateioCCAux(2) = Nvl(vRateioCCAux(2),0) + vMar End If
                                                If IsNumeric(vAbr) Then vRateioCCAux(3) = Nvl(vRateioCCAux(3),0) + vAbr End If
                                                If IsNumeric(vMai) Then vRateioCCAux(4) = Nvl(vRateioCCAux(4),0) + vMai End If
                                                If IsNumeric(vJun) Then vRateioCCAux(5) = Nvl(vRateioCCAux(5),0) + vJun End If
                                                If IsNumeric(vJul) Then vRateioCCAux(6) = Nvl(vRateioCCAux(6),0) + vJul End If
                                                If IsNumeric(vAgo) Then vRateioCCAux(7) = Nvl(vRateioCCAux(7),0) + vAgo End If
                                                If IsNumeric(vSet) Then vRateioCCAux(8) = Nvl(vRateioCCAux(8),0) + vSet End If
                                                If IsNumeric(vOut) Then vRateioCCAux(9) = Nvl(vRateioCCAux(9),0) + vOut End If
                                                If IsNumeric(vNov) Then vRateioCCAux(10) = Nvl(vRateioCCAux(10),0) + vNov End If
                                                If IsNumeric(vDez) Then vRateioCCAux(11) = Nvl(vRateioCCAux(11),0) + vDez End If
                                                If IsNumeric(vTotal) Then vRateioCCAux(12) = Nvl(vRateioCCAux(12),0) + vTotal End If
                                            ElseIf CStr(vCdItem) = "357" Then '--357 - Total Geral
                                                If IsNumeric(vJan) Then vTotalGeral(0) = Nvl(vTotalGeral(0),0) + vJan End If
                                                If IsNumeric(vFev) Then vTotalGeral(1) = Nvl(vTotalGeral(1),0) + vFev End If
                                                If IsNumeric(vMar) Then vTotalGeral(2) = Nvl(vTotalGeral(2),0) + vMar End If
                                                If IsNumeric(vAbr) Then vTotalGeral(3) = Nvl(vTotalGeral(3),0) + vAbr End If
                                                If IsNumeric(vMai) Then vTotalGeral(4) = Nvl(vTotalGeral(4),0) + vMai End If
                                                If IsNumeric(vJun) Then vTotalGeral(5) = Nvl(vTotalGeral(5),0) + vJun End If
                                                If IsNumeric(vJul) Then vTotalGeral(6) = Nvl(vTotalGeral(6),0) + vJul End If
                                                If IsNumeric(vAgo) Then vTotalGeral(7) = Nvl(vTotalGeral(7),0) + vAgo End If
                                                If IsNumeric(vSet) Then vTotalGeral(8) = Nvl(vTotalGeral(8),0) + vSet End If
                                                If IsNumeric(vOut) Then vTotalGeral(9) = Nvl(vTotalGeral(9),0) + vOut End If
                                                If IsNumeric(vNov) Then vTotalGeral(10) = Nvl(vTotalGeral(10),0) + vNov End If
                                                If IsNumeric(vDez) Then vTotalGeral(11) = Nvl(vTotalGeral(11),0) + vDez End If
                                                If IsNumeric(vTotal) Then vTotalGeral(12) = Nvl(vTotalGeral(12),0) + vTotal End If
                                            ElseIf CStr(vCdItem) = "358" Then '--358 - Qtde. Produzida
                                                If Trim(LCase(CStr(Nvl(vDsCentroCusto, "")))) = "paciente dia" Then
                                                    If IsNumeric(vJan) Then vPDTotal(0) = Nvl(vPDTotal(0),0) + vJan End If
                                                    If IsNumeric(vFev) Then vPDTotal(1) = Nvl(vPDTotal(1),0) + vFev End If
                                                    If IsNumeric(vMar) Then vPDTotal(2) = Nvl(vPDTotal(2),0) + vMar End If
                                                    If IsNumeric(vAbr) Then vPDTotal(3) = Nvl(vPDTotal(3),0) + vAbr End If
                                                    If IsNumeric(vMai) Then vPDTotal(4) = Nvl(vPDTotal(4),0) + vMai End If
                                                    If IsNumeric(vJun) Then vPDTotal(5) = Nvl(vPDTotal(5),0) + vJun End If
                                                    If IsNumeric(vJul) Then vPDTotal(6) = Nvl(vPDTotal(6),0) + vJul End If
                                                    If IsNumeric(vAgo) Then vPDTotal(7) = Nvl(vPDTotal(7),0) + vAgo End If
                                                    If IsNumeric(vSet) Then vPDTotal(8) = Nvl(vPDTotal(8),0) + vSet End If
                                                    If IsNumeric(vOut) Then vPDTotal(9) = Nvl(vPDTotal(9),0) + vOut End If
                                                    If IsNumeric(vNov) Then vPDTotal(10) = Nvl(vPDTotal(10),0) + vNov End If
                                                    If IsNumeric(vDez) Then vPDTotal(11) = Nvl(vPDTotal(11),0) + vDez End If
                                                    If IsNumeric(vTotal) Then vPDTotal(12) = Nvl(vPDTotal(12),0) + vTotal End If
                                                End If
                                            End If

                                            Response.Flush
                                        End If
                                    Next
                                    
                                    vCustoDiretoIndireto(0) = FormatarValor(vCustoDiretoIndireto(0), "M", null, null, null, 2)
                                    vCustoDiretoIndireto(1) = FormatarValor(vCustoDiretoIndireto(1), "M", null, null, null, 2)
                                    vCustoDiretoIndireto(2) = FormatarValor(vCustoDiretoIndireto(2), "M", null, null, null, 2)
                                    vCustoDiretoIndireto(3) = FormatarValor(vCustoDiretoIndireto(3), "M", null, null, null, 2)
                                    vCustoDiretoIndireto(4) = FormatarValor(vCustoDiretoIndireto(4), "M", null, null, null, 2)
                                    vCustoDiretoIndireto(5) = FormatarValor(vCustoDiretoIndireto(5), "M", null, null, null, 2)
                                    vCustoDiretoIndireto(6) = FormatarValor(vCustoDiretoIndireto(6), "M", null, null, null, 2)
                                    vCustoDiretoIndireto(7) = FormatarValor(vCustoDiretoIndireto(7), "M", null, null, null, 2)
                                    vCustoDiretoIndireto(8) = FormatarValor(vCustoDiretoIndireto(8), "M", null, null, null, 2)
                                    vCustoDiretoIndireto(9) = FormatarValor(vCustoDiretoIndireto(9), "M", null, null, null, 2)
                                    vCustoDiretoIndireto(10) = FormatarValor(vCustoDiretoIndireto(10), "M", null, null, null, 2)
                                    vCustoDiretoIndireto(11) = FormatarValor(vCustoDiretoIndireto(11), "M", null, null, null, 2)
                                    vCustoDiretoIndireto(12) = FormatarValor(vCustoDiretoIndireto(12), "M", null, null, null, 2)

                                    vRateioCCAux(0) = FormatarValor(vRateioCCAux(0), "M", null, null, null, 2)
                                    vRateioCCAux(1) = FormatarValor(vRateioCCAux(1), "M", null, null, null, 2)
                                    vRateioCCAux(2) = FormatarValor(vRateioCCAux(2), "M", null, null, null, 2)
                                    vRateioCCAux(3) = FormatarValor(vRateioCCAux(3), "M", null, null, null, 2)
                                    vRateioCCAux(4) = FormatarValor(vRateioCCAux(4), "M", null, null, null, 2)
                                    vRateioCCAux(5) = FormatarValor(vRateioCCAux(5), "M", null, null, null, 2)
                                    vRateioCCAux(6) = FormatarValor(vRateioCCAux(6), "M", null, null, null, 2)
                                    vRateioCCAux(7) = FormatarValor(vRateioCCAux(7), "M", null, null, null, 2)
                                    vRateioCCAux(8) = FormatarValor(vRateioCCAux(8), "M", null, null, null, 2)
                                    vRateioCCAux(9) = FormatarValor(vRateioCCAux(9), "M", null, null, null, 2)
                                    vRateioCCAux(10) = FormatarValor(vRateioCCAux(10), "M", null, null, null, 2)
                                    vRateioCCAux(11) = FormatarValor(vRateioCCAux(11), "M", null, null, null, 2)
                                    vRateioCCAux(12) = FormatarValor(vRateioCCAux(12), "M", null, null, null, 2)

                                    vTotalGeral(0) = FormatarValor(vTotalGeral(0), "M", null, null, null, 2)
                                    vTotalGeral(1) = FormatarValor(vTotalGeral(1), "M", null, null, null, 2)
                                    vTotalGeral(2) = FormatarValor(vTotalGeral(2), "M", null, null, null, 2)
                                    vTotalGeral(3) = FormatarValor(vTotalGeral(3), "M", null, null, null, 2)
                                    vTotalGeral(4) = FormatarValor(vTotalGeral(4), "M", null, null, null, 2)
                                    vTotalGeral(5) = FormatarValor(vTotalGeral(5), "M", null, null, null, 2)
                                    vTotalGeral(6) = FormatarValor(vTotalGeral(6), "M", null, null, null, 2)
                                    vTotalGeral(7) = FormatarValor(vTotalGeral(7), "M", null, null, null, 2)
                                    vTotalGeral(8) = FormatarValor(vTotalGeral(8), "M", null, null, null, 2)
                                    vTotalGeral(9) = FormatarValor(vTotalGeral(9), "M", null, null, null, 2)
                                    vTotalGeral(10) = FormatarValor(vTotalGeral(10), "M", null, null, null, 2)
                                    vTotalGeral(11) = FormatarValor(vTotalGeral(11), "M", null, null, null, 2)
                                    vTotalGeral(12) = FormatarValor(vTotalGeral(12), "M", null, null, null, 2)

                                    vPDTotal(0) = FormatarValor(vPDTotal(0), "M", null, null, null, 2)
                                    vPDTotal(1) = FormatarValor(vPDTotal(1), "M", null, null, null, 2)
                                    vPDTotal(2) = FormatarValor(vPDTotal(2), "M", null, null, null, 2)
                                    vPDTotal(3) = FormatarValor(vPDTotal(3), "M", null, null, null, 2)
                                    vPDTotal(4) = FormatarValor(vPDTotal(4), "M", null, null, null, 2)
                                    vPDTotal(5) = FormatarValor(vPDTotal(5), "M", null, null, null, 2)
                                    vPDTotal(6) = FormatarValor(vPDTotal(6), "M", null, null, null, 2)
                                    vPDTotal(7) = FormatarValor(vPDTotal(7), "M", null, null, null, 2)
                                    vPDTotal(8) = FormatarValor(vPDTotal(8), "M", null, null, null, 2)
                                    vPDTotal(9) = FormatarValor(vPDTotal(9), "M", null, null, null, 2)
                                    vPDTotal(10) = FormatarValor(vPDTotal(10), "M", null, null, null, 2)
                                    vPDTotal(11) = FormatarValor(vPDTotal(11), "M", null, null, null, 2)
                                    vPDTotal(12) = FormatarValor(vPDTotal(12), "M", null, null, null, 2)
                        %>
                        <tr role="row" class="separador ui-widget-content jqgrow ui-row-ltr">
                            <!--td role="gridcell" colspan="<%=vQtdColunas%>"></td>-->
                            <td role="gridcell" style="border: none;"></td>
                        </tr>
                        <tr role="row" class="nvl0 tpG ui-widget-content jqgrow ui-row-ltr">
                            <td role="gridcell" class="ativo" colspan="4">TOTAL GERAL</td>
                            <td role="gridcell" colspan="14">&nbsp;</td>
                        </tr>
                        <tr role="row" class="nvl1 tpI ui-widget-content jqgrow ui-row-ltr">
                            <td role="gridcell" class="ativo" data-value="355">Custos Diretos e Indiretos</td>
                            <td role="gridcell"><span title="Custos Diretos e Indiretos (JAN): <%=vCustoDiretoIndireto(0)%>"><%=vCustoDiretoIndireto(0)%></span></td>
                            <td role="gridcell"><span title="Custos Diretos e Indiretos (FEV): <%=vCustoDiretoIndireto(1)%>"><%=vCustoDiretoIndireto(1)%></span></td>
                            <td role="gridcell"><span title="Custos Diretos e Indiretos (MAR): <%=vCustoDiretoIndireto(2)%>"><%=vCustoDiretoIndireto(2)%></span></td>
                            <td role="gridcell"><span title="Custos Diretos e Indiretos (ABR): <%=vCustoDiretoIndireto(3)%>"><%=vCustoDiretoIndireto(3)%></span></td>
                            <td role="gridcell"><span title="Custos Diretos e Indiretos (MAI): <%=vCustoDiretoIndireto(4)%>"><%=vCustoDiretoIndireto(4)%></span></td>
                            <td role="gridcell"><span title="Custos Diretos e Indiretos (JUN): <%=vCustoDiretoIndireto(5)%>"><%=vCustoDiretoIndireto(5)%></span></td>
                            <td role="gridcell"><span title="Custos Diretos e Indiretos (JUL): <%=vCustoDiretoIndireto(6)%>"><%=vCustoDiretoIndireto(6)%></span></td>
                            <td role="gridcell"><span title="Custos Diretos e Indiretos (AGO): <%=vCustoDiretoIndireto(7)%>"><%=vCustoDiretoIndireto(7)%></span></td>
                            <td role="gridcell"><span title="Custos Diretos e Indiretos (SET): <%=vCustoDiretoIndireto(8)%>"><%=vCustoDiretoIndireto(8)%></span></td>
                            <td role="gridcell"><span title="Custos Diretos e Indiretos (OUT): <%=vCustoDiretoIndireto(9)%>"><%=vCustoDiretoIndireto(9)%></span></td>
                            <td role="gridcell"><span title="Custos Diretos e Indiretos (NOV): <%=vCustoDiretoIndireto(10)%>"><%=vCustoDiretoIndireto(10)%></span></td>
                            <td role="gridcell"><span title="Custos Diretos e Indiretos (DEZ): <%=vCustoDiretoIndireto(11)%>"><%=vCustoDiretoIndireto(11)%></span></td>
                            <td role="gridcell"></td>
                            <td role="gridcell" class="tdAnual"><span title="Custos Diretos e Indiretos (TOTAL): <%=vCustoDiretoIndireto(12)%>"><%=vCustoDiretoIndireto(12)%></span></td>
                        </tr>
                        <tr role="row" class="nvl1 tpI ui-widget-content jqgrow ui-row-ltr">
                            <td role="gridcell" class="ativo" data-value="356">Rateio dos C.C Auxiliares</td>
                            <td role="gridcell"><span title="Rateio dos C.C Auxiliares (JAN): <%=vRateioCCAux(0)%>"><%=vRateioCCAux(0)%></span></td>
                            <td role="gridcell"><span title="Rateio dos C.C Auxiliares (FEV): <%=vRateioCCAux(1)%>"><%=vRateioCCAux(1)%></span></td>
                            <td role="gridcell"><span title="Rateio dos C.C Auxiliares (MAR): <%=vRateioCCAux(2)%>"><%=vRateioCCAux(2)%></span></td>
                            <td role="gridcell"><span title="Rateio dos C.C Auxiliares (ABR): <%=vRateioCCAux(2)%>"><%=vRateioCCAux(3)%></span></td>
                            <td role="gridcell"><span title="Rateio dos C.C Auxiliares (MAI): <%=vRateioCCAux(4)%>"><%=vRateioCCAux(4)%></span></td>
                            <td role="gridcell"><span title="Rateio dos C.C Auxiliares (JUN): <%=vRateioCCAux(5)%>"><%=vRateioCCAux(5)%></span></td>
                            <td role="gridcell"><span title="Rateio dos C.C Auxiliares (JUL): <%=vRateioCCAux(6)%>"><%=vRateioCCAux(6)%></span></td>
                            <td role="gridcell"><span title="Rateio dos C.C Auxiliares (AGO): <%=vRateioCCAux(7)%>"><%=vRateioCCAux(7)%></span></td>
                            <td role="gridcell"><span title="Rateio dos C.C Auxiliares (SET): <%=vRateioCCAux(8)%>"><%=vRateioCCAux(8)%></span></td>
                            <td role="gridcell"><span title="Rateio dos C.C Auxiliares (OUT): <%=vRateioCCAux(9)%>"><%=vRateioCCAux(9)%></span></td>
                            <td role="gridcell"><span title="Rateio dos C.C Auxiliares (NOV): <%=vRateioCCAux(10)%>"><%=vRateioCCAux(10)%></span></td>
                            <td role="gridcell"><span title="Rateio dos C.C Auxiliares (DEZ): <%=vRateioCCAux(11)%>"><%=vRateioCCAux(11)%></span></td>
                            <td role="gridcell"></td>
                            <td role="gridcell" class="tdAnual"><span title="Rateio dos C.C Auxiliares (TOTAL): <%=vRateioCCAux(12)%>"><%=vRateioCCAux(12)%></span></td>
                        </tr>
                        <tr role="row" class="nvl1 tpI stlN ui-widget-content jqgrow ui-row-ltr">
                            <td role="gridcell" class="ativo" data-value="357">Total Geral</td>
                            <td role="gridcell"><span title="Total Geral (JAN): <%=vTotalGeral(0)%>"><%=vTotalGeral(0)%></span></td>
                            <td role="gridcell"><span title="Total Geral (FEV): <%=vTotalGeral(1)%>"><%=vTotalGeral(1)%></span></td>
                            <td role="gridcell"><span title="Total Geral (MAR): <%=vTotalGeral(2)%>"><%=vTotalGeral(2)%></span></td>
                            <td role="gridcell"><span title="Total Geral (ABR): <%=vTotalGeral(3)%>"><%=vTotalGeral(3)%></span></td>
                            <td role="gridcell"><span title="Total Geral (MAI): <%=vTotalGeral(4)%>"><%=vTotalGeral(4)%></span></td>
                            <td role="gridcell"><span title="Total Geral (JUN): <%=vTotalGeral(5)%>"><%=vTotalGeral(5)%></span></td>
                            <td role="gridcell"><span title="Total Geral (JUL): <%=vTotalGeral(6)%>"><%=vTotalGeral(6)%></span></td>
                            <td role="gridcell"><span title="Total Geral (AGO): <%=vTotalGeral(7)%>"><%=vTotalGeral(7)%></span></td>
                            <td role="gridcell"><span title="Total Geral (SET): <%=vTotalGeral(8)%>"><%=vTotalGeral(8)%></span></td>
                            <td role="gridcell"><span title="Total Geral (OUT): <%=vTotalGeral(9)%>"><%=vTotalGeral(9)%></span></td>
                            <td role="gridcell"><span title="Total Geral (NOV): <%=vTotalGeral(10)%>"><%=vTotalGeral(10)%></span></td>
                            <td role="gridcell"><span title="Total Geral (DEZ): <%=vTotalGeral(11)%>"><%=vTotalGeral(11)%></span></td>
                            <td role="gridcell"></td>
                            <td role="gridcell" class="tdAnual"><span title="Total Geral (TOTAL): <%=vTotalGeral(12)%>"><%=vTotalGeral(12)%></span></td>
                        </tr>
                        <tr role="row" class="nvl1 tpI ui-widget-content jqgrow ui-row-ltr">
                            <td role="gridcell" class="ativo">Paciente Dia Total</td>
                            <td role="gridcell"><span title="Paciente Dia Total (JAN): <%=vPDTotal(0)%>"><%=vPDTotal(0)%></span></td>
                            <td role="gridcell"><span title="Paciente Dia Total (FEV): <%=vPDTotal(1)%>"><%=vPDTotal(1)%></span></td>
                            <td role="gridcell"><span title="Paciente Dia Total (MAR): <%=vPDTotal(2)%>"><%=vPDTotal(2)%></span></td>
                            <td role="gridcell"><span title="Paciente Dia Total (ABR): <%=vPDTotal(3)%>"><%=vPDTotal(3)%></span></td>
                            <td role="gridcell"><span title="Paciente Dia Total (MAI): <%=vPDTotal(4)%>"><%=vPDTotal(4)%></span></td>
                            <td role="gridcell"><span title="Paciente Dia Total (JUN): <%=vPDTotal(5)%>"><%=vPDTotal(5)%></span></td>
                            <td role="gridcell"><span title="Paciente Dia Total (JUL): <%=vPDTotal(6)%>"><%=vPDTotal(6)%></span></td>
                            <td role="gridcell"><span title="Paciente Dia Total (AGO): <%=vPDTotal(7)%>"><%=vPDTotal(7)%></span></td>
                            <td role="gridcell"><span title="Paciente Dia Total (SET): <%=vPDTotal(8)%>"><%=vPDTotal(8)%></span></td>
                            <td role="gridcell"><span title="Paciente Dia Total (OUT): <%=vPDTotal(9)%>"><%=vPDTotal(9)%></span></td>
                            <td role="gridcell"><span title="Paciente Dia Total (NOV): <%=vPDTotal(10)%>"><%=vPDTotal(10)%></span></td>
                            <td role="gridcell"><span title="Paciente Dia Total (DEZ): <%=vPDTotal(11)%>"><%=vPDTotal(11)%></span></td>
                            <td role="gridcell"></td>
                            <td role="gridcell" class="tdAnual"><span title="Paciente Dia Total (TOTAL): <%=vPDTotal(12)%>"><%=vPDTotal(12)%></span></td>
                        </tr>
                        <%
                                End If
                        %>
                    </tbody>
                </table>
                <div class="row rodape">
                    <% View "AnaliseCritica" %>
                </div>
            </div>
        </div>
    </div>
</div>
