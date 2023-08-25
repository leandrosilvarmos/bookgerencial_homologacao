<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><%=Texts.Titulo%></h5>
            </div>
            <div class="ibox-content">
                <form action="?controller=GrupoPermissao&action=CreatePost" id="CreatePost" method="post" accept-charset="ISO-8859-1">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "NmGrupo", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.TextBox("NmGrupo", Model.NmGrupo, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "DsGrupo", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.TextBox("DsGrupo", Model.DsGrupo, "class='form-control'")%>
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
                                <%=GetActionLink("List", "GrupoPermissao", "Voltar", "fa-reply", null, true)%>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
