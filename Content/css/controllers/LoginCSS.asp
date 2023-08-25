<% 
Select Case UCase(Action)
    Case UCase("Create"), UCase("CreatePost")
        Include("/_mvc/Bundles/iCheckCSS.asp")
        Include("/_mvc/Bundles/Select2CSS.asp")
    Case UCase("Edit"), UCase("EditPost")
        Include("/_mvc/Bundles/iCheckCSS.asp")
        Include("/_mvc/Bundles/Select2CSS.asp")
    Case UCase("List")
        Include("/_mvc/Bundles/DatatableCSS.asp")
%>
<style type="text/css">
    a.fa.fa-unlock-alt, a.fa.fa-object-group {
        color: #1a1a1a;
    }

        a.fa.fa-unlock-alt:hover, a.fa.fa-object-group:hover {
            color: #6f6f6f;
        }

        a.fa.fa-unlock-alt:active, a.fa.fa-object-group:active {
            color: #000000;
        }
</style>
<%
End Select 
%>