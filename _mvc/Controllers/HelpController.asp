<%
Public Model

Public ViewData

Class HelpController
    Private Sub Class_Initialize()
        Set ViewData = Server.CreateObject("Scripting.Dictionary")
    End Sub

    Private Sub Class_Terminate()
    End Sub

    Public Sub Index()
        View "Index"
    End Sub

End Class
%>
