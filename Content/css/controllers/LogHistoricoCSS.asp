<% 
Select Case UCase(Action)
    Case UCase("List")
        Include("/_mvc/Bundles/DatatableCSS.asp")
%>
<style type="text/css">

        .table td.TipoLog.I {
            color: #01690e;
            font-weight: 700;
        }

        .table td.TipoLog.E {
            color: #800707;
            font-weight: 700;
        }

        .table td.TipoLog.A {
            color: #a37302;
            font-weight: 700;
        }
    
</style>
<%
End Select 
%>