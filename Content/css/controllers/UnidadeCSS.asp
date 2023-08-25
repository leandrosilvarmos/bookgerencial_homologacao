<% 
Select Case UCase(Action)
    Case UCase("Create")
        Include("/_mvc/Bundles/iCheckCSS.asp")
        Include("/_mvc/Bundles/Select2CSS.asp")
    Case UCase("Edit")
        Include("/_mvc/Bundles/iCheckCSS.asp")
        Include("/_mvc/Bundles/Select2CSS.asp")
    Case UCase("List")
        Include("/_mvc/Bundles/DatatableCSS.asp")
End Select 
%>