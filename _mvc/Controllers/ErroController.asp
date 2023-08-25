<%
Public Model

Public ViewData

Class ErroController
    Private Sub Class_Initialize()
        Set ViewData = Server.CreateObject("Scripting.Dictionary")
    End Sub

    Private Sub Class_Terminate()
    End Sub

    Public Sub Index(args)
        Dim vErrNumber, vErrDescription, vErrSource, vErrController, vErrAction, vErrRoute

        vErrNumber      = ""
        vErrDescription = ""
        vErrSource      = ""
        vErrController  = ""
        vErrAction      = ""
        vErrRoute       = ""

        If args("CdLogExcecao") <> "" Then
            Dim vExcecao

            Set vExcecao = ExecProcedure("OBTER_LOG_EXCECAO_SPR", CStr(args("CdLogExcecao")), True)

            vErrNumber      = vExcecao.GetValue("NUMERO",0)
            vErrDescription = vExcecao.GetValue("DESCRICAO",0)
            vErrSource      = vExcecao.GetValue("ORIGEM",0)
            vErrController  = vExcecao.GetValue("CONTROLLER",0)
            vErrAction      = vExcecao.GetValue("ACTION",0)
            vErrRoute       = vExcecao.GetValue("ROUTE",0)
        Else
            vErrNumber      = args("errNumber")
            vErrDescription = Trim(args("errDescription"))
            vErrSource      = Trim(args("errSource"))
            vErrController  = args("errController")
            vErrAction      = args("errAction")
            vErrRoute       = args("errRoute")
        End If

        ViewData.Add "Erro", "<b>Número:</b> " & vErrNumber & "<br/><br/>" & "<b>Descrição:</b> " & vErrDescription & "<br/><br/>" & "<b>Origem:</b> " & vErrSource
        ViewData.Add "Controller", vErrController
        ViewData.Add "Action", vErrAction
        ViewData.Add "Route", vErrRoute

        View "Index"
    End Sub

End Class
%>
