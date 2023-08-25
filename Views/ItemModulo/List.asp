<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><%=Texts.Titulo%></h5>
            </div>
            <div class="ibox-content">
                <div class="form-horizontal">
                    <div class="form-group">
                        <%=eHtml.Label("Módulo", "CdModulo", "class='control-label col-md-2'")%>
                        <div class="col-md-10">
                            <%=Html.DropDownList("CdModulo", ViewData.Item("CdModulo"), ViewData.Item("Modulos"), "CdModulo", "CdNmModulo")%>
                        </div>
                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <% If ViewData.Item("CdModulo") <> "" Then %>

                <% If ViewData.Item("CdItemSuperior") <> "" Then %>
                <div class="form-horizontal">
                    <div class="form-group">
                        <%=eHtml.Label("Nome do Item", "", "class='control-label col-md-2'")%>

                        <% If Not IsNothing(ViewData.Item("ItemSuperior")) Then %>
                        <div class="col-md-8" style="padding-top: 7px;">
                            <%=Html.Encode(ViewData.Item("ItemSuperior").Items()(0).NmItem)%>
                        </div>
                        <div class="col-md-2" style="text-align: right;">
                            <a href="?controller=ItemModulo&action=ListMsg&id=<%=ViewData.Item("CdModulo")%>&CdSuperior=<%=ViewData.Item("ItemSuperior").Items()(0).CdItemSuperior%>" class="fa fa-reply btn btn-white">Voltar</a>
                        </div>
                        <% End If %>
                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <h4 style="margin-bottom: 20px !important;">Subitens</h4>
                <% End If %>

                <p style="margin-bottom: 20px !important;">
                    <%=GetActionLinkIV("Create",  ViewData.Item("CdModulo") & "&CdSuperior=" & ViewData.Item("CdItemSuperior"), true)%>
                </p>

                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th><%=GetModelDisplay("ItemModulo", "Ordem")%></th>
                            <th><%=GetModelDisplay("ItemModulo", "NmItem")%></th>
                            <th><%=GetModelDisplay("ItemModulo", "DsItem")%></th>
                            <th><%=GetModelDisplay("ItemModulo", "Tipo")%></th>
                            <th><%=GetModelDisplay("ItemModulo", "Situacao")%></th>
                            <th>Unidade</th>
                            <th class="no-sort"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            If Not IsNothing(Model) Then
                                Dim vBtnEdit, vBtnDelete, vBtnDetails, vBtnSubItens
                                
                                vBtnEdit        = GetActionLinkV("Edit", false)
                                vBtnDelete      = GetActionLinkV("Delete", false)
                                vBtnDetails     = GetActionLinkV("Details", false)
                                vBtnSubItens    = "<a href='?controller=ItemModulo&action=ListMsg&id=" & ViewData.Item("CdModulo") & "&CdSuperior={id}' class='fas fa-lg fa-sitemap' title='Subitens'></a>"

                    	        For each obj in Model.Items
                        %>
                        <tr>
                            <td>
                                <%=Html.Encode(obj.Ordem)%>
                            </td>
                            <td class="w-s-normal">
                                <%=Html.Encode(obj.NmItem)%>
                            </td>
                            <td class="w-s-normal">
                                <%=Html.Encode(obj.DsItem)%>
                            </td>
                            <td>
                                <%=Html.Encode(Texts.EnumDescricao("TipoItemEnum", obj.Tipo))%>
                            </td>
                            <td>
                                <%=Html.Encode(Texts.EnumDescricao("SituacaoEnum", obj.Situacao))%>
                            </td>
                            <td>
                                <% 
                                   If Not IsNothing(ViewData.Item("Unidades")) And obj.CdUnidade <> "" Then
                                       Response.Write(ViewData.Item("Unidades").GetValueById("SIGLA", obj.CdUnidade))
                                   End If
                                %>
                            </td>
                            <td>
                                <%=Replace(vBtnSubItens, "{id}", CStr(obj.CdItem))%>
                                <%=iif(vBtnSubItens = "","","&nbsp;|&nbsp;")%>
                                <%=Replace(vBtnEdit, "{id}", CStr(obj.CdItem))%>
                                <%=Replace(vBtnDelete, "{id}", CStr(obj.CdItem))%>
                                <%=Replace(vBtnDetails, "{id}", CStr(obj.CdItem))%>
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
                        Response.Write "<h4 style='text-align: center;'>Selecione o módulo</h4>"
                   End If 
                %>
            </div>
        </div>
    </div>
</div>
