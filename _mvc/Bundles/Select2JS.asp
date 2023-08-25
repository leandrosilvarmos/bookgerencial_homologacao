<!-- Select2 -->
<script src="/_mvc/Content/js/plugins/select2/select2.full.min.js"></script>
<script src="/_mvc/Content/js/plugins/select2/pt-BR.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("select:not(.input-sm)").select2({
            dropdownAutoWidth: true,
            width: '100%',
            "language": "pt-BR",
            allowClear: true,
            placeholder: 'Selecione...'
        });

        $("select.input-sm.with-auto").select2({
            dropdownAutoWidth: true,
            width: '90%',
            "language": "pt-BR",
            allowClear: true,
            placeholder: 'Selecione...'
        });
    });

    function select2Open(name) {
        var select2 = $("#" + name).data('select2');
        setTimeout(function () {
            select2.open();
        }, 0);
    }
</script>
