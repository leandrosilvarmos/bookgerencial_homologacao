<% 
    If Not IsNothing(ViewData.Item("AnaliseCritica")) Then 
%>

<br />

<div class="hr-line-dashed"></div>

<div class="row">
    <h5 style="margin-left: 20px; margin-bottom: 15px; margin-top: 15px;">Análise crítica:</h5>

    <div class="col-sm-12">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th style="text-align: right;">Mês</th>
                    <th>&nbsp;</th>
                </tr>
            </thead>
            <tbody>
                <%
        For i = 0 To (ViewData.Item("AnaliseCritica").Count - 1) Step 1
                %>
                <tr>
                    <td style="text-align: right; border: 1px solid #ddd;"><strong><%=InitCap(MonthName(ViewData.Item("AnaliseCritica").GetValue("MES",i))) %></strong></td>
                    <td style="border: 1px solid #ddd; white-space: pre-wrap;"><%=Html.Encode(ViewData.Item("AnaliseCritica").GetValue("DS_ANALISE_CRITICA",i))%></td>
                </tr>
                <%
            Response.Flush
        Next
                %>
            </tbody>
        </table>
    </div>
</div>
<%
    End If
%>