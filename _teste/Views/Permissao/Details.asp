<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><%=Texts.Titulo%></h5>
            </div>
            <div class="ibox-content">
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
                    </dl>

                    <div class="hr-line-dashed"></div>

                    <dl class="dl-horizontal">
                        <% If Not IsNothing(ViewData.Item("Controller")) Then %>
                        <dt><%=Html.Encode("Controller")%></dt>
                        <dd>
                            <%=Html.Encode(ViewData.Item("Controller").GetValue("DS_CONTROLLER",0))%>
                        </dd>
                        <% End If %>

                        <% If Not IsNothing(ViewData.Item("Modulo")) Then %>
                        <dt><%=Html.Encode("Módulo")%></dt>
                        <dd>
                            <%=Html.Encode(ViewData.Item("Modulo").Items()(0).CdNmModulo)%>
                        </dd>
                        <% End If %>
                    </dl>

                    <div class="hr-line-dashed"></div>

                    <dl class="dl-horizontal">
                        <dt><%=Html.Display(Model, "Criar")%></dt>
                        <dd>
                            <%=Html.Encode(Texts.EnumDescricao("IeEnum", CStr(Nvl(Model.Criar,0))))%>
                        </dd>

                        <dt><%=Html.Display(Model, "Listar")%></dt>
                        <dd>
                            <%=Html.Encode(Texts.EnumDescricao("IeEnum", CStr(Nvl(Model.Listar,0))))%>
                        </dd>

                        <dt><%=Html.Display(Model, "Visualizar")%></dt>
                        <dd>
                            <%=Html.Encode(Texts.EnumDescricao("IeEnum", CStr(Nvl(Model.Visualizar,0))))%>
                        </dd>

                        <dt><%=Html.Display(Model, "Editar")%></dt>
                        <dd>
                            <%=Html.Encode(Texts.EnumDescricao("IeEnum", CStr(Nvl(Model.Editar,0))))%>
                        </dd>

                        <dt><%=Html.Display(Model, "Deletar")%></dt>
                        <dd>
                            <%=Html.Encode(Texts.EnumDescricao("IeEnum", CStr(Nvl(Model.Deletar,0))))%>
                        </dd>
                    </dl>

                    <div class="hr-line-dashed"></div>

                    <dl class="dl-horizontal">
                        <dt><%=Html.Display(Model, "Situacao")%></dt>
                        <dd>
                            <%=Html.Encode(Texts.EnumDescricao("SituacaoEnum", Model.Situacao))%>
                        </dd>

                        <dt><%=Html.Encode("Usuário Alt.")%></dt>
                        <dd>
                            <% 
                                If Not IsNothing(ViewData.Item("UsuarioAlt")) Then
                                    Response.Write(Html.Encode(ViewData.Item("UsuarioAlt").GetValue("NOME",0)))
                                End If 
                            %>
                        </dd>

                        <dt><%=Html.Display(Model, "DtAlteracao")%></dt>
                        <dd>
                            <%=Html.Encode(Model.DtAlteracao)%>
                        </dd>
                    </dl>
                </div>
                <div class="hr-line-dashed"></div>
                <div class="row form-group" style="margin-bottom: 0px;">
                    <div class="col-md-offset-1 col-md-10">
                        <%=GetActionLinkIV("Edit", CStr(Model.CdPermissao), true) %>
                        <%=GetActionLink("ListMsg", "Permissao", "Voltar", "fa-reply", Model.CdUsuario & "&CdGrupoPermissao=" & Model.CdGrupoPermissao, true)%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
