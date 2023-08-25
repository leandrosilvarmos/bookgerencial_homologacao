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
                            <th>Controller</th>
                            <th>Módulo</th>
                            <th>Criar</th>
                            <th>Lista</th>
                            <th>Visualizar</th>
                            <th>Editar</th>
                            <th>Deletar</th>
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
                                    Dim vCdPermissao, vNmGrupoPermissao, vNmUsuario, vController, vNmModulo, vCriar, vListar, vVisualizar, vEditar, vDeletar, vSituacao

                                    vCdPermissao      = Model.GetValue("CD_PERMISSAO",i)
                                    vNmGrupoPermissao = Model.GetValue("NM_GRUPO",i)
                                    vNmUsuario        = Model.GetValue("NM_USUARIO",i)
                                    vController       = Model.GetValue("DS_CONTROLLER",i)
                                    vNmModulo         = Model.GetValue("NM_MODULO",i)
                                    vCriar            = Model.GetValue("CRIAR",i)
                                    vListar           = Model.GetValue("LISTAR",i)
                                    vVisualizar       = Model.GetValue("VISUALIZAR",i)
                                    vEditar           = Model.GetValue("EDITAR",i)
                                    vDeletar          = Model.GetValue("DELETAR",i)
                                    vSituacao         = Model.GetValue("SITUACAO",i)
                        %>
                        <tr>
                            <td class="w-s-normal">
                                <%=Html.Encode(vController)%>
                            </td>
                            <td class="w-s-normal">
                                <%=Html.Encode(vNmModulo)%>
                            </td>
                            <td class="Bolean_<%=Nvl(vCriar,0)%>">
                                <%=Html.Encode(Texts.EnumDescricao("IeEnum", CStr(Nvl(vCriar,0))))%>
                            </td>
                            <td class="Bolean_<%=Nvl(vListar,0)%>">
                                <%=Html.Encode(Texts.EnumDescricao("IeEnum", CStr(Nvl(vListar,0))))%>
                            </td>
                            <td class="Bolean_<%=Nvl(vVisualizar,0)%>">
                                <%=Html.Encode(Texts.EnumDescricao("IeEnum", CStr(Nvl(vVisualizar,0))))%>
                            </td>
                            <td class="Bolean_<%=Nvl(vEditar,0)%>">
                                <%=Html.Encode(Texts.EnumDescricao("IeEnum", CStr(Nvl(vEditar,0))))%>
                            </td>
                            <td class="Bolean_<%=Nvl(vDeletar,0)%>">
                                <%=Html.Encode(Texts.EnumDescricao("IeEnum", CStr(Nvl(vDeletar,0))))%>
                            </td>
                            <td class="Situacao <%=vSituacao%>">
                                <%=Html.Encode(Texts.EnumDescricao("SituacaoEnum", vSituacao))%>
                            </td>
                            <td>
                                <%=Replace(vBtnEdit, "{id}", CStr(vCdPermissao))%>
                                <%=Replace(vBtnDelete, "{id}", CStr(vCdPermissao))%>
                                <%=Replace(vBtnDetails, "{id}", CStr(vCdPermissao))%>
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
