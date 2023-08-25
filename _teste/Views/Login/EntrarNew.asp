<!DOCTYPE html>
<html lang="pt-br" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta name="language" content="PT-BR" />

    <title><%=iif(IsTest, "(Teste) ", "")%>Login - <%=Title%></title>

    <link rel="shortcut icon" href="Content/img/favicon.ico" />

    <!-- Style CSS -->
    <link rel="stylesheet" href="Content/css/layout_home/style.css" />

    <style type="text/css">
        @media print {
            a[href]:after {
                content: none !important;
            }

            body {
                -webkit-print-color-adjust: exact !important;
            }
        }
    </style>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="Content/js/html5shiv.min.js"></script>
      <script src="Content/js/respond.min.js"></script>
    <![endif]-->
    <!--[if lte IE 8]>
        <style>
            input {
                font-family: Arial;
            }
        </style>
    <![endif]-->
</head>
<body>
    <!-- Preloader -->
    <div id="preloader">
        <div class="apland-load"></div>
    </div>

    <!-- Register Area -->
    <div class="register-area d-flex">
        <div class="register-content-wrapper d-flex align-items-center" style="background-color: #e8f2f5;">
            <div class="register-content">
                <!-- Logo -->
                <a href="index.html" class="logo">
                    <img src="Content/img/logo_gerencial.png" alt="" /></a>

                <h3 style="color: #2e5b73;"><%=Title%><%=iif(IsTest, "&nbsp;<small style='font-size: 12px;'>(Teste)</small>", "")%></h3>
                <p>Digite seus dados de acesso:</p>

                <!-- Register Form -->
                <div class="register-form">
                    <form action="?controller=Login&action=EntrarPost&partial=true" id="EntrarPost" method="post" accept-charset="ISO-8859-1">
                        <% If Not IsEmpty(ViewData.Item("Erro")) Then %>
                        <div class="alert alert-<%=ViewData.Item("Alert")%>" style="font-size: 13px;">
                            <%=Texts.Mensagem(ViewData.Item("Erro"))%>
                        </div>
                        <% End If %>
                        <div class="form-group">
                            <i class="icofont-ui-user"></i>
                            <input id="DsLogin" name="DsLogin" type="text" class="form-control" placeholder="Login" required="required" />
                        </div>
                        <div class="form-group">
                            <i class="icofont-lock"></i>
                            <input id="DsSenha" name="DsSenha" type="password" class="form-control" placeholder="Senha" required="required" />
                        </div>

                        <button type="submit" class="btn apland-btn w-100"><i class="icofont-sign-in"></i>&nbsp;Login</button>
                    </form>
                </div>

                <!-- Footer Copwrite Area -->
                <div class="footer_bottom">
                    <p><strong>Book Gerencial</strong>&nbsp;&copy;&nbsp;Copyright 2019</p>
                </div>
            </div>
        </div>

        <!-- Register Side Content -->
        <div class="register-side-content bg-img" style="background-image: url(Content/img/bg-img/bg_login.jpg); background-color: #e8f2f5;"></div>
    </div>

    <!-- jQuery(necessary for all JavaScript plugins) -->
    <script src="Content/js/layout_home/jquery.min.js"></script>
    <script src="Content/js/layout_home/popper.min.js"></script>
    <script src="Content/js/layout_home/bootstrap.min.js"></script>
    <script src="Content/js/layout_home/owl.carousel.min.js"></script>
    <script src="Content/js/layout_home/waypoints.min.js"></script>
    <script src="Content/js/layout_home/jquery.easing.min.js"></script>
    <script src="Content/js/layout_home/default/classy-nav.min.js"></script>
    <script src="Content/js/layout_home/default/sticky.js"></script>
    <script src="Content/js/layout_home/default/mail.js"></script>
    <script src="Content/js/layout_home/default/scrollup.min.js"></script>
    <script src="Content/js/layout_home/default/one-page-nav.js"></script>
    <script src="Content/js/layout_home/jarallax.min.js"></script>
    <script src="Content/js/layout_home/jarallax-video.min.js"></script>
    <script src="Content/js/layout_home/jquery.counterup.min.js"></script>
    <script src="Content/js/layout_home/jquery.countdown.min.js"></script>
    <script src="Content/js/layout_home/jquery.magnific-popup.min.js"></script>
    <script src="Content/js/layout_home/wow.min.js"></script>
    <!-- Active js -->
    <script src="Content/js/layout_home//default/active.js"></script>

    <%RederScripts()%>
</body>
</html>
