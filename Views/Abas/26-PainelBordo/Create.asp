<% Frequencia = True %>
<% View "CreateValores" %>
<% If Request.QueryString("unidade") <> "2" Then %>
<% View "CreateAnaliseCritica" %>
<% End If %>