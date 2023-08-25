<% 
Select Case UCase(Action)
    Case UCase("Create")
        Include("/_mvc/Bundles/iCheckJS.asp")
        Include("/_mvc/Bundles/Select2JS.asp")
    Case UCase("Edit")
        Include("/_mvc/Bundles/iCheckJS.asp")
        Include("/_mvc/Bundles/Select2JS.asp")
    Case UCase("List")
        Include("/_mvc/Bundles/DatatableJS.asp")
End Select 
%>