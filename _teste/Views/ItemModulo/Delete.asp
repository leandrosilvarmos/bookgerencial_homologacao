<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><%=Texts.Titulo%></h5>
            </div>
            <div class="ibox-content">
                <h3><%=Texts.Mensagem("msgConfDelete")%></h3>
                <div style="margin-bottom: 23px;"></div>
                <div>
                    <dl class="dl-horizontal">
                        <dt><%=Html.Encode("Módulo")%></dt>
                        <dd>
                            <% 
                                If Not IsNothing(ViewData.Item("Modulo")) Then
                                    Response.Write(Html.Encode(ViewData.Item("Modulo").Items()(0).CdNmModulo))
                                End If
                            %>
                        </dd>

                        <% If Not IsNothing(ViewData.Item("ItemSuperior")) Then %>
                        <dt><%=Html.Encode("Item Superior")%></dt>
                        <dd>
                            <%=Html.Encode(ViewData.Item("ItemSuperior").Items()(0).NmItem)%>
                        </dd>
                        <% End If %>
                    </dl>
                    <div class="hr-line-dashed"></div>
                    <dl class="dl-horizontal">
                        <dt><%=Html.Display(Model, "NmItem")%></dt>
                        <dd>
                            <%=Html.Encode(Model.NmItem)%>
                        </dd>

                        <dt><%=Html.Display(Model, "DsItem")%></dt>
                        <dd>
                            <%=Html.Encode(Model.DsItem)%>
                        </dd>

                        <dt><%=Html.Encode("Unidade")%></dt>
                        <dd>
                            <% 
                                If Not IsNothing(ViewData.Item("Unidade")) Then
                                    Response.Write(Html.Encode(ViewData.Item("Unidade").Items()(0).NmUnidade))
                                End If
                            %>
                        </dd>

                        <dt><%=Html.Encode("CentroCusto")%></dt>
                        <dd>
                            <% 
                                If Not IsNothing(ViewData.Item("CentroCusto")) Then
                                    Response.Write(Html.Encode(ViewData.Item("CentroCusto").Items()(0).CdNmCentroCusto))
                                End If
                            %>
                        </dd>

                        <dt><%=Html.Display(Model, "Formula")%></dt>
                        <dd>
                            <%=Html.Encode(Model.Formula)%>
                        </dd>

                        <dt><%=Html.Display(Model, "DsQuery")%></dt>
                        <dd>
                            <%=Html.Encode(Model.DsQuery)%>
                        </dd>

                        <dt><%=Html.Display(Model, "Ordem")%></dt>
                        <dd>
                            <%=Html.Encode(Model.Ordem)%>
                        </dd>

                        <dt><%=Html.Display(Model, "Tipo")%></dt>
                        <dd>
                            <%=Html.Encode(Texts.EnumDescricao("TipoItemEnum", Model.Tipo))%>
                        </dd>

                        <dt><%=Html.Display(Model, "Funcao")%></dt>
                        <dd>
                            <%=Html.Encode(Texts.EnumDescricao("FuncaoItemEnum", Model.Funcao))%>
                        </dd>

                        <dt><%=Html.Display(Model, "Formatacao")%></dt>
                        <dd>
                            <%=Html.Encode(Texts.EnumDescricao("FormatacaoItemEnum", Model.Formatacao))%>
                        </dd>

                        <dt><%=Html.Display(Model, "Situacao")%></dt>
                        <dd>
                            <%=Html.Encode(Texts.EnumDescricao("SituacaoEnum", Model.Situacao))%>
                        </dd>

                        <dt><%=Html.Display(Model, "QtdCasasDecimais")%></dt>
                        <dd>
                            <%=Html.Encode(Model.QtdCasasDecimais)%>
                        </dd>

                        <dt><%=Html.Display(Model, "Estilo")%></dt>
                        <dd>
                            <%=Html.Encode(Model.Estilo)%>
                        </dd>

                        <dt><%=Html.Display(Model, "OcultarNulo")%></dt>
                        <dd>
                            <%=Html.Encode(Texts.EnumDescricao("FormatacaoItemEnum", Model.OcultarNulo))%>
                        </dd>

                        <dt><%=Html.Display(Model, "Trimestral")%></dt>
                        <dd>
                            <%=Html.Encode(Texts.EnumDescricao("FuncaoItemEnum", Model.Trimestral))%>
                        </dd>

                        <dt><%=Html.Display(Model, "AH")%></dt>
                        <dd>
                            <%=Html.Encode(Texts.EnumDescricao("IeCharEnum", Model.AH))%>
                        </dd>

                        <dt><%=Html.Display(Model, "ExibirTotal")%></dt>
                        <dd>
                            <%=Html.Encode(Texts.EnumDescricao("IeCharEnum", Model.ExibirTotal))%>
                        </dd>

                        <dt><%=Html.Display(Model, "Frequencia")%></dt>
                        <dd>
                            <%=Html.Encode(Texts.EnumDescricao("FrequenciaEnum", Model.Frequencia))%>
                        </dd>

                        <dt><%=Html.Display(Model, "MetaComparacao")%></dt>
                        <dd>
                            <%=Texts.EnumDescricao("MetaEnum", Model.MetaComparacao)%>
                        </dd>

                        <dt><%=Html.Display(Model, "MetaValor")%></dt>
                        <dd>
                            <%=Html.Encode(Model.MetaValor)%>
                        </dd>

                        <dt><%=Html.Display(Model, "MetaComplemento")%></dt>
                        <dd>
                            <%=Html.Encode(Model.MetaComplemento)%>
                        </dd>
                    </dl>
                    <div class="hr-line-dashed"></div>

                    <form action="?controller=ItemModulo&action=DeletePost" id="DeletePost" method="post">
                        <%=Html.Hidden("CdItem", Model.CdItem)%>
                        <%=Html.Hidden("CdModulo", Model.CdModulo)%>
                        <%=Html.Hidden("CdItemSuperior", Model.CdItemSuperior)%>

                        <div class="form-actions no-color">
                            <div class="row form-group" style="margin-bottom: 0px;">
                                <div class="col-md-offset-1 col-md-10">
                                    <button type="submit" class="btn btn-danger"><i class="fa fa-trash"></i>&nbsp;Excluir</button>
                                    <%=GetActionLink("ListMsg", "ItemModulo", "Voltar", "fa-reply",  Model.CdModulo & "&CdSuperior=" & Model.CdItemSuperior, true)%>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
