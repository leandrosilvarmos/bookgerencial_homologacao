<% If Not IsPrint Then %>
<script type="text/javascript">
    $(document).ready(function () {
        $("#spanBook").click(function () {
            $("#myModal .modal-body").html("<div class='sk-spinner sk-spinner-pulse'></div>");
            $("#myModal .modal-title").html("Selecione o book:");
            $("#myModal").modal("show").find(".modal-body").load("?action=Book&unidade=<%=Request.QueryString("unidade")%>&item=<%=Request.QueryString("item")%>&partial=true");
        });

        $("#h2Unidade").click(function () {
            $("#myModal .modal-body").html("<div class='sk-spinner sk-spinner-pulse'></div>");
            $("#myModal .modal-title").html("Selecione a unidade:");
            $("#myModal").modal("show").find(".modal-body").load("?action=Unidades&ano=<%=Request.QueryString("ano")%>&item=<%=Request.QueryString("item")%>&create=" + $(this).attr("data-create") + "&partial=true");
        });


        $("#myModal").click(function () {
            $("#myModal").modal("hide");
        });
    });
</script>
<% End If %>

<% 
Select Case UCase(Action)
    Case UCase("List")
%>

<script src="Content/js/tableHeadFixer.js"></script>

<!-- ChartJS-->
<script src="/_mvc/Content/js/plugins/chartJs/Chart2.min.js"></script>

