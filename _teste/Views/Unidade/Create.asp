<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><%=Texts.Titulo%></h5>
            </div>
            <div class="ibox-content">
                <form action="?controller=Unidade&action=CreatePost" id="CreatePost" method="post" accept-charset="ISO-8859-1">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "NmUnidade", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.TextBox("NmUnidade", Model.NmUnidade, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "DsUnidade", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.TextBox("DsUnidade", Model.DsUnidade, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "Sigla", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.TextBox("Sigla", Model.Sigla, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "UrlLogo", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.TextBox("UrlLogo", Model.UrlLogo, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "UrlFoto", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.TextBox("UrlFoto", Model.UrlFoto, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "UrlMapaEstrategico", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.TextBox("UrlMapaEstrategico", Model.UrlMapaEstrategico, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "Certificacoes", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.DropDownListEnum("Certificacoes", Model.Certificacoes, "CertificadosEnum", "multiple class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "DsMissao", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.TextBox("DsMissao", Model.DsMissao, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "DsVisao", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.TextBox("DsVisao", Model.DsVisao, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "DsValores", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.TextBox("DsValores", Model.DsValores, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "Ordem", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.NumTextBox("Ordem", Model.Ordem, "class='form-control'")%>
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
                                <%=GetActionLink("List", "Unidade", "Voltar", "fa-reply", null, true)%>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
