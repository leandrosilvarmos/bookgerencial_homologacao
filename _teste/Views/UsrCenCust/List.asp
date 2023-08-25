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
                   <div class="form-group">
                        <%=eHtml.Label("Grupo de Permissão", "CdGrupoPermissao", "class='control-label col-md-2'")%>
                        <div class="col-md-10">
                            <%=Html.DropDownList("CdGrupoPermissao", ViewData.Item("CdGrupoPermissao"), ViewData.Item("GruposPermissao"), "CdGrupoPermissao", "NmGrupo")%>
                        </div>
                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <% If ViewData.Item("CdUsuario") <> "" Or ViewData.Item("CdGrupoPermissao") <> "" Then %>

                <p style="margin-bottom: 20px !important;">
                    <%=GetActionLinkIV("Create",  ViewData.Item("CdUsuario") & "&CdGrupoPermissao=" & ViewData.Item("CdGrupoPermissao"), true)%>
                </p>

                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Centro de Custo</th>
                            <th>Unidade</th>
                            <th>Situação</th>
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
                                    Dim vCdControle, vCdCentroCusto, vNmCentroCusto, vCdUnidade, vSigla, vSituacao

                                    vCdControle    = Model.GetValue("CD_CONTROLE",i)
                                    vCdCentroCusto = Model.GetValue("CD_CENTRO_CUSTO",i)
                                    vNmCentroCusto = Model.GetValue("NM_CENTRO_CUSTO",i)
                                    vCdUnidade     = Model.GetValue("CD_UNIDADE",i)
                                    vSigla         = Model.GetValue("SIGLA",i)
                                    vSituacao      = Model.GetValue("SITUACAO",i)
                        %>
                        <tr>
                            <td class="w-s-normal">
                                <%=Html.Encode(iif(vCdCentroCusto>10,vCdCentroCusto&" - ","")&vNmCentroCusto)%>
                            </td>
                            <td class="w-s-normal">
                                <%=Html.Encode(vSigla)%>
                            </td>
                            <td class="Situacao <%=vSituacao%>">
                                <%=Html.Encode(Texts.EnumDescricao("SituacaoEnum", vSituacao))%>
                            </td>
                            <td>
                                <%=Replace(vBtnEdit, "{id}", CStr(vCdControle))%>
                                <%=Replace(vBtnDelete, "{id}", CStr(vCdControle))%>
                                <%=Replace(vBtnDetails, "{id}", CStr(vCdControle))%>
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
                        Response.Write "<h4 style='text-align: center;'>Selecione um Login ou Grupo de Permissão</h4>"
                   End If 
                %>
            </div>
        </div>
    </div>
</div>
