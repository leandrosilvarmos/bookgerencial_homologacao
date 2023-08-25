<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><%=Texts.Titulo%></h5>
            </div>
            <div class="ibox-content">
                <form action="?controller=UsrUnidade&action=EditPost" id="EditPost" method="post">
                    <div class="form-horizontal">
                        <%=Html.Hidden("CdControle", Model.CdControle)%>
                        <%=Html.Hidden("CdUsuario", Model.CdUsuario)%>

                        <% If Not IsNothing(ViewData.Item("Usuario")) Then %>
                        <div class="form-group">
                            <%=eHtml.Label("Usuário", "CdUsuario", "class='control-label col-md-2'")%>
                            <div class="col-md-10" style="padding-top: 7px;">
                                <%=Html.Encode(ViewData.Item("Usuario").GetValue("NOME",0))%>
                            </div>
                        </div>
                        <% End If %>

                        <% If Not IsNothing(ViewData.Item("Unidade")) Then %>

                        <div class="form-group">
                            <%=eHtml.Label("Unidade", "CdUnidade", "class='control-label col-md-2'")%>
                            <div class="col-md-10" style="padding-top: 7px;">
                                <%=Html.Encode(ViewData.Item("Unidade").GetValue("NM_UNIDADE",0))%>
                            </div>
                        </div>
                        <% End If %>


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
                                <%=GetActionLink("ListMsg", "UsrUnidade", "Voltar", "fa-reply",  Model.CdUsuario, true)%>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
