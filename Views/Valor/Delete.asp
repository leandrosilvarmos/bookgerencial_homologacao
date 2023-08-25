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
                        <dt><%=Html.Display(Model, "ValorNum")%></dt>
                        <dd>
                            <%=Html.Encode(Model.ValorNum)%>
                        </dd>

                        <dt><%=Html.Display(Model, "ValorTxt")%></dt>
                        <dd>
                            
                        </dd>

                        <dt><%=Html.Display(Model, "Tipo")%></dt>
                        <dd>
                            <%=Html.Encode(Model.Tipo)%>
                        </dd>

                        <dt><%=Html.Display(Model, "Mes")%></dt>
                        <dd>
                            <%=Html.Encode(Texts.EnumDescricao("1", Model.Mes))%>
                        </dd>

                        <dt><%=Html.Display(Model, "Ano")%></dt>
                        <dd>
                            <%=Html.Encode(Model.Ano)%>
                        </dd>

                        <dt><%=Html.Display(Model, "CdSecao")%></dt>
                        <dd>
                            <%=Html.Encode(Model.CdSecao)%>
                        </dd>

                        <dt><%=Html.Display(Model, "CdModulo")%></dt>
                        <dd>
                            <%=Html.Encode(Model.CdModulo)%>
                        </dd>

                        <dt><%=Html.Display(Model, "CdUnidade")%></dt>
                        <dd>
                            <%=Html.Encode(Model.CdUnidade)%>
                        </dd>

                        <dt><%=Html.Display(Model, "CdItem")%></dt>
                        <dd>
                            <%=Html.Encode(Model.CdItem)%>
                        </dd>

                        <dt><%=Html.Display(Model, "Situacao")%></dt>
                        <dd>
                            <%=Html.Encode(Model.Situacao)%>
                        </dd>

                    </dl>
                    <div class="hr-line-dashed"></div>

                    <form action="?controller=Administrador&action=DeletePost" id="DeletePost" method="post">
                        <%=Html.Hidden("item", "Valor")%>

                        <%=Html.Hidden("CdValor", Model.CdValor)%>

                        <div class="form-actions no-color">
                            <div class="row form-group" style="margin-bottom: 0px;">
                                <div class="col-md-offset-1 col-md-10">
                                    <button type="submit" class="btn btn-danger"><i class="fa fa-trash"></i>&nbsp;Excluir</button>
                                    <%'=GetActionLink("List", "Valor", "Voltar", "fa-reply", null, true)%>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
