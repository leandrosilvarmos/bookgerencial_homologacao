<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><%=Texts.Titulo%></h5>
            </div>
            <div class="ibox-content">
                <p>
                    <%=GetActionLinkIV("Create", null, true)%>
                </p>
                <div class="hr-line-dashed"></div>
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Usuário</th>
                            <th><%=GetModelDisplay("Login", "DsLogin")%></th>
                            <th><%=GetModelDisplay("Login", "Situacao")%></th>
                            <th class="no-sort"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            If Not IsNothing(Model) Then
                                Dim vBtnEdit, vBtnDelete, vBtnDetails, vBtnUnidade, vBtnPermissao, vBtnGrpPermissao, vBtnCentroCusto
                                
                                vBtnEdit         = GetActionLinkV("Edit", false)
                                vBtnDelete       = GetActionLinkV("Delete", false)
                                vBtnDetails      = GetActionLinkV("Details", false)

                                vBtnUnidade      = GetActionLinkBase("ListMsg", "UsrUnidade", "Unidades", "fa-hospital", "", false, true)
                                vBtnPermissao    = GetActionLinkBase("ListMsg", "Permissao", "Permissões", "fa-unlock-alt", "", false, true)
                                vBtnGrpPermissao = GetActionLinkBase("ListMsg", "UsrGrupoPerm", "Grupos&nbsp;de&nbsp;Permissão", "fa-object-group", "", false, true)
                                vBtnCentroCusto  = GetActionLinkBase("ListMsg", "UsrCenCust", "Centro&nbsp;de&nbsp;Custo", " fa-sitemap", "", false, true)
                                

                    	        For i = 0 To (Model.Count - 1) Step 1
                                    Dim vCdLogin, vCdUsuario, vNmUsuario, vDsLogin, vSituacao

                                    vCdLogin   = Model.GetValue("CD_LOGIN",i)
                                    vCdUsuario = Model.GetValue("CD_USUARIO",i)
                                    vNmUsuario = Model.GetValue("NOME",i)
                                    vDsLogin   = Model.GetValue("DS_LOGIN",i)
                                    vSituacao  = Model.GetValue("SITUACAO",i)
                        %>
                        <tr>
                            <td class="w-s-normal">
                                <%=Html.Encode(vNmUsuario)%>
                            </td>
                            <td>
                                <%=Html.Encode(vDsLogin)%>
                            </td>
                            <td class="Situacao <%=vSituacao%>">
                                <%=Html.Encode(Texts.EnumDescricao("SituacaoEnum", vSituacao))%>
                            </td>
                            <td>
                                <%=Replace(vBtnUnidade, "{id}", CStr(vCdUsuario))%>
                                <%=Replace(vBtnPermissao, "{id}", CStr(vCdUsuario))%>
                                <%=Replace(vBtnGrpPermissao, "{id}", CStr(vCdUsuario))%>
                                <%=Replace(vBtnCentroCusto, "{id}", CStr(vCdUsuario))%>
                                <%=iif(vBtnUnidade & vBtnPermissao & vBtnGrpPermissao = "","","&nbsp;|&nbsp;")%>
                                <%=Replace(vBtnEdit, "{id}", CStr(vCdLogin))%>
                                <%=Replace(vBtnDelete, "{id}", CStr(vCdLogin))%>
                                <%=Replace(vBtnDetails, "{id}", CStr(vCdLogin))%>
                            </td>
                        </tr>
                        <%
                                   Response.Flush
                    	        Next
                            End If
                        %>
                    </tbody>

                </table>
            </div>
        </div>
    </div>
</div>
