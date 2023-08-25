<%
Public Model

Public ViewData

Class LogExcecaoController

    Private Sub Class_Initialize()
        Set ViewData = Server.CreateObject("Scripting.Dictionary")
    End Sub

    Private Sub Class_Terminate()
    End Sub

    Public Sub List()
        Set Model = ExecProcedure("OBTER_LOGS_EXCECAO_SPR", CdSistema, True)

        View "List"
    End Sub
End Class
%>