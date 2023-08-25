<!-- DataTable -->
<script src="/_mvc/Content/js/plugins/dataTables/jquery.dataTables.min.js"></script>
<script src="/_mvc/Content/js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script src="/_mvc/Content/js/plugins/dataTables/dataTables.responsive.js"></script>
<script src="/_mvc/Content/js/plugins/dataTables/dataTables.colReorder.min.js"></script>
<script src="/_mvc/Content/js/plugins/dataTables/dataTables.tableTools.min.js"></script>
<script src="/_mvc/Content/js/plugins/dataTables/dataTables.buttons.min.js"></script>
<script src="/_mvc/Content/js/plugins/dataTables/jszip.min.js"></script>
<script src="/_mvc/Content/js/plugins/dataTables/pdfmake.min.js"></script>
<script src="/_mvc/Content/js/plugins/dataTables/vfs_fonts.js"></script>
<script src="/_mvc/Content/js/plugins/dataTables/buttons.html5.min.js"></script>
<script src="/_mvc/Content/js/plugins/dataTables/dataTables.fixedColumns.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('.table tfoot th').each(function () {
            if (!$(this).hasClass("no-filter")) {
                var title = $('.table thead th').eq($(this).index()).text();
                $(this).html('<input type="text" placeholder="' + title.trim() + '" style="width: 100%;" />');
            }
        });

        var vScrollX = false;

        if (typeof vTableScrollX !== 'undefined') {
            vScrollX = vTableScrollX;
        }

        var vOrderNum = 0;

        if (typeof vTableOrderNum !== 'undefined') {
            vOrderNum = vTableOrderNum;
        }

        var vOrderTipo = "asc";

        if (typeof vTableOrderTipo !== 'undefined') {
            vOrderTipo = vTableOrderTipo;
        }

        var vPdfOrientation = "normal";

        if (typeof vTablePdfOrientation !== 'undefined') {
            vPdfOrientation = vTablePdfOrientation;
        }

        var vLanguage = {
            "sEmptyTable": "Nenhum registro encontrado",
            "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
            "sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
            "sInfoFiltered": "(Filtrados de _MAX_ registros)",
            "sInfoPostFix": "",
            "sInfoThousands": ".",
            "sLengthMenu": "_MENU_ resultados por página",
            "sLoadingRecords": "Carregando...",
            "sProcessing": "Processando...",
            "sZeroRecords": "Nenhum registro encontrado",
            "sSearch": "Pesquisar",
            "oPaginate": {
                "sNext": "Próximo",
                "sPrevious": "Anterior",
                "sFirst": "Primeiro",
                "sLast": "Último"
            },
            "oAria": {
                "sSortAscending": ": Ordenar colunas de forma ascendente",
                "sSortDescending": ": Ordenar colunas de forma descendente"
            }
        };

        var vButtons

        if (typeof vTableNoButtons !== 'undefined') {
            vButtons = [];
        } else {
            vButtons = [
                { extend: 'pdfHtml5', text: '', orientation: vPdfOrientation },
                { extend: 'copyHtml5', text: '' },
                { extend: 'excelHtml5', text: '' },
                { extend: 'csvHtml5', text: '' }
            ];
        }

        jQuery.extend(jQuery.fn.dataTableExt.oSort, {
            "date-pre": function (a) {
                var b = a.split(' ');
                var ukDatea = b[0].split('/');
                var retorno = (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
                return retorno;
            },

            "date-asc": function (a, b) {
                return ((a < b) ? -1 : ((a > b) ? 1 : 0));
            },

            "date-desc": function (a, b) {
                return ((a < b) ? 1 : ((a > b) ? -1 : 0));
            },

            "date-time-pre": function (a) {
                var b = a.split(' ');
                var ukDatea = b[0].split('/');
                var ukHora = b[1].split(':');
                var retorno = (ukDatea[2] + ukDatea[1] + ukDatea[0] + ukHora[0] + ukHora[1] + ukHora[2]) * 1;
                return retorno;
            },

            "date-time-asc": function (a, b) {
                return ((a < b) ? -1 : ((a > b) ? 1 : 0));
            },

            "date-time-desc": function (a, b) {
                return ((a < b) ? 1 : ((a > b) ? -1 : 0));
            },

            "ordem-pre": function (a) {
                var b = a.split('/');
                var retorno = (lpad(b[1], "0", 4) + lpad(b[0], "0", 6)) * 1;

                return retorno;
            },

            "ordem-asc": function (a, b) {
                return ((a < b) ? -1 : ((a > b) ? 1 : 0));
            },

            "ordem-desc": function (a, b) {
                return ((a < b) ? 1 : ((a > b) ? -1 : 0));
            }
        });

        var vColumnDefs = [
            { targets: "ordem", sType: "ordem" },
            { targets: "no-sort", orderable: false },
            { targets: "date", sType: "date" },
            { targets: "date-time", sType: "date-time" }

        ];

        var table;

        if (vScrollX) {
            table = $('.table').DataTable({
                dom: 'lBfrtip',
                colReorder: true,
                scrollX: vScrollX,
                scrollCollapse: true,
                fixedColumns: {
                    leftColumns: 1
                },
                "order": [[vOrderNum, vOrderTipo]],
                "iDisplayLength": 25,
                buttons: vButtons,
                columnDefs: vColumnDefs,
                "language": vLanguage
            });
        }
        else {
            table = $('.table').DataTable({
                dom: 'lBfrtip',
                colReorder: true,
                "order": [[vOrderNum, vOrderTipo]],
                "iDisplayLength": 25,
                buttons: vButtons,
                columnDefs: vColumnDefs,
                "language": vLanguage
            });
        }

        if (typeof vTableNoButtons === 'undefined') {
            $("div.dt-buttons").prepend("<button id='reset' class='dt-button buttons-html5' title='Limpar filtros'><span class='fa fa-eraser'></span></button>")

            $("div.dt-buttons .dt-button").addClass("btn");

            $("div.dt-buttons .dt-button.buttons-copy span").addClass("fa fa-clipboard");
            $("div.dt-buttons .dt-button.buttons-copy").attr("title", "Copiar para área de transferência");

            $("div.dt-buttons .dt-button.buttons-excel span").addClass("fa fa-file-excel-o");
            $("div.dt-buttons .dt-button.buttons-excel").attr("title", "Exportar para Excel");

            $("div.dt-buttons .dt-button.buttons-csv span").addClass("fa fa-file-text-o");
            $("div.dt-buttons .dt-button.buttons-csv").attr("title", "Exportar para CSV");

            $("div.dt-buttons .dt-button.buttons-pdf span").addClass("fa fa-file-pdf-o");
            $("div.dt-buttons .dt-button.buttons-pdf").attr("title", "Exportar para PDF");
        }

        $('a.toggle-vis').on('click', function (e) {
            e.preventDefault();

            var column = table.column($(this).attr('data-column'));

            column.visible(!column.visible());
        });

        $('#reset').click(function (e) {
            e.preventDefault();

            table.colReorder.reset();

            table.search("").columns().search("").draw();

            $(".table tfoot input").val("").trigger("change");

        });

        $(".table tfoot input").on('keyup change', function () {
            table
                .column($(this).parent().index() + ':visible')
                .search(this.value)
                .draw();
        });
    });
</script>
