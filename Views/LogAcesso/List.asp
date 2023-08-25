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
                            <th>Usuário Log</th>
                            <th>Computador</th>
                            <th class="date-time">Dt. Acesso</th>
                            <th>Login</th>
                            <th>Status</th>
                            <th>Mensagem</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            If Not IsNothing(Model) Then
                    	        For i = 0 To (Model.Count - 1) Step 1
                                    Dim vNmUsuario, vComputador, vDtLogAcesso, vLogin, vStatus, vMensagem

                                    vNmUsuario   = Model.GetValue("NM_USUARIO",i)
                                    vComputador  = Model.GetValue("COMPUTADOR",i)
                                    vDtLogAcesso = Model.GetValue("DT_LOG_ACESSO",i)
                                    vLogin       = Model.GetValue("USUARIO",i)
                                    vStatus      = Model.GetValue("STATUS",i)
                                    vMensagem    = Model.GetValue("MENSAGE",i)
                        %>
                        <tr>
                            <td class="w-s-normal">
                                <%=Html.Encode(vNmUsuario)%>
                            </td>
                            <td>
                                <%=Html.Encode(vComputador)%>
                            </td>
                            <td class="w-s-normal">
                                <%=Html.Encode(vDtLogAcesso)%>
                            </td>
                            <td>
                                <%=Html.Encode(vLogin)%>
                            </td>
                            <td class="w-s-normal Status <%=vStatus%>">
                                <%=Html.Encode(Texts.EnumDescricao("StatusLogAcessoEnum", vStatus))%>
                            </td>
                            <td class="w-s-normal">
                                <%=Html.Encode(Texts.Mensagem(vMensagem))%>
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
