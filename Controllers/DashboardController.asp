<%
Public Model

Public ViewData

Class DashboardController
    Private Sub Class_Initialize()
        Set ViewData = Server.CreateObject("Scripting.Dictionary")
    End Sub

    Private Sub Class_Terminate()
    End Sub

    Public Sub Index()
        IndexMsg(null)
    End Sub

    Public Sub IndexMsg(args)
        Dim vMes, vAno, vAnalise
        
        vMes = null
        vAno = null
        vAnalise = ""

        If Not IsNothing(args) Then
            vMes = args("mes")
            vAno = args("ano")
            vAnalise = CStr(args("analise"))
        End If

        If IsNothing(vAno) Or vAno = "" Then
            vAno = Year(Date())
        End If

        If IsNothing(vMes) Then             
            vMes = Month(Date())
                    
            If vMes = 1 Then
                vMes = 12
                vAno = vAno - 1
            Else
                vMes = vMes - 1
            End If
        End If

        ViewData.Add "Ano", vAno
        ViewData.Add "Mes", vMes
        ViewData.Add "Analise", vAnalise

        ViewData.Add "Indicadores", ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_ITENS_DASHBOARD", Session("CdUsuario") & "," & vAno & "," & vMes, True)
        
        ViewData.Add "CountPendencias", ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_COUNT_ANALISES_PENDENTES", Session("CdUsuario"), True)
        
        ViewData.Add "AnalisesSemPreenchimento", ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_ANALISES_PENDENTES", Session("CdUsuario")&",1", True)
        ViewData.Add "AnalisesSemAprovacao", ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_ANALISES_PENDENTES", Session("CdUsuario")&",2", True)
        ViewData.Add "AnalisesRejeitadas", ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_ANALISES_PENDENTES", Session("CdUsuario")&",3", True)

        View "Index"
    End Sub

End Class
%>
