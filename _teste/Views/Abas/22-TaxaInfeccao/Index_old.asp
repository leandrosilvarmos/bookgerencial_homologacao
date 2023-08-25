<div id="tbTaxaInfeccao">
    <div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="border: none;">
        <div class="ui-jqgrid-view">
            <% 
    If Not IsNothing(Model) Then
        Dim tempItem

        tempItem = ""

        For i = 0 To (Model.Count - 1) Step 1
            Dim vCdItem, vNmItem, vMes, vValAnterior, vValAtual, vValVar, vQtdMes

            vCdItem      = Model.GetValue("CD_ITEM",i)
            vNmItem      = Model.GetValue("NM_ITEM",i)
            vMes         = Model.GetValue("MES",i)
            vValAnterior = Model.GetValue("VAL_ANO_ANTERIOR",i)
            vValAtual    = Model.GetValue("VAL_ANO_ATUAL",i)
            vValVar      = Model.GetValue("VAL_VAR",i)
            vQtdMes      = Model.GetValue("QTD_MES",i)

            If vCdItem <> tempCdItem Then
                If i > 0 Then
            %>
            </tbody>
    </table>
            <br />
    <%
                End If
    %>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr class="ui-jqgrid-labels">
                        <th class="ui-state-default ui-th-column ui-th-ltr" colspan="2">CONTROLE DE INFECÇÃO</th>
                        <th class="ui-state-default ui-th-column ui-th-ltr"><%=ViewData.Item("Ano")-1%></th>
                        <th class="ui-state-default ui-th-column ui-th-ltr"><%=ViewData.Item("Ano")%></th>
                        <th class="ui-state-default ui-th-column ui-th-ltr">Var%</th>
                    </tr>
                    <tr class="ui-jqgrid-labels thtitle">
                        <th class="ui-state-default ui-th-column ui-th-ltr">&nbsp;</th>
                        <th class="ui-state-default ui-th-column ui-th-ltr">Mês</th>
                        <th class="ui-state-default ui-th-column ui-th-ltr" style="white-space: normal; width: 200px;"><%=vNmItem%></th>
                        <th class="ui-state-default ui-th-column ui-th-ltr" style="white-space: normal; width: 200px;"><%=vNmItem%></th>
                        <th class="ui-state-default ui-th-column ui-th-ltr" style="white-space: normal; width: 200px;"><%=ViewData.Item("Ano")%> X <%=ViewData.Item("Ano")-1%></th>
                    </tr>
                </thead>
                <tbody>
                    <%
            End If
                    %>
                    <tr class="<%=lcase(vMes)%> ui-widget-content jqgrow ui-row-ltr">
                        <% If vCdItem <> tempCdItem Then %>
                        <td rowspan="<%=CInt(vQtdMes)+1%>" style="background-color: #f5f5f5;"><b>UTI Adulto e Neo</b></td>
                        <% End If %>
                        <td><%=vMes%></td>
                        <td><%=vValAnterior%></td>
                        <td><%=vValAtual%></td>
                        <td class="<%=iif(vValVar>0,"stlN","")%>"><%=vValVar%>%</td>
                    </tr>
                    <% 
            tempCdItem     = Model.GetValue("CD_ITEM",i)

            Response.Flush
        Next

        If i > 0 Then
                    %>
                </tbody>
            </table>
            <%
            End If
        End If
            %>
        </div>
    </div>
</div>
<div class="row rodape">
    <% View "AnaliseCritica" %>
</div>
