<div class="jqGrid_wrapper">
    <div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="gbox_table_list_1" dir="ltr" style="width: 100%;">
        <div class="ui-jqgrid-view" id="gview_table_list_1" style="width: 100%;">
            <div class="ui-jqgrid-bdiv">
                <table tabindex="0" cellspacing="0" cellpadding="0" border="0" role="grid" class="ui-jqgrid-btable" style="width: 100%;">
                    <thead>
                        <tr class="ui-jqgrid-labels" role="rowheader">
                            <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="border-top-width: 0px; border-left-width: 0px; padding: 6px;">&nbsp;</th>
                            <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr comp-unidade1" style="width: 130px; border-top-width: 0px; border-left-width: 0px; padding: 6px;"><%=ViewData.Item("Unidade1")%></th>
                            <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr comp-unidade2" style="width: 130px; border-top-width: 0px; border-left-width: 0px; padding: 6px;"><%=ViewData.Item("Unidade2")%></th>
                            <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px; border-top-width: 0px; border-left-width: 0px; padding: 6px;">%</th>
                        </tr>
                    </thead>
                    <tbody>
<% If Not IsPrint Then %>
                        <tr class="jqgfirstrow" role="row" style="height: auto">
                            <td role="gridcell" style="height: 0px;"></td>
                            <td role="gridcell" style="height: 0px; width: 130px;"></td>
                            <td role="gridcell" style="height: 0px; width: 130px;"></td>
                        </tr>
<% End If %>
                        <%
If Not IsNothing(Model) Then
    Dim vTempCdGrupo, vTempCdSubgrupo, vZebra

    vTempCdGrupo    = ""
    vTempCdSubgrupo = ""
    vZebra          = "odd"

    vAnoAtual    = ViewData.Item("Ano")
    vAnoAnterior = vAnoAtual -1
    
    For i = 0 To (Model.Count - 1) Step 1
        If Model.GetValue("IS_ITEM",i) = "S" Then
            Dim vNivel, vCdItem, vNmItem, vDsItem, vTipo, vFuncao, vFormatacao, vFormula, vCdItemSuperior, vQtdCasasDecimais, vEstilo, vCdUnidade, vNumUnidade

            Dim vValUnidade1, vValUnidade2, vVariacao

            Dim vSub, vExibir, vCdItemRaiz
        
            vNivel               = Model.GetValue("NIVEL",i)
            vCdItem              = Model.GetValue("CD_ITEM",i)
            vNmItem              = Model.GetValue("NM_ITEM",i)
            vDsItem              = Model.GetValue("DS_ITEM",i)
            vTipo                = Model.GetValue("TIPO",i)
            vFuncao              = Model.GetValue("FUNCAO",i)
            vFormatacao          = Model.GetValue("FORMATACAO",i)
            vFormula             = Model.GetValue("FORMULA",i)
            vCdItemSuperior      = Model.GetValue("CD_ITEM_SUPERIOR",i)
            vQtdCasasDecimais    = Model.GetValue("QTD_CASAS_DECIMAIS",i)
            vEstilo              = Model.GetValue("ESTILO",i)
            vCdUnidade           = Model.GetValue("CD_UNIDADE",i)
            vNumUnidade          = Model.GetValue("NUM_UNIDADE",i)

            vCdItemRaiz          = Model.GetValue("CD_ITEM_RAIZ",i)
            vExibir = True

            If vTipo = "G" Or vTipo = "S" Then
                If VerificarConjuntoVazio(vCdItem, i) Then
                    vExibir = False
                End If
            End If

            If vExibir Then
                vValUnidade1 = iif(vFormatacao <> "T", FormatarValor(Model.GetValue("VAL_UNIDADE1",i), vFormatacao, vFormula, "VAL_UNIDADE1", i, vQtdCasasDecimais), Model.GetValue("VAL_UNIDADE1_TXT",i))
                vValUnidade2 = iif(vFormatacao <> "T", FormatarValor(Model.GetValue("VAL_UNIDADE2",i), vFormatacao, vFormula, "VAL_UNIDADE2", i, vQtdCasasDecimais), Model.GetValue("VAL_UNIDADE2_TXT",i))
                
                If vValUnidade1 = "-" And vValUnidade2 = "-" And (vFuncao <> "" Or vFormula <> "") And vTipo = "I" Then
                    vExibir = False
                End If

                If vExibir Then
                    vSub = ""
            
                    For Each vCdSub In Split(Model.GetValue("PATH_CD_ITEM",i),";")
                        If vCdSub <> "" And vCdSub <> CStr(vCdItem) Then
                            vSub = vSub & " sub" & vCdSub
                        End If
                    Next

                    If IsNumeric(Replace(Nvl(vValUnidade1,"-"),"%","")) And  IsNumeric(Replace(Nvl(vValUnidade2,"-"),"%","")) Then
                        If CDbl(Replace(vValUnidade2,"%","")) <> 0 And CDbl(Replace(vValUnidade1,"%","")) <> 0 Then
                            If vFormatacao = "P" Then
                                vVariacao = CDbl(Replace(vValUnidade2,"%","")) - CDbl(Replace(vValUnidade1,"%",""))
                            Else
                                vVariacao = (CDbl(Replace(vValUnidade2,"%","")) / CDbl(Replace(vValUnidade1,"%","")) - 1) * 100
                            End If

                            vVariacao = FormatNumber(vVariacao,2) & iif(vFormatacao = "P","p.p","%")
                        Else
                            vVariacao = "-"
                        End If
                    Else
                        vVariacao = "-"
                    End If


                    If instr(vEstilo, "stlSeparadorTop") > 0 And i > 0 Then

                        %>
                        <tr role="row" class="separador ui-widget-content jqgrow ui-row-ltr">
                            <td role="gridcell" colspan="4"></td>
                        </tr>
                        <%
                    End If
                        %>
                        <tr role="row" class="nvl<%=vNivel%> tp<%=vTipo%> <%=vSub%> <%=vEstilo%> ui-widget-content jqgrow ui-row-ltr comp-unidade<%=vNumUnidade%>">
                            <td role="gridcell" class="ativo" data-value="<%=vCdItem%>"><%=vNmItem%><%=iif(Not IsNothing(vDsItem), "<span style='float: right; color: #7d8081; cursor: help; display: none;' class='fas fa-lg fa-info-circle' title='"&vDsItem&"'></span>", "")%></td>
                            <td role="gridcell"><span title="<%=vNmItem%> (<%=ViewData.Item("Unidade1")%>): <%=vValUnidade1%>"><%=vValUnidade1%></span></td>
                            <td role="gridcell"><span title="<%=vNmItem%> (<%=ViewData.Item("Unidade2")%>): <%=vValUnidade2%>"><%=vValUnidade2%></span></td>
                            <td role="gridcell"><span title="<%=vNmItem%> (<%=iif(vFormatacao = "P","p.p","%")%>): <%=vVariacao%>"><%=vVariacao%></span></td>
                            <%                          
                    Response.Flush
                End If
            End If
        End If
    Next
End If
                            %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>