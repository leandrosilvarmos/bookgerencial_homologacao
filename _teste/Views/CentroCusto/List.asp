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
                            <th><%=GetModelDisplay("CentroCusto", "CdCentroCusto")%></th>
                            <th><%=GetModelDisplay("CentroCusto", "NmCentroCusto")%></th>
                            <th><%=GetModelDisplay("CentroCusto", "DsCentroCusto")%></th>
                            <th><%=GetModelDisplay("CentroCusto", "Situacao")%></th>
                            <th>Unidade</th>
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
                                    If obj.CdCentroCusto <> -1 Then ' -1 = Todos
                        %>
                        <tr>
                            <td>
                                <%=Html.Encode(obj.CdCentroCusto)%>
                            </td>
                            <td class="w-s-normal">
                                <%=Html.Encode(obj.NmCentroCusto)%>
                            </td>
                            <td class="w-s-normal">
                                <%=Html.Encode(obj.DsCentroCusto)%>
                            </td>
                            <td>
                                <% 
                                   If Not IsNothing(ViewData.Item("Unidades")) And obj.CdUnidade <> "" Then
                                       Response.Write(ViewData.Item("Unidades").GetValueById("SIGLA", obj.CdUnidade))
                                   End If
                                %>
                            </td>
                            <td class="Situacao <%=obj.Situacao%>">
                                <%=Html.Encode(Texts.EnumDescricao("SituacaoEnum", obj.Situacao))%>
                            </td>
                            <td>
                                <%=Replace(vBtnEdit, "{id}", CStr(obj.CdCentroCusto))%>
                                <%=Replace(vBtnDelete, "{id}", CStr(obj.CdCentroCusto))%>
                                <%=Replace(vBtnDetails, "{id}", CStr(obj.CdCentroCusto))%>
                            </td>
                        </tr>
                        <%
                                        Response.Flush
                                    End If
                    	        Next
                            End If
                        %>
                    </tbody>

                </table>
            </div>
        </div>
    </div>
</div>
