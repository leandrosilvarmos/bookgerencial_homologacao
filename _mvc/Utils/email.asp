<%
Class clsEmail
    Private objCDOSYSMail, objCDOSYSCon
    Public pFrom, pTO, pBCC, pCC, pTitulo, pCorpo, pTipo

    '-------------------------------------------------------
    Sub Class_Initialize()
        pFrom   = ""
        pTO     = ""
        pBCC    = ""
        pCC     = ""
        pTitulo = ""
        pCorpo  = ""
        pTipo   = "HTML"

        Set objCDOSYSMail = Server.CreateObject("CDO.Message")
        Set objCDOSYSCon = Server.CreateObject ("CDO.Configuration")
        'Out going SMTP server
        objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.hesap.org.br"
        objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
        objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
        objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60

        objCDOSYSCon.Fields.Update
        'Update the CDOSYS Configuration
        Set objCDOSYSMail.Configuration = objCDOSYSCon
    End Sub

    '-------------------------------------------------------
    Function fAddAnexo(pAnexo)
        objCDOSYSMail.AddAttachment(pAnexo)
    End Function

    '-------------------------------------------------------
    Sub fEnviaEmail()
        If IsTest Then
           pCorpo  = "(TO='"&pTO&"'; BCC='"&pBCC&"'; CC='"&pCC&"')" & vbcrlf & vbcrlf & pCorpo
           pTO     = EmailTest
           pBCC    = ""
           pCC     = ""
           pTitulo = "(TESTE) " & pTitulo
           
        End If

        objCDOSYSMail.From = pFrom
        objCDOSYSMail.TO = pTO

        If pBCC <> "" Then
            objCDOSYSMail.bcc = pBCC
        End If
        
        If pCC <> "" Then
            objCDOSYSMail.CC = pCC
        End If

        objCDOSYSMail.Subject = pTitulo

        If pTipo = "HTML" Then
            objCDOSYSMail.HTMLBody = pCorpo
        Else
            objCDOSYSMail.TextBody = pCorpo
        End If
            
        objCDOSYSMail.Send

        'Close the server mail object
        Set objCDOSYSMail = Nothing
        Set objCDOSYSCon = Nothing
    End Sub
End Class
%>