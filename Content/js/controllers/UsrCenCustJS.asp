<% 
Select Case UCase(Action)
    Case UCase("Create")
        Include("/_mvc/Bundles/iCheckJS.asp")
        Include("/_mvc/Bundles/Select2JS.asp")
    Case UCase("Edit")
        Include("/_mvc/Bundles/iCheckJS.asp")
        Include("/_mvc/Bundles/Select2JS.asp")
    Case UCase("List"), UCase("ListMsg")
        Include("/_mvc/Bundles/DatatableJS.asp")
        Include("/_mvc/Bundles/Select2JS.asp")
%>

<script type="text/javascript">
    $(document).ready(function () {
        $("#CdUsuario").change(function () {
            window.location = "?controller=UsrCenCust&action=ListMsg&id=" + $(this).val();
        });

        $("#CdGrupoPermissao").change(function () {
            window.location = "?controller=UsrCenCust&action=ListMsg&CdGrupoPermissao=" + $(this).val();
        });
    });
</script>

<%
End Select 
%>