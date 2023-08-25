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

    <%Include("/_mvc/Bundles/GlobalCSS.asp")%>

    <link href="/_mvc/Content/font-awesome/5.0.13/css/fontawesome-all.css" rel="stylesheet" />

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

    <style type="text/css">
        .navbar-brand {
            color: #ffffff !important;
        }

        .nav > li.active {
            border-left-color: #2b8895;
        }

        .pace .pace-progress {
            background: #006371;
        }

        .sk-spinner-circle .sk-circle:before {
            background-color: #2b8895 !important;
        }

        .fa-mail-reply:before, .fa-reply:before {
            content: "\f112" !important;
        }

        a.fa.fa-pencil-alt {
            color: #08652f;
        }

            a.fa.fa-pencil-alt:hover {
                color: #20854a;
            }

            a.fa.fa-pencil-alt:active {
                color: #03421d;
            }

        a.fa-lg {
            font-size: 1.1em;
        }

        .navbar-top-links li a {
            padding: 15px 10px !important;
        }

        .nav-item-user {
            color: #ffffff !important;
        }

        .nav-item-sair {
            padding: 5px;
        }

            .nav-item-sair a {
                color: #676a6c !important;
            }

        .nav .open > a,
        .nav .open > a:hover,
        .nav .open > a:focus {
            color: #676a6c !important;
            background-color: #ffffff !important;
        }

        .nav .open i.fa {
            color: #676a6c !important;
        }

        .nav.navbar-top-links .dropdown-alerts a {
            padding: 5px !important;
            font-weight: 600;
        }

        .navbar-top-links .dropdown-menu li.dropdown-divider {
            height: 1px;
            background-color: #f3f3f4;
        }

        .nav.navbar-top-links .dropdown-alerts a span.label {
            padding-bottom: 2px !important;
            padding-top: 1px !important;
            padding-left: 3px !important;
            padding-right: 3px !important;
            float: right !important;
            margin-top: 7px !important;
        }
    </style>

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
<body>
    <% If Not IsPrint Then %>
    <div id="wrapper">
        <%Include("Views/Shared/_Sidebar.asp")%>
        <div class="row border-bottom">
            <%Include("Views/Shared/_Header.asp")%>
        </div>
        <div id="page-wrapper" class="gray-bg" style="margin-top: -11px;">
            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-sm-12">
                    <%=GetTitle(true)%>

                    <%=GetBreadcrumbs(null)%>
                </div>
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

            <div class="wrapper wrapper-content animated fadeIn">
                <%RenderBody()%>
            </div>

            <div class="footer">
                <div class="pull-right">
                    Todos os direitos reservados
                </div>
                <div>
                    <strong>Book Gerencial</strong>&nbsp;&copy;&nbsp;Copyright 2018
                </div>
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

    <script type="text/javascript">
        $(document).ready(function () {
            $("span.fa-file-text-o").addClass("fa-file-text").removeClass("fa-file-text-o");
            $(".form-group a.fa-pencil-alt[title='Editar']").addClass("fa-pencil btn btn-primary").removeClass("fa-pencil-alt");
        });
    </script>
</body>
</html>
