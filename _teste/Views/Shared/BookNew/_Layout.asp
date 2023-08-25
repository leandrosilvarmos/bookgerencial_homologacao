<% Const withTemplate = True %>
<!DOCTYPE html>
<html lang="pt-br" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta name="language" content="PT-BR" />

    <title><%=iif(IsTest, "(Teste) ", "")&Title%></title>

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

    <%RederStyles()%>

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

    <!-- ***** Header Start ***** -->
    <header class="header_area">
        <%Include("Views/Shared/BookNew/_Header.asp")%>
    </header>
    <!-- ***** Header End ***** -->

    <!-- ***** Welcome Area Start ***** -->
    <section class="welcome_area" id="home">
        <div class="home_barisal" style="background-image: url(Content/img/bg-img/hero-back.png);"></div>

        <div class="container h-100">
            <div class="row h-100 justify-content-between align-items-center">
                <div class="col-12 col-md-6">
                    <!-- Content -->
                    <div class="welcome_text_area section_heading">
                        <img src="Content/img/logo_gerencial_titulos.png" alt="" />
                        <a href="?action=IndexMsg&item=books&ancora=book" class="btn apland-btn mt-30"><i class="fa fa-lg fa-book"></i>&nbsp;&nbsp;Books</a>
                        <a href="?controller=Dashboard" class="btn apland-btn btn-2 mt-30 ml-2" style="background-color: #ffffff;"><i class="fa fa-lg fa-edit"></i>&nbsp;&nbsp;Cadastros</a>
                    </div>
                </div>
                <div class="col-12 col-sm-10 col-md-6">
                    <div class="welcome_area_thumb text-center">
                        <img src="Content/img/logo_gerencial.png" alt="" />
                    </div>
                </div>
            </div>
        </div>

    </section>
    <!-- ***** Welcome Area End ***** -->

    <%RenderBody()%>

    <section class="faq_area section_padding_100" id="sobre">
        <div class="container">
            <div class="row">
                <!-- Single FAQ Area -->
                <div class="col-12 col-sm-6">
                    <div class="single_faq_area">
                        <h6>Fontes/Sistemas:</h6>
                        <p>SALUX - TASY - TOTVS - Alphalinc - NCI/KPIH - Gestão Saúde - WEB</p>
                    </div>
                </div>

                <!-- Single FAQ Area -->
                <div class="col-12 col-sm-6">
                    <div class="single_faq_area">
                        <h6>Executoras Financeiro:</h6>
                        <p>Ana Paula Ramos / Sueli Dine</p>
                    </div>
                </div>

                <!-- Single FAQ Area -->
                <div class="col-12 col-sm-6">
                    <div class="single_faq_area">
                        <h6>Implantação e Migração de Dados T.I:</h6>
                        <p>Rodrigo Bonci</p>
                    </div>
                </div>

                <!-- Single FAQ Area -->
                <div class="col-12 col-sm-6">
                    <div class="single_faq_area">
                        <h6>Líder Adm Financeiro:</h6>
                        <p>Heloísa Rígoli Pedersolli</p>
                    </div>
                </div>

                <!-- Single FAQ Area -->
                <div class="col-12 col-sm-6">
                    <div class="single_faq_area">
                        <h6>Revisão e Aprovação:</h6>
                        <p>Márcio Aparecido da Cruz</p>
                    </div>
                </div>

                <!-- Single FAQ Area -->
                <div class="col-12 col-sm-6">
                    <div class="single_faq_area">
                        <h6>Aprovação Final:</h6>
                        <p>Dra. Maria Fernanda Lopes da Silva</p>
                    </div>
                </div>

                <!-- Single FAQ Area -->
                <div class="col-12 col-sm-6">
                    <div class="single_faq_area">
                        <h6>Desenvolvedor:</h6>
                        <p>Wesley Ormundo</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ***** Footer Area Start ***** -->
    <footer class="footer_area">
        <div class="footer_bottom_area">
            <div class="container">
                <div class="row">
                    <!-- Footer Social Area -->
                    <div class="col-12">
                        <div class="footer_social_area">
                        </div>
                        <!-- Footer Menu Area -->
                        <div class="footer_menu">
                            <ul>
                                <li><a href="?">Início</a></li>
                                <li><a href="Content/pdf/manual_apoio_gestor.pdf" title="MAG - Manual de Apoio ao Gestor">MAG</a></li>
                                <li><a href="?action=IndexMsg&item=books&ancora=book">Books</a></li>
                                <li><a href="?controller=Dashboard">Cadastros</a></li>
                                <li><a href="content/pdf/manual_book_gerencial.pdf">Ajuda</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer_copywrite_area" style="padding: 30px 0 30px 0;">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <!-- Footer Copwrite Area -->
                        <div class="footer_bottom text-center">
                            <p><strong>Book Gerencial</strong>&nbsp;&copy;&nbsp;Copyright 2019</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- ***** Footer Area End ***** -->

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

    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                url: "?action=AnalisePendencias&partial=true",
                type: "Get",
                dataType: "json",
                success: function (Data) {
                    if (Data !== undefined) {
                        if (Data[0].TOTAL > 0) {
                            $("#notifyTotal .label-count").html(Data[0].TOTAL);
                            //$("#notifyTotal .label-count").addClass("show");
                        }

                        if (Data[0].SEM_PREENCHIMENTO > 0) {
                            $("#notifySemPreenchimento .label-count").html(Data[0].SEM_PREENCHIMENTO);
                            $("#notifySemPreenchimento").addClass("show");
                        }

                        if (Data[0].SEM_APROVACAO > 0) {
                            $("#notifySemAprovacao .label-count").html(Data[0].SEM_APROVACAO);
                            $("#notifySemAprovacao").addClass("show");
                        }

                        if (Data[0].REJEITADAS > 0) {
                            $("#notifyRejeitada .label-count").html(Data[0].REJEITADAS);
                            $("#notifyRejeitada").addClass("show");
                        }
                    }
                }
            });
        });

        $(window).load(function () {
            var vId = '<%=Request("ancora")%>';

            if (vId !== undefined && vId != '') {
                $('html, body').animate({
                    scrollTop:  $("#" + vId).offset().top
                }, 100);
            }
        });
    </script>

</body>
</html>
