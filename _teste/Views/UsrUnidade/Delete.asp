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
                        <dt><%=Html.Encode("Usu�rio")%></dt>
                        <dd>
                            <%=Html.Encode(ViewData.Item("Usuario").GetValue("NOME",0))%>
                        </dd>
                        <% End If %>

                        <% If Not IsNothing(ViewData.Item("Unidade")) Then %>
                        <dt><%=Html.Encode("Unidade")%></dt>
                        <dd>
                            <%=Html.Encode(ViewData.Item("Unidade").GetValue("NM_UNIDADE",0))%>
                        </dd>
                        <% End If %>

                        <dt><%=Html.Display(Model, "Situacao")%></dt>
                        <dd>
                            <%=Html.Encode(Texts.EnumDescricao("SituacaoEnum", Model.Situacao))%>
                        </dd>

                        <dt><%=Html.Display(Model, "DtAlteracao")%></dt>
                        <dd>
                            <%=Html.Encode(Model.DtAlteracao)%>
                        </dd>

                        <dt><%=Html.Encode("Usu�rio Alt.")%></dt>
                        <dd>
                            <% 
                                If Not IsNothing(ViewData.Item("UsuarioAlt")) Then
                                    Response.Write(Html.Encode(ViewData.Item("UsuarioAlt").GetValue("NOME",0)))
                                End If 
                            %>
                        </dd>

                    </dl>
                    <div class="hr-line-dashed"></div>

                    <form action="?controller=UsrUnidade&action=DeletePost" id="DeletePost" method="post">
                        <%=Html.Hidden("CdControle", Model.CdControle)%>
                        <%=Html.Hidden("CdUsuario", Model.CdUsuario)%>

                        <div class="form-actions no-color">
                            <div class="row form-group" style="margin-bottom: 0px;">
                                <div class="col-md-offset-1 col-md-10">
                                    <button type="submit" class="btn btn-danger"><i class="fa fa-trash"></i>&nbsp;Excluir</button>
                                    <%=GetActionLink("ListMsg", "UsrUnidade", "Voltar", "fa-reply", Model.CdUsuario, true) %>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
