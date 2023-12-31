<%
Public Model

Public ViewData

Class AbasController
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

                    Set vUnidade = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_UNIDADE_SPR", Nvl(Session("CdUsuario"), "0") & "," & Nvl(args("unidade"), "0") & ",' '", True)
                            
                    If Not IsNothing(vUnidade) Then
                        ViewData.Add "Unidade", vUnidade.GetValue("SIGLA",0) & " - " & vUnidade.GetValue("NM_UNIDADE",0)
                        ViewData.Add "UnidadeLogo", vUnidade.GetValue("URL_LOGO",0)
                    Else
                        RedirectToAction "Index", "Home", Array()
                    End If
                End If
            End If

            If Not IsNothing(args("ano")) Then
                ViewData.Add "Ano", args("ano")
            End If

            Set Model = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_MODULO_SPR", Nvl(Session("CdUsuario"), "0") & ",0,'A'," & Nvl(args("unidade"),"0"), True)

            View "Index"
        Else
            RedirectToAction "Index", "Home", Array()
        End If
    End Sub

    Public Sub List(args)
        If Not IsNull(args) Then
            Dim vItem, vValItem, vValUnidade, vValAno 

            vItem = ""

            vValItem    = CStr(args("item"))
            vValUnidade = CStr(args("unidade"))
            vValAno     = CStr(args("ano"))
       
            Dim vPermissao, vBoolPermissao, vPermissaoEdit, vBoolPermissaoEdit

            vBoolPermissao     = False
            vBoolPermissaoEdit = False
        
            Set vPermissao     = ExecProcedure("BOOK_GERENCIAL_PKG.VERIFICAR_PERMISSAO_MODULO_SPR", Nvl(Session("CdUsuario"), "0") & "," & Nvl(vValItem, "0"), True)
            Set vPermissaoEdit = ExecProcedure("BOOK_GERENCIAL_PKG.VERIFICAR_PERM_MODULO_EDIT_SPR", Nvl(Session("CdUsuario"), "0") & "," & Nvl(vValItem, "0"), True)

            If Not IsNothing(vPermissao) Then
                vBoolPermissao = iif(Cstr(vPermissao.GetValue("PERMISSAO",0)) = "S", true, false)
            End If

            If Not IsNothing(vPermissaoEdit) Then
                vBoolPermissaoEdit = iif(Cstr(vPermissaoEdit.GetValue("PERMISSAO",0)) = "S" And vPermissaoEdit.GetValue("ORIGEM_DADOS",0) = "M", true, false)
            End If

            If Not vBoolPermissao Then
                RedirectToAction "Index", "Home", Array()
            End If

            If Not IsNothing(vValItem) And Not IsNothing(vValUnidade) And Not IsNothing(vValAno) Then
                If CStr(vValItem) = "25" Then
                    Set Model = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_RESUMO_EXECUTIVO_SPR", vValUnidade & "," & vValAno, True)
                'ElseIf CStr(vValItem) = "22" Then
                '    Set Model = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_CONTROLE_INFECCAO_SPR", vValUnidade & "," & vValAno, True)

                '    ViewData.Add "AnaliseCritica", ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_ANALISE_CRITICA", vValUnidade & "," & vValItem & "," & vValAno & ",0,'A'", True)

                '    ViewData.Add "PermissaoEdit", vBoolPermissaoEdit
                Else
                    Set Model = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_ITENS_MODULO_SPR", vValUnidade & "," & vValItem & "," & vValAno & "," & Nvl(Session("CdUsuario"), "0"), True)
                
                    ViewData.Add "AnaliseCritica", ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_ANALISE_CRITICA", vValUnidade & "," & vValItem & "," & vValAno & ",0,'A'", True)

                    ViewData.Add "PermissaoEdit", vBoolPermissaoEdit
                End If

                ViewData.Add "Graficos", ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_GRAFICOS_SPR", vValItem & "," & vValUnidade,True)
                ViewData.Add "Unidades", ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_UNIDADE_SPR", "-1,0,'A'", True)

                ViewData.Add "Modulo", ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_MODULO_SPR",  Nvl(Session("CdUsuario"), "0") & "," & vValItem & ",' '," & vValUnidade, True)   
    
                ViewData.Add "CdUnidade", vValUnidade
                ViewData.Add "Ano", vValAno

				Session("Ano") = vValAno

                If Not IsNothing(ViewData.Item("Modulo")) Then
                    vItem = ViewData.Item("Modulo").GetValue("URL_PATH", 0) & "/"
                End If
            End If

            If Not IsNothing(vValUnidade) Then
                If CStr(vValUnidade) <> "0" Then
                    Dim vUnidade

                    Set vUnidade = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_UNIDADE_SPR", Nvl(Session("CdUsuario"), "0") & "," & vValUnidade & ",' '", True)
                            
                    If Not IsNothing(vUnidade) Then
                        ViewData.Add "Unidade", "<span class='hidden-xs'>" & vUnidade.GetValue("SIGLA",0) & " - </span>" & vUnidade.GetValue("NM_UNIDADE",0)
                        ViewData.Add "UnidadeLogo", vUnidade.GetValue("URL_LOGO",0)
                    Else
                        RedirectToAction "Index", "Home", Array()
                    End If 
                End If
            End If

            ViewData.Add "Aba", vItem & "Index"

            View "List"
        Else
            RedirectToAction "Index", "Home", Array()
        End If
    End Sub

    Public Sub Create()
        CreateMsg(null)
    End Sub

    Public Sub CreateMsg(args)
        If Not IsNull(args) Then
            If Not IsNothing(args("unidade")) And args("unidade") <> "" Then
                ViewData.Add "CdUnidade", args("unidade")

                If CStr(args("unidade")) <> "0" Then
                    Dim vUnidade

                    Set vUnidade = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_UNIDADE_SPR", Nvl(Session("CdUsuario"), "0") & "," & args("unidade") & ",' '", True)

                    If Not IsNothing(vUnidade) Then
                        ViewData.Add "Unidade", vUnidade.GetValue("SIGLA",0) & " - " & vUnidade.GetValue("NM_UNIDADE",0)
                        ViewData.Add "UnidadeLogo", vUnidade.GetValue("URL_LOGO",0)
                    Else
                        RedirectToAction "Index", "Home", Array()
                    End If

                    If Not IsNothing(args("item")) And args("item") <> "" Then
                        Dim vItem

                        vItem = ""

                        ViewData.Add "Item", args("item")

                        ViewData.Add "Modulo", ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_MODULO_EDIT_SPR",  Nvl(Session("CdUsuario"), "0") & "," & Nvl(args("unidade"),0) & "," & Nvl(args("item"),"-1") & ",'A','M'", True)

                        If Not IsNothing(ViewData.Item("Modulo")) Then
                            vItem = ViewData.Item("Modulo").GetValue("URL_PATH", 0) & "/"
                        End If

                        ViewData.Add "Aba", vItem & "Create"

                        Dim vMes, vAno

                        vMes = args("mes")
                        vAno = args("ano")

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

                        Set Model = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_ITENS_EDIT_SPR", CStr(args("unidade")) & "," & CStr(args("item")) & "," & vAno & "," & vMes & "," & Nvl(Session("CdUsuario"), "0"), True)

                        Dim vAnaliseCritica

                        Set vAnaliseCritica = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_ANALISE_CRITICA", CStr(args("unidade")) & "," & CStr(args("item")) & "," & vAno & "," & vMes & ",'A'", True)

                        If Not IsNothing(vAnaliseCritica) Then
                            ViewData.Add "AnaliseCritica", vAnaliseCritica
                        End If

                        Dim vPermissaoExcluir, vPermissaoCriar, vPermissaoEditar

                        Set vPermissaoCriar   = ExecProcedure("BOOK_GERENCIAL_PKG.VERIFICAR_PERM_MODULO_EDIT_SPR", Nvl(Session("CdUsuario"), "0") & "," & CStr(args("item")), True)
                        Set vPermissaoExcluir = ExecProcedure("BOOK_GERENCIAL_PKG.VERIFICAR_PERM_MDL_DELETAR_SPR", Nvl(Session("CdUsuario"), "0") & "," & CStr(args("item")), True)
                        Set vPermissaoEditar  = ExecProcedure("BOOK_GERENCIAL_PKG.VERIFICAR_PERM_MDL_EDITAR_SPR", Nvl(Session("CdUsuario"), "0") & "," & CStr(args("item")), True)

                        ViewData.Add "PermissaoCriar", iif(vPermissaoCriar.GetValue("PERMISSAO",0)="S", True, False)
                        ViewData.Add "PermissaoExcluir", iif(vPermissaoExcluir.GetValue("PERMISSAO",0)="S", True, False)
                        ViewData.Add "PermissaoEditar", iif(vPermissaoEditar.GetValue("PERMISSAO",0)="S", True, False)

                        Dim vAnalisePendente

                        Set vAnalisePendente = ExecProcedure("BOOK_GERENCIAL_PKG.VERIFICAR_ANALISE_PENDENTE_SPR", CStr(args("item")) & "," & CStr(args("unidade")), True)

                        ViewData.Add "AnalisePendente", iif(vAnalisePendente.GetValue("PENDENTE",0)="S", True, False)
                        ViewData.Add "AnoAnalisePendente", vAnalisePendente.GetValue("ANO",0)
                        ViewData.Add "MesAnalisePendente", vAnalisePendente.GetValue("MES",0)

                        ViewData.Add "Etapa", "Valores"
                    Else
                        Set Model = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_MODULO_EDIT_SPR", Nvl(Session("CdUsuario"), "0") & "," & Nvl(args("unidade"),0) & ",0,'A','M'", True)

                        If Not IsNothing(Model) Then
                            If Model.Count = 1 Then
                                RedirectToAction "CreateMsg", "Abas", Array("unidade="&CStr(args("unidade")), "item="&Model.GetValue("CD_MODULO",0))
                            End If
                        End If

                        ViewData.Add "Etapa", "Modulos"
                    End If
                Else
                    RedirectToAction "Create", "Abas", Array()
                End If
            End If
        Else
            Set Model = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_UNIDADE_SPR", Nvl(Session("CdUsuario"), "0") & ",0,'A'", True)

            If Not IsNothing(Model) Then
                If Model.Count = 1 Then
                    RedirectToAction "CreateMsg", "Abas", Array("unidade="&Model.GetValue("CD_UNIDADE",0))
                End If
            End If

            ViewData.Add "Etapa", "Unidades"
        End If

        View "Create"
    End Sub

    Public Sub CreatePost(args)
        Dim vCdUnidade, vCdModulo, vAno, vMes

        vCdUnidade = args("CdUnidade")
        vCdModulo  = args("CdModulo")
        vAno       = args("Ano")
        vMes       = args("Mes")

        For Each item In args
            If instr(item, "item") > 0 Then
                Dim vCdItem, vValor
    
                vCdItem = Replace(item, "item", "")
                vValor  = args(item)
        
                If Not IsNothing(vValor) And vValor <> "" Then
                    ExecProcedure "BOOK_GERENCIAL_PKG.GRAVAR_VALOR_BOOK_SPR", CStr(Session("CdUsuario")) & "," & CStr(vCdUnidade) & "," & CStr(vCdModulo) & "," & CStr(vAno) & "," & CStr(vMes) & "," & CStr(vCdItem) & ",q'[" & CStr(vValor) & "]'", False
                End If
            End If
        Next

        RedirectToAction "CreateMsg", "Abas", Array("unidade="&CStr(vCdUnidade), "item="&vCdModulo, "ano="&vAno, "mes="&vMes, "Ancora=btnSalvarValores")
    End Sub

    Public Sub CreateAnalisePost(args)
        Dim vCdAnaliseCritica, vCdUnidade, vCdModulo, vAno, vMes, vValor

        vCdAnaliseCritica = args("CdAnaliseCritica")
        vCdUnidade        = args("CdUnidadeAnalise")
        vCdModulo         = args("CdModuloAnalise")
        vAno              = args("AnoAnalise")
        vMes              = args("MesAnalise")
        vValor            = args("AnaliseCritica")
        
        If Not IsNothing(vValor) And vValor <> "" Then
            ExecProcedure "BOOK_GERENCIAL_PKG.GRAVAR_ANALISE_CRITICA_SPR", iif(IsNumeric(vCdAnaliseCritica), vCdAnaliseCritica, "null") & "," & CStr(vCdUnidade) & "," & CStr(vCdModulo) & "," & CStr(vAno) & "," & CStr(vMes) & ",q'[" & CStr(Replace(vValor,"'","�")) & "]'," & CStr(Session("CdUsuario")), False
        End If

        RedirectToAction "CreateMsg", "Abas", Array("unidade="&CStr(vCdUnidade), "item="&vCdModulo, "ano="&vAno, "mes="&vMes, "Ancora=AnaliseCritica")
    End Sub

    Public Sub AprovacaoAnalisePost(args)
        Dim vCdAnaliseCritica, vAprovacao, vMotivo, vCdUnidade, vCdModulo, vAno, vMes

        vCdAnaliseCritica = args("CdAnaliseCritica")
        vAprovacao        = args("Aprovacao")
        vMotivo           = args("Motivo")

        vCdUnidade        = args("CdUnidadeAnalise")
        vCdModulo         = args("CdModuloAnalise")
        vAno              = args("AnoAnalise")
        vMes              = args("MesAnalise")
        
        If Not IsNothing(vCdAnaliseCritica) And vCdAnaliseCritica <> "" And Not IsNothing(vAprovacao) And vAprovacao <> "" Then
            ExecProcedure "BOOK_GERENCIAL_PKG.GRAVAR_APROVACAO_ANALISE_SPR", vCdAnaliseCritica & ",'" & vAprovacao & "'," & ",q'[" & CStr(vMotivo) & "]'," & CStr(Session("CdUsuario")), False
        End If

        RedirectToAction "CreateMsg", "Abas", Array("unidade="&CStr(vCdUnidade), "item="&vCdModulo, "ano="&vAno, "mes="&vMes, "Ancora=AnaliseCritica")
    End Sub

    Public Sub AnaliseCriticaHistorico(args)
        Dim vValItem, vValUnidade, vValAno, vValMes

        vValItem    = CStr(args("item"))
        vValUnidade = CStr(args("unidade"))
        vValAno     = CStr(args("ano"))
        vValMes     = CStr(args("mes"))

        If Not IsNothing(vValItem) And Not IsNothing(vValUnidade) And Not IsNothing(vValAno) And Not IsNothing(vValMes) Then
            Set Model = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_ANALISES_HISTORICO", vValUnidade & "," & vValItem & "," & vValAno & "," & vValMes, True)
        End If

        View "AnaliseCriticaHistorico"
    End Sub

    Public Sub ComparativoExcel(args)
        Response.ContentType = "application/vnd.ms-excel"
        Response.AddHeader "Content-Disposition", "attachment; filename=Book_Comparativo.xls"

        Comparativo(args)
    End Sub

    Public Sub Comparativo(args)
        If Not IsNull(args) Then
            Dim vItem, vValItem, vValUnidade, vValUnidade2, vValAno, vValMes, vRetUnidade, vSiglaUnidade1, vSiglaUnidade2

            vItem = ""

            vValItem     = CStr(args("item"))
            vValUnidade  = CStr(args("unidade"))
            vValUnidade2 = CStr(args("unidade2"))
            vValAno      = CStr(args("ano"))
            vValMes      = CStr(args("mes"))
            
            vSiglaUnidade1 = ""
            vSiglaUnidade2 = ""

            If Not IsNothing(vValItem) And Not IsNothing(vValUnidade) And Not IsNothing(vValUnidade2) And Not IsNothing(vValAno) And Not IsNothing(vValMes) Then
                Set vRetUnidade = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_UNIDADE_SPR", "-2," & vValUnidade & ",' '" , True)            

                If Not IsNothing(vRetUnidade) Then
                    vSiglaUnidade1 = vRetUnidade.GetValue("SIGLA",i)
                End If

                Set vRetUnidade = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_UNIDADE_SPR", "-2," & vValUnidade2 & ",' '" , True)            

                If Not IsNothing(vRetUnidade) Then
                    vSiglaUnidade2 = vRetUnidade.GetValue("SIGLA",i)
                End If

                Set vRetUnidade = Nothing

                If vValUnidade = vValUnidade2 Then 
                    vSiglaUnidade1 = vSiglaUnidade1 & " " & vValAno
                    vSiglaUnidade2 = vSiglaUnidade2 & " " & CStr(CInt(vValAno)-1)
                    
                    If cInt(vValItem) = 6 Then
                        Set Model = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_COMPARACAO_ITENS_CC_SPR", vValUnidade & "," & vValAno & "," & CStr(CInt(vValAno)-1) & "," & vValMes, True)
                    Else
                        Set Model = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_COMPARACAO_ITENS_ANO_SPR", vValUnidade & "," & vValItem & "," & vValAno & "," & CStr(CInt(vValAno)-1) & "," & vValMes, True) 
                    End If
                Else
                    Set Model = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_COMPARACAO_ITENS_SPR", vValUnidade & "," & vValUnidade2 & "," & vValItem & "," & vValAno & "," & vValMes, True)
                End If

                ViewData.Add "Unidade1", vSiglaUnidade1
                ViewData.Add "Unidade2", vSiglaUnidade2
            End If

            View "Comparativo"
        Else
            RedirectToAction "Index", "Home", Array()
        End If
    End Sub

    Public Sub GrafResumoExecutivoJsonPost(args)
        JsonResult()

        Set retorno = jsObject()

        Dim vCdUnidade, vAno, i

        vCdUnidade = args("unidade")
        vAno       = args("ano")
        i          = args("item")

        If vCdUnidade <> "" And vAno <> "" Then
            Dim vResumoExecutivo

            Set vResumoExecutivo = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_RESUMO_EXECUTIVO_SPR", CStr(vCdUnidade)&","&CStr(vAno), True)

            If Not IsNothing(vResumoExecutivo) Then

                Dim objJson, grafico1, grafico2, grafico3, grafico4
                Dim labels, datasets, dataItem, backgroundItem

                Set grafico1 = jsObject() 
                    Set labels = jsArray()
                        labels(null) = "Urg�ncia"
                        labels(null) = "Sa�das"

                    Set datasets = jsArray()
                        Set objJson = jsObject()
                            objJson("label") = "%"

                            Set backgroundItem = jsArray()
                                backgroundItem(null) = "#1ab394" '#8eb4e3
                                backgroundItem(null) = "#1ab394" '#8eb4e3

                            Set objJson("backgroundColor")  = backgroundItem

                            Set dataItem = jsArray()
                                dataItem(null) = Replace(CStr(FormatNumber(vResumoExecutivo.GetValue("URGENCIAS_REALIZADO",i), 2)), ",", ".")
                                dataItem(null) = Replace(CStr(FormatNumber(vResumoExecutivo.GetValue("SAIDAS_REALIZADO",i), 2)), ",", ".")  

                            Set objJson("data")  = dataItem
                        Set datasets(null) = objJson

                    Set grafico1("labels")   = labels
                    Set grafico1("datasets") = datasets
                Set retorno("graf1") = grafico1

                Set grafico2 = jsObject() 
                    Set labels = jsArray()
                        labels(null) = "Urg�ncia"
                        labels(null) = "Sa�das"

                    Set datasets = jsArray()
                        Set objJson = jsObject()
                            objJson("label") = "%"

                            Set backgroundItem = jsArray()
                                backgroundItem(null) = "#1ab394" '#c0504d
                                backgroundItem(null) = "#1ab394" '#c0504d

                            Set objJson("backgroundColor")  = backgroundItem

                            Set dataItem = jsArray()
                                dataItem(null) = Replace(CStr(FormatNumber(vResumoExecutivo.GetValue("URGENCIAS_COMPARATIVO",i), 2)), ",", ".")
                                dataItem(null) = Replace(CStr(FormatNumber(vResumoExecutivo.GetValue("SAIDAS_COMPARATIVO",i), 2)), ",", ".")  

                            Set objJson("data")  = dataItem
                        Set datasets(null) = objJson

                    Set grafico2("labels")   = labels
                    Set grafico2("datasets") = datasets
                Set retorno("graf2") = grafico2

                Set grafico3 = jsObject() 
                    Set labels = jsArray()
                        labels(null) = "Receitas"
                        labels(null) = "Despesas"

                    Set datasets = jsArray()
                        Set objJson = jsObject()
                            objJson("label") = "%"

                            Set backgroundItem = jsArray()
                                backgroundItem(null) = "#337ab7" '#558ed5
                                backgroundItem(null) = "#337ab7" '#254061

                            Set objJson("backgroundColor")  = backgroundItem

                            Set dataItem = jsArray()
                                dataItem(null) = Replace(CStr(FormatNumber(vResumoExecutivo.GetValue("RECEITAS",i), 2)), ",", ".")
                                dataItem(null) = Replace(CStr(FormatNumber(vResumoExecutivo.GetValue("DESPESAS",i), 2)), ",", ".")  

                            Set objJson("data")  = dataItem
                        Set datasets(null) = objJson

                    Set grafico3("labels")   = labels
                    Set grafico3("datasets") = datasets
                Set retorno("graf3") = grafico3

                Set grafico4 = jsObject() 
                    Set labels = jsArray()
                        labels(null) = "IPCA"
                        labels(null) = "IGPM"

                    Set datasets = jsArray()
                        Set objJson = jsObject()
                            objJson("label") = "%"

                            Set backgroundItem = jsArray()
                                backgroundItem(null) = "#337ab7" '#254061
                                backgroundItem(null) = "#337ab7" '#558ed5

                            Set objJson("backgroundColor")  = backgroundItem

                            Set dataItem = jsArray()
                                dataItem(null) = Replace(CStr(FormatNumber(vResumoExecutivo.GetValue("IPCA",i), 2)), ",", ".")
                                dataItem(null) = Replace(CStr(FormatNumber(vResumoExecutivo.GetValue("IGPM",i), 2)), ",", ".")  

                            Set objJson("data")  = dataItem
                        Set datasets(null) = objJson

                    Set grafico4("labels")   = labels
                    Set grafico4("datasets") = datasets
                Set retorno("graf4") = grafico4
            End If
        End If

        retorno.Flush
    End Sub

    Public Sub GrafDataJsonPost(args)
        JsonResult()

        Set retorno = jsObject()

        Dim vCdGrafico, vCdUnidade, vAno, i

        vCdGrafico = args("grafico")
        vCdUnidade = args("unidade")
        vAno       = args("ano")

        If vCdUnidade <> "" And vAno <> "" Then
            Dim vValores

            Set vValores = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_VALORES_GRAFICO_SPR", CStr(vCdGrafico)&","&CStr(vAno)&","&CStr(vCdUnidade), True)

            If Not IsNothing(vValores) Then
                Dim objJson
                Dim labels, datasets, dataItem, backgroundItem

                Set labels = jsArray()

                Dim temid
                temid = 0

                For i = 0 To (vValores.Count - 1) Step 1
                    If temid = 0 or temid = vValores.GetValue("CD_ITEM",i) Then
                        labels(null) = UCase(MonthName(vValores.GetValue("MES",i),true))
                    Else
                        Exit For
                    End If

                    temid = vValores.GetValue("CD_ITEM",i)
                Next

                Set datasets = jsArray()
                    
                    temid = 0
                    For i = 0 To (vValores.Count - 1) Step 1
                        If temid <> vValores.GetValue("CD_ITEM",i) Then
                            Set objJson = jsObject()
                
                            objJson("label") = vValores.GetValue("NM_ITEM",i)
                            objJson("fill")  = false
                            objJson("backgroundColor") = "rgba(26,179,148,1)"
                            objJson("borderColor") = "rgba(26,179,148,1)"

                            Set dataItem = jsArray()
                        End If
                    
                        dataItem(null) = vValores.GetValue("VALOR_NUM",i)
            
                        Set objJson("data")  = dataItem
                        
                        If (temid <> 0 And temid <> vValores.GetValue("CD_ITEM",i)) Or i = (vValores.Count - 1) Then
                            Set datasets(null) = objJson
                        End If

                        temid = vValores.GetValue("CD_ITEM",i)
                    Next

                Set retorno("labels")   = labels
                Set retorno("datasets") = datasets
            End If
        End If

        retorno.Flush
    End Sub

    Public Sub ExcluirValorPost(args)
        JsonResult()

        Set retorno = jsObject()

        Dim vCdValor, vMotivo

        vCdValor = args("CdValor")
        vMotivo  = args("Motivo")
        
        If Not IsNothing(vCdValor) And vCdValor <> "" Then
            ExecProcedure "BOOK_GERENCIAL_PKG.EXCLUIR_VALOR_BOOK_SPR", CStr(vCdValor) & "," & CStr(Session("CdUsuario")) & ",q'[" & CStr(vMotivo) & "]'", False
            
            retorno("Sucesso") = True
        Else
            retorno("Sucesso")  = False
        End If

        retorno.Flush
    End Sub

    Public Sub RetornaDetalhesItemPost(args)
		JsonResult()

		Dim vCdItem

		vCdItem = args("cdItem")

		If vCdItem <> "" Then
			Dim retorno

			Set retorno = ExecProcedureJson("BOOK_GERENCIAL_PKG.OBTER_DETALHES_ITEM", CStr(vCdItem))
		    
		    retorno.Flush
    	End If
    End Sub

