<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><%=Texts.Titulo%></h5>
            </div>
            <div class="ibox-content">
                <form action="?controller=Permissao&action=CreatePost" id="CreatePost" method="post" accept-charset="ISO-8859-1">
                    <%=Html.Hidden("CdUsuario", Model.CdUsuario)%>
                    <%=Html.Hidden("CdGrupoPermissao", Model.CdGrupoPermissao)%>

                    <div class="form-horizontal">
                        <% If Not IsNothing(ViewData.Item("Usuario")) Then %>
                        <div class="form-group">
                            <%=eHtml.Label("Usuário", "CdUsuario", "class='control-label col-md-2'")%>
                            <div class="col-md-10" style="padding-top: 7px;">
                                <%=Html.Encode(ViewData.Item("Usuario").GetValue("NOME",0))%>
                            </div>
                        </div>
                        <% End If %>

                        <% If Not IsNothing(ViewData.Item("GrupoPermissao")) Then %>
                        <div class="form-group">
                            <%=eHtml.Label("Grupo de Permissão", "CdGrupoPermissao", "class='control-label col-md-2'")%>
                            <div class="col-md-10" style="padding-top: 7px;">
                                <%=Html.Encode(ViewData.Item("GrupoPermissao").Items()(0).NmGrupo)%>
                            </div>
                        </div>
                        <% End If %>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <%=eHtml.Label("Controller", "CdController", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=Html.DropDownListGroupDb("CdController", Model.CdController, ViewData.Item("Controllers"), "CD_CONTROLLER", "DS_CONTROLLER", "CD_GRUPO_CONTROLLER", "DS_GRUPO_CONTROLLER")%>
                            </div>
                        </div>

                        <div id="divModulo" class="form-group" style="display: none;">
                            <%=eHtml.Label("Módulo", "CdItem", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=Html.DropDownListDb("CdItem", Model.CdItem, ViewData.Item("Modulos"), "CD_MODULO", "CD_NM_MODULO")%>
                                <span class="help-block m-b-none">Deixe em branco para liberar todos!</span>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "Criar", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=Html.RadioButtonListEnum("Criar", Model.Criar, "IeEnum")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "Listar", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=Html.RadioButtonListEnum("Listar", Model.Listar, "IeEnum")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "Visualizar", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=Html.RadioButtonListEnum("Visualizar", Model.Visualizar, "IeEnum")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "Editar", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=Html.RadioButtonListEnum("Editar", Model.Editar, "IeEnum")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "Deletar", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=Html.RadioButtonListEnum("Deletar", Model.Deletar, "IeEnum")%>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

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
                                <%=GetActionLink("ListMsg", "Permissao", "Voltar", "fa-reply", Model.CdUsuario & "&CdGrupoPermissao=" & Model.CdGrupoPermissao, true)%>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
