<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><%=Texts.Titulo%></h5>
            </div>
            <div class="ibox-content">
                <form action="?controller=CentroCusto&action=CreatePost" id="CreatePost" method="post" accept-charset="ISO-8859-1">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "CdCentroCusto", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.NumTextBox("CdCentroCusto", Model.CdCentroCusto, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "NmCentroCusto", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.TextBox("NmCentroCusto", Model.NmCentroCusto, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "DsCentroCusto", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.TextBox("DsCentroCusto", Model.DsCentroCusto, "class='form-control'")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.Label("Unidade", "CdUnidade", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=Html.DropDownList("CdUnidade", Model.CdUnidade, ViewData.Item("Unidades"), "CdUnidade", "NmUnidade")%>
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
                                <%=GetActionLink("List", "CentroCusto", "Voltar", "fa-reply", null, true)%>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