End Class

Function FormatarValor(pValor, pTipo, pFormula, pColuna, pIndex, pQtdCasasDecimais)
    Dim vRet, vValor, vValorTemp

    vRet = ""
    vValorTemp = pValor
 
    If Not IsNothing(pFormula) Then
        vValor = Nvl(pValor,0)

        vValor = ConvertFormula(pFormula, pColuna)

        vValorTemp = vValor

        Model.SetValue pColuna, pIndex, vValor
    Else
        vValor = "-"
    End If

    If pTipo = "" And vValor = "-" Then
        vRet = vValor
    Else
        If vValor = "-" Or IsNothing(vValor) Or vValor = "" Then
            vValor = Nvl(iif(pValor="",0,pValor),0)
        End If

        If Not IsNothing(vValor) Then
            Select Case pTipo
                Case "N"
                    vRet = FormatNumber(vValor, 0)
                Case "D"
                    If Not IsNothing(vQtdCasasDecimais) Then
                        vRet = FormatNumber(vValor, CInt(vQtdCasasDecimais))
                    Else
                        vRet = FormatNumber(vValor, 2)
                    End If
                Case "P"
                    If Not IsNothing(vQtdCasasDecimais) Then
                        vRet = FormatNumber(vValor, CInt(vQtdCasasDecimais)) & "%"
                    Else
                        vRet = FormatNumber(vValor, 2) & "%"
                    End If
                Case "M"
                    If Not IsNothing(vQtdCasasDecimais) Then
                        vRet = FormatNumber(vValor, CInt(vQtdCasasDecimais))
                    Else
                        vRet = FormatNumber(vValor, 2)
                    End If

                    If vRet = 0 Then
                        vRet = "-"
                    End If
                Case Else
                    vRet = pValor
            End Select
        Else
            vRet = "-"
        End If
    End If

    If IsNothing(vValorTemp) Then
        vRet = "-"
    End If

    FormatarValor = vRet
