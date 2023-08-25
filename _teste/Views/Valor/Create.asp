<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><%=Texts.Titulo%></h5>
            </div>
            <div class="ibox-content">
                <form action="?controller=Administrador&action=CreatePost" id="CreatePost" method="post" accept-charset="ISO-8859-1">
                    <%=Html.Hidden("item", "Valor")%>

                    <div class="form-horizontal">
                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "ValorNum", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.NumTextBox("ValorNum", Model.ValorNum, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "ValorTxt", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "Tipo", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.TextBox("Tipo", Model.Tipo, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "Mes", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=Html.RadioButtonListEnum("Mes", Model.Mes, "1")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "Ano", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.NumTextBox("Ano", Model.Ano, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "CdSecao", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.NumTextBox("CdSecao", Model.CdSecao, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "CdModulo", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.NumTextBox("CdModulo", Model.CdModulo, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "CdUnidade", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.NumTextBox("CdUnidade", Model.CdUnidade, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "CdItem", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.NumTextBox("CdItem", Model.CdItem, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "Situacao", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.NumTextBox("Situacao", Model.Situacao, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <div class="col-md-offset-1 col-md-10">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp;&nbsp;Salvar</button>
                                <%'=GetActionLink("List", "Valor", "Voltar", "fa-reply", null, true)%>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
