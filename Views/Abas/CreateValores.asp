<div class="row" style="margin-bottom: 30px; text-align: center;">
    <div class="col-sm-3">
        <strong>Legenda:</strong>
    </div>
    <div class="col-sm-3">
        <i class="fa fa-lg fa-circle verde"></i>&nbsp;Preenchido / Salvo
    </div>
    <div class="col-sm-3">
        <i class="fa fa-lg fa-circle amarelo"></i>&nbsp;Preenchido / Não salvo
    </div>
    <div class="col-sm-3">
        <i class="fa fa-lg fa-circle vermelho"></i>&nbsp;Sem Preenchimento
    </div>
</div>
<%
    Dim vMesAtual, vAnoAtual, vDsMesAtual, vDsMesAnterior1, vDsMesAnterior2

    If IsNumeric(ViewData.Item("Mes")) Then
        vMesAtual = CInt(ViewData.Item("Mes"))
    Else
        vMesAtual = 1
    End if 

    If IsNumeric(ViewData.Item("Ano")) Then
        vAnoAtual = CInt(ViewData.Item("Ano"))
    Else
        vAnoAtual = Year(Date())
    End if 
    
    vDsMesAtual     = InitCap(MonthName(vMesAtual)) & " / " & vAnoAtual

    If vMesAtual = 1 Then
        vDsMesAnterior1 = InitCap(MonthName(12)) & " / " & vAnoAtual-1
        vDsMesAnterior2 = InitCap(MonthName(11)) & " / " & vAnoAtual-1
    Else
        vDsMesAnterior1 = InitCap(MonthName(vMesAtual-1)) & " / " & vAnoAtual
        
        If vMesAtual = 2 Then
            vDsMesAnterior2 = InitCap(MonthName(12)) & " / " & vAnoAtual-1
        Else
            vDsMesAnterior2 = InitCap(MonthName(vMesAtual-2)) & " / " & vAnoAtual
        End If
    End If

