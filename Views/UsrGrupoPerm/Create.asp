<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><%=Texts.Titulo%></h5>
            </div>
            <div class="ibox-content">
                <form action="?controller=UsrGrupoPerm&action=CreatePost" id="CreatePost" method="post" accept-charset="ISO-8859-1">
                    <div class="form-horizontal">
                        <%=Html.Hidden("CdUsuario", Model.CdUsuario)%>

                        <% If Not IsNothing(ViewData.Item("Usuario")) Then %>
                        <div class="form-group">
                            <%=eHtml.Label("Usuário", "CdUsuario", "class='control-label col-md-2'")%>
                            <div class="col-md-10" style="padding-top: 7px;">
                                <%=Html.Encode(ViewData.Item("Usuario").GetValue("NOME",0))%>
                            </div>
                        </div>
                        <% End If %>

                        <div class="form-group">
                            <%=eHtml.Label("Grupo de Permissão", "CdGrupoPermissao", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=Html.DropDownListDb("CdGrupoPermissao", Model.CdGrupoPermissao, ViewData.Item("GruposPermissao"), "CD_GRUPO_PERMISSAO", "NM_GRUPO")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "Situacao", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=Html.RadioButtonListEnum("Situacao", Model.Situacao, "SituacaoEnum")%>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <div class="col-md-offset-1 col-md-10">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp;&nbsp;Salvar</button>
                                <%=GetActionLink("ListMsg", "UsrGrupoPerm", "Voltar", "fa-reply", Model.CdUsuario, true)%>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
