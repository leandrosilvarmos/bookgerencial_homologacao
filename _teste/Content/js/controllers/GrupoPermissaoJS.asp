<% 
Select Case UCase(Action)
    Case UCase("Create")
        Include("/_mvc/Bundles/iCheckJS.asp")
    Case UCase("Edit")
        Include("/_mvc/Bundles/iCheckJS.asp")
    Case UCase("List")
        Include("/_mvc/Bundles/DatatableJS.asp")
End Select 
%>