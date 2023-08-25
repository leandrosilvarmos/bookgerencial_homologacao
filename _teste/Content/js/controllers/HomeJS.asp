<% 
Select Case UCase(Action)
    Case UCase("Index"), UCase("IndexMsg")
%>
<script type="text/javascript">
    $(document).ready(function () {
        $("#btnUnidades").click(function () {
            $(".li-tab").removeClass("active");
            $("#li-unidade").addClass("active");
        });

        $("#btnCadastros").click(function () {
            $(".li-tab").removeClass("active");
            $("#li-cadastros").addClass("active");
        });

        $('#cadastros-menu').metisMenu();

    });
</script>
<%
End Select 
%>