<script type="text/javascript">
    var vFixedColumnDisabled = false;

    $(document).ready(function () {
        var vWindowWidth = $(window).width();

        $("#page-wrapper").width(vWindowWidth - 35);

        $("tr.tpS td:first-child").prepend("<i class='fa'></i>");

        var vSize = $("tr.jqgfirstrow td:first-child").css("width");

        if (vSize !== undefined) {
            $("table.ui-jqgrid-htable tr th:first-child").css("width", vSize);
            $("table.ui-jqgrid-htable tr th:first-child").css("margin-left", "-" + vSize);

            if ($(window).width() > 767) {
                $("table.ui-jqgrid-htable").css("padding-left", vSize);
                vFixedColumnDisabled = true;
            }
        }

        $("tr.tpS td:first-child").click(function () {
            $(this).toggleClass("ativo");

            $(".sub" + $(this).attr("data-value")).toggleClass("tr-hide");
        });

        $(".ui-jqgrid-bdiv tr:not(.tpG):not(.OverFlowSubItem):not(.separador)").click(function () {
            $(".ui-jqgrid-bdiv tr").removeClass("ui-state-highlight");

            $(this).addClass("ui-state-highlight");
        });

        $(".ui-jqgrid-bdiv").scroll(function () {
            $(".ui-jqgrid-hdiv").scrollLeft($(this).scrollLeft());
            //$(".rodape").css("left", $("tr.jqgfirstrow td:first-child").css("left"));
        });

        $("span[title!='']:not(.no-tooltip)").tooltip();

        $(".tpG").prev(".separador").prev(".tpG").hide();
        $(".separador").prev(".tpS").hide();
        $(".tpG").prev(".separador").prev(".tpS").prev(".separador").prev(".tpG").hide();

        $(".ui-jqgrid-btable").tableHeadFixer({ 'left': 1 });

        $("#btnAbrirGrafico").click(function () {
            $("#mdlGrafico").modal("show");

            $("#CdGrafico").change();
        });

        $("#CdGrafico").change(function () {
            $("#spninGraf").show();

            setTimeout(function () {
                $.ajax({
                    url: "?controller=Abas&action=GrafDataJsonPost&partial=true",
                    type: "Post",
                    data: { grafico: $("#CdGrafico").val(), unidade: '<%=Request("unidade")%>', ano: '<%=Request("ano")%>' },
                    dataType: "json",
                    success: function (Data) {
                        if (Data !== undefined) {
                            var grafico1 = document.getElementById("grafico");

                            var ctxGrf1 = grafico1.getContext("2d");

                            ctxGrf1.clearRect(0, 0, grafico1.width, grafico1.height);

                            var graf1 = new Chart(ctxGrf1, {
                                type: 'line',
                                data: Data,
                                options: {
                                    responsive: true,
                                    elements: {
                                        line: {
                                            tension: 0
                                        }
                                    },
                                    title: {
                                        display: true,
                                        text: $("#CdGrafico option:selected").text()
                                    },
                                    tooltips: {
                                        mode: 'index',
                                        intersect: false,
                                    },
                                    hover: {
                                        mode: 'nearest',
                                        intersect: true
                                    }
                                }
                            });
                        }
                        $("#spninGraf").hide();
                    },
                    error: errorFunc
                });

            }, 300);
        });

        $("#btnComparacao").click(function () {
            $("#mdlComparativo").modal("show");

            $("#CdUnidadeComparacao").change();
        });

        $("#CdMesComp").change(function () {
            $("#CdUnidadeComparacao").change();
        });

        $("#CdUnidadeComparacao").change(function () {
            if ($("#CdUnidadeComparacao").val() != "") {
                $("#spninComparativo").show();
                $("#btnComparativoExcel").removeAttr("disabled");

                setTimeout(function () {
                    $("#divComparativo").load("?controller=Abas&action=Comparativo&unidade=<%=ViewData.Item("CdUnidade")%>&unidade2=" + $("#CdUnidadeComparacao").val() + "&ano=<%=ViewData.Item("Ano")%>&item=<%=ViewData.Item("Modulo").GetValue("CD_MODULO",0)%>&mes=" + $("#CdMesComp").val() + "&partial=true");
                    $("#spninComparativo").hide();
                }, 300);
            } else {
                $("#spninComparativo").hide();
                $("#btnComparativoExcel").attr("disabled", "disabled");
            }
        });

        $("#btnComparativoExcel").click(function () {
            window.open("?controller=Abas&action=ComparativoExcel&unidade=<%=ViewData.Item("CdUnidade")%>&unidade2=" + $("#CdUnidadeComparacao").val() + "&ano=<%=ViewData.Item("Ano")%>&item=<%=ViewData.Item("Modulo").GetValue("CD_MODULO",0)%>&mes=" + $("#CdMesComp").val() + "&print=true");
        });

        $("#btnMaxmizeComparativo").click(function () {
            if ($("#mdlComparativo .modal-dialog").hasClass("full-screen")) {
                $("#mdlComparativo .modal-dialog").removeClass("full-screen");
            }
            else {
                $("#mdlComparativo .modal-dialog").addClass("full-screen");
            }
        });

        $("span.fa-info-circle").click(function () {
            $("#spninDetalhes").show();

            $("#spninDetalhes + .dl-horizontal").hide();

            $("#mdlDetalhes").modal("show");

            $.ajax({
                url: "?controller=Abas&action=RetornaDetalhesItemPost&partial=true",
                type: "Post",
                data: { cdItem: $(this).parents().first().attr("data-value") },
                dataType: "json",
                success: function (Data) {
                    if (Data !== undefined) {
                        $("#strIndicador").text(Data[0].INDICADOR);
                        $("#strDescricao").text(Data[0].DESCRICAO);
                        $("#strNivel").text(Data[0].NIVEL);
                        $("#strNumerador").text(Data[0].NUMERADOR);
                        $("#strDenominador").text(Data[0].DENOMINADOR);
                        $("#strObjetivo").text(Data[0].OBJETIVO);
                        $("#strFormula").text(Data[0].FORMULA);
                        $("#strFrequencia").text(Data[0].FREQUENCIA);
                        $("#strUnidadeMedida").text(Data[0].UNIDADE_MEDIDA);
                        $("#strOrigem").text(Data[0].ORIGEM);
                        $("#strMeta").text(Data[0].META);
                    }

                    $("#spninDetalhes").hide();
                    $("#spninDetalhes + .dl-horizontal").show();
                },
                error: errorFunc
            });
        });

        var optUnidade = $("#CdUnidadeComparacao option[value='<%=ViewData.Item("CdUnidade")%>']");
        optUnidade.text(optUnidade.text() + " (<%=CInt(Request.QueryString("ano"))-1%>)");
    });

    $(window).resize(function () {
        ResizeHeightTable();

        if ($(window).width() < 768) {
            $("table.ui-jqgrid-htable").css("padding-left", "0px");
            vFixedColumnDisabled = true;
        }
        else {
            if (vFixedColumnDisabled) {
                var vSize = $("tr.jqgfirstrow td:first-child").css("width");

                if (vSize !== undefined) {
                    $("table.ui-jqgrid-htable").css("padding-left", vSize);
                }

                vFixedColumnDisabled = false;
            }
        }
    });

    $(window).load(function () {
        setTimeout(function () {
            ResizeHeightTable();
        }, 300);
    });

    function ResizeHeightTable() {
        var vWindowHeight, vPageHeadingClassHeight, vPageHeadingHeight, vUiJgridTableHeight, vFinalHeight;

        vWindowHeight = $(".gray-bg").height();
        vPageHeadingClassHeight = $(".page-heading").height();
        vPageHeadingHeight = $("#page-heading").height();
        vUiJgridTableHeight = ($(".ui-jqgrid-btable").hasClass("hd-dias-mes") ? 27 : 0) + ($(".ui-jqgrid-btable").hasClass("hd-trimestre") ? 27 : 0);

        vFinalHeight = vWindowHeight - vPageHeadingClassHeight - vPageHeadingHeight - vUiJgridTableHeight - 180;

        $(".ui-jqgrid-bdiv").height(vFinalHeight);
    }