End Function

Function ConvertFormula(pFormula, pColuna)
    Dim vFormula, vCodigos, vRet, vValor

    vFormula = Split(UCase(pFormula), ";")
    
    Select Case UCase(vFormula(0))
        Case "SUM"
            Dim vSum, vCount, vVazio
                
            vSum   = 0
            vCount = 0
            vVazio = True

            For Each vItem In Split(vFormula(1),",")
                If Left(vItem,1) = "#" Then
                    vValor = Model.GetValueById(pColuna, Replace(vItem,"#",""))

                    If Not IsNothing(vValor) Then
                        vSum = vSum + CDbl(vValor)
                        vVazio = False

                        vCount = vCount + 1
                    End If
                Else
                    vSum = vSum + CDbl(vItem)

                    vCount = vCount + 1
                End If
            Next

            If vVazio And vCount = 0 Then
                vRet = null
            Else
                vRet = vSum 
            End If
        Case "EXP"
            Dim vExp, vStrExp

            vExp    = 0
            vCount  = 0
            vVazio  = True
            vStrExp = " "

            For Each vItem In Split(vFormula(1),",")
                If Left(vItem,1) = "#" Then
                    vValor = Model.GetValueById(pColuna, Replace(vItem,"#",""))

                    vStrExp = vStrExp & Nvl(vValor,0)

                    If Not IsNothing(vValor) Then
                        vVazio = False
                        vCount = vCount + 1
                    End If
                ElseIf Left(vItem,1) = "@" Then
                    vValor = ConvertFuncao(vItem,pColuna)

                    vStrExp = vStrExp & vValor

                    If Not IsNothing(vValor) Then
                        vCount = vCount + 1
                    End If
                Else
                    vStrExp = vStrExp & vItem

                    If IsNumeric(vValor) Then
                        vCount = vCount + 1
                    End If
                End If
            Next    

            vStrExp = vStrExp & " "

            If vVazio And vCount = 0 Then
                vRet = null
            Else
                If Not vStrExp = "" _
                   And Not Instr(CStr(vStrExp), " 0/") > 0 _
                   And Not Instr(CStr(vStrExp), "/0 ") > 0 _
                   And Not Instr(CStr(vStrExp), "/0*") > 0 _
                   And Not Instr(CStr(vStrExp), "/(0)") > 0 _
                   And Not Instr(CStr(vStrExp), "/0)") > 0 _
                   And Not Instr(CStr(vStrExp), "(0/") > 0 _
                   And Not Instr(CStr(vStrExp), "(0)/") > 0 _
                   And Not Instr(CStr(vStrExp), "(0+0+0+0+0+0+0+0+0+0)/") > 0 _
                   And Not Instr(CStr(vStrExp), "(0+0+0+0+0+0+0+0+0)/") > 0 _
                   And Not Instr(CStr(vStrExp), "(0+0+0+0+0+0+0+0)/") > 0 _
                   And Not Instr(CStr(vStrExp), "(0+0+0+0+0+0+0)/") > 0 _
                   And Not Instr(CStr(vStrExp), "(0+0+0+0+0+0)/") > 0 _
                   And Not Instr(CStr(vStrExp), "(0+0+0+0+0)/") > 0 _
                   And Not Instr(CStr(vStrExp), "(0+0+0+0)/") > 0 _
                   And Not Instr(CStr(vStrExp), "(0+0+0)/") > 0 _
                   And Not Instr(CStr(vStrExp), "(0+0)/") > 0 _
                   And Not Instr(CStr(vStrExp), "/(0+0+0+0+0+0+0+0+0+0)") > 0 _
                   And Not Instr(CStr(vStrExp), "/(0+0+0+0+0+0+0+0+0)") > 0 _
                   And Not Instr(CStr(vStrExp), "/(0+0+0+0+0+0+0+0)") > 0 _
                   And Not Instr(CStr(vStrExp), "/(0+0+0+0+0+0+0)") > 0 _
                   And Not Instr(CStr(vStrExp), "/(0+0+0+0+0+0)") > 0 _
                   And Not Instr(CStr(vStrExp), "/(0+0+0+0+0)") > 0 _
                   And Not Instr(CStr(vStrExp), "/(0+0+0+0)") > 0 _
                   And Not Instr(CStr(vStrExp), "/(0+0+0)") > 0 _
                   And Not Instr(CStr(vStrExp), "/(0+0)") > 0 Then

                   vExp = Eval(Replace(vStrExp,",","."))

                End If

                vRet = vExp
            End If
        Case Else
            vRet = null
    End Select

    ConvertFormula = vRet
