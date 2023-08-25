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
                            <th><%=GetModelDisplay("GrupoPermissao", "NmGrupo")%></th>
                            <th><%=GetModelDisplay("GrupoPermissao", "DsGrupo")%></th>
                            <th><%=GetModelDisplay("GrupoPermissao", "Situacao")%></th>
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

                                vBtnPermissao    = GetActionLinkBase("ListMsg", "Permissao", "Permissões", "fa-unlock-alt", "", false, true)

                    	        For each obj in Model.Items
                        %>
                        <tr>
                            <td class="w-s-normal">
                                <%=Html.Encode(obj.NmGrupo)%>
                            </td>
                            <td class="w-s-normal">
                                <%=Html.Encode(obj.DsGrupo)%>
                            </td>
                            <td class="Situacao <%=obj.Situacao%>">
                                <%=Html.Encode(Texts.EnumDescricao("SituacaoEnum", obj.Situacao))%>
                            </td>
                            <td>
                                <%=Replace(vBtnPermissao, "{id}", "&CdGrupoPermissao=" & CStr(obj.CdGrupoPermissao))%>
                                <%=iif(vBtnPermissao = "","","&nbsp;|&nbsp;")%>
                                <%=Replace(vBtnEdit, "{id}", CStr(obj.CdGrupoPermissao))%>
                                <%=Replace(vBtnDelete, "{id}", CStr(obj.CdGrupoPermissao))%>
                                <%=Replace(vBtnDetails, "{id}", CStr(obj.CdGrupoPermissao))%>
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
