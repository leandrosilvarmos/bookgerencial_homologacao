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

    <% If Not IsPrint Then %>

    <style type="text/css">
        .nav .open i.fa {
            color: #676a6c !important;
        }

        .nav.navbar-top-links .dropdown-alerts a {
            padding: 5px !important;
        }

        .navbar-top-links .dropdown-menu li.dropdown-divider {
            height: 1px;
            background-color: #f3f3f4;
        }

        .nav.navbar-top-links .dropdown-alerts a span.label {
            padding-bottom: 2px !important;
            padding-top: 2px !important;
            padding-left: 3px !important;
            padding-right: 3px !important;
            float: right !important;
            margin-top: 6px !important;
        }

        .nav.navbar-top-links .dropdown-menu > li > a {
            color: #262626 !important;
        }
    </style>

    <% Include("Bundles/GlobalCSS.asp") %>

    <% Else %>

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

    <% End If %>

    <%RederStyles()%>

    <% If Not IsPrint Then %>
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
    <% End If %>
</head>
<body class="<%=iif(UCase(Controller) = UCase("Abas") And UCase(Action) = UCase("List"), "mini-navbar", "")%> md-skin fixed-nav">
    <% If Not IsPrint Then %>
    <div id="wrapper" <%=iif(UCase(Controller) = UCase("Abas") And UCase(Action) = UCase("List"), "style='height: 100%; position:absolute'", "")%>>
        <%Include("Views/Shared/Book/_Sidebar.asp")%>
        <div class="row border-bottom">
            <%Include("Views/Shared/Book/_Header.asp")%>
        </div>
        <div <%=iif(UCase(Controller) = UCase("Abas") And UCase(Action) = UCase("List"), "", "id='page-wrapper'")%> class="gray-bg" style="margin-top: 49px; <%=iif(UCase(Controller) = UCase("Abas") And UCase(Action) = UCase("List"), "min-height: 100% !important;", "margin-left: 0px !important;")%>">
            <div class="row wrapper border-bottom white-bg page-heading" style="border-left: 1px solid #f3f3f4; padding-bottom: 0px;">
            </div>

            <div id="preloader" class="prel">
                <div class="sk-spinner sk-spinner-circle">
                    <div class="sk-circle1 sk-circle"></div>
                    <div class="sk-circle2 sk-circle"></div>
                    <div class="sk-circle3 sk-circle"></div>
                    <div class="sk-circle4 sk-circle"></div>
                    <div class="sk-circle5 sk-circle"></div>
                    <div class="sk-circle6 sk-circle"></div>
                    <div class="sk-circle7 sk-circle"></div>
                    <div class="sk-circle8 sk-circle"></div>
                    <div class="sk-circle9 sk-circle"></div>
                    <div class="sk-circle10 sk-circle"></div>
                    <div class="sk-circle11 sk-circle"></div>
                    <div class="sk-circle12 sk-circle"></div>
                </div>
            </div>
            <div class="wrapper wrapper-content animated fadeIn" style="<%=iif(UCase(Controller) = UCase("Abas") And UCase(Action) = UCase("List"), "position: fixed; max-width: 100%; left: 35px; right: 0px;", "")%>">
                <%RenderBody()%>
            </div>
        </div>
        <div class="footer fixed">
            <!--<div class="scroll-sidebar" style="height: 27px; width: 35px; font-size: 16px; color: #dcdcdc; position: absolute; left: 0; top: -27px; background-color: #293846; text-align: center; border-top: 2px solid #334f69;">
                <i class="fas fa-caret-up"></i>&nbsp;
                <i class="fas fa-caret-down"></i>
            </div>-->
            <div class="pull-right hidden-xs">
                Todos os direitos reservados
            </div>
            <div>
                <strong>Book Gerencial</strong>&nbsp;&copy;&nbsp;Copyright 2020
            </div>
        </div>
    </div>

    <%Include("/_mvc/Bundles/GlobalJS.asp")%>

    <%Include("Content/js/controllers/GlobalJS.asp")%>

    <% 
       Else 
            RenderBody() 

    %>
    <script type="text/javascript">
        window.onload = function () {
            window.print();
        }
    </script>
    <%
       End If
    %>

    <%RederScripts()%>

    <% If UCase(Controller) = UCase("Abas") And UCase(Action) = UCase("List") Then %>
    <script type="text/javascript">
        $(function () {
            $("#side-menu li ul").removeClass("in");

            $("#side-menu li").on('click', function (e) {
                $(this).find("ul").removeClass("collapsing");
                $(this).removeClass("active");

                window.location = $(this).contents().find("a").attr("href");
            });
        })
    </script>
    <% End If %>
</body>
</html>