</script>

<% If CStr(Request.QueryString("item")) = "25" Then %>
<!-- ChartJS-->
<script src="/_mvc/Content/js/plugins/chartJs/Chart2.min.js"></script>

<script type="text/javascript">
    var barOption = {
        legend: {
            display: false
        },
        tooltips: {
            enabled: true
        },
        hover: {
            animationDuration: 1
        },
        layout: {
            padding: {
                left: 10,
                right: 10,
                top: 25,
                bottom: 10
            }
        },
        animation: {
            duration: 1,
            onComplete: function () {
                var chartInstance = this.chart,
                    ctx = chartInstance.ctx;
                ctx.textAlign = 'center';
                ctx.fillStyle = "rgba(0, 0, 0, 1)";
                ctx.textBaseline = 'bottom';

                this.data.datasets.forEach(function (dataset, i) {
                    var meta = chartInstance.controller.getDatasetMeta(i);
                    meta.data.forEach(function (bar, index) {
                        var data = dataset.data[index];
                        ctx.fillText(data + '%', bar._model.x, bar._model.y - 5);
                    });
                });
            }
        },
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }],
            xAxes: [{
                barPercentage: 0.4
            }]
        }
    };

    $(document).ready(function () {
        $(".ibox.mdl_25 > .ibox-content").height($(window).height() - $(".page-heading").height() - $("#page-heading").height() - 250 - ($(".ui-jqgrid-btable").hasClass("hd-dias-mes") ? 27 : 0) - ($(".ui-jqgrid-btable").hasClass("hd-trimestre") ? 27 : 0));
    });

    $(window).resize(function () {
        $(".ibox.mdl_25 > .ibox-content").height($(window).height() - $(".page-heading").height() - $("#page-heading").height() - 180 - ($(".ui-jqgrid-btable").hasClass("hd-dias-mes") ? 27 : 0) - ($(".ui-jqgrid-btable").hasClass("hd-trimestre") ? 27 : 0));
    });

    $(window).on('load', function () {
        GerarGraficos(<%=(Model.Count - 1) %>);
    });

    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        GerarGraficos($(this).attr("data-item"));
    });

    function GerarGraficos(pItem) {
        setTimeout(function () {
            $.ajax({
                url: "?controller=Abas&action=GrafResumoExecutivoJsonPost&partial=true",
                type: "Post",
                data: { unidade: '<%=Request("unidade")%>', ano: '<%=Request("ano")%>', item: pItem },
                dataType: "json",
                success: function (Data) {

                    if (Data.graf1 !== undefined && Data.graf2 !== undefined && Data.graf3 !== undefined && Data.graf4 !== undefined) {
                        var ctxGrf1 = document.getElementById("graf01_tab" + pItem).getContext("2d");
                        var ctxGrf2 = document.getElementById("graf02_tab" + pItem).getContext("2d");
                        var ctxGrf3 = document.getElementById("graf03_tab" + pItem).getContext("2d");
                        var ctxGrf4 = document.getElementById("graf04_tab" + pItem).getContext("2d");

                        var graf1 = new Chart(ctxGrf1, {
                            type: 'bar',
                            data: Data.graf1,
                            options: barOption
                        });

                        var graf2 = new Chart(ctxGrf2, {
                            type: 'bar',
                            data: Data.graf2,
                            options: barOption
                        });

                        var graf3 = new Chart(ctxGrf3, {
                            type: 'bar',
                            data: Data.graf3,
                            options: barOption
                        });

                        var graf4 = new Chart(ctxGrf4, {
                            type: 'bar',
                            data: Data.graf4,
                            options: barOption
                        });
                    }
                },
                error: errorFunc
            });
        }, 300);
    }
