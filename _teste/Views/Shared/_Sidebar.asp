<nav class="navbar-default navbar-static-side" role="navigation" style="margin-top: 50px;">
    <div class="sidebar-collapse">
        <ul class="nav metismenu" id="side-menu">
            <li class="<%=IsLinkActive("Home", "Index")%>" style="border-top: 1px solid #2f4050 !important;">
                <a href="<%=Html.ActionUrl("Home","Index", "")%>"><i class="fa fa-home"></i><span class="nav-label">Início</span></a>
            </li>

            <li class="<%=IsLinkActive("Dashboard", "Index")%>" style="border-top: 1px solid #2f4050 !important;">
                <a href="<%=Html.ActionUrl("Dashboard","Index", "")%>"><i class="fa fa-tachometer-alt"></i><span class="nav-label">Dashboard</span></a>
            </li>
            <%=GetNavigationItens()%>
        </ul>
    </div>
</nav>
