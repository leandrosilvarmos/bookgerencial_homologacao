<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>

<%Response.Charset="ISO-8859-1"%>

<%
    'If Request.ServerVariables("HTTPS")  = "off" Then
        'Response.Redirect "https://" & Request.ServerVariables("HTTP_HOST") & Replace(Request.ServerVariables("UNENCODED_URL"),"Default.asp","")
    'End If
%>
 
<%  
    CdSistema = 31
    Title  = "Book Gerencial"
    Layout = "Views/Shared/_Layout.asp"
    AnoCopyright = "2018"
    IsCookie = True
    CookieName = "BookGerencial"

    vQryStrController = lcase(Request.QueryString("controller"))
    vQryStrAction = lcase(Request.QueryString("action"))

    If (vQryStrController = "abas" And (vQryStrAction = "list" Or vQryStrAction = "index" Or vQryStrAction = "indexmsg" Or vQryStrAction = "comparativoexcel" Or vQryStrAction = "")) Or vQryStrController = "home" Or vQryStrController = "" Then
        Layout = "Views/Shared/Book/_Layout.asp"
    End If
%>

<!--#include virtual="/_mvc/mvc.asp" -->