%>
<form action="?controller=Abas&action=CreatePost" id="CreatePost" method="post" accept-charset="ISO-8859-1">
    <%=Html.Hidden("CdUnidade", ViewData.Item("CdUnidade"))%>
    <%=Html.Hidden("CdModulo", ViewData.Item("Item"))%>
    <%=Html.Hidden("Ano", ViewData.Item("Ano"))%>
    <%=Html.Hidden("Mes", ViewData.Item("Mes"))%>

    <table class="table table-bordered <%=iif(Frequencia,"frequencia","")%>">
        <thead>
            <tr>
                <th></th>
                <% If Frequencia Then %><th>Frequência</th>
                <% End If %>
                <th><%=vDsMesAnterior2%></th>
                <th><%=vDsMesAnterior1%></th>
                <th><%=vDsMesAtual%></th>
                <th><a id="changeData" href="#" title="Alterar Data"><i class="fas fa-calendar fa-lg"></i></a></th>
            </tr>
        </thead>
        <tbody>
            <% 
            If Not IsNothing(Model) Then
                For i = 0 To (Model.Count - 1) Step 1
                    Dim vNivel, vCdItem, vNmItem, vDsItem, vTipo, vFormatacao, vQtdCasasDecimais, vEstilo, vValFrequencia, vCdCentroCusto, vCriar, vCdValMes, vValMes, vCdValMesAnterior1, vValMesAnterior1, vCdValMesAnterior2, vValMesAnterior2
                
                    Dim vIputGrpAddon, vTitleInputGrpAddon

                    Dim vExibirValor, vNmFrequencia

                    vNivel             = Model.GetValue("NIVEL",i)
                    vCdItem            = Model.GetValue("CD_ITEM",i)
                    vNmItem            = Model.GetValue("NM_ITEM",i)
                    vDsItem            = Model.GetValue("DS_ITEM",i)
                    vTipo              = Model.GetValue("TIPO",i)
                    vFormatacao        = Model.GetValue("FORMATACAO",i)
                    vQtdCasasDecimais  = Model.GetValue("QTD_CASAS_DECIMAIS",i)
                    vEstilo            = Model.GetValue("ESTILO",i)
                    vValFrequencia     = Model.GetValue("FREQUENCIA",i)
                    vCdCentroCusto     = Model.GetValue("CD_CENTRO_CUSTO",i)
                    vCriar             = Model.GetValue("CRIAR",i)

                    vCdValMes          = Model.GetValue("CD_VAL_MES",i)
                    vValMes            = iif(vFormatacao <> "T", FormatarValor(Model.GetValue("VAL_MES",i), vFormatacao, null, "VAL_MES", i, vQtdCasasDecimais), Model.GetValue("VAL_MES_TXT",i))
                    vCdValMesAnterior1 = Model.GetValue("CD_VAL_MES_ANTERIOR_1",i)
                    vValMesAnterior1   = iif(vFormatacao <> "T", FormatarValor(Model.GetValue("VAL_MES_ANTERIOR_1",i), vFormatacao, null, "VAL_MES_ANTERIOR_1", i, vQtdCasasDecimais), Model.GetValue("VAL_MES_ANTERIOR_TXT_1",i))
                    vCdValMesAnterior2 = Model.GetValue("CD_VAL_MES_ANTERIOR_2",i)
                    vValMesAnterior2   = iif(vFormatacao <> "T", FormatarValor(Model.GetValue("VAL_MES_ANTERIOR_2",i), vFormatacao, null, "VAL_MES_ANTERIOR_2", i, vQtdCasasDecimais), Model.GetValue("VAL_MES_ANTERIOR_TXT_2",i))

                    vIputGrpAddon       = ""
                    vTitleInputGrpAddon = ""

                    vExibirValor = False
                    vNmFrequencia = ""    

                    Select Case vFormatacao
                        Case "N"
                            vIputGrpAddon = "<strong>Nº</strong>"
                            vTitleInputGrpAddon = "Número inteiro"

                            If IsNothing(vQtdCasasDecimais) Then
                                vQtdCasasDecimais = 0
                            End If
                        Case "D"
                            vIputGrpAddon = "<strong>0,0</strong>"
                            vTitleInputGrpAddon = "Número decimal"

                            If IsNothing(vQtdCasasDecimais) Then
                                vQtdCasasDecimais = 2
                            End If
                        Case "M"
                            vIputGrpAddon = "<i class='fa fa-dollar-sign'></i>"
                            vTitleInputGrpAddon = "Moeda (R$)"

                            If IsNothing(vQtdCasasDecimais) Then
                                vQtdCasasDecimais = 2
                            End If
                        Case "P"
                            vIputGrpAddon = "<i class='fa fa-percentage'></i>"
                            vTitleInputGrpAddon = "Porcentagem"

                            If IsNothing(vQtdCasasDecimais) Then
                                vQtdCasasDecimais = 2
                            End If
                        Case "T"
                             vIputGrpAddon = "<strong>T</strong>"
                             vTitleInputGrpAddon = "Texto"
                        Case "H"
                            vIputGrpAddon = "<i class='fa fa-clock'></i>"
                            vTitleInputGrpAddon = "Hora"
                    End Select

                    If instr(vEstilo, "stlSeparadorTop") > 0 Then
            %>
            <tr class="separador">
                <td colspan="<%=iif(Frequencia,"6","5")%>">&nbsp;</td>
            </tr>
            <%
                    End If

                    If vTipo = "I" Then
                        If Not Frequencia Or (Frequencia And vValFrequencia = 1) Then 
                            vExibirValor = True
                            vNmFrequencia = vDsMesAtual
                        ElseIf Frequencia And vMesAtual > 1 Then
                            Dim vResto
        
                            vResto = vMesAtual Mod vValFrequencia

                            If vResto = 0 Then
                                vExibirValor = True

                                If pFrequenciaValor = 12 Then
                                    vNmFrequencia = vAnoAtual
                                Else
                                    vNmFrequencia = CStr(vMesAtual / vValFrequencia) & "º " & Texts.EnumDescricao("NmFrequenciaEnum", vValFrequencia) 
                                End If
                            End If
                        End If 
            %>
            <% If vExibirValor Then %>
            <tr class="nvl<%=vNivel%> tp<%=vTipo%> format<%=vFormatacao%> <%=vEstilo%>">
                <td><%=vNmItem%><%=iif(Not IsNothing(vDsItem), "<span style='float: right; color: #7d8081; cursor: help; display: none;' class='fas fa-lg fa-info-circle' title='"&vDsItem&"'></span>", "")%></td>
                <%If Frequencia Then %><td><b><%=Html.Encode(Texts.EnumDescricao("FrequenciaEnum", vValFrequencia))%></b></td>
                <% End If %>
                <td><span title="<%=vNmItem%> (<%=vDsMesAnterior2%>): <%=vValMesAnterior2%>"><%=vValMesAnterior2%></span></td>
                <td><span title="<%=vNmItem%> (<%=vDsMesAnterior1%>): <%=vValMesAnterior1%>"><%=vValMesAnterior1%></span></td>

                <td class="mes-atual">
                    <% If IsNothing(vCdValMes) Then %>
                    <% If ViewData.Item("PermissaoCriar") And ((CStr(vCriar) = "1" And CStr(vCdCentroCusto) <> "0") Or CStr(vCdCentroCusto) = "0") Then %>
                    <div class="input-group">
                        <span class="input-group-addon" title="<%=vTitleInputGrpAddon%>"><%=vIputGrpAddon%></span>
                        <input id="item<%=vCdItem%>" name="item<%=vCdItem%>" type="text" class="form-control valor" title="<%=vNmItem%> (<%=vDsMesAtual%>)" data-cditem="<%=vCdItem%>" data-precision="<%=vQtdCasasDecimais%>" />
                    </div>
                    <% End If %>
                    <% Else %>
                    <span title="<%=vNmItem%> (<%=vDsMesAtual%>): <%=vValMes%>">
                        <%=vValMes%>
                    </span>
                    <% If ViewData.Item("PermissaoExcluir") Then %>
                    <span class="fa fa-trash excluir-valor" title="Excluir Valor" data-cdvalor="<%=vCdValMes%>" data-valor="<%=vNmItem%> (<%=vDsMesAtual%>): <%=vValMes%>"></span>
                    <% End If %>
                    <% End If %>
                </td>
                <td><span class="fa fa-lg fa-circle <%=iif(IsNothing(vCdValMes), "vermelho", "verde")%> cditem-<%=vCdItem%>" title="<%=iif(IsNothing(vCdValMes), "Sem Preenchimento", "Preenchido / Salvo")%>"></span></td>
            </tr>
            <% Else %>
            <tr class="nvl<%=vNivel%> tp<%=vTipo%> format<%=vFormatacao%> <%=vEstilo%>">
                <td><%=vNmItem%><%=iif(Not IsNothing(vDsItem), "<span style='float: right; color: #7d8081; cursor: help; display: none;' class='fas fa-lg fa-info-circle' title='"&vDsItem&"'></span>", "")%></td>
                <%If Frequencia Then %><td><b><%=Html.Encode(Texts.EnumDescricao("FrequenciaEnum", vValFrequencia))%></b></td>
                <% End If %>
                <td colspan="4"><i class="fas fa-exclamation-triangle" style="color: #ffb300;"></i>&nbsp;<small title="Quando o período estiver em vigência, não poderá ser efetuado lançamentos!">Período&nbsp;<strong><%=Texts.EnumDescricao("FrequenciaEnum", vValFrequencia)%></strong>&nbsp;em vigência</small></td>
            </tr>
            <% End If %>
            <%  
                    Else
            %>
            <tr class="nvl<%=vNivel%> tp<%=vTipo%> <%=vEstilo%>">
                <td colspan="<%=iif(Frequencia,"6","5")%>"><%=vNmItem%></td>
            </tr>
            <% 
                    End If

                    Response.Flush
                Next
            End If 
            %>
        </tbody>
    </table>

    <% If ViewData.Item("PermissaoCriar")  Then %>
    <div class="row" style="text-align: right;">
        <div class="col-sm-12">
            <button id="btnSalvarValores" class="btn btn-primary" type="submit" disabled><i class="fa fa-save"></i>&nbsp;Gravar Valores</button>
        </div>
    </div>
    <% End If %>
