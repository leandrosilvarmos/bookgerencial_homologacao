<nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i></a>
    </div>
    <ul class="nav navbar-top-links navbar-right">
        <li>
            <span class="m-r-sm text-muted welcome-message"></span>
        </li>

        <!--<li class="dropdown">
            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                <i class="fa fa-bell"></i>
                <span class="label label-primary">0</span>
            </a>
            <ul class="dropdown-menu dropdown-alerts">
                <li>
                    <a href="mailbox.html">
                        <div>
                            <i class="fa fa-envelope fa-fw"></i> You have 16 messages
                            <span class="pull-right text-muted small">4 minutes ago</span>
                        </div>
                    </a>
                </li>
                <li class="divider"></li>
            </ul>
        </li>-->

        <li>
            <a href="<%=Html.ActionUrl("Login","Sair", "")%>">
                <i class="fa fa-sign-out"></i>Sair
            </a>
        </li>
    </ul>

</nav>
