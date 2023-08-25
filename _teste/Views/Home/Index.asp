<div class="row">
    <div class="col-lg-12">
        <div class="tabs-container tabs-home" style="margin-bottom: 25px;">
            <div class="tabs-left">
                <ul class="nav nav-tabs hidden-xs">
                    <li class="li-tab <%=iif(IsNothing(ViewData.Item("CdUnidade")) And IsNothing(ViewData.Item("Item")), "active", "")%>"><a data-toggle="tab" href="#tab-home" title="Início"><i class="fa fa-lg fa-home"></i><span>&nbsp;Início</span></a></li>
                    <li id="li-unidade" class="li-tab <%=iif((Not IsNothing(ViewData.Item("CdUnidade"))) Or lcase(CStr(ViewData.Item("Item"))) = "books", "active", "")%>"><a data-toggle="tab" href="#tab-book" title="Books"><i class="fa fa-lg fa-book"></i><span>&nbsp;Books</span></a></li>
                    <li id="li-cadastros" class="li-tab <%=iif(lcase(CStr(ViewData.Item("Item"))) = "cadastros", "active", "")%>"><a href="?controller=Dashboard" title="Cadastros"><i class="fa fa-edit"></i><span>&nbsp;Cadastros</span></a></li>
                    <li class="li-tab"><a data-toggle="tab" href="#tab-sobre" title="Sobre o Projeto"><i class="fa fa-lg fa-info-circle"></i><span>&nbsp;Sobre o Projeto</span></a></li>
                </ul>
                <a class="hidden-xs" title="MAG - Manual de Apoio ao Gestor" target="_blank" href="Content/pdf/manual_apoio_gestor.pdf">
                    <img src="Content/img/icone_mag.png" style="position: absolute; top: 220px; left: 29px; border: solid 1px #ddd;" />
                </a>
                <div class="tab-content">
                    <div id="tab-home" class="tab-pane <%=iif(IsNothing(ViewData.Item("CdUnidade")) And IsNothing(ViewData.Item("Item")), "active", "")%>">
                        <div class="panel-body animated fadeIn">
                            <div class="col-lg-12">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <img id="imgLogoInicial" src="Content/img/capa_book_gerencial2.jpg" class="img-responsive" style="margin: auto;" />
                                    </div>
                                </div>

                                <div class="hr-line-dashed"></div>

                                <div class="row">
                                    <div class="col-md-2 hidden-sm">
                                    </div>
                                    <div class="col-md-4 col-sm-6 col-xs-12" style="padding-top: 5px;">
                                        <a id="btnUnidades" class="btn btn-block btn-outline btn-azul-seconci" data-toggle="tab" href="#tab-book"><i class="fa fa-book"></i>&nbsp;Books</a>
                                    </div>
                                    <div class="col-md-4 col-sm-6 col-xs-12" style="padding-top: 5px;">
                                        <a id="btnCadastros" class="btn btn-block btn-outline btn-azul-seconci" href="?controller=Dashboard"><i class="fa fa-edit"></i>&nbsp;Cadastros</a>
                                    </div>
                                    <div class="col-md-2 hidden-sm"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="tab-book" class="tab-pane <%=iif((Not IsNothing(ViewData.Item("CdUnidade"))) Or lcase(CStr(ViewData.Item("Item"))) = "books", "active", "")%>">
                        <div class="panel-body animated fadeIn">
                            <% 
                               If Not IsNothing(ViewData.Item("CdUnidade")) And ViewData.Item("CdUnidade") <> 0 Then
                                    View "Book"
                               Else
                            %>
                            <div class="row" style="padding-left: 30px;">
                                <h4>Selecione uma unidade:</h4>
                            </div>
                            <%
                                    View "Unidades"
                               End If 
                            %>
                        </div>
                    </div>
                    <div id="tab-cadastros" class="tab-pane <%=iif(lcase(CStr(ViewData.Item("Item"))) = "cadastros", "active", "")%>">
                        <div class="panel-body animated fadeIn">
                            <div class="sidebar-collapse">
                                <ul class="nav metismenu" id="cadastros-menu">
                                    <li>
                                        <a href="<%=Html.ActionUrl("Dashboard","Index", "")%>"><i class="fa fa-tachometer-alt"></i><span class="nav-label">Dashboard</span></a>
                                    </li>
                                    <%=GetNavigationItens()%>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div id="tab-sobre" class="tab-pane">
                        <div class="panel-body animated fadeIn">
                            <br/>
                            <br/>
                            <br/>
                            <div>
                                <div class="col-xs-12">
                                    <dl class="dl-horizontal">
                                        <dt>Fontes/Sistemas:</dt>
                                        <dd>SALUX - TASY - TOTVS - Alphalinc - NCI/KPIH - Gestão Saúde - WEB</dd>

                                        <dt>Executoras Financeiro:</dt>
                                        <dd>Ana Paula Ramos / Sueli Dine</dd>

                                        <dt>Implantação e Migração de Dados T.I:</dt>
                                        <dd>Rodrigo Bonci</dd>

                                        <dt>Desenvolvedor:</dt>
                                        <dd>Wesley Ormundo</dd>

                                        <dt>Líder Adm Financeiro:</dt>
                                        <dd>Heloísa Rígoli Pedersolli / Cristina Ortiz Hohmuth</dd>

                                        <dt>Revisão e Aprovação:</dt>
                                        <dd>Márcio Aparecido da Cruz</dd>

                                        <dt>Aprovação Final:</dt>
                                        <dd>Dra. Maria Fernanda Lopes da Silva</dd>
                                    </dl>
                                </div>
                            </div>
                            <div>
                                <div class="col-xs-12" style="text-align: right;">
                                    <small>VERSÃO</small>
                                    <br />
                                    <small style="font-size: 12px;">1&nbsp;</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
