<script type="text/javascript">
    $(document).ready(function () {
        $.ajax({
            url: "?action=AnalisePendencias&partial=true",
            type: "Get",
            dataType: "json",
            success: function (Data) {
                if (Data !== undefined) {
                    if (Data[0].TOTAL > 0) {
                        $("#notifyTotal .label-count").html(Data[0].TOTAL);
                        $("#notifyTotal .label-count").addClass("show");
                    }

                    if (Data[0].SEM_PREENCHIMENTO > 0) {
                        $("#notifySemPreenchimento .label-count").html(Data[0].SEM_PREENCHIMENTO);
                        $("#notifySemPreenchimento").addClass("show");
                    }

                    if (Data[0].SEM_APROVACAO > 0) {
                        $("#notifySemAprovacao .label-count").html(Data[0].SEM_APROVACAO);
                        $("#notifySemAprovacao").addClass("show");
                    }

                    if (Data[0].REJEITADAS > 0) {
                        $("#notifyRejeitada .label-count").html(Data[0].REJEITADAS);
                        $("#notifyRejeitada").addClass("show");
                    }
                }
            },
            error: errorFunc
        });
    });
</script>
