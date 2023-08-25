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
                        <% If Not IsNothing(ViewData.Item("Usuario")) Then %>
                        <dt><%=Html.Encode("Usuário")%></dt>
                        <dd>
                            <%=Html.Encode(ViewData.Item("Usuario").GetValue("NOME",0))%>
                        </dd>
                        <% End If %>

                        <% If Not IsNothing(ViewData.Item("GrupoPermissao")) Then %>
                        <dt><%=Html.Encode("Grupo de Permissão")%></dt>
                        <dd>
                            <%=Html.Encode(ViewData.Item("GrupoPermissao").Items()(0).NmGrupo)%>
                        </dd>
                        <% End If %>

                        <% If Not IsNothing(ViewData.Item("CentroCusto")) Then %>
                        <dt><%=Html.Encode("Cód. Centro de Custo")%></dt>
                        <dd>
                            <%=Html.Encode(ViewData.Item("CentroCusto").Items()(0).CdCentroCusto)%>
                        </dd>
                        <% End If %>

                        <% If Not IsNothing(ViewData.Item("CentroCusto")) Then %>
                        <dt><%=Html.Encode("Centro de Custo")%></dt>
                        <dd>
                            <%=Html.Encode(ViewData.Item("CentroCusto").Items()(0).NmCentroCusto)%>
                        </dd>
                        <% End If %>


                        <dt><%=Html.Display(Model, "Situacao")%></dt>
                        <dd>
                            <%=Html.Encode(Texts.EnumDescricao("SituacaoEnum", Model.Situacao))%>
                        </dd>
                    </dl>
                    <div class="hr-line-dashed"></div>

                    <form action="?controller=UsrCenCust&action=DeletePost" id="DeletePost" method="post">
                        <%=Html.Hidden("CdControle", Model.CdControle)%>
                        <%=Html.Hidden("CdUsuario", Model.CdUsuario)%>
                        <%=Html.Hidden("CdGrupoPermissao", Model.CdGrupoPermissao)%>

                        <div class="form-actions no-color">
                            <div class="row form-group" style="margin-bottom: 0px;">
                                <div class="col-md-offset-1 col-md-10">
                                    <button type="submit" class="btn btn-danger"><i class="fa fa-trash"></i>&nbsp;Excluir</button>
                                    <%=GetActionLink("ListMsg", "UsrCenCust", "Voltar", "fa-reply", Model.CdUsuario & "&CdGrupoPermissao=" & Model.CdGrupoPermissao, true)%>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
