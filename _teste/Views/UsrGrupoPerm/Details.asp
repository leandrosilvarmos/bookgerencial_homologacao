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
                            <%=Html.Encode(ViewData.Item("GrupoPermissao").GetValue("NM_GRUPO",0))%>
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

                        <dt><%=Html.Encode("Usuário Alt.")%></dt>
                        <dd>
                            <% 
                                If Not IsNothing(ViewData.Item("UsuarioAlt")) Then
                                    Response.Write(Html.Encode(ViewData.Item("UsuarioAlt").GetValue("NOME",0)))
                                End If 
                            %>
                        </dd>
                    </dl>
                </div>
                <div class="hr-line-dashed"></div>
                <div class="row form-group" style="margin-bottom: 0px;">
                    <div class="col-md-offset-1 col-md-10">
                        <%=GetActionLinkIV("Edit", CStr(Model.CdControle), true) %>
                        <%=GetActionLink("ListMsg", "UsrGrupoPerm", "Voltar", "fa-reply", Model.CdUsuario, true) %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>  