</script>
<% End If %>

<% If CStr(Request.QueryString("item")) = "22" Then %>
<script type="text/javascript">
    $(document).ready(function () {
        $(".ibox.mdl_22 > .ibox-content").height($(window).height() - $(".page-heading").height() - $("#page-heading").height() - 219 - ($(".ui-jqgrid-btable").hasClass("hd-dias-mes") ? 27 : 0) - ($(".ui-jqgrid-btable").hasClass("hd-trimestre") ? 27 : 0));
    });

    $(window).resize(function () {
        $(".ibox.mdl_22 > .ibox-content").height($(window).height() - $(".page-heading").height() - $("#page-heading").height() - 149 - ($(".ui-jqgrid-btable").hasClass("hd-dias-mes") ? 27 : 0) - ($(".ui-jqgrid-btable").hasClass("hd-trimestre") ? 27 : 0));
    });
</script>
<% End If %>

<% 
   Case UCase("Create"), UCase("CreateMsg")
%>

<!-- maskMoney -->
<script src="/_mvc/Content/js/plugins/maskMoney/jquery.maskMoney.js"></script>

<% Include("/_mvc/Bundles/DatePickerJS.asp") %>

<% Include("/_mvc/Bundles/JasnyJS.asp") %>

<script type="text/javascript">
    $(document).ready(function () {
        $("#CreatePost").on("keyup keypress", function (e) {
            var keyCode = e.keyCode || e.which;
            if (keyCode === 13) {
                e.preventDefault();
                return false;
            }
        });

        $("#CreateAnalisePost button[type!='submit']").on("click", function (e) {
            e.preventDefault();
        });

        $("span[title!='']:not(.no-tooltip), input.valor[title!=''], #changeData").tooltip();

        $("input.valor").change(function () {
            var vCdItem = $(this).attr("data-cditem");

            if ($(this).val() != "") {
                $(".cditem-" + vCdItem).attr("data-original-title", "Preenchido / Não salvo").addClass("amarelo");
            }
            else {
                $(".cditem-" + vCdItem).attr("data-original-title", "Sem Preenchimento").removeClass("amarelo");
            }

            if ($("#CreatePost input.valor").filter(function () { return this.value != ""; }).length > 0) {
                $("#btnSalvarValores").prop("disabled", false);
            } else {
                $("#btnSalvarValores").prop("disabled", true);
            }
        });

        $("#changeData").click(function () {
            $("#mdlChangeData").modal("show");
        });

        $("#btnChangeData").click(function () {
            $("#mdlChangeData").modal("hide");

            var vData = $("#txtChangeData").val().split("/");

            if (vData.length == 2) {
                window.location = "?controller=Abas&action=CreateMsg&unidade=" + $("#CdUnidade").val() + "&item=" + $("#CdModulo").val() + "&ano=" + vData[1] + "&mes=" + parseInt(vData[0]);
            }
        });

        $(".excluir-valor").click(function () {
            $("#valor-exclusao").html($(this).attr("data-valor"));
            $("#txtCdValorExclusao").val($(this).attr("data-cdvalor"));
            $("#mdlExcluirValor").modal("show");
        });

        $("#btnExcluirValor").click(function () {
            $.ajax({
                url: "?controller=Abas&action=ExcluirValorPost&partial=true",
                type: "Post",
                data: { CdValor: $("#txtCdValorExclusao").val(), Motivo: $("#txtMotivoExclusao").val() },
                dataType: "json",
                success: function (Data) {
                    $("#mdlExcluirValor").modal("hide");

                    if (Data.Sucesso) {
                        var vMes, vAno

                        if ($("#Ano").val() !== undefined && $("#Ano").val() != "") {
                            vAno = "&ano=" + $("#Ano").val()
                        } else {
                            vAno = ""
                        }

                        if ($("#Mes").val() !== undefined && $("#Mes").val() != "") {
                            vMes = "&mes=" + $("#Mes").val()
                        } else {
                            vMes = ""
                        }

                        window.location = "?controller=Abas&action=CreateMsg&unidade=" + $("#CdUnidade").val() + "&item=" + $("#CdModulo").val() + vAno + vMes
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    errorFunc(jqXHR, textStatus, errorThrown);
                }
            });
        });

        $("#AnaliseCritica").on("propertychange input", function (e) {
            if ($("#DsAnaliseCriticaSalvo") !== undefined) {
                if ($("#DsAnaliseCriticaSalvo").val() != $(this).val() && $(this).val().trim() != "") {
                    $("#btnSalvarAnalise").prop("disabled", false);
                } else {
                    $("#btnSalvarAnalise").prop("disabled", true);
                }
            }
        });

        $("#btnAprovarAnalise").click(function (e) {
            e.preventDefault();

            $("#Aprovacao").val("A");
            $("#CreateAnalisePost").attr("action", "?controller=Abas&action=AprovacaoAnalisePost").submit();
        });

        $("#btnRejeitarAnalise").click(function (e) {
            e.preventDefault();

            $("#mdlRejeitarAnalise").modal("show");
        });

        $("#btnRejeitarAnaliseConfirm").click(function () {
            $("#mdlRejeitarAnalise").modal("hide");

            $("#Aprovacao").val("R");
            $("#Motivo").val($("#txtMotivoRejeicao").val());
            $("#CreateAnalisePost").attr("action", "?controller=Abas&action=AprovacaoAnalisePost").submit();
        });

        $("#btnHistorico").click(function (e) {
            e.preventDefault();

            $("#mdlHistoricoAnalise .modal-body").html("<div class='sk-spinner sk-spinner-pulse'></div>");

            $("#mdlHistoricoAnalise .modal-body").load("?controller=Abas&action=AnaliseCriticaHistorico&unidade=" + $("#CdUnidade").val() + "&item=" + $("#CdModulo").val() + "&ano=" + $("#Ano").val() + "&mes=" + $("#Mes").val() + "&partial=true");

            $("#mdlHistoricoAnalise").modal("show");
        });

        $(".formatN .input-group input").maskMoney({
            allowNegative: true,
            allowZero: true,
            decimal: ',',
            thousands: '',
            affixesStay: false,
            allowEmpty: true
        });

        $(".formatH .input-group input").maskMoney({
            allowNegative: true,
            allowZero: true,
            decimal: ',',
            thousands: '',
            affixesStay: false,
            allowEmpty: true
        });

        $(".formatM .input-group input").maskMoney({
            allowNegative: true,
            allowZero: true,
            precision: 2,
            decimal: ',',
            thousands: '',
            affixesStay: false,
            allowEmpty: true
        });

        $(".formatD .input-group input, .formatP .input-group input").maskMoney({
            allowNegative: true,
            allowZero: true,
            precision: 2,
            thousands: '',
            decimal: ',',
            affixesStay: false,
            allowEmpty: true
        });
    });
</script>
<%
End Select 
%>