<div id="tbSuprimentos" class="jqGrid_wrapper">
    <div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="gbox_table_list_1" dir="ltr" style="width: 100%;">
        <div class="ui-jqgrid-view" id="gview_table_list_1" style="width: 100%;">
            <div class="ui-state-default ui-jqgrid-hdiv" style="width: 100%; cursor: default;">
                <div class="ui-jqgrid-hbox">
                    <table class="ui-jqgrid-htable" style="width: 100%;" role="grid" cellspacing="0" cellpadding="0" border="0">
                        <thead>
                            <%
                               vMeses      = True
                               vTotalAnual = True
                               vMediaAnual = True

                               View "Header"
                            %>
                        </thead>
                    </table>
                </div>
            </div>
            <div class="ui-jqgrid-bdiv" style="height: 640px; width: 100%;">
                <table tabindex="0" cellspacing="0" cellpadding="0" border="0" role="grid" class="ui-jqgrid-btable" style="width: 100%;">
                    <tbody>
                        <% View "Valores" %>
                    </tbody>
                </table>
                <div class="row rodape">
                    <div style="padding-left: 20px; margin-top: 10px; margin-bottom: -10px;">
                        <p>*1 - Consumo geral contemplam os itens estoc�veis e n�o padronizados, adquiridos atrav�s de SCDU (Solicita��o de Compra - Direto ao Usu�rio), exceto Nutri��o e Diet�tica, G�neros Aliment�cios e Medicamentos;</p>
                        <!--<p>*2 - N�o h� devolu��es, pois o sistema de abastecimento � realizado via kamban e/ou requisi��es avulsas por Centro de Responsabilidade;</p>-->
                        <p>*2 - Requisi��o emergencial se tratam de solicita��es de materiais armazenados no Ceadis para atendimento em at� 2h30, com justificativa e autoriza��o da Ger�ncia respons�vel (setor solicitante);</p>
                        <p>*3 - Compras de urg�ncia se referem a itens n�o padronizados, adquiridos atrav�s de SCDU, mediante justificativas descritas diretamente no impresso, salvo nos meses de  Junho (Scalp), Agosto (Pl�stico para plastifica��o), Outubro (Eletrodo marcapasso e Introdutor Swan Ganz) e Novembro (Tela cir�rgica) que tamb�m houveram compras de itens estoc�veis;</p>
                        <p>*4/*5 - Volume de compras e Consumo por grupo de estocagem, idem ao t�pico *1.</p>
                    </div>
                    <% View "AnaliseCritica" %>
                </div>
            </div>
        </div>
    </div>
</div>
