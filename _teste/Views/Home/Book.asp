<div class="row" style="height: 55px;">
    <div class="col-xs-1 col-sm-2 col-md-1 col-lg-1 hidden-xs">
        <img class="img-responsive" style="max-width: 70px !important;" src="Content/img/<%=ViewData.Item("UnidadeLogo")%>" />
    </div>
    <div class="col-xs-11 col-sm-9 col-md-10 col-lg-10">
        <h2 style="margin-top: 10px; font-weight: 500; color: #2b8895;"><%=ViewData.Item("Unidade")%></h2>
    </div>
</div>

<% If Not IsNothing(ViewData.Item("UnidadeCertificacoes")) Then %>
<div class="row <%=ViewData.Item("UnidadeCertificacoes")%>">
    <label class="col-xs-10">Acreditações:</label>
    <label class="col-xs-10"></label>
</div>
<% End If %>

<% If Not IsNothing(ViewData.Item("DsMissao")) Then %>
<div class="row" style="margin-left: 13px; margin-top: 5px;">
    <label>Missão:</label>
    <p><%=ViewData.Item("DsMissao")%></p>
</div>
<% End If %>

<% If Not IsNothing(ViewData.Item("DsVisao")) Then %>
<div class="row" style="margin-left: 13px;">
    <label>Visão:</label>
    <p><%=ViewData.Item("DsVisao")%></p>
</div>
<% End If %>

<% If Not IsNothing(ViewData.Item("DsValores")) Then %>
<div class="row" style="margin-left: 13px;">
    <label>Valores:</label>
    <p><%=ViewData.Item("DsValores")%></p>
</div>
<% End If %>

<div class="col-lg-12" style="padding: 0px;">
    <div class="float-e-margins">
        <% If Not Partial Then %>
        <div class="ibox-title" style="min-height: 20px; height: 45px;">
            <% If Not IsNothing(ViewData.Item("MapaEstrategico")) Then %>
            <a href="Content/img/<%=ViewData.Item("MapaEstrategico")%>" target="_blank">
                <h5>Acesso ao Mapa Estratégico</h5>
                &nbsp;</a>
            <% End If %>
            <div class="ibox-tools" style="width: 150px; float: right;">
                <a href="?action=IndexMsg&unidade=0">
                    <i class="fa fa-reply"></i>&nbsp;Voltar
                </a>
            </div>
        </div>
        <hr style="margin: 0px !important;">
        <% End If %>
        <div class="ibox-content forum-container" style="padding-top: 10px !important; padding-left: 15px!important; padding-right: 15px!important;">
            <% If Not IsNothing(ViewData.Item("Books")) Then %>
            <div class="pull-right forum-desc">
                <strong>Total de books: <%=ViewData.Item("Books").Count%></strong>
            </div>
            <h3>Acesso ao Book</h3>
            <%
                For i = 0 To (ViewData.Item("Books").Count - 1) Step 1
                    Dim vAno, vQtdMes, vQtdItem, vQtdValor

                    vAno      = ViewData.Item("Books").GetValue("ANO",i)
                    vQtdMes   = ViewData.Item("Books").GetValue("QTD_MES",i)
                    vQtdItem  = ViewData.Item("Books").GetValue("QTD_ITEM",i)
                    vQtdValor = ViewData.Item("Books").GetValue("QTD_VALOR",i)									

            %>
            <div class="forum-item" style="padding-bottom: 0px; padding-top: 5px;">
                <div class="row">
                    <div class="col-md-12 forum-content">
                        <div class="forum-icon">
                            <i class="fa fa-book"></i>
                        </div>
                        <% If Not ViewData.Item("Item") = "" Then %>
                        <a href="?controller=Abas&action=List&unidade=<%=ViewData.Item("CdUnidade")%>&ano=<%=vAno%>&item=<%=ViewData.Item("Item")%>" class="forum-item-title" style="margin-top: -10px; padding-top: 20px; padding-bottom: 15px;">Ano de <%=vAno%></a>
                        <% Else %>
                        <a href="?controller=Abas&action=IndexMsg&unidade=<%=ViewData.Item("CdUnidade")%>&ano=<%=vAno%>" class="forum-item-title" style="margin-top: -10px; padding-top: 20px; padding-bottom: 15px;">Ano de <%=vAno%></a>
                        <% End If %>
                    </div>
                    <!--<div class="col-md-1 forum-info">
                        <span class="views-number"><%=vQtdMes%>
                        </span>
                        <div>
                            <small>Meses</small>
                        </div>
                    </div>
                    <div class="col-md-1 forum-info">
                        <span class="views-number"><%=vQtdItem%>
                        </span>
                        <div>
                            <small>Itens</small>
                        </div>
                    </div>
                    <div class="col-md-1 forum-info">
                        <span class="views-number"><%=vQtdValor%>
                        </span>
                        <div>
                            <small>Valores</small>
                        </div>
                    </div>-->
                </div>
            </div>
            <% 
                    Response.Flush
                Next
            Else 
            %>
            <div class="forum-title" style="margin-top: 0px; margin-bottom: 25px;">
                <div class="pull-right forum-desc">
                    <strong>Total de books: 0</strong>
                </div>
            </div>
            <div class="forum-item">
                <div class="row">
                    <h4 style="text-align: center;">Nenhum book encontrado</h4>
                </div>
            </div>
            <% 
            End If 
            %>
        </div>
    </div>
</div>
