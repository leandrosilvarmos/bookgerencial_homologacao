<% If Not IsEmpty(ViewData.Item("Alert")) Then %>
<input id="mensagem" type="hidden" data-alert="<%=ViewData.Item("Alert")%>" value="<%=Texts.Mensagem(ViewData.Item("Erro"))%>" />
<% End If %>

<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><%=Texts.Titulo%></h5>
            </div>
            <div class="ibox-content">
                <form action="?controller=Login&action=AlterarSenhaPost" id="AlterarSenhaPost" method="post">
                    <div class="form-horizontal">
                        <%=Html.Hidden("CdLogin", Model.CdLogin)%>
                        <%=Html.Hidden("CdUsuario", Model.CdUsuario)%>

                        <% If Not IsEmpty(ViewData.Item("Alert")) Then %>
                        <input id="mensagem" type="hidden" data-alert="<%=ViewData.Item("Alert")%>" value="<%=Texts.Mensagem(ViewData.Item("Erro"))%>" />
                        <% End If %>

                        <div class="form-group">
                            <%=eHtml.Label("Usuário", "CdUsuario", "class='control-label col-md-2'")%>
                            <div class="col-md-10" style="padding-top: 7px;">
                                <% 
                                   If Not IsNothing(ViewData.Item("Usuario")) Then
                                        Response.Write(Html.Encode(ViewData.Item("Usuario").GetValue("Nome",0)))
                                   End If
                                %>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.LabelFor(Model, "DsLogin", "class='control-label col-md-2'")%>
                            <div class="col-md-10" style="padding-top: 7px;">
                                <%=Html.Encode(Model.DsLogin)%>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <%=eHtml.Label("Nova Senha", "DsSenha", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.PasswordBox("DsSenha", null, "class='form-control' required")%>
                            </div>
                        </div>

                        <div class="form-group">
                            <%=eHtml.Label("Confirmação Senha", "DsSenhaConfirm", "class='control-label col-md-2'")%>
                            <div class="col-md-10">
                                <%=eHtml.PasswordBox("DsSenhaConfirm", null, "class='form-control' required")%>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <div class="col-md-offset-1 col-md-10">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp;&nbsp;Salvar</button>
                                <a href="?" class="fa fa-lg fa-reply btn btn-white" title="Voltar"> Voltar</a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
