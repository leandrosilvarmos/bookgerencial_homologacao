<% View "PageHeader" %>

<div class="row">
    <div class="col-lg-12">
        <% If Not IsNothing(ViewData.Item("Modulo")) Then %>
        <div class="ibox float-e-margins mdl_<%=ViewData.Item("Modulo").GetValue("CD_MODULO",0)%>">
            <div class="ibox-title">
                <h5>
                    <%=ViewData.Item("Modulo").GetValue("NM_MODULO",0)%>&nbsp;
                    <small class="hidden-xs"><%=ViewData.Item("Modulo").GetValue("DS_MODULO",0)%></small>
                </h5>
                <div class="ibox-tools hidden-xs">
                    <% If ViewData.Item("Unidades").Count > 1 Then 'And ViewData.Item("Modulo").GetValue("CD_MODULO",0) <> 6%> 
                    <a id="btnComparacao" href="#" class="btn btn-primary" style="color: #fff; margin-bottom: 0px; padding-top: 3px; padding-bottom: 2px;">
                        <i class="fa fa-hospital"></i>&nbsp;Comparar
                    </a>
                    <% End If %>
                    <% If Not IsNothing(ViewData.Item("Graficos")) Then%>
                    <a id="btnAbrirGrafico" href="#" class="btn btn-info" style="color: #fff; margin-bottom: 0px; padding-top: 3px; padding-bottom: 2px;">
                        <i class="fa fa-chart-pie"></i>&nbsp;Gr�ficos
                    </a>
                    <% End If %>
                    <% If ViewData.Item("PermissaoEdit") Then %>
                    <a class="btn btn-success" style="color: #fff; margin-bottom: 0px; padding-top: 3px; padding-bottom: 2px;" href="?controller=Abas&action=CreateMsg&unidade=<%=ViewData.Item("CdUnidade")%>&item=<%=ViewData.Item("Modulo").GetValue("CD_MODULO",0)%>">
                        <i class="fa fa-edit"></i>&nbsp;Cadastros
                    </a>
                    <% End If %>
                    <a href="?controller=Abas&action=IndexMsg&unidade=<%=ViewData.Item("CdUnidade")%>&ano=<%=ViewData.Item("Ano")%>">
                        <i class="fa fa-reply"></i>&nbsp;Voltar
                    </a>
                </div>

            </div>
            <hr style="margin: 0px !important; border-color: #c9d0d6;" />
            <div class="ibox-content">
                <%View ViewData.Item("Aba")%>
            </div>
        </div>
        <% End If %>
    </div>
</div>

<div id="mdlGrafico" class="modal fade">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"><%=ViewData.Item("Modulo").GetValue("NM_MODULO",0)%> / <%=ViewData.Item("Ano")%></h4>
            </div>
            <div class="modal-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="CdGrafico" class="control-label col-xs-2">Gr�fico</label>
                        <div class="col-xs-9">
                            <%=eHtml.DropDownListDb("CdGrafico", -1, ViewData.Item("Graficos"), "CD_GRAFICO", "NM_GRAFICO", "class='form-control'")%>
                        </div>
                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <div id="spninGraf" class="sk-spinner sk-spinner-pulse"></div>
                <canvas id="grafico" height="140"></canvas>
            </div>
            <div class="modal-footer" style="border-top-width: 0px;">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            </div>
        </div>
    </div>
</div>

<div id="mdlComparativo" class="modal fade">
    <div class="modal-dialog" style="width: 95%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <a href="#" id="btnMaxmizeComparativo" style="float: right; margin-right: 10px;" title="Maximizar"><i class="fa"></i></a>
                <h4 class="modal-title">COMPARATIVO - <%=ViewData.Item("Modulo").GetValue("NM_MODULO",0)%> / <%=ViewData.Item("Ano")%></h4>
            </div>
            <div class="modal-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="CdMesComp" class="control-label col-xs-2">M�s</label>
                        <div class="col-xs-9">
                            <select id="CdMesComp" name="CdMesComp" class="form-control">
                                <option value="1" selected>Janeiro</option>
                                <option value="2">Fevereiro</option>
                                <option value="3">Mar�o</option>
                                <option value="4">Abril</option>
                                <option value="5">Maio</option>
                                <option value="6">Junho</option>
                                <option value="7">Julho</option>
                                <option value="8">Agosto</option>
                                <option value="9">Setembro</option>
                                <option value="10">Outubro</option>
                                <option value="11">Novembro</option>
                                <option value="12">Dezembro</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-2"><i class="fa fa-circle comp-unidade1"></i>&nbsp;&nbsp;Unidade 1</label>
                        <div class="col-xs-9" style="margin-top: 5px; font-size: 14px; padding-left: 31px;">
                            <%=ViewData.Item("Unidade")%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="CdGrafico" class="control-label col-xs-2"><i class="fa fa-circle comp-unidade2"></i>&nbsp;&nbsp;Unidade 2</label>
                        <div class="col-xs-9">
                            <%=eHtml.DropDownListDb("CdUnidadeComparacao", iif(ViewData.Item("Modulo").GetValue("CD_MODULO",0) = 6, ViewData.Item("CdUnidade"), null), ViewData.Item("Unidades"), "CD_UNIDADE", "SIGLA_NM_UNIDADE", "class='form-control' " & iif(ViewData.Item("Modulo").GetValue("CD_MODULO",0) = 6, "disabled='disabled'", ""))%>
                        </div>
                        <div class="col-xs-1">
                            <button id="btnComparativoExcel" disabled="disabled" class="btn btn-primary btn-rounded" type="button" style="padding-bottom: 3px; padding-top: 4px; margin-top: 3px;"><i class="fa fa-file-excel"></i>&nbsp;Excel</button>
                        </div>
                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <div id="spninComparativo" class="sk-spinner sk-spinner-pulse"></div>
                <div id="divComparativo"></div>
            </div>
            <div class="modal-footer" style="border-top-width: 0px;">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            </div>
        </div>
    </div>
</div>

<div id="mdlDetalhes" class="modal fade">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Detalhes</h4>
            </div>
            <div class="modal-body" style="padding-bottom: 0px;">
                <div id="spninDetalhes" class="sk-spinner sk-spinner-pulse"></div>
                <dl class="dl-horizontal" style="margin-bottom: 0px;">
                    <dt>Indicador</dt>
                    <dd id="strIndicador"></dd>

                    <dt>Descri��o</dt>
                    <dd id="strDescricao"></dd>

                    <dt>N�vel</dt>
                    <dd id="strNivel"></dd>

                    <dt>Numerador</dt>
                    <dd id="strNumerador"></dd>

                    <dt>Denominador</dt>
                    <dd id="strDenominador"></dd>

                    <dt>Objetivo</dt>
                    <dd id="strObjetivo"></dd>

                    <dt>F�rmula</dt>
                    <dd id="strFormula"></dd>

                    <dt>Frequ�ncia</dt>
                    <dd id="strFrequencia"></dd>

                    <dt>Unidade de Medida</dt>
                    <dd id="strUnidadeMedida"></dd>

                    <dt>Origem dos dados</dt>
                    <dd id="strOrigem"></dd>

                    <dt>Meta</dt>
                    <dd id="strMeta"></dd>
                </dl>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="modal-footer" style="border-top-width: 0px;">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            </div>
        </div>
    </div>
</div>
