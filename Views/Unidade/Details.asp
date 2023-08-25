<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><%=Texts.Titulo%></h5>
            </div>
            <div class="ibox-content">
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

                        <dt><%=Html.Display(Model, "UrlFoto")%></dt>
                        <dd>
                            <%=Html.Encode(Model.UrlFoto)%>
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
                </div>
                <div class="hr-line-dashed"></div>
                <div class="row form-group" style="margin-bottom: 0px;">
                    <div class="col-md-offset-1 col-md-10">
                        <%=GetActionLinkIV("Edit", CStr(Model.CdUnidade), true) %>
                        <%=GetActionLink("List", "Unidade", "Voltar", "fa-reply", null, true) %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>  