<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><%=Texts.Titulo%></h5>
            </div>
            <div class="ibox-content">
                <div>
                    <dl class="dl-horizontal">
                        <dt><%=Html.Display(Model, "NmGrupo")%></dt>
                        <dd>
                            <%=Html.Encode(Model.NmGrupo)%>
                        </dd>

                        <dt><%=Html.Display(Model, "DsGrupo")%></dt>
                        <dd>
                            <%=Html.Encode(Model.DsGrupo)%>
                        </dd>

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
                        <%=GetActionLinkIV("Edit", CStr(Model.CdGrupoPermissao), true) %>
                        <%=GetActionLink("List", "GrupoPermissao", "Voltar", "fa-reply", null, true) %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>  