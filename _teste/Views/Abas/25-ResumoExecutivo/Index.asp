<div class="row border-bottom white-bg dashboard-header" style="margin: -15px -35px 20px -35px; border-bottom-width: 3px!important; padding-bottom: 0px;">
    <ul class="nav nav-tabs">
        <%
            If Not IsNothing(Model) Then
                For i = 0 To (Model.Count - 1) Step 1
        %>
        <li class="<%=iif(i=(Model.Count - 1),"active","")%>">
            <a data-toggle="tab" href="#tab-<%=i%>" data-item="<%=i%>"><%=Model.GetValue("COMPETENCIA",i)%></a>
        </li>
        <%    
                    Response.Flush
                Next
            End If
        %>
    </ul>
</div>

<div id="divResumoExecutivo" class="tabs-container m-t-lg">
    <div class="tab-content">
        <%
            If Not IsNothing(Model) Then
                For i = 0 To (Model.Count - 1) Step 1
                    Dim vMes, vCompetencia, vReceitas, vDespesas, vUrgenciasRealizado, vSaidasRealizado, vUrgenciasComparativo, vSaidaComparativo, vIPCA, vIGPM

                    vMes                  = Model.GetValue("MES",i)
                    vCompetencia          = Model.GetValue("COMPETENCIA",i)
                    vReceitas             = FormatNumber(Model.GetValue("RECEITAS",i), 2)
                    vDespesas             = FormatNumber(Model.GetValue("DESPESAS",i), 2)
                    vUrgenciasRealizado   = FormatNumber(Model.GetValue("URGENCIAS_REALIZADO",i), 2)
                    vSaidasRealizado      = FormatNumber(Model.GetValue("SAIDAS_REALIZADO",i), 2)
                    vUrgenciasComparativo = FormatNumber(Model.GetValue("URGENCIAS_COMPARATIVO",i), 2)
                    vSaidaComparativo     = FormatNumber(Model.GetValue("SAIDAS_COMPARATIVO",i), 2)
                    vIPCA                 = FormatNumber(Model.GetValue("IPCA",i), 2)
                    vIGPM                 = FormatNumber(Model.GetValue("IGPM",i), 2)
                
        %>
        <div id="tab-<%=i%>" class="tab-pane<%=iif(i=(Model.Count - 1)," active","")%>">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins" style="margin-bottom: 20px;">
                        <div class="ibox-content text-center p-sm" style="padding: 5px !important;">
                            <h2><span style="color: #293846; font-weight: 400;">Cenário de Produção e Econômico Financeiro</span></h2>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row" style="display: none;">
                <div class="col-sm-3">
                    <div class="ibox">
                        <div class="ibox-content" style="margin-right: 0px;">
                            <table class="table table-bordered" style="margin: 0px;">
                                <thead>
                                    <tr>
                                        <th>Receitas</th>
                                        <th>Despesas</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><%=vReceitas & "%"%></td>
                                        <td><%=vDespesas & "%"%></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="ibox">
                        <div class="ibox-content" style="margin-right: 0px;">
                            <table class="table table-bordered" style="margin: 0px;">
                                <thead>
                                    <tr>
                                        <th>Urgência</th>
                                        <th>Saídas</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><%=vUrgenciasRealizado & "%"%></td>
                                        <td><%=vSaidasRealizado & "%"%></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="ibox">
                        <div class="ibox-content" style="margin-right: 0px;">
                            <table class="table table-bordered" style="margin: 0px;">
                                <thead>
                                    <tr>
                                        <th>Urgência</th>
                                        <th>Saídas</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><%=vUrgenciasComparativo & "%"%></td>
                                        <td><%=vSaidaComparativo & "%"%></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="ibox">
                        <div class="ibox-content" style="margin-right: 0px;">
                            <table class="table table-bordered" style="margin: 0px;">
                                <thead>
                                    <tr>
                                        <th>IPCA</th>
                                        <th>IGPM</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><%=vIPCA & "%"%></td>
                                        <td><%=vIGPM & "%"%></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins" style="margin-bottom: 20px;">
                        <div class="ibox-content text-center p-sm" style="padding: 5px !important;">
                            <h2><span style="color: #293846; font-weight: 400;">Evolução da Produção</span></h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title" style="padding-bottom: 0px; height: 60px;">
                            <h5>Comparativo da Produção
                                    <% 
                                       If Not IsNothing(vMes) Then
                                           Response.Write(Mid(vCompetencia, InStr(vCompetencia, " ")))
                                       Else
                                           Response.Write(vCompetencia)
                                       End If
                                    %>
                                <br />
                                <small>Realizado
                                    <% 
                                       If Not IsNothing(vMes) Then
                                           Response.Write(UCase(MonthName(vMes)))
                                       Else
                                           Response.Write("Acumulado")
                                       End If
                                    %>
                                </small>
                                
                            </h5>
                        </div>
                        <div class="ibox-content">
                            <div>
                                <canvas id="graf01_tab<%=i%>" height="140"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title" style="padding-bottom: 0px; height: 60px;">
                            <h5>Produção Contratado x Realizado 
                                <br />
                                <small>
                                    <% 
                                       If Not IsNothing(vMes) Then
                                           Response.Write(UCase(MonthName(vMes)))
                                       Else
                                           Response.Write("Acumulado " & CInt(ViewData.Item("Ano")) - 1)
                                       End If
                                    %>
                                </small>
                            </h5>
                        </div>
                        <div class="ibox-content">
                            <div>
                                <canvas id="graf02_tab<%=i%>" height="140"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins" style="margin-bottom: 20px;">
                        <div class="ibox-content text-center p-sm" style="padding: 5px !important;">
                            <h2><span style="color: #293846; font-weight: 400;">Econômico Financeiro</span></h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title" style="padding-bottom: 0px; height: 60px;">
                            <h5>Econômico Financeiro
                                <br />
                                <small>
                                    <% 
                                       If Not IsNothing(vMes) Then
                                           Response.Write("Comparativo " & vCompetencia)
                                       Else
                                           Response.Write("Acumulado " & CInt(ViewData.Item("Ano")) - 1)
                                       End If
                                    %>
                                </small>
                            </h5>
                        </div>
                        <div class="ibox-content">
                            <div>
                                <canvas id="graf03_tab<%=i%>" height="140"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title" style="padding-bottom: 0px; height: 60px;">
                            <h5>Inflação
                                <br />
                                <small>Acumulado
                                    <% 
                                       If Not IsNothing(vMes) Then
                                           Response.Write(CInt(ViewData.Item("Ano")))
                                       Else
                                           Response.Write(CInt(ViewData.Item("Ano")) - 1)
                                       End If
                                    %>
                                </small>
                            </h5>
                        </div>
                        <div class="ibox-content">
                            <div>
                                <canvas id="graf04_tab<%=i%>" height="140"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%                  
                    Response.Flush
                Next
            End If
        %>
    </div>
</div>


