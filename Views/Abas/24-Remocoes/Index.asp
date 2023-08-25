<div id="tbRemocoes" class="jqGrid_wrapper">
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
                    <% View "AnaliseCritica" %>
                </div>
            </div>
        </div>
    </div>
</div>