End Function

Function ConvertFuncao(vFuncao, vParametros)
    Dim vRet

    vRet = ""

    Select Case LCase(Replace(vFuncao,"@",""))
        Case "qtd_dias_mes"
			vRet = QuantosDiasMes(GetNumMes(vParametros), Session("Ano"), true) 
    End Select

    ConvertFuncao = vRet
End Function

Function GetNumMes(vStrMes)
    Dim vRet

    vRet = 0

    Select Case vStrMes
        Case "JAN"
            vRet = 1
        Case "FEV"
            vRet = 2
        Case "MAR"
            vRet = 3
        Case "ABR"
            vRet = 4
        Case "MAI"
            vRet = 5
        Case "JUN"
            vRet = 6
        Case "JUL"
            vRet = 7
        Case "AGO"
            vRet = 8
        Case "SET"
            vRet = 9
        Case "OUT"
            vRet = 10
        Case "NOV"
            vRet = 11
        Case "DEZ"
            vRet = 12
    End Select

    GetNumMes = vRet
End Function

Function VerificarConjuntoVazio(pCdItemSuperior, pIndexAtual)
    Dim retorno, index

    retorno = True

    If Not IsNothing(Model) Then
        For index = (pIndexAtual + 1) To (Model.Count - 1) Step 1
            Dim vCdItemSuperior

            
            vCdItemSuperior = Model.GetValue("CD_ITEM_SUPERIOR", index)

            If CStr(Nvl(vCdItemSuperior, "")) = CStr(Nvl(pCdItemSuperior,"")) Then
                Dim vTipo, vCdItem

                vCdItem = Model.GetValue("CD_ITEM", index)
                vTipo = Model.GetValue("TIPO", index)

                If vTipo = "S" Then
                    If Not VerificarConjuntoVazio(vCdItem, index) Then
                        retorno = False
                        Exit For
                    End If
                Else
                    retorno = False
                    Exit For
                End If
            End If
        Next
    End If

    VerificarConjuntoVazio = retorno
