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
                            <th></th>
                            <th class="no-sort"></th>
                            <th><%=GetModelDisplay("Modulo", "NmModulo")%></th>
                            <th><%=GetModelDisplay("Modulo", "DsModulo")%></th>
                            <th><%=GetModelDisplay("Modulo", "Situacao")%></th>
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
                            <td style="text-align: center;">
                                <%=iif(obj.CdModulo = 0, "",Html.Encode(obj.CdModulo))%>
                            </td>
                            <td style="text-align: center;">
                                <span class="fas <%=Html.Encode(obj.Icone)%>"></span>
                            </td>
                            <td class="w-s-normal">
                                <%=Html.Encode(obj.NmModulo)%>
                            </td>
                            <td class="w-s-normal">
                                <%=Html.Encode(obj.DsModulo)%>
                            </td>
                            <td class="Situacao <%=obj.Situacao%>">
                                <%=Html.Encode(Texts.EnumDescricao("SituacaoEnum", obj.Situacao))%>
                            </td>
                            <td>
                                <%=Replace(vBtnEdit, "{id}", CStr(obj.CdModulo))%>
                                <%=Replace(vBtnDelete, "{id}", CStr(obj.CdModulo))%>
                                <%=Replace(vBtnDetails, "{id}", CStr(obj.CdModulo))%>
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
