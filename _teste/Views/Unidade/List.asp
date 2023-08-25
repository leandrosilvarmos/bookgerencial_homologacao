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
                            <th><%=GetModelDisplay("Unidade", "Ordem")%></th>
                            <th><%=GetModelDisplay("Unidade", "NmUnidade")%></th>
                            <th><%=GetModelDisplay("Unidade", "DsUnidade")%></th>
                            <th><%=GetModelDisplay("Unidade", "Sigla")%></th>
                            <th><%=GetModelDisplay("Unidade", "UrlLogo")%></th>
                            <th><%=GetModelDisplay("Unidade", "UrlFoto")%></th>
                            <th><%=GetModelDisplay("Unidade", "Situacao")%></th>
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

                    	        For each obj in Model.Items
                        %>
                        <tr>
                            <td>
                                <%=Html.Encode(obj.Ordem)%>
                            </td>
                            <td class="w-s-normal">
                                <%=Html.Encode(obj.NmUnidade)%>
                            </td>
                            <td class="w-s-normal">
                                <%=Html.Encode(obj.DsUnidade)%>
                            </td>
                            <td>
                                <%=Html.Encode(obj.Sigla)%>
                            </td>
                            <td>
                                <%=Html.Encode(obj.UrlLogo)%>
                            </td>
                            <td>
                                <%=Html.Encode(obj.UrlFoto)%>
                            </td>
                            <td class="Situacao <%=obj.Situacao%>">
                                <%=Html.Encode(Texts.EnumDescricao("SituacaoEnum", obj.Situacao))%>
                            </td>
                            <td>
                                <%=Replace(vBtnEdit, "{id}", CStr(obj.CdUnidade))%>
                                <%=Replace(vBtnDelete, "{id}", CStr(obj.CdUnidade))%>
                                <%=Replace(vBtnDetails, "{id}", CStr(obj.CdUnidade))%>
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