End Function

Function VerificarMeta(vValor, vMetaComparacao, vMetaValor)
    Dim vRet, vNaMeta, vForaMeta, vValorComp, vMetaComp

    vRet = ""
    vNaMeta = "bg-green"
    vForaMeta = "bg-red"

    If Not IsNothing(vValor) And Not IsNothing(vMetaValor) Then
        vValorComp = Replace(Nvl(vValor,"0"),"%","")
        vMetaComp = Replace(Nvl(vMetaValor,"0"),"%","")

        If IsNumeric(vValorComp) And IsNumeric(vMetaComp) Then
            vValorComp = CDbl(vValorComp)
            vMetaComp = CDbl(vMetaComp)

            Select Case CStr(Nvl(vMetaComparacao,0))
                Case "1" ' -- >
                    If vValorComp > vMetaComp Then
                        vRet = vNaMeta
                    Else
                        vRet = vForaMeta
                    End If
                Case "2" ' -- <
                    If vValorComp < vMetaComp Then
                        vRet = vNaMeta
                    Else
                       vRet = vForaMeta
                    End If
                Case "3" ' -- >=
                    If vValorComp >= vMetaComp Then
                        vRet = vNaMeta
                    Else
                        vRet = vForaMeta
                    End If
                Case "4" ' -- <=
                    If vValorComp <= vMetaComp Then
                        vRet = vNaMeta
                    Else
                        vRet = vForaMeta
                    End If
                Case Else
                    If vValorComp >= vMetaComp Then
                        vRet = vNaMeta
                    Else
                        vRet = vForaMeta
                    End If
            End Select
        End If
    End If

    VerificarMeta = vRet
