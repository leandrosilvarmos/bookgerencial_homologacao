<% 
Select Case UCase(Action)
    Case UCase("Create")
        Include("/_mvc/Bundles/iCheckJS.asp")
%>
<script src="/_mvc/Content/js/plugins/fontawesome-iconpicker/fontawesome-iconpicker.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('.icp-auto').iconpicker();
    });
</script>
<%
    Case UCase("Edit")
        Include("/_mvc/Bundles/iCheckJS.asp")
%>
<script src="/_mvc/Content/js/plugins/fontawesome-iconpicker/fontawesome-iconpicker.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('.icp-auto').iconpicker();
    });
</script>
<%
    Case UCase("List")
        Include("/_mvc/Bundles/DatatableJS.asp")
End Select 
%>