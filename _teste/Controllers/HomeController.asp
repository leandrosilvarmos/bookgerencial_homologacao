<%
Public Model

Public ViewData

Class HomeController
    Private Sub Class_Initialize()
        Set ViewData = Server.CreateObject("Scripting.Dictionary")
    End Sub

    Private Sub Class_Terminate()
    End Sub

    Public Sub Index()
        IndexMsg(null)
    End Sub

    Public Sub IndexMsg(args)
        If Not IsNull(args) Then
            If Not IsNothing(args("unidade")) Then
                ViewData.Add "CdUnidade", args("unidade")

                If CStr(args("unidade")) <> "0" Then
                    Dim vUnidade

                    Set vUnidade = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_UNIDADE_SPR", Nvl(Session("CdUsuario"), "0") & "," & args("unidade") & ",' '", True)

                    If Not IsNothing(vUnidade) Then
                        ViewData.Add "Unidade", "<span class='hidden-xs'>" & vUnidade.GetValue("SIGLA",0) & " - </span>" & vUnidade.GetValue("NM_UNIDADE",0)
                        ViewData.Add "UnidadeLogo", vUnidade.GetValue("URL_LOGO",0) 
                        ViewData.Add "UnidadeCertificacoes", vUnidade.GetValue("CERTIFICACOES",0)
						ViewData.Add "DsMissao", vUnidade.GetValue("DS_MISSAO",0) 
						ViewData.Add "DsVisao", vUnidade.GetValue("DS_VISAO",0)
						ViewData.Add "DsValores", vUnidade.GetValue("DS_VALORES",0)
						ViewData.Add "MapaEstrategico", vUnidade.GetValue("URL_MAPA_ESTRATEGICO",0)
                    Else
                        RedirectToAction "Index", "Home", Array()
                    End If

                    ViewData.Add "Books", ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_BOOK_SPR", CStr(args("unidade")), True)
                End If
            End If

            If Not IsNothing(args("item")) Then
                ViewData.Add "Item", args("item")
            End If
        End If

        Set Model = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_UNIDADE_SPR", Nvl(Session("CdUsuario"), "0") & ",0,'A'", True)

        View "Index"
    End Sub

    Public Sub Book(args)
        If Not IsNull(args) Then
            If Not IsNothing(args("unidade")) Then
                ViewData.Add "CdUnidade", args("unidade")

                If CStr(args("unidade")) <> "0" Then
                    Dim vUnidade

                    Set vUnidade = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_UNIDADE_SPR", Nvl(Session("CdUsuario"), "0") & "," & args("unidade") & ",' '", True)

                    If Not IsNothing(vUnidade) Then
                        ViewData.Add "Unidade", "<span class='hidden-xs'>" & vUnidade.GetValue("SIGLA",0) & " - </span>" & vUnidade.GetValue("NM_UNIDADE",0)
                        ViewData.Add "UnidadeLogo", vUnidade.GetValue("URL_LOGO",0)
                    Else
                        RedirectToAction "Index", "Home", Array()
                    End If

                    ViewData.Add "Books", ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_BOOK_SPR", CStr(args("unidade")), True)
                End If
            End If

            If Not IsNothing(args("item")) And Not IsEmpty(args("item")) Then
                ViewData.Add "Item", args("item")
            End If
        End If

        View "Book"
    End Sub

    Public Sub Unidades(args)
        If Not IsNull(args) Then
            If Not IsNothing(args("ano")) And Not IsEmpty(args("ano")) Then
                ViewData.Add "Ano", args("ano")
            End If

            If Not IsNothing(args("item")) And Not IsEmpty(args("item")) Then
                ViewData.Add "Item", args("item")
            End If

            If Not IsNothing(args("create")) And Not IsEmpty(args("create")) Then
                ViewData.Add "Create", args("create")
            End If
        End If

        Set Model = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_UNIDADE_SPR", Nvl(Session("CdUsuario"), "0") & ",0,'A'", True)

        View "Unidades"
    End Sub

    Public Sub AnalisePendencias()
		JsonResult()

		If Not IsNothing(Session("CdUsuario")) Then
			Dim retorno

			Set retorno = ExecProcedureJson("BOOK_GERENCIAL_PKG.OBTER_COUNT_ANALISES_PENDENTES", CStr(Session("CdUsuario")))

		    retorno.Flush
    	End If
    End Sub
End Class
%>