</form>

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
                    <input id="txtChangeData" type="text" class="form-control" data-mask="99/9999" value="<%=lpad(vMesAtual,"0",2)&"/"&vAnoAtual%>" />
                </div>
            </div>
            <div class="modal-footer" style="border-top-width: 0px">
                <button id="btnChangeData" type="button" class="btn btn-primary"><i class="fas fa-calendar-check"></i>&nbsp;Alterar</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            </div>
        </div>
    </div>
</div>

<% If ViewData.Item("PermissaoExcluir") Then %>

<div id="mdlExcluirValor" class="modal fade">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Excluir Valor</h4>
            </div>
            <div class="modal-body" style="padding-bottom: 10px;">
                <h3><%=Texts.Mensagem("msgConfDelete")%></h3>
                <br />
                <span id="valor-exclusao" style="font-size: 14px; padding-left: 25px;"></span>
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label for="txtMotivoExclusao" class="control-label col-md-1" style="text-align: left; padding-left: 0px; margin-top: 5px; padding-right: 0px;">Motivo</label>
                    <div class="col-md-10">
                        <input id="txtMotivoExclusao" type="text" class="form-control col-sm-8" value="" maxlength="500" />
                        <input id="txtCdValorExclusao" type="hidden" />
                    </div>
                </div>
                <br />
                <br />
            </div>
            <div class="modal-footer" style="border-top-width: 0px">
                <button id="btnExcluirValor" type="button" class="btn btn-danger"><i class="fas fa-trash"></i>&nbsp;Excluir</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            </div>
        </div>
    </div>
</div>

<% End If %>