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
                        <p>*1 - Consumo geral contemplam os itens estocáveis e não padronizados, adquiridos através de SCDU (Solicitação de Compra - Direto ao Usuário), exceto Nutrição e Dietética, Gêneros Alimentícios e Medicamentos;</p>
                        <!--<p>*2 - Não há devoluções, pois o sistema de abastecimento é realizado via kamban e/ou requisições avulsas por Centro de Responsabilidade;</p>-->
                        <p>*2 - Requisição emergencial se tratam de solicitações de materiais armazenados no Ceadis para atendimento em até 2h30, com justificativa e autorização da Gerência responsável (setor solicitante);</p>
                        <p>*3 - Compras de urgência se referem a itens não padronizados, adquiridos através de SCDU, mediante justificativas descritas diretamente no impresso, salvo nos meses de  Junho (Scalp), Agosto (Plástico para plastificação), Outubro (Eletrodo marcapasso e Introdutor Swan Ganz) e Novembro (Tela cirúrgica) que também houveram compras de itens estocáveis;</p>
                        <p>*4/*5 - Volume de compras e Consumo por grupo de estocagem, idem ao tópico *1.</p>
                    </div>
                    <% View "AnaliseCritica" %>
                </div>
            </div>
        </div>
    </div>
</div>
