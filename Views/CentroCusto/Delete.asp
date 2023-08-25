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
                        <dt><%=Html.Display(Model, "CdCentroCusto")%></dt>
                        <dd>
                            <%=Html.Encode(Model.CdCentroCusto)%>
                        </dd>

                        <dt><%=Html.Display(Model, "NmCentroCusto")%></dt>
                        <dd>
                            <%=Html.Encode(Model.NmCentroCusto)%>
                        </dd>

                        <dt><%=Html.Display(Model, "DsCentroCusto")%></dt>
                        <dd>
                            <%=Html.Encode(Model.DsCentroCusto)%>
                        </dd>

                        <dt><%=Html.Encode("Unidade")%></dt>
                        <dd>
                            <% 
                                If Not IsNothing(ViewData.Item("Unidade")) Then
                                    Response.Write(Html.Encode(ViewData.Item("Unidade").Items()(0).NmUnidade))
                                End If
                            %>
                        </dd>

                        <dt><%=Html.Display(Model, "Situacao")%></dt>
                        <dd>
                            <%=Html.Encode(Texts.EnumDescricao("SituacaoEnum", Model.Situacao))%>
                        </dd>
                    </dl>
                    <div class="hr-line-dashed"></div>

                    <form action="?controller=CentroCusto&action=DeletePost" id="DeletePost" method="post">
                        <%=Html.Hidden("CdCentroCusto", Model.CdCentroCusto)%>

                        <div class="form-actions no-color">
                            <div class="row form-group" style="margin-bottom: 0px;">
                                <div class="col-md-offset-1 col-md-10">
                                    <button type="submit" class="btn btn-danger"><i class="fa fa-trash"></i>&nbsp;Excluir</button>
                                    <%=GetActionLink("List", "CentroCusto", "Voltar", "fa-reply", null, true)%>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
