<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><%=Texts.Titulo%></h5>
            </div>
            <div class="ibox-content">
                <div class="form-horizontal">
                    <div class="form-group">
                        <%=eHtml.Label("Login", "CdUsuario", "class='control-label col-md-2'")%>
                        <div class="col-md-10">
                            <%=Html.DropDownListDb("CdUsuario", ViewData.Item("CdUsuario"), ViewData.Item("Logins"), "CD_USUARIO", "DS_NOME_USUARIO")%>
                        </div>
                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <% If ViewData.Item("CdUsuario") <> "" Then %>

                <p style="margin-bottom: 20px !important;">
                    <%=GetActionLinkIV("Create",  ViewData.Item("CdUsuario"), true)%>
                </p>

                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Grupo de Permissão</th>
                            <th><%=GetModelDisplay("UsrGrupoPerm", "Situacao")%></th>
                            <th class="no-sort"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            If Not IsNothing(Model) Then
                                Dim vBtnEdit, vBtnDelete, vBtnDetails
                                
                                vBtnEdit        = GetActionLinkV("Edit", false)
                                vBtnDelete      = GetActionLinkV("Delete", false)
                                vBtnDetails     = GetActionLinkV("Details", false)

                    	        For i = 0 To (Model.Count - 1) Step 1
                                    Dim vCdControler, vUnidade, vSituacao

                                    vCdControler = Model.GetValue("CD_CONTROLE",i)
                                    vUnidade     = Model.GetValue("NM_GRUPO",i)
                                    vSituacao    = Model.GetValue("SITUACAO",i)
                        %>
                        <tr>
                            <td class="w-s-normal">
                                <%=Html.Encode(vUnidade)%>
                            </td>
                            <td class="Situacao <%=vSituacao%>">
                                <%=Html.Encode(Texts.EnumDescricao("SituacaoEnum", vSituacao))%>
                            </td>
                            <td>
                                <%=Replace(vBtnEdit, "{id}", CStr(vCdControler))%>
                                <%=Replace(vBtnDelete, "{id}", CStr(vCdControler))%>
                                <%=Replace(vBtnDetails, "{id}", CStr(vCdControler))%>
                            </td>
                        </tr>
                        <%
                                   Response.Flush
                    	        Next
                            End If
                        %>
                    </tbody>
                </table>
                <% 
                   Else
                        Response.Write "<h4 style='text-align: center;'>Selecione um Login</h4>"
                   End If 
                %>
            </div>
        </div>
    </div>
</div>
