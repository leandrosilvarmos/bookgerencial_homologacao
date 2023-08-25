<tr class="ui-jqgrid-labels" role="rowheader">
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 200px;">&nbsp;</th>
    <% If vFrequencia Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">FREQUÊNCIA</th>
    <% End If %>
    <% If vMeta Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">META</th>
    <% End If %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">JAN</th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">FEV</th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">MAR</th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">ABR</th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">MAI</th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">JUN</th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">JUL</th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">AGO</th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">SET</th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">OUT</th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">NOV</th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">DEZ</th>
    <% If vTotalAnual Or vMediaAnual Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 65px;">&nbsp;</th>
    <% End If %>

    <% If vTotalAnual Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">TOTAL <%=ViewData.Item("Ano")%></th>
    <% End If %>
    <% If vMediaAnual Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">MÉDIA <%=ViewData.Item("Ano")%></th>
    <% End If %>
    <% If vAvAnual Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">A.V. <%=ViewData.Item("Ano")%></th>
    <% End If %>


    <% 'Valores ano anterior %>
    <% If vTotalAnual Or vMediaAnual Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 65px;">&nbsp;</th>
    <% End If %>
    <% If vTotalAnual Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">TOTAL <%=ViewData.Item("Ano")-1%></th>
    <% End If %>
    <% If vMediaAnual Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">MÉDIA <%=ViewData.Item("Ano")-1%></th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;"><%=ViewData.Item("Ano")%> x <%=ViewData.Item("Ano")-1%></th>
    <% End If %>
    <% If vAvAnual Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">A.V. <%=ViewData.Item("Ano")-1%></th>
    <% End If %>
</tr>
<%
    If vDiasMes Then
%>
<tr class="dias-mes ui-jqgrid-labels" role="rowheader">
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="text-align: right; padding-right: 8px; padding-top: 5px;">Dias</th>
    <% If vFrequencia Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">&nbsp;</th>
    <% End If %>
    <% If vMeta Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">&nbsp;</th>
    <% End If %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"><%=QuantosDiasMes(1,ViewData.Item("Ano"),true)%></th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"><%=QuantosDiasMes(2,ViewData.Item("Ano"),true)%></th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"><%=QuantosDiasMes(3,ViewData.Item("Ano"),true)%></th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"><%=QuantosDiasMes(4,ViewData.Item("Ano"),true)%></th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"><%=QuantosDiasMes(5,ViewData.Item("Ano"),true)%></th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"><%=QuantosDiasMes(6,ViewData.Item("Ano"),true)%></th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"><%=QuantosDiasMes(7,ViewData.Item("Ano"),true)%></th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"><%=QuantosDiasMes(8,ViewData.Item("Ano"),true)%></th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"><%=QuantosDiasMes(9,ViewData.Item("Ano"),true)%></th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"><%=QuantosDiasMes(10,ViewData.Item("Ano"),true)%></th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"><%=QuantosDiasMes(11,ViewData.Item("Ano"),true)%></th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"><%=QuantosDiasMes(12,ViewData.Item("Ano"),true)%></th>
    
    <% If vTotalAnual Or vMediaAnual Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 65px;">&nbsp;</th>
    <% End If %>

    <% If vTotalAnual Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr tdAnual" style="width: 130px;">&nbsp;</th>
    <% End If %>
    <% If vMediaAnual Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr tdMedia" style="width: 130px;">&nbsp;</th>
    <% End If %>
    <% If vAvAnual Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr tdAv" style="width: 130px;">&nbsp;</th>
    <% End If %>

    <% 'Valores ano anterior %>
    <% If vTotalAnual Or vMediaAnual Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 65px;">&nbsp;</th>
    <% End If %>
    <% If vTotalAnual Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr tdAnualAnoAnterior" style="width: 130px;">&nbsp;</th>
    <% End If %>
    <% If vMediaAnual Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr tdMediaAnoAnterior" style="width: 130px;">&nbsp;</th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr tdComparacaoAnos" style="width: 130px;">&nbsp;</th>
    <% End If %>
    <% If vAvAnual Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr tdAv" style="width: 130px;">&nbsp;</th>
    <% End If %>
</tr>
<%
    End If

    If vTrimestre Then
%>
<tr class="trimestre ui-jqgrid-labels" role="rowheader">
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr">&nbsp;</th>
    <% If vFrequencia Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">&nbsp;</th>
    <% End If %>
    <% If vMeta Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">&nbsp;</th>
    <% End If %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" colspan="3">1º TRI</th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" colspan="3">2º TRI</th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" colspan="3">3º TRI</th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" colspan="3">4º TRI</th>
    <% If vTotalAnual Or vMediaAnual Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 65px;">&nbsp;</th>
    <% End If %>

    <% If vTotalAnual Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">&nbsp;</th>
    <% End If %>
    <% If vMediaAnual Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">&nbsp;</th>
    <% End If %>
    <% If vAvAnual Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">&nbsp;</th>
    <% End If %>

    <% 'Valores ano anterior %>
    <% If vTotalAnual Or vMediaAnual Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 65px;">&nbsp;</th>
    <% End If %>
    <% If vTotalAnual Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">&nbsp;</th>
    <% End If %>
    <% If vMediaAnual Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">&nbsp;</th>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">&nbsp;</th>
    <% End If %>
    <% If vAvAnual Then %>
    <th role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 130px;">&nbsp;</th>
    <% End If %>
</tr>
<%
    End If

    Set vMeses   = Nothing
    Set vDiasMes = Nothing
%>