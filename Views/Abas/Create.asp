<%
    Select Case ViewData.Item("Etapa")
        Case "Unidades"
%>

<div class="row" style="padding-left: 30px;">
    <h4>Selecione uma unidade:</h4>
</div>

<div class="row">
    <div class="col-xs-12">
        <%
    If Not IsNothing(Model) Then
        For i = 0 To (Model.Count - 1) Step 1
            Dim vCdUnidade, vNmUnidade, vDsUnidade, vSigla, vUrlLogo, vUrlFoto, vSituacao

            vCdUnidade = Model.GetValue("CD_UNIDADE",i)
            vNmUnidade = Model.GetValue("NM_UNIDADE",i)
            vDsUnidade = Model.GetValue("DS_UNIDADE",i)
            vSigla     = Model.GetValue("SIGLA",i)
            vUrlLogo   = Model.GetValue("URL_LOGO",i)
            vUrlFoto   = Model.GetValue("URL_FOTO",i)
            vSituacao  = Model.GetValue("SITUACAO",i)
        %>
        <div class="col-xs-12 col-sm-6 col-md-4">
            <a href="?controller=Abas&action=CreateMsg&unidade=<%=vCdUnidade%>">
                <div class="ibox">
                    <div class="ibox-content product-box">
                        <div class="product-imitation" style="padding: 0px;">
                            
                            <img src="Content/img/<%=vUrlFoto%>" class="img-responsive" style="margin: auto;" />
                        </div>
                        <div class="product-desc">
                            <div class="row">
                                <div class="col-xs-3" style="padding-right: 0px; padding-left: 3px;">
                                    <img src="Content/img/<%=vUrlLogo%>" class="img-responsive" />
                                </div>
                                <div class="col-xs-9">
                                    <span class="product-name"><%=vSigla%></span>
                                    <div class="small m-t-xs">
                                        <%=vNmUnidade%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <% 
                    Response.Flush
                Next
            Else 
        %>
        <div>
            <div class="row">
                <h4 style="text-align: center;">Nenhuma unidade encontrada</h4>
            </div>
        </div>
        <% 
            End If 
        %>
    </div>
</div>

<%
        Case "Modulos"
            View "PageHeader"
%>

<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5 style="margin-top: 10px;">Módulos</h5>
                <div class="ibox-tools">
                    <a class="fa fa-reply btn" href="?controller=Abas&action=Create">Voltar</a>
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
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                If Not IsNothing(Model) Then
                    	            For i = 0 To (Model.Count - 1) Step 1
                                        Dim vCdModulo, vNmModulo, vDsModulo, vIcone, vOrigemDados

                                        vCdModulo    = Model.GetValue("CD_MODULO",i)
                                        vNmModulo    = Model.GetValue("NM_MODULO",i)
                                        vDsModulo    = Model.GetValue("DS_MODULO",i)
                                        vIcone       = Model.GetValue("ICONE",i)
                                        vOrigemDados = Model.GetValue("ORIGEM_DADOS",i)

                                        If vOrigemDados = "M" Then
                            %>
                            <tr>
                                <!--<td><%=iif(vCdModulo=0,"",vCdModulo)%></td>-->
                                <td style="text-align: center;"><i class="fas fa-lg <%=vIcone%>"></i></td>
                                <td><a href="?controller=Abas&action=CreateMsg&unidade=<%=ViewData.Item("CdUnidade")%>&item=<%=vCdModulo%>"><%=vNmModulo%></a></td>
                                <td><%=vDsModulo%></td>
                            </tr>
                            <% 
                                            End If
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

<%
        Case "Valores"
            View "PageHeader"
%>

<div class="row">
    <div class="col-lg-12">
        <% If Not IsNothing(ViewData.Item("Modulo")) Then %>
        <div class="ibox float-e-margins mdl_<%=ViewData.Item("Modulo").GetValue("CD_MODULO",0)%>">
            <div class="ibox-title">
                <h5>
                    <%=ViewData.Item("Modulo").GetValue("NM_MODULO",0)%>
                    <br />
                    <small><%=ViewData.Item("Modulo").GetValue("DS_MODULO",0)%></small>
                </h5>
                <div class="ibox-tools">
                    <a class="fa fa-book btn btn-success" href="?controller=Abas&action=List&unidade=<%=ViewData.Item("CdUnidade")%>&ano=<%=ViewData.Item("Ano")%>&item=<%=ViewData.Item("Item")%>">Visualizar Book</a>
                    <a class="fa fa-reply btn" href="?controller=Abas&action=CreateMsg&unidade=<%=ViewData.Item("CdUnidade")%>">Voltar</a>
                </div>
            </div>
            <hr style="margin: 0px !important; border-color: #c9d0d6;" />
            <div class="ibox-content">
                <%View ViewData.Item("Aba")%>
            </div>
        </div>
        <% End If %>
    </div>
</div>

<%
    End Select
%>