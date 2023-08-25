<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><%=Texts.Titulo%></h5>
            </div>
            <div class="ibox-content">
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
                </div>
                <div class="hr-line-dashed"></div>
                <div class="row form-group" style="margin-bottom: 0px;">
                    <div class="col-md-offset-1 col-md-10">
                        <%=GetActionLinkIV("Edit", CStr(Model.CdCentroCusto), true) %>
                        <%=GetActionLink("List", "CentroCusto", "Voltar", "fa-reply", null, true) %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>  