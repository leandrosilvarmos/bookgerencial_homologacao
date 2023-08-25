<% 
Select Case UCase(Action)
    Case UCase("Create")
        Include("/_mvc/Bundles/iCheckCSS.asp")
        Include("/_mvc/Bundles/Select2CSS.asp")
    Case UCase("Edit")
        Include("/_mvc/Bundles/iCheckCSS.asp")
    Case UCase("List"), UCase("ListMsg")
        Include("/_mvc/Bundles/DatatableCSS.asp")
        Include("/_mvc/Bundles/Select2CSS.asp")
End Select 
%>