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
                        <dt><%=Html.Display(Model, "NmModulo")%></dt>
                        <dd>
                            <%=Html.Encode(Model.NmModulo)%>
                        </dd>

                        <dt><%=Html.Display(Model, "DsModulo")%></dt>
                        <dd>
                            <%=Html.Encode(Model.DsModulo)%>
                        </dd>

                        <dt><%=Html.Display(Model, "Icone")%></dt>
                        <dd>
                            <i class="fas <%=Model.Icone%>"></i>
                            <%=Html.Encode(Model.Icone)%>
                        </dd>

                        <dt><%=Html.Display(Model, "UrlPath")%></dt>
                        <dd>
                            <%=Html.Encode(Model.UrlPath)%>
                        </dd>
                        
                        <dt><%=Html.Display(Model, "Ordem")%></dt>
                        <dd>
                            <%=Html.Encode(Model.Ordem)%>
                        </dd>

                        <dt><%=Html.Display(Model, "OcultarNulo")%></dt>
                        <dd>
                            <%=Html.Encode(Texts.EnumDescricao("IeCharEnum", Model.OcultarNulo))%>
                        </dd>

                        <dt><%=Html.Display(Model, "AnaliseCritica")%></dt>
                        <dd>
                            <%=Html.Encode(Texts.EnumDescricao("IeCharEnum", Model.AnaliseCritica))%>
                        </dd>

                        <dt><%=Html.Display(Model, "OrigemDados")%></dt>
                        <dd>
                            <%=Html.Encode(Texts.EnumDescricao("OrigemDadosEnum", Model.OrigemDados))%>
                        </dd>

                        <dt><%=Html.Display(Model, "Situacao")%></dt>
                        <dd>
                            <%=Html.Encode(Texts.EnumDescricao("SituacaoEnum", Model.Situacao))%>
                        </dd>
                    </dl>
                    <div class="hr-line-dashed"></div>

                    <form action="?controller=Modulo&action=DeletePost" id="DeletePost" method="post">
                        <%=Html.Hidden("CdModulo", Model.CdModulo)%>

                        <div class="form-actions no-color">
                            <div class="row form-group" style="margin-bottom: 0px;">
                                <div class="col-md-offset-1 col-md-10">
                                    <button type="submit" class="btn btn-danger"><i class="fa fa-trash"></i>&nbsp;Excluir</button>
                                    <%=GetActionLink("List", "Modulo", "Voltar", "fa-reply", null, true)%>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
