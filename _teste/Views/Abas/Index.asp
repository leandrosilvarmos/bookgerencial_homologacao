<% View "PageHeader" %>

<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>ÍNDICE
                </h5>
                <div class="ibox-tools">
                    <a href="?action=IndexMsg&unidade=<%=ViewData.Item("CdUnidade")%>">
                        <i class="fa fa-reply"></i>&nbsp;Voltar
                    </a>
                </div>
            </div>
            <hr style="margin: 0px !important;" />
            <div class="ibox-content">
                <div class="row">
                    <table class="table table-responsive table-striped" style="border: 0px;">
                        <thead>
                            <tr>
                                <!--<th>Aba</th>-->
                                <th></th>
                                <th class="hidden-xs"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                If Not IsNothing(Model) Then
                    	            For i = 0 To (Model.Count - 1) Step 1
                                        Dim vCdModulo, vNmModulo, vDsModulo, vIcone

                                        vCdModulo = Model.GetValue("CD_MODULO",i)
                                        vNmModulo = Model.GetValue("NM_MODULO",i)
                                        vDsModulo = Model.GetValue("DS_MODULO",i)
                                        vIcone    = Model.GetValue("ICONE",i)
                            %>
                            <tr>
                                <!--<td><%=iif(vCdModulo=0,"",vCdModulo)%></td>-->
                                <td style="text-align: center;"><i class="fas fa-lg <%=vIcone%>"></i></td>
                                <td><a href="?controller=Abas&action=List&unidade=<%=ViewData.Item("CdUnidade")%>&ano=<%=ViewData.Item("Ano")%>&item=<%=vCdModulo%>"><%=vNmModulo%></a></td>
                                <td class="hidden-xs"><%=vDsModulo%></td>
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
</div>
