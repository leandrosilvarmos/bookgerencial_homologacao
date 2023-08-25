<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav metismenu" id="side-menu">
            <li class="nav-header">
                <div class="dropdown profile-element">
                    <span>
                        <img alt="image" src="/_mvc/Content/img/logo_branco_128x128.png" style="margin-left: 30px; width: 100px;" />
                    </span>
                    <%=iif(IsTest, "<small style='color: #d0d0d0; font-weight: 600; font-size: 13px;'>(Teste)</small>", "")%>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <span class="clear">
                            <span class="block m-t-xs">
                                <strong class="font-bold"><%=Session("NmUsuario")%></strong>
                            </span><span class="text-muted text-xs block">Minha conta<b class="caret"></b></span>
                        </span>
                    </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <!--<li><a href="#">Perfil</a></li>
                        <li class="divider"></li>-->
                        <li><a href="<%=Html.ActionUrl("Login","Sair", "")%>">Sair</a></li>
                    </ul>
                </div>
                <div class="logo-element">
                    HESAP
                    <%=iif(IsTest, "<small style='font-size: 11px;'>(Teste)</small>", "")%>
                </div>
            </li>

            <li class="<%=IsLinkActive("Home", "Index")%>">
                <a href="<%=Html.ActionUrl("Home","Index", "")%>"><i class="fa fa-home"></i><span class="nav-label">Início</span></a>
            </li>

            <%=GetNavigationItens()%>
        </ul>
    </div>
</nav>
