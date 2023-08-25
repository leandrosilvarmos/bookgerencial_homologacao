<!DOCTYPE html>
<html lang="pt-br" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="cache-control" content="no-cache" />

    <title><%=iif(IsTest, "(Teste) ", "")%>Login - <%=Title%></title>

    <link rel="shortcut icon" href="Content/img/favicon.ico" />

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
<body class="gray-bg">
    <div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <div>
                <img src="Content/img/logo_gerencial.png" style="width: 300px;" />
            </div>
            <h2 style="font-weight: 600; color: #2d5a72; font-size: 30px; <%=iif(IsTest,"margin-left: 35px;","")%>"><%=Title%><%=iif(IsTest, "&nbsp;<small style='font-size: 11px;'>(Teste)</small>", "")%></h2><p>Digite seus dados de acesso:</p>
            <form action="?controller=Login&action=EntrarPost&partial=true" id="EntrarPost" method="post" accept-charset="ISO-8859-1">
                <% If Not IsEmpty(ViewData.Item("Erro")) Then %>
                <div class="alert alert-<%=ViewData.Item("Alert")%>">
                    <%=Texts.Mensagem(ViewData.Item("Erro"))%>
                </div>
                <% End If %>
                <div class="form-group">
                    <input id="DsLogin" name="DsLogin" type="text" class="form-control" placeholder="Login" required="required" />
                </div>
                <div class="form-group">
                    <input id="DsSenha" name="DsSenha" type="password" class="form-control" placeholder="Senha" required="required" />
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">Login</button>
            </form>
            <p class="m-t"><small>&copy;&nbsp;Copyright 2018</small> </p>
        </div>
    </div>

    <%Include("/_mvc/Bundles/GlobalJS.asp")%>
</body>
</html>
