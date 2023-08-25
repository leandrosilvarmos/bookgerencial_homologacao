<% 
Select Case UCase(Action)
    Case UCase("Index"), UCase("IndexMsg")
        Include("/_mvc/Bundles/DatePickerJS.asp") 
%>
<script type="text/javascript">
    var vTableNoButtons = true;
</script>
<%
        Include("/_mvc/Bundles/DatatableJS.asp")
%>
<script type="text/javascript">
    $(document).ready(function () {
        $("span[title!='']:not(.no-tooltip)").tooltip();

        $(".indicadores tr").click(function () {
            window.location = "?controller=Abas&action=CreateMsg&unidade=" + $(this).attr("data-cdunidade") + "&item=" + $(this).attr("data-cdmodulo") + $("#tmpData").val();
        });

        $('#txtPesquisar').on('propertychange input', function (e) {
            PesquisarItens($(this).val());
        });

        $(".legenda").click(function () {
            $("#txtPesquisar").val($(this).next("span").text());
            PesquisarItens($("#txtPesquisar").val());
        });

        $(".legenda + span").click(function () {
            $("#txtPesquisar").val($(this).text());
            PesquisarItens($("#txtPesquisar").val());
        });

        $("#changeData").click(function () {
            $("#mdlChangeData").modal("show");
        });

        $("#btnChangeData").click(function () {
            $("#mdlChangeData").modal("hide");

            var vData = $("#txtChangeData").val().split("/");

            if (vData.length == 2) {
                window.location = "?controller=Dashboard&action=IndexMsg&ano=" + vData[1] + "&mes=" + parseInt(vData[0]);
            }
        });
    });

    function PesquisarItens(vTxtPesquisar) {
        $("#box-indicadores").removeClass("filtrado");
        RedefinirItens();
        $("#lblFiltro").text("");

        if (vTxtPesquisar != "") {
            $(".clsModulo").removeClass("item-filtrado");

            var itemFiltrado;

            itemFiltrado = $(".clsModulo > td:nth-child(6)").filter(function () {
                var text = $(this).text().trim();
                text = removerAcentos(text.toUpperCase());

                var pesquisa = vTxtPesquisar;
                pesquisa = removerAcentos(pesquisa.toUpperCase());

                var ret = text.indexOf(pesquisa) !== -1;

                if (!ret) {
                    var keywords = $(this).closest(".clsModulo").attr("data-keywords");

                    var arrkeywords = keywords.split(",");

                    $(arrkeywords).each(function (index, value) {
                        var keyword = removerAcentos(value.toUpperCase());

                        ret = keyword == pesquisa

                        if (ret) return false;
                    });
                }

                return ret;
            }).closest(".clsModulo");

            $(itemFiltrado).addClass("item-filtrado");

            $(itemFiltrado).closest(".panel-collapse").addClass("in").attr("aria-expanded", "true").css("height", "auto");

            OcultarItens();

            $("#box-indicadores").addClass("filtrado");
            $("#lblFiltro").text($(".item-filtrado").length + " itens filtrados de " + $(".clsModulo").length);
        }
    }

    function OcultarItens() {
        $("#box-indicadores .panel.panel-default").each(function () {
            if ($(this).find(".item-filtrado").get(0) == undefined) {
                $(this).addClass("hide");
            }
        });
    }

    function RedefinirItens() {
        $(".clsModulo").show();
        $("#box-indicadores .panel.panel-default").removeClass("hide");
        $("#box-indicadores .panel.panel-default .panel-collapse").removeClass("in").attr("aria-expanded", "false").css("height", "0px");
        $("#box-indicadores .panel.panel-default:first-child .panel-collapse").addClass("in").attr("aria-expanded", "true").css("height", "auto");
    }

    function LimparPesquisa() {
        $('#txtPesquisar').val("");
        PesquisarItens("");
    }

    function removerAcentos(newStringComAcento) {
        var string = newStringComAcento;
        var mapaAcentosHex = {
            a: /[\xE0-\xE6]/g,
            A: /[\xC0-\xC6]/g,
            e: /[\xE8-\xEB]/g,
            E: /[\xC8-\xCB]/g,
            i: /[\xEC-\xEF]/g,
            I: /[\xCC-\xCF]/g,
            o: /[\xF2-\xF6]/g,
            O: /[\xD2-\xD6]/g,
            u: /[\xF9-\xFC]/g,
            U: /[\xD9-\xDC]/g,
            c: /\xE7/g,
            C: /\xC7/g,
            n: /\xF1/g,
            N: /\xD1/g,
        };

        for (var letra in mapaAcentosHex) {
            var expressaoRegular = mapaAcentosHex[letra];
            string = string.replace(expressaoRegular, letra);
        }

        return string;
    }

</script>
<%
End Select 
%>