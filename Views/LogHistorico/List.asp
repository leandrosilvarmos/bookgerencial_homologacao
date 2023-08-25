<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><%=Texts.Titulo%></h5>
            </div>
            <div class="ibox-content">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Descrição Log</th>
                            <th>Usuário</th>
                            <th class="date-time">Dt. Histórico</th>
                            <th>Tabela</th>
                            <th>Campo</th>
                            <th>Cód. Registro</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            If Not IsNothing(Model) Then
                    	        For i = 0 To (Model.Count - 1) Step 1
                                    Dim vDescricaoLog, vTipo, vNmUsuario, vDtHistorico, vTabela, vCampo, vCdRegistro

                                    vDescricaoLog = Model.GetValue("DS_LOG_DESCRICAO",i)
                                    vTipo         = Model.GetValue("TIPO",i)
                                    vNmUsuario    = Model.GetValue("NM_USUARIO",i)
                                    vDtHistorico  = Model.GetValue("DT_LOG_HISTORICO",i)
                                    vTabela       = Model.GetValue("TABELA",i)
                                    vCampo        = Model.GetValue("CAMPO",i)
                                    vCdRegistro   = Model.GetValue("CD_REGISTRO",i)
                        %>
                        <tr>
                            <td class="w-s-normal TipoLog <%=vTipo%>">
                                <%=Html.Encode(vDescricaoLog)%>
                            </td>
                            <td class="w-s-normal">
                                <%=Html.Encode(vNmUsuario)%>
                            </td>
                            <td>
                                <%=Html.Encode(vDtHistorico)%>
                            </td>
                            <td>
                                <%=Html.Encode(vTabela)%>
                            </td>
                            <td>
                                <%=Html.Encode(vCampo)%>
                            </td>
                            <td>
                                <%=Html.Encode(vCdRegistro)%>
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
