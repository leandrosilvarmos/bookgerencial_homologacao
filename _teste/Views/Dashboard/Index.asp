<%
    Dim vMes, vAno, vMesAtual, vAnoAtual

    vMes = ViewData.Item("Mes")
    vAno = ViewData.Item("Ano")

    vMesAtual = Month(Date())
    vAnoAtual = Year(Date())

    If vMesAtual = 1 Then
        vMesAtual = 12
        vAnoAtual = vAnoAtual - 1
    Else
        vMesAtual = vMesAtual - 1
    End If
%>
<div class="tabs-container">
    <ul class="nav nav-tabs" role="tablist">
        <li class="<%=iif(ViewData.Item("Analise")<>"", "", "active")%>"><a class="nav-link active show" data-toggle="tab" href="#tab-1" aria-expanded="true"><i class="fas fa-list-ol"></i>&nbsp;Indicadores</a></li>
        <% If CStr(ViewData.Item("CountPendencias").GetValue("PERMISSAO_CRIAR",0)) = "1" Or CStr(ViewData.Item("CountPendencias").GetValue("PERMISSAO_EDITAR",0)) = "1" Then %>
        <li class="<%=iif(ViewData.Item("Analise")<>"", "active", "")%>"><a class="nav-link" data-toggle="tab" href="#tab-2"><i class="far fa-list-alt"></i>&nbsp;Análises<% If ViewData.Item("CountPendencias").GetValue("TOTAL",0) <> "0" Then %>&nbsp;&nbsp;<span class="label label-danger" style="padding-bottom: 1px; padding-top: 0px; padding-left: 3px; padding-right: 3px;" data-original-title="" title=""><%=ViewData.Item("CountPendencias").GetValue("TOTAL",0)%></span><% End If %></a></li>
        <% End If %>
    </ul>
    <div class="tab-content">
        <div role="tabpanel" id="tab-1" class="tab-pane <%=iif(ViewData.Item("Analise")<>"", "", "active")%>">
            <div class="panel-body" style="padding: 0px;">
                <div class="row">
                    <div class="col-md-12">
                        <div class="ibox">
                            <div class="ibox-title" style="border-top-width: 0px;">
                                <h5><strong><%=InitCap(MonthName(vMes)) & " " & vAno%></strong></h5>
                                <div class="ibox-tools">
                                    <a id="changeData" class="dropdown-toggle" data-toggle="dropdown" href="#" title="Alterar Data" style="color: #337ab7;">
                                        <i class="fas fa-calendar fa-lg"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="ibox-content ibox-heading">
                                <div class="row" style="padding-left: 30px;">
                                    <div class="col-sm-3">
                                        <span class="label label-danger legenda">&nbsp;</span>&nbsp;&nbsp;<span>Sem Preenchimento</span>
                                    </div>
                                    <div class="col-sm-3">
                                        <span class="label label-warning legenda">&nbsp;</span>&nbsp;&nbsp;<span>Preenchimento Parcial</span>
                                    </div>
                                    <div class="col-sm-3">
                                        <span class="label label-primary legenda">&nbsp;</span>&nbsp;&nbsp;<span>Preenchimento Completo</span>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="itemLegenda legenda"></div>
                                        &nbsp;<span>Suas Competências</span>
                                    </div>
                                </div>
                                <div class="row" style="padding-left: 30px; margin-top: 10px;">
                                    <div class="col-sm-3">
                                        <span class="fas fa-lg fa-pencil-square legenda aprovacao-"></span>&nbsp;&nbsp;<span>Análise Sem Preenchimento</span>
                                    </div>
                                    <div class="col-sm-3">
                                        <span class="fas fa-lg fa-pencil-square legenda aprovacao-P"></span>&nbsp;&nbsp;<span>Análise Sem Aprovação</span>
                                    </div>
                                    <div class="col-sm-3">
                                        <span class="fas fa-lg fa-pencil-square legenda aprovacao-R"></span>&nbsp;&nbsp;<span>Análise Rejeitada</span>
                                    </div>
                                    <div class="col-sm-3">
                                        <span class="fas fa-lg fa-pencil-square legenda aprovacao-A"></span>&nbsp;&nbsp;<span>Análise Aprovada</span>
                                    </div>
                                </div>
                            </div>
                            <div id="box-indicadores" class="ibox-content table-responsive">
                                <div class="row" style="margin-bottom: 25px;">
                                    <div class="col-sm-12">
                                        <input id="txtPesquisar" type="text" class="form-control" style="float: right; width: 200px;">
                                        <label style="float: right; margin-top: 5px; margin-right: 10px;">Pesquisar:</label>
                                    </div>
                                </div>
                                <div class="row filtro">
                                    <label id="lblFiltro"></label>
                                    &nbsp;(<a href="#" onclick="LimparPesquisa();">Limpar pesquisa</a>)
                                </div>
                                <div class="panel-group" id="accordion">
                                    <% 
                        If Not IsNothing(ViewData.Item("Indicadores")) Then 
                            Dim vCdUnidadeTemp   
                        
                            vCdUnidadeTemp = ""

                            For i = 0 To (ViewData.Item("Indicadores").Count - 1) Step 1
                                Dim vCdUnidade, vNmUnidade, vSigla, vUrlLogo, vCdModulo, vNmModulo, vIcone, vQtdItem, vQtdItemPreenchido, vAprovacaoAnalise, vDsAprovacaoAnalise, vPermissaoCriar, vIsAnaliseCritica

                                vCdUnidade          = ViewData.Item("Indicadores").GetValue("CD_UNIDADE",i)
                                vNmUnidade          = ViewData.Item("Indicadores").GetValue("NM_UNIDADE",i)
                                vSigla              = ViewData.Item("Indicadores").GetValue("SIGLA",i)
                                vUrlLogo            = ViewData.Item("Indicadores").GetValue("URL_LOGO",i)
                                vCdModulo           = ViewData.Item("Indicadores").GetValue("CD_MODULO",i)
                                vNmModulo           = ViewData.Item("Indicadores").GetValue("NM_MODULO",i)
                                vIcone              = ViewData.Item("Indicadores").GetValue("ICONE",i)
                                vQtdItem            = ViewData.Item("Indicadores").GetValue("QTD_ITEM",i)
                                vQtdItemPreenchido  = ViewData.Item("Indicadores").GetValue("QTD_ITEM_PREENCHIDO",i)
                                vAprovacaoAnalise   = ViewData.Item("Indicadores").GetValue("SITUACAO_ANALISE",i)
                                vDsAprovacaoAnalise = ViewData.Item("Indicadores").GetValue("DS_SITUACAO_ANALISE",i)
                                vPermissaoCriar     = ViewData.Item("Indicadores").GetValue("PERMISSAO_CRIAR",i)
                                vIsAnaliseCritica   = ViewData.Item("Indicadores").GetValue("IS_ANALISE_CRITICA",i)

                                vKeywords = vSigla & "," & vNmUnidade & "," & vCdModulo & "," & iif(CInt(vQtdItem) > CInt(vQtdItemPreenchido), iif(CInt(vQtdItemPreenchido) = 0,"Sem Preenchimento","Preenchimento Parcial"), "Preenchimento Completo") & iif(vIsAnaliseCritica = "S", "," & vDsAprovacaoAnalise, "") & iif(vPermissaoCriar=1,",Suas Competências","")

                                If vCdUnidade <> vCdUnidadeTemp Then
                                    If vCdUnidadeTemp <> "" Then
                                        Response.Write "</tbody></table></div></div></div>"
                                    End If
                                    %>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <img src="Content/img/<%=vUrlLogo%>" />
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse<%=vCdUnidade%>"><%=vSigla%>&nbsp;-&nbsp;<%=vNmUnidade%></a>
                                            </h4>
                                        </div>
                                        <div id="collapse<%=vCdUnidade%>" class="panel-collapse collapse <%=iif(vCdUnidadeTemp="","in","")%>">
                                            <div class="panel-body">
                                                <table id="indicadores<%=vCdUnidade%>" class="indicadores table-indicadores table-hover no-margins">
                                                    <%        
                                End If 
                                                    %>
                                                    <tr class="col-sm-6 clsModulo <%=iif(vPermissaoCriar=1,"permissao-criar","")%>" data-cdunidade="<%=vCdUnidade%>" data-cdmodulo="<%=vCdModulo%>" data-keywords="<%=vKeywords%>">
                                                        <td><%=iif(CInt(vQtdItem) > CInt(vQtdItemPreenchido), iif(CInt(vQtdItemPreenchido) = 0,"<span class='label label-danger' title='Sem Preenchimento'>&nbsp;</span>","<span class='label label-warning' title='Preenchimento Parcial'>&nbsp;</span>"), "<span class='label label-primary' title='Preenchimento Completo'>&nbsp;</span>")%></td>
                                                        <td><%If vIsAnaliseCritica = "S" And ((vCdUnidade = 2 And vCdModulo <> 26) Or vCdUnidade <> 2) Then %><span class="fas fa-lg fa-pencil-square aprovacao-<%=vAprovacaoAnalise%>" title="<%=vDsAprovacaoAnalise%>"></span><% End If %></td>
                                                        <td>|</td>
                                                        <td><i class="fas fa-lg <%=vIcone%>"></i></td>
                                                        <td><!--<%=iif(vCdModulo=0, "", vCdModulo & "")%>--></td>
                                                        <td>
                                                            <%=vNmModulo%>
                                                        </td>
                                                    </tr>
                                                    <% If i = (ViewData.Item("Indicadores").Count - 1) Then %>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <%    
                                                       End If

                                vCdUnidadeTemp = vCdUnidade

                                Response.Flush
                            Next
                        Else
                                    %>
                                    <div>
                                        <div class="row">
                                            <h4 style="text-align: center;">Nenhum item encontrado</h4>
                                        </div>
                                    </div>
                                    <%
                        End If
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div role="tabpanel" id="tab-2" class="tab-pane <%=iif(ViewData.Item("Analise")<>"", "active", "")%>">
            <div class="panel-body">
                <div class="tabs-container">
                    <ul class="nav nav-tabs" role="tablist">
                        <% If CStr(ViewData.Item("CountPendencias").GetValue("PERMISSAO_CRIAR",0)) = "1" Then %>
                        <li class="<%=iif(ViewData.Item("Analise")="1" Or ViewData.Item("Analise")="", "active", "")%>">
                            <a class="nav-link active" data-toggle="tab" href="#tab-3">
                                <span class="fas fa-lg fa-pencil-square aprovacao-" data-original-title="" title=""></span>&nbsp;&nbsp;
                                <span data-original-title="" title="">Análises Sem Preenchimento</span>
                                <% If ViewData.Item("CountPendencias").GetValue("SEM_PREENCHIMENTO",0) <> "0" Then %>
                                &nbsp;&nbsp;
                                <span class="label label-danger" style="padding-bottom: 1px; padding-top: 0px; padding-left: 3px; padding-right: 3px;" data-original-title="" title=""><%=ViewData.Item("CountPendencias").GetValue("SEM_PREENCHIMENTO",0)%></span>
                                <% End If %>
                            </a>
                        </li>
                        <% End If %>
                        <% If CStr(ViewData.Item("CountPendencias").GetValue("PERMISSAO_EDITAR",0)) = "1" Then %>
                        <li class="<%=iif(ViewData.Item("Analise")="2" Or (CStr(ViewData.Item("CountPendencias").GetValue("PERMISSAO_CRIAR",0)) <> "1" And ViewData.Item("Analise")=""), "active", "")%>">
                            <a class="nav-link" data-toggle="tab" href="#tab-4">
                                <span class="fas fa-lg fa-pencil-square aprovacao-P" data-original-title="" title=""></span>&nbsp;&nbsp;
                                <span data-original-title="" title="">Análises Sem Aprovação</span>
                                <% If ViewData.Item("CountPendencias").GetValue("SEM_APROVACAO",0) <> "0" Then %>
                                &nbsp;&nbsp;
                                <span class="label label-danger" style="padding-bottom: 1px; padding-top: 0px; padding-left: 3px; padding-right: 3px;" data-original-title="" title=""><%=ViewData.Item("CountPendencias").GetValue("SEM_APROVACAO",0)%></span>
                                <% End If %>
                            </a>
                        </li>
                        <% End If %>
                        <% If CStr(ViewData.Item("CountPendencias").GetValue("PERMISSAO_CRIAR",0)) = "1" Then %>
                        <li class="<%=iif(ViewData.Item("Analise")="3", "active", "")%>">
                            <a class="nav-link" data-toggle="tab" href="#tab-5">
                                <span class="fas fa-lg fa-pencil-square aprovacao-R" data-original-title="" title=""></span>&nbsp;&nbsp;
                                <span data-original-title="" title="">Análises Rejeitadas</span>
                                <% If ViewData.Item("CountPendencias").GetValue("REJEITADAS",0) <> "0" Then %>
                                &nbsp;&nbsp;
                                <span class="label label-danger" style="padding-bottom: 1px; padding-top: 0px; padding-left: 3px; padding-right: 3px;" data-original-title="" title=""><%=ViewData.Item("CountPendencias").GetValue("REJEITADAS",0)%></span>
                                <% End If %>
                            </a>
                        </li>
                        <% End If %>
                    </ul>
                    <div class="tab-content">
                        <div role="tabpanel" id="tab-3" class="tab-pane <%=iif(ViewData.Item("Analise")="1" Or (CStr(ViewData.Item("CountPendencias").GetValue("PERMISSAO_CRIAR",0)) = "1" And ViewData.Item("Analise")=""), "active", "")%>">
                            <div class="panel-body">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>Aba</th>
                                            <th>Data</th>
                                            <th>Unidade</th>
                                            <th class="no-sort">&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%  
                                            If Not IsNothing(ViewData.Item("AnalisesSemPreenchimento")) Then 
                                                For i = 0 To (ViewData.Item("AnalisesSemPreenchimento").Count - 1) Step 1
                                                    Dim vAnoAP, vMesAP, vCdUnidadeAP, vUnidadeAP, vCdCentroCustoAP, vNmCentroCustoAP, vCdModuloAP, vNmModuloAP, vIconeModuloAP

                                                    vAnoAP           = ViewData.Item("AnalisesSemPreenchimento").GetValue("ANO",i)
                                                    vMesAP           = ViewData.Item("AnalisesSemPreenchimento").GetValue("MES",i)
                                                    vCdUnidadeAP     = ViewData.Item("AnalisesSemPreenchimento").GetValue("CD_UNIDADE",i)
                                                    vUnidadeAP       = ViewData.Item("AnalisesSemPreenchimento").GetValue("UNIDADE",i)
                                                    vCdCentroCustoAP = ViewData.Item("AnalisesSemPreenchimento").GetValue("CD_CENTRO_CUSTO",i)
                                                    vNmCentroCustoAP = ViewData.Item("AnalisesSemPreenchimento").GetValue("NM_CENTRO_CUSTO",i)
                                                    vCdModuloAP      = ViewData.Item("AnalisesSemPreenchimento").GetValue("CD_MODULO",i)
                                                    vNmModuloAP      = ViewData.Item("AnalisesSemPreenchimento").GetValue("NM_MODULO",i)
                                                    vIconeModuloAP   = ViewData.Item("AnalisesSemPreenchimento").GetValue("ICONE",i)
                                        %>
                                        <tr>
                                            <td><i class="fas fa-lg <%=vIconeModuloAP%>"></i>&nbsp;&nbsp;<%'=iif(vCdModuloAP=0, "", vCdModuloAP & " - ")%><%=vNmModuloAP%></td>
                                            <td><%=InitCap(MonthName(vMesAP)) & " " & vAnoAP%></td>
                                            <td><%=vUnidadeAP & iif(vNmCentroCustoAP<>"","<br/>"&iif(vCdCentroCustoAP > 10, vCdCentroCustoAP & " - ", "")&vNmCentroCustoAP,"") %></td>
                                            <td><a href="?controller=Abas&action=CreateMsg&unidade=<%=vCdUnidadeAP%>&item=<%=vCdModuloAP%>&ano=<%=vAnoAP%>&mes=<%=vMesAP%>&centrocusto=<%=vCdCentroCustoAP%>&ancora=AnaliseCritica"><i class="fa fa-edit"></i></a></td>
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
                        <div role="tabpanel" id="tab-4" class="tab-pane <%=iif(ViewData.Item("Analise")="2" Or (CStr(ViewData.Item("CountPendencias").GetValue("PERMISSAO_CRIAR",0)) <> "1" And ViewData.Item("Analise")=""), "active", "")%>">
                            <div class="panel-body">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>Aba</th>
                                            <th>Data</th>
                                            <th>Unidade</th>
                                            <th class="no-sort">&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%  
                                            If Not IsNothing(ViewData.Item("AnalisesSemAprovacao")) Then 
                                                For i = 0 To (ViewData.Item("AnalisesSemAprovacao").Count - 1) Step 1
                                                    Dim vAnoAA, vMesAA, vCdUnidadeAA, vUnidadeAA, vCdCentroCustoAA, vNmCentroCustoAA, vCdModuloAA, vNmModuloAA, vIconeModuloAA

                                                    vAnoAA           = ViewData.Item("AnalisesSemAprovacao").GetValue("ANO",i)
                                                    vMesAA           = ViewData.Item("AnalisesSemAprovacao").GetValue("MES",i)
                                                    vCdUnidadeAA     = ViewData.Item("AnalisesSemAprovacao").GetValue("CD_UNIDADE",i)
                                                    vUnidadeAA       = ViewData.Item("AnalisesSemAprovacao").GetValue("UNIDADE",i)
                                                    vCdCentroCustoAA = ViewData.Item("AnalisesSemAprovacao").GetValue("CD_CENTRO_CUSTO",i)
                                                    vNmCentroCustoAA = ViewData.Item("AnalisesSemAprovacao").GetValue("NM_CENTRO_CUSTO",i)
                                                    vCdModuloAA      = ViewData.Item("AnalisesSemAprovacao").GetValue("CD_MODULO",i)
                                                    vNmModuloAA      = ViewData.Item("AnalisesSemAprovacao").GetValue("NM_MODULO",i)
                                                    vIconeModuloAA   = ViewData.Item("AnalisesSemAprovacao").GetValue("ICONE",i)
                                        %>
                                        <tr>
                                            <td><i class="fas fa-lg <%=vIconeModuloAA%>"></i>&nbsp;&nbsp;<%'=iif(vCdModuloAA=0, "", vCdModuloAA & " - ")%><%=vNmModuloAA%></td>
                                            <td><%=InitCap(MonthName(vMesAA)) & " " & vAnoAA%></td>
                                            <td><%=vUnidadeAA & iif(vNmCentroCustoAA<>"","<br/>"&iif(vCdCentroCustoAA > 10, vCdCentroCustoAA & " - ", "")&vNmCentroCustoAA,"") %></td>
                                            <td><a href="?controller=Abas&action=CreateMsg&unidade=<%=vCdUnidadeAA%>&item=<%=vCdModuloAA%>&ano=<%=vAnoAA%>&mes=<%=vMesAA%>&centrocusto=<%=vCdCentroCustoAA%>&ancora=AnaliseCritica"><i class="fa fa-edit"></i></a></td>
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
                        <div role="tabpanel" id="tab-5" class="tab-pane <%=iif(ViewData.Item("Analise")="3", "active", "")%>">
                            <div class="panel-body">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>Aba</th>
                                            <th>Data</th>
                                            <th>Unidade</th>
                                            <th class="no-sort">&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%  
                                            If Not IsNothing(ViewData.Item("AnalisesRejeitadas")) Then 
                                                For i = 0 To (ViewData.Item("AnalisesRejeitadas").Count - 1) Step 1
                                                    Dim vAnoAR, vMesAR, vCdUnidadeAR, vUnidadeAR, vCdCentroCustoAR, vNmCentroCustoAR, vCdModuloAR, vNmModuloAR, vIconeModuloAR

                                                    vAnoAR           = ViewData.Item("AnalisesRejeitadas").GetValue("ANO",i)
                                                    vMesAR           = ViewData.Item("AnalisesRejeitadas").GetValue("MES",i)
                                                    vCdUnidadeAR     = ViewData.Item("AnalisesRejeitadas").GetValue("CD_UNIDADE",i)
                                                    vUnidadeAR       = ViewData.Item("AnalisesRejeitadas").GetValue("UNIDADE",i)
                                                    vCdCentroCustoAR = ViewData.Item("AnalisesRejeitadas").GetValue("CD_CENTRO_CUSTO",i)
                                                    vNmCentroCustoAR = ViewData.Item("AnalisesRejeitadas").GetValue("NM_CENTRO_CUSTO",i)
                                                    vCdModuloAR      = ViewData.Item("AnalisesRejeitadas").GetValue("CD_MODULO",i)
                                                    vNmModuloAR      = ViewData.Item("AnalisesRejeitadas").GetValue("NM_MODULO",i)
                                                    vIconeModuloAR   = ViewData.Item("AnalisesRejeitadas").GetValue("ICONE",i)
                                        %>
                                        <tr>
                                            <td><i class="fas fa-lg <%=vIconeModuloAR%>"></i>&nbsp;&nbsp;<%'=iif(vCdModuloAR=0, "", vCdModuloAR & " - ")%><%=vNmModuloAR%></td>
                                            <td><%=InitCap(MonthName(vMesAR)) & " " & vAnoAR%></td>
                                            <td><%=vUnidadeAR & iif(vNmCentroCustoAR<>"","<br/>"&iif(vCdCentroCustoAR > 10, vCdCentroCustoAR & " - ", "")&vNmCentroCustoAR,"") %></td>
                                            <td><a href="?controller=Abas&action=CreateMsg&unidade=<%=vCdUnidadeAR%>&item=<%=vCdModuloAR%>&ano=<%=vAnoAR%>&mes=<%=vMesAR%>&centrocusto=<%=vCdCentroCustoAR%>&ancora=AnaliseCritica"><i class="fa fa-edit"></i></a></td>
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
        </div>
    </div>
</div>

<div id="mdlChangeData" class="modal fade">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Alterar data</h4>
            </div>
            <div class="modal-body" style="padding-bottom: 10px;">
                <div class="input-group date month">
                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                    <input id="txtChangeData" type="text" class="form-control" data-mask="99/9999" value="<%=lpad(vMes,"0",2)&"/"&vAno%>" />
                    <input id="tmpData" type="hidden" value="<%=iif(CInt(vMes) = CInt(vMesAtual) And CInt(vAno) = CInt(vAnoAtual), "", "&ano=" & vAno & "&mes=" & vMes)%>" />
                </div>
            </div>
            <div class="modal-footer" style="border-top-width: 0px">
                <button id="btnChangeData" type="button" class="btn btn-primary"><i class="fas fa-calendar-check"></i>&nbsp;Alterar</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            </div>
        </div>
    </div>
</div>
