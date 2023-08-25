<!DOCTYPE html>
<html lang="pt-br" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="cache-control" content="no-cache" />

    <title>Erro 500 - <%=Title%></title>

    <%Include("/_mvc/Bundles/GlobalCSS.asp")%>

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
<body class="gray-bg" style="padding: 30px;">
    <div class="row animated fadeInDown">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h2>Erro 500&nbsp;<small><%=Texts.Mensagem("msgErro500")%></small></h2>
                </div>
                <div class="ibox-content">
                    <div class="form-horizontal">
                        <div>
                            <p>
                                <b>Controller:</b>&nbsp;<%=ViewData.Item("Controller")%><br />
                                <b>Action:</b>&nbsp;<%=ViewData.Item("Action")%><br />
                                <b>Route:</b>&nbsp;<%=ViewData.Item("Route")%>
                            </p>
                            <pre class="alert-danger"><%=ViewData.Item("Erro")%></pre>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <a class="fa fa-lg fa-reply btn btn-white" href="javascript:void(0);" onclick="history.go(-1);" title="Voltar">&nbsp;Voltar</a>
                        <a class="fa fa-lg fa-home btn btn-success" href="?controller=Home&action=Index" title="Início">&nbsp;Início</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%Include("/_mvc/Bundles/GlobalJS.asp")%>
</body>
</html>
