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
                        <dt><%=Html.Encode("Usuário")%></dt>
                        <dd>
                            <% 
                                If Not IsNothing(ViewData.Item("Usuario")) Then
                                    Response.Write(Html.Encode(ViewData.Item("Usuario").GetValue("Nome",0)))
                                End If
                            %>
                        </dd>

                        <dt><%=Html.Display(Model, "DsLogin")%></dt>
                        <dd>
                            <%=Html.Encode(Model.DsLogin)%>
                        </dd>

                        <dt><%=Html.Display(Model, "Situacao")%></dt>
                        <dd>
                            <%=Html.Encode(Texts.EnumDescricao("SituacaoEnum", Model.Situacao))%>
                        </dd>

                        <dt><%=Html.Display(Model, "DtAlteracao")%></dt>
                        <dd>
                            <%=Html.Encode(Model.DtAlteracao)%>
                        </dd>

                        <dt><%=Html.Encode("Usuário Alt.")%></dt>
                        <dd>
                            <% 
                                If Not IsNothing(ViewData.Item("UsuarioAlt")) Then
                                    Response.Write(Html.Encode(ViewData.Item("UsuarioAlt").GetValue("Nome",0)))
                                End If
                            %>
                        </dd>
                    </dl>
                    <div class="hr-line-dashed"></div>

                    <form action="?controller=Login&action=DeletePost" id="DeletePost" method="post">
                        <%=Html.Hidden("CdLogin", Model.CdLogin)%>

                        <div class="form-actions no-color">
                            <div class="row form-group" style="margin-bottom: 0px;">
                                <div class="col-md-offset-1 col-md-10">
                                    <button type="submit" class="btn btn-danger"><i class="fa fa-trash"></i>&nbsp;Excluir</button>
                                    <%=GetActionLink("List", "Login", "Voltar", "fa-reply", null, true)%>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
