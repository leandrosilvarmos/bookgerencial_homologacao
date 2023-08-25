<nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0; background-color: #2b8895 !important; height: 50px;">
    <div class="navbar-header">
        <a class="navbar-minimalize minimalize-styl-2" href="#" style="margin-top: 11px !important; color: #ffffff !important;"><i class="fa fa-bars"></i></a>
        <div class="navbar-brand">
            <a href="?" style="color: #ffffff !important;"><strong>BOOK GERENCIAL</strong><%=iif(IsTest, "&nbsp;<small style='font-size: 11px;'>(Teste)</small>", "")%></a>
        </div>
    </div>
    <ul class="nav navbar-top-links navbar-right">
        <li>
            <span class="m-r-sm text-muted welcome-message"></span>
        </li>
        <li class="dropdown">
            <a id="notifyTotal" class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                <i class="fa fa-lg fa-bell" style="color: #ffffff;"></i><span class="label label-danger label-count" style="display: none; padding-bottom: 1px; padding-top: 1px; padding-left: 3px; padding-right: 3px;"></span>
            </a>
            <ul class="dropdown-menu dropdown-alerts" style="width: 240px;">
                <li id="notifySemPreenchimento" style="display: none;">
                    <a href="?controller=Dashboard&action=IndexMsg&analise=1" class="dropdown-item">
                        <div>
                            <!--<span class="fas fa-lg fa-pencil-square aprovacao-" data-original-title="" title=""></span>&nbsp;&nbsp;-->
                            <span data-original-title="" title="">Análises Sem Preenchimento</span>&nbsp;&nbsp;
                                <span class="label label-danger label-count"></span>
                        </div>
                    </a>
                </li>
                <!--<li class="dropdown-divider"></li>-->
                <li id="notifySemAprovacao" style="display: none;">
                    <a href="?controller=Dashboard&action=IndexMsg&analise=2" class="dropdown-item">
                        <div>
                            <!--<span class="fas fa-lg fa-pencil-square aprovacao-P" data-original-title="" title=""></span>&nbsp;&nbsp;-->
                            <span data-original-title="" title="">Análises Sem Aprovação</span>&nbsp;&nbsp;
                                <span class="label label-danger label-count"></span>
                        </div>
                    </a>
                </li>
                <!--<li class="dropdown-divider"></li>-->
                <li id="notifyRejeitada" style="display: none;">
                    <a href="?controller=Dashboard&action=IndexMsg&analise=3" class="dropdown-item">
                        <div>
                            <!--<span class="fas fa-lg fa-pencil-square aprovacao-R" data-original-title="" title=""></span>&nbsp;&nbsp;-->
                            <span data-original-title="" title="">Análises Rejeitadas</span>&nbsp;&nbsp;
                                <span class="label label-danger label-count"></span>
                        </div>
                    </a>
                </li>
                <!--<li class="dropdown-divider"></li>
                <li>
                    <div class="text-center link-block">
                        <a href="notifications.html" class="dropdown-item">
                            <strong>See All Alerts</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </div>
                </li>-->
            </ul>
        </li>
        <li class="dropdown">
            <a class="dropdown-toggle count-info nav-item-user" data-toggle="dropdown" href="#" aria-expanded="false">
                <i class="fa fa-lg fa-user" style="margin-right: 0px;"></i>
                <span class="hidden-xs">&nbsp;&nbsp;
                <% 
                   If Not IsNothing(Session("NmUsuario")) Then
                       Response.Write(Split(Session("NmUsuario")," ")(0))
                   End If
                %>
                &nbsp;</span><b class="caret"></b>
            </a>
            <ul class="dropdown-menu dropdown-messages" style="width: 160px;">
                <li style="margin: 5px 0 5px 0;">
                    <div class="link-block nav-item-sair">
                        <a href="?">
                            <i class="fas fa-home"></i>&nbsp;&nbsp;<strong>Início</strong>
                        </a>
                    </div>
                </li>
                <li style="margin: 5px 0 5px 0;">
                    <div class="link-block nav-item-sair">
                        <a href="?action=IndexMsg&item=books">
                            <i class="fas fa-book"></i>&nbsp;&nbsp;<strong>Books</strong>
                        </a>
                    </div>
                </li>
                <li style="margin: 5px 0 5px 0;">
                    <div class="link-block nav-item-sair">
                        <a href="?action=IndexMsg&item=cadastros">
                            <i class="fas fa-edit"></i>&nbsp;&nbsp;<strong>Cadastros</strong>
                        </a>
                    </div>
                </li>
                <li class="divider"></li>
                <li>
                    <div class="link-block nav-item-sair">
                        <a href="content/pdf/manual_book_gerencial.pdf" target="_blank">
                            <i class="fa fa-question-circle"></i>&nbsp;&nbsp;<strong>Ajuda</strong>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="link-block nav-item-sair">
                        <a href="<%=Html.ActionUrl("Login","AlterarSenha", "")%>">
                            <i class="fa fa-key"></i>&nbsp;&nbsp;<strong>Alterar Senha</strong>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="link-block nav-item-sair">
                        <a href="<%=Html.ActionUrl("Login","Sair", "")%>">
                            <i class="fa fa-sign-out-alt"></i>&nbsp;&nbsp;<strong>Sair</strong>
                        </a>
                    </div>
                </li>
            </ul>
        </li>
    </ul>
</nav>
