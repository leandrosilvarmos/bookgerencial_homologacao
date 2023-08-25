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

    <% If Not IsPrint Then %>

    <%Include("/_mvc/Bundles/GlobalCSS.asp")%>

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
<body>
    <% If Not IsPrint Then %>
    <div id="wrapper">
        <%Include("/_mvc/Views/Shared/_Sidebar.asp")%>

        <div id="page-wrapper" class="gray-bg">
            <div class="row border-bottom">
                <%Include("/_mvc/Views/Shared/_Header.asp")%>
            </div>

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
                    <strong>&copy;&nbsp;Copyright <%=iif(IsNothing(AnoCopyright),Year(date),AnoCopyright)%> -</strong>&nbsp;Hospital Estadual de Sapopemba
                </div>
            </div>
        </div>
    </div>

    <%Include("/_mvc/Bundles/GlobalJS.asp")%>

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
</body>
</html>
