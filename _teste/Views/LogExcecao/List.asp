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
                            <th class="date-time">Dt. Exceção</th>
                            <th>Exceção</th>
                            <th>Path</th>
                            <th>Computador</th>
                            <th>Usuário</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            If Not IsNothing(Model) Then
                    	        For i = 0 To (Model.Count - 1) Step 1
                                    Dim vNumero, vOrigem, vDescricaoLog, vNmUsuario, vDtExcecao, vController, vAction, vComputador, vRoute

                                    vNumero       = Model.GetValue("NUMERO",i)
                                    vDescricaoLog = Model.GetValue("DESCRICAO",i)
                                    vOrigem       = Model.GetValue("ORIGEM",i)
                                    vNmUsuario    = Model.GetValue("NM_USUARIO",i)
                                    vDtExcecao    = Model.GetValue("DT_LOG_EXCECAO",i)
                                    vController   = Model.GetValue("CONTROLLER",i)
                                    vAction       = Model.GetValue("ACTION",i)
                                    vComputador   = Model.GetValue("COMPUTADOR",i)
                                    vRoute        = Model.GetValue("ROUTE",i)
                        %>
                        <tr>
                            <td>
                                <%=Html.Encode(vDtExcecao)%>
                            </td>
                            <td class="w-s-normal">
                                <strong>Número:</strong>&nbsp;
                                <%=Html.Encode(vNumero)%>
                                <br />
                                <hr />
                                <strong>Origem:</strong>&nbsp;
                                <%=Html.Encode(vOrigem)%>
                                <br />
                                <hr />
                                <strong>Descrição:</strong>&nbsp;
                                <%=Html.Encode(vDescricaoLog)%>
                            </td>
                            <td>
                                <strong>Controller:</strong>&nbsp;
                                <%=Html.Encode(vController)%>
                                <br />
                                <hr />
                                <strong>Action:</strong>&nbsp;
                                <%=Html.Encode(vAction)%>
                                <br />
                                <hr />
                                <strong>Route:</strong>&nbsp;
                                <%=Html.Encode(vRoute)%>
                            </td>
                            <td>
                                <%=Html.Encode(vComputador)%>
                            </td>
                            <td class="w-s-normal">
                                <%=Html.Encode(vNmUsuario)%>
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
