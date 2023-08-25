<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><%=Texts.Titulo%></h5>
            </div>
            <div class="ibox-content">
                <form action="?controller=Modulo&action=EditPost" id="EditPost" method="post">
                    <div class="form-horizontal">
                        <%=Html.Hidden("CdModulo", Model.CdModulo)%>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "NmModulo", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.TextBox("NmModulo", Model.NmModulo, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "DsModulo", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.TextBox("DsModulo", Model.DsModulo, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "Icone", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <div class="input-group iconpicker-container">
                                    <span class="input-group-addon"><i class="fas <%=Model.Icone%>"></i></span>
                                    <%=eHtml.TextBox("Icone", Model.Icone, "data-placement='bottomLeft' class='form-control icp icp-auto iconpicker-element iconpicker-input'")%>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "UrlPath", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.TextBox("UrlPath", Model.UrlPath, "class='form-control'")%>
                            </div>
                        </div>
                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "Ordem", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.NumTextBox("Ordem", Model.Ordem, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "OcultarNulo", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=Html.RadioButtonListEnum("OcultarNulo", Model.OcultarNulo, "IeCharEnum")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "AnaliseCritica", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=Html.RadioButtonListEnum("AnaliseCritica", Model.AnaliseCritica, "IeCharEnum")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "OrigemDados", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=Html.RadioButtonListEnum("OrigemDados", Model.OrigemDados, "OrigemDadosEnum")%>
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
                                <%=GetActionLink("List", "Modulo", "Voltar", "fa-reply", null, true)%>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
