<div class="main_header_area">
    <div class="classy-nav-container breakpoint-off">
        <div class="container">
            <nav class="classy-navbar justify-content-between" id="aplandNav">

                <!-- Logo -->
                <a class="nav-brand" href="?" style="font-weight: 700; color: #1c8fab">Book Gerencial<%=iif(IsTest, "&nbsp;<small style='font-size: 12px;'>(Teste)</small>", "")%></a>

                <!-- Navbar Toggler -->
                <div class="classy-navbar-toggler">
                    <span class="navbarToggler"><span></span><span></span><span></span></span>
                </div>

                <!-- Menu -->
                <div class="classy-menu">
                    <!-- close btn -->
                    <div class="classycloseIcon">
                        <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                    </div>

                    <!-- Nav Start -->
                    <div class="classynav">
                        <ul id="corenav">
                            <li><a href="?">Início</a></li>
                            <li><a href="#" title="MAG - Manual de Apoio ao Gestor">MAG</a>
                                <ul class="dropdown">
                                    <li>
                                        <a title="MAG - Manual de Apoio ao Gestor" target="_blank" href="Content/pdf/manual_apoio_gestor.pdf">
                                            <img src="Content/img/icone_mag.png" style="border: solid 1px #ddd;">
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a id="notifyTotal" href="#">
                                    <i class="fa fa-lg fa-bell"></i><span class="badge badge-danger label-count" style="position: relative; top: -8px; left: -8px;"></span>
                                </a>
                                <ul class="dropdown" style="width: 290px;">
                                    <li id="notifySemPreenchimento" style="display: none;">
                                        <a href="?controller=Dashboard&action=IndexMsg&analise=1">Análises Sem Preenchimento&nbsp;&nbsp;<span class="badge badge-danger label-count" style="float: right;"></span></a>
                                    </li>
                                    <li id="notifySemAprovacao" style="display: none;">
                                        <a href="?controller=Dashboard&action=IndexMsg&analise=2">Análises Sem Aprovação&nbsp;&nbsp;<span class="badge badge-danger label-count" style="float: right;"></span></a>
                                    </li>
                                    <li id="notifyRejeitada" style="display: none;">
                                        <a href="?controller=Dashboard&action=IndexMsg&analise=3">Análises Rejeitadas&nbsp;&nbsp;<span class="badge badge-danger label-count" style="float: right;"></span></a>
                                    </li>
                                </ul>
                            </li>
                            <li><a href="#"><i class="fa fa-lg fa-user"></i>&nbsp;&nbsp;<%If Not IsNothing(Session("NmUsuario")) Then Response.Write(Split(Session("NmUsuario")," ")(0)) End If%></a>
                                <ul class="dropdown">
                                    <li><a href="?action=IndexMsg&item=books&ancora=book"><i class="fa fa-lg fa-book"></i>&nbsp;&nbsp;Books</a></li>
                                    <li><a href="?controller=Dashboard"><i class="fa fa-lg fa-edit"></i>&nbsp;&nbsp;Cadastros</a></li>
                                    <li><a href="content/pdf/manual_book_gerencial.pdf"><i class="fa fa-lg fa-question-circle"></i>&nbsp;&nbsp;Ajuda</a></li>
                                    <li><a href="?controller=Login&action=AlterarSenha"><i class="fa fa-key"></i>&nbsp;&nbsp;Alterar Senha</a></li>
                                    <li><a href="?controller=Login&action=Sair"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;Sair</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!-- Nav End -->
                </div>
            </nav>
        </div>
    </div>
</div>
