<% 
Select Case UCase(Action)
    Case UCase("List")
%>
<script type="text/javascript">
    var vTableOrderNum = 0;
    var vTableOrderTipo = "desc"
</script>
<%
        Include("/_mvc/Bundles/DatatableJS.asp")
End Select 
%>