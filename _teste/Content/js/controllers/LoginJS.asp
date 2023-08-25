<% 
Select Case UCase(Action)
    Case UCase("Create"), UCase("CreatePost")
        Include("/_mvc/Bundles/iCheckJS.asp")
        Include("/_mvc/Bundles/Select2JS.asp")
%>
<script type="text/javascript">
    $(document).ready(function () {
        if ($("#mensagem").val() != "") {
            var vMensagem, vAlert;

            vAlert = $("#mensagem").attr("data-alert");
            vMensagem = $("#mensagem").val();

            if (vAlert == "success") {
                toastr.success(vMensagem, '');
            }
            else {
                toastr.error(vMensagem, '');
            }
        }
    });
</script>
<%
    Case UCase("Edit"), UCase("EditPost")
        Include("/_mvc/Bundles/iCheckJS.asp")
        Include("/_mvc/Bundles/Select2JS.asp")
%>
<script type="text/javascript">
    $(document).ready(function () {
        if ($("#mensagem").val() != "") {
            var vMensagem, vAlert;

            vAlert = $("#mensagem").attr("data-alert");
            vMensagem = $("#mensagem").val();

            if (vAlert == "success") {
                toastr.success(vMensagem, '');
            }
            else {
                toastr.error(vMensagem, '');
            }
        }
    });
</script>
<%
    Case UCase("AlterarSenha"), UCase("AlterarSenhaMsg"), UCase("AlterarSenhaPost")
%>
<script type="text/javascript">
    $(document).ready(function () {
        if ($("#mensagem").val() != "") {
            var vMensagem, vAlert;

            vAlert = $("#mensagem").attr("data-alert");
            vMensagem = $("#mensagem").val();

            if (vAlert == "success") {
                toastr.success(vMensagem, '');
            }
            else {
                toastr.error(vMensagem, '');
            }
        }
    });
</script>
<%
    Case UCase("List")
        Include("/_mvc/Bundles/DatatableJS.asp")
End Select 
%>