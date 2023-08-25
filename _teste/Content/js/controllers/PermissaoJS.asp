<% 
Select Case UCase(Action)
    Case UCase("Create")
        Include("/_mvc/Bundles/iCheckJS.asp")
        Include("/_mvc/Bundles/Select2JS.asp")
%>

<script type="text/javascript">
    $(document).ready(function () {
        $("#CdController").change(function () {
            if ($(this).val() == 33) { //33 - Valores | Módulo
                $("#divModulo").show();
            } else {
                $("#divModulo").hide();
                $("#CdItem").val(null).trigger("change");
            }
        });
    });
</script>

<%
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
            window.location = "?controller=Permissao&action=ListMsg&id=" + $(this).val();
        });

        $("#CdGrupoPermissao").change(function () {
            window.location = "?controller=Permissao&action=ListMsg&CdGrupoPermissao=" + $(this).val();
        });
    });
</script>

<%
End Select 
%>