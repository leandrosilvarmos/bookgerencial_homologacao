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
                        <dt><%=Html.Display(Model, "NmUnidade")%></dt>
                        <dd>
                            <%=Html.Encode(Model.NmUnidade)%>
                        </dd>

                        <dt><%=Html.Display(Model, "DsUnidade")%></dt>
                        <dd>
                            <%=Html.Encode(Model.DsUnidade)%>
                        </dd>

                        <dt><%=Html.Display(Model, "Sigla")%></dt>
                        <dd>
                            <%=Html.Encode(Model.Sigla)%>
                        </dd>

                        <dt><%=Html.Display(Model, "UrlLogo")%></dt>
                        <dd>
                            <%=Html.Encode(Model.UrlLogo)%>
                        </dd>

                        <dt><%=Html.Display(Model, "UrlMapaEstrategico")%></dt>
                        <dd>
                            <%=Html.Encode(Model.UrlMapaEstrategico)%>
                        </dd>

                        <dt><%=Html.Display(Model, "Certificacoes")%></dt>
                        <dd>
                            <%=Html.Encode(Texts.EnumMultipleDescricao("CertificadosEnum", Model.Certificacoes))%>
                        </dd>

                        <dt><%=Html.Display(Model, "DsMissao")%></dt>
                        <dd>
                            <%=Html.Encode(Model.DsMissao)%>
                        </dd>

                        <dt><%=Html.Display(Model, "DsVisao")%></dt>
                        <dd>
                            <%=Html.Encode(Model.DsVisao)%>
                        </dd>

                        <dt><%=Html.Display(Model, "DsValores")%></dt>
                        <dd>
                            <%=Html.Encode(Model.DsValores)%>
                        </dd>

                        <dt><%=Html.Display(Model, "Ordem")%></dt>
                        <dd>
                            <%=Html.Encode(Model.Ordem)%>
                        </dd>

                        <dt><%=Html.Display(Model, "Situacao")%></dt>
                        <dd>
                            <%=Html.Encode(Texts.EnumDescricao("SituacaoEnum", Model.Situacao))%>
                        </dd>

                    </dl>
                    <div class="hr-line-dashed"></div>

                    <form action="?controller=Unidade&action=DeletePost" id="DeletePost" method="post">
                        <%=Html.Hidden("CdUnidade", Model.CdUnidade)%>

                        <div class="form-actions no-color">
                            <div class="row form-group" style="margin-bottom: 0px;">
                                <div class="col-md-offset-1 col-md-10">
                                    <button type="submit" class="btn btn-danger"><i class="fa fa-trash"></i>&nbsp;Excluir</button>
                                    <%=GetActionLink("List", "Unidade", "Voltar", "fa-reply", null, true)%>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
