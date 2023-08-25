<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><%=Texts.Titulo%></h5>
            </div>
            <div class="ibox-content">
                <form action="?controller=ItemModulo&action=CreatePost" id="CreatePost" method="post" accept-charset="ISO-8859-1">
                    <%=Html.Hidden("CdModulo", Model.CdModulo)%>
                    <%=Html.Hidden("CdItemSuperior", Model.CdItemSuperior)%>

                    <div class="form-horizontal">
                        <div class="form-group">
                            <%=eHtml.Label("Módulo", "CdModulo", "class='control-label col-md-2'")%>
                            <div class="col-md-10" style="padding-top: 7px;">
                                <% 
                                   If Not IsNothing(ViewData.Item("Modulo")) Then
                                        Response.Write(Html.Encode(ViewData.Item("Modulo").Items()(0).CdNmModulo))
                                   End If
                                %>
                            </div>
                        </div>
                        <% If Not IsNothing(ViewData.Item("ItemSuperior")) Then %>
                        <div class="form-group">
                            <%=eHtml.Label("Item Superior", "CdItemSuperior", "class='control-label col-md-2'")%>
                            <div class="col-md-10" style="padding-top: 7px;">
                                <%=Html.Encode(ViewData.Item("ItemSuperior").Items()(0).NmItem)%>
                            </div>
                        </div>
                        <% End If %>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "NmItem", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.TextBox("NmItem", Model.NmItem, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "DsItem", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.TextBox("DsItem", Model.DsItem, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.Label("Unidade", "CdUnidade", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=Html.DropDownList("CdUnidade", Model.CdUnidade, ViewData.Item("Unidades"), "CdUnidade", "NmUnidade")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.Label("Centro de Custo", "CdCentroCusto", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=Html.DropDownListGroupDb("CdCentroCusto", Model.CdCentroCusto, ViewData.Item("CentroCustos"), "CdCentroCusto", "CdNmCentroCusto", "CdUnidade", "Unidade")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "Formula", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.TextBox("Formula", Model.Formula, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "DsQuery", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.TextBox("DsQuery", Model.DsQuery, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "Ordem", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.NumTextBox("Ordem", Model.Ordem, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "QtdCasasDecimais", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.NumTextBox("QtdCasasDecimais", Model.QtdCasasDecimais, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "Estilo", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.DropDownListEnum("Estilo", Model.Estilo, "EstiloItemEnum", "multiple class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "Tipo", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=Html.RadioButtonListEnum("Tipo", Model.Tipo, "TipoItemEnum")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "Funcao", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=Html.RadioButtonListEnum("Funcao", Model.Funcao, "FuncaoItemEnum")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "Formatacao", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=Html.RadioButtonListEnum("Formatacao", Model.Formatacao, "FormatacaoItemEnum")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "OcultarNulo", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=Html.RadioButtonListEnum("OcultarNulo", Model.OcultarNulo, "IeCharEnum")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "Trimestral", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=Html.RadioButtonListEnum("Trimestral", Model.Trimestral, "FuncaoItemEnum")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "OrigemDados", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=Html.RadioButtonListEnum("OrigemDados", Model.OrigemDados, "OrigemDadosEnum")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "AH", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=Html.RadioButtonListEnum("AH", Model.OrigemDados, "IeCharEnum")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "ExibirTotal", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=Html.RadioButtonListEnum("ExibirTotal", Model.ExibirTotal, "IeCharEnum")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "Frequencia", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=Html.DropDownListEnum("Frequencia", Model.Frequencia, "FrequenciaEnum")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "MetaComparacao", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=Html.DropDownListEnum("MetaComparacao", Model.MetaComparacao, "DsMetaEnum")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "MetaValor", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.TextBox("MetaValor", Model.MetaValor, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "MetaComplemento", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.TextBox("MetaComplemento", Model.MetaComplemento, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "Situacao", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=Html.RadioButtonListEnum("Situacao", Model.Situacao, "SituacaoEnum")%>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <div class="col-md-offset-1 col-md-10">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp;&nbsp;Salvar</button>
                                <%=GetActionLink("ListMsg", "ItemModulo", "Voltar", "fa-reply",  Model.CdModulo & "&CdSuperior=" & Model.CdItemSuperior, true)%>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
