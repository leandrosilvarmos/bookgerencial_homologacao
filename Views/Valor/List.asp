<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><%=Texts.Titulo%></h5>
            </div>
            <div class="ibox-content">
                <p>
                    <%'=GetActionLinkIV("Create", null, true)%>
                </p>
                <div class="hr-line-dashed"></div>
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th><%=GetModelDisplay("Valor", "ValorNum")%></th>
                            <th><%=GetModelDisplay("Valor", "ValorTxt")%></th>
                            <th><%=GetModelDisplay("Valor", "Tipo")%></th>
                            <th><%=GetModelDisplay("Valor", "Mes")%></th>
                            <th><%=GetModelDisplay("Valor", "Ano")%></th>
                            <th><%=GetModelDisplay("Valor", "CdSecao")%></th>
                            <th><%=GetModelDisplay("Valor", "CdModulo")%></th>
                            <th><%=GetModelDisplay("Valor", "CdUnidade")%></th>
                            <th><%=GetModelDisplay("Valor", "CdItem")%></th>
                            <th><%=GetModelDisplay("Valor", "Situacao")%></th>
                            <th class="no-sort"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            If Not IsNothing(Model) Then
                    	        For each obj in Model.Items
                        %>
                        <tr>
                            <td>
                                <%=Html.Encode(obj.ValorNum)%>
                            </td>
                            <td>
                                
                            </td>
                            <td>
                                <%=Html.Encode(obj.Tipo)%>
                            </td>
                            <td>
                                <%=Html.Encode(Texts.EnumDescricao("1", obj.Mes))%>
                            </td>
                            <td>
                                <%=Html.Encode(obj.Ano)%>
                            </td>
                            <td>
                                <%=Html.Encode(obj.CdSecao)%>
                            </td>
                            <td>
                                <%=Html.Encode(obj.CdModulo)%>
                            </td>
                            <td>
                                <%=Html.Encode(obj.CdUnidade)%>
                            </td>
                            <td>
                                <%=Html.Encode(obj.CdItem)%>
                            </td>
                            <td>
                                <%=Html.Encode(obj.Situacao)%>
                            </td>
                            <td>
                                <%'=GetActionLinkIV("Edit", CStr(obj.CdValor), false)%>
                                <%'=GetActionLinkIV("Delete", CStr(obj.CdValor), false)%>
                                <%'=GetActionLinkIV("Details", CStr(obj.CdValor), false)%>
                            </td>
                        </tr>
                        <%
                    	        Next
                            End If
                        %>
                    </tbody>

                </table>
            </div>
        </div>
    </div>
</div>
