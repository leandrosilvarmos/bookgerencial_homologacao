<% 
Select Case UCase(Action)
    Case UCase("Create")
        Include("/_mvc/Bundles/iCheckCSS.asp")
    Case UCase("Edit")
        Include("/_mvc/Bundles/iCheckCSS.asp")
    Case UCase("List")
        Include("/_mvc/Bundles/DatatableCSS.asp")
%>
<style type="text/css">
    a.fa.fa-unlock-alt {
        color: #1a1a1a;
    }

        a.fa.fa-unlock-alt:hover {
            color: #6f6f6f;
        }

        a.fa.fa-unlock-alt:active {
            color: #000000;
        }
</style>
<%
End Select 
%>