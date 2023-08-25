<% 
Select Case UCase(Action)
    Case UCase("Create")
        Include("/_mvc/Bundles/iCheckCSS.asp")
%>
<link href="/_mvc/Content/css/plugins/fontawesome-iconpicker/fontawesome-iconpicker.css" rel="stylesheet">
<%
    Case UCase("Edit")
        Include("/_mvc/Bundles/iCheckCSS.asp")
%>
<link href="/_mvc/Content/css/plugins/fontawesome-iconpicker/fontawesome-iconpicker.css" rel="stylesheet">
<%
    Case UCase("List")
        Include("/_mvc/Bundles/DatatableCSS.asp")
End Select 
%>