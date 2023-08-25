<% 
Select Case UCase(Action)
    Case UCase("List")
        Include("/_mvc/Bundles/DatatableCSS.asp")
%>
<style type="text/css">
    .table td.Status.A {
        color: #01690e;
        font-weight: 700;
    }

    .table td.Status.B {
        color: #800707;
        font-weight: 700;
    }
</style>
<%
End Select 
%>