End Function

Function ExibirValor(pTipo, pMeta, pValor, pMes, pAno, pNmItem, pMetaComparacao, pMetaValor, pFrequencia, pFrequenciaValor)
    Dim vRet, vExibirValor, vNmFrequencia, vColspan

    vExibirValor = False
    vNmFrequencia = ""

    If Not pFrequencia Or (pFrequencia And pFrequenciaValor = 1) Then 
        vExibirValor = True
        vNmFrequencia = UCase(MonthName(pMes,True))
    ElseIf pFrequencia And pMes > 1 Then
        Dim vResto
        
        vResto = pMes Mod pFrequenciaValor

        If vResto = 0 Then
            vExibirValor = True
            vColspan = "colspan='"&pFrequenciaValor&"'"

            If pFrequenciaValor = 12 Then
                vNmFrequencia = pAno
            Else
                vNmFrequencia = CStr(pMes / pFrequenciaValor) & "� " & Texts.EnumDescricao("NmFrequenciaEnum", vFrequenciaValor) 
            End If
        End If
    End If 

    If vExibirValor Then
        vRet = "<td role='gridcell' " & vColspan
        vRet = vRet & " class='" & iif(vTipo = "I" And vMeta,VerificarMeta(pValor,pMetaComparacao,pMetaValor),"") & "'" 
        vRet = vRet & ">"
        vRet = vRet & "<span title='" & Replace(pNmItem,"'","") & " (" & vNmFrequencia & "): " & pValor & "'>" & pValor & "</span>"
        vRet = vRet & "</td>"
    End If

    Response.Write(vRet)
End Function
%>
