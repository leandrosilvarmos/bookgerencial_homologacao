<div class="container">
    <div class="row justify-content-center">
        <div class="col-12 col-sm-12 col-lg-12">
            <!-- Section Heading -->
            <div class="section_heading text-center" style="margin-bottom: 50px;">
                <img class="img-responsive" style="max-width: 100px !important; float: left; margin-top: -10px;" src="Content/img/<%=ViewData.Item("UnidadeLogo")%>" />
                <h3><%=ViewData.Item("Unidade")%></h3>
                <div class="line"></div>
            </div>
        </div>
    </div>

    <div class="row">
        <% If Not IsNothing(ViewData.Item("UnidadeCertificacoes")) Then %>
        <div class="col-12 col-sm-6 col-lg-3">
            <div class="benifits_text wow fadeInUp">
                <h5 style="color: #0e6275;">Acreditações</h5>
                <p class="<%=ViewData.Item("UnidadeCertificacoes")%>">
                    <label></label>
                    <label></label>
                </p>
            </div>
        </div>
        <% End If %>

        <% If Not IsNothing(ViewData.Item("DsMissao")) Then %>
        <div class="col-12 col-sm-6 col-lg-3">
            <div class="single_benifits d-flex wow fadeInUp">
                <div class="benifits_text">
                    <h5 style="color: #0e6275;">Missão</h5>
                    <p style="color: #000000;"><%=ViewData.Item("DsMissao")%></p>
                </div>
            </div>
        </div>
        <% End If %>

        <% If Not IsNothing(ViewData.Item("DsVisao")) Then %>
        <div class="col-12 col-sm-6 col-lg-3">
            <div class="single_benifits d-flex wow fadeInUp">
                <div class="benifits_text">
                    <h5 style="color: #0e6275;">Visão</h5>
                    <p style="color: #000000;"><%=ViewData.Item("DsVisao")%></p>
                </div>
            </div>
        </div>
        <% End If %>

        <% If Not IsNothing(ViewData.Item("DsValores")) Then %>
        <div class="col-12 col-sm-6 col-lg-3">
            <div class="single_benifits d-flex wow fadeInUp">
                <div class="benifits_text">
                    <h5 style="color: #0e6275;">Valores</h5>
                    <p style="color: #000000;"><%=ViewData.Item("DsValores")%></p>
                </div>
            </div>
        </div>
        <% End If %>
    </div>

    <div class="col-lg-12" style="padding: 0px;">
        <div class="float-e-margins">
            <% If Not Partial Then %>
            <div class="ibox-title" style="min-height: 20px; height: 45px;">
                <% If Not IsNothing(ViewData.Item("MapaEstrategico")) Then %>
                <a href="Content/img/<%=ViewData.Item("MapaEstrategico")%>" target="_blank">
                    <h5 style="color: #4879af;">Acesso ao Mapa Estratégico</h5>
                    &nbsp;</a>
                <% End If %>
                <div class="ibox-tools" style="width: 150px; float: right; text-align: right; margin-top: -30px;">
                    <a href="?action=IndexMsg&unidade=0&ancora=book">
                        <i class="fa fa-reply"></i>&nbsp;Voltar
                    </a>
                </div>
            </div>
            <hr style="margin: 0px !important;">
            <% End If %>
            <div class="ibox-content forum-container" style="padding-top: 10px !important; padding-left: 15px!important; padding-right: 15px!important;">
                <% If Not IsNothing(ViewData.Item("Books")) Then %>
                <div class="pull-right forum-desc">
                    <strong style="font-size: 14px;">Total de books: <%=ViewData.Item("Books").Count%></strong>
                </div>
                <h6 style="color: #636363;">Acesso ao Book</h6>
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
</div>
