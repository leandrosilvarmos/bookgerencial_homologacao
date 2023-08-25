<!-- DatePicker -->
<script src="/_mvc/Content/js/plugins/datapicker/bootstrap-datepicker.js"></script>
<script src="/_mvc/Content/js/plugins/datapicker/bootstrap-datepicker.pt-BR.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('.input-group.date.full').datepicker({
            format: "dd/mm/yyyy",
            language: "pt-BR",
            autoclose: true,
            todayHighlight: true
        });

        $('.input-group.date.month').datepicker({
            format: "mm/yyyy",
            startView: 1,
            minViewMode: 1,
            language: "pt-BR",
            autoclose: true,
            todayHighlight: true
        });
    });
</script>
