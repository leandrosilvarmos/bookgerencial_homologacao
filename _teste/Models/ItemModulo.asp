<%
Class ItemModulo
    Public Table
    Public Sequence

    Public Display
    Public Metadata
    Public Columns
    Public ColTypes
    Public Required

    Private Sub Class_Initialize()
        Table = "BOOK_ITEM"
        Sequence = "BOOK_CD_ITEM_SQ"

        Display  = Array("Cуdigo"  , "Nome"         , "Descriзгo"    , "Tipo"   , "Funзгo" , "Formataзгo" , "Formula"      , "Desc. Query"  , "Ordem"  , "Situaзгo" , "Cуd. Modulo" , "Cуd. Unidade" , "Cуd. Item Superior" , "Qtd. Casas Decimais" , "Estilo"      , "Ocultar Nulo" , "Trimestral" , "Origem dos Dados" , "Anбlise Horizontal" , "Exibir Total" , "Frequкncia" , "Meta Comparaзгo" , "Meta Valor" , "Meta Complemento" , "Cуd. Centro de Custo")
        Metadata = Array("CdItem"  , "NmItem"       , "DsItem"       , "Tipo"   , "Funcao" , "Formatacao" , "Formula"      , "DsQuery"      , "Ordem"  , "Situacao" , "CdModulo"    , "CdUnidade"    , "CdItemSuperior"     , "QtdCasasDecimais"    , "Estilo"      , "OcultarNulo"  , "Trimestral" , "OrigemDados"      , "AH"                 , "ExibirTotal"  , "Frequencia" , "MetaComparacao"  , "MetaValor"  , "MetaComplemento"  , "CdCentroCusto")
	    Columns  = Array("CD_ITEM" , "NM_ITEM"      , "DS_ITEM"      , "TIPO"   , "FUNCAO" , "FORMATACAO" , "FORMULA"      , "DS_QUERY"     , "ORDEM"  , "SITUACAO" , "CD_MODULO"   , "CD_UNIDADE"   , "CD_ITEM_SUPERIOR"   , "QTD_CASAS_DECIMAIS"  , "ESTILO"      , "OCULTAR_NULO" , "TRIMESTRAL" , "ORIGEM_DADOS"     , "AH"                 , "EXIBIR_TOTAL" , "FREQUENCIA" , "META_COMPARACAO" , "META_VALOR" , "META_COMPLEMENTO" , "CD_CENTRO_CUSTO")
        ColTypes = Array("NUMBER"  , "VARCHAR2:150" , "VARCHAR2:300" , "CHAR:1" , "CHAR:1" , "CHAR:1"     , "VARCHAR2:100" , "VARCHAR2:400" , "NUMBER" , "CHAR:1"   , "NUMBER"      , "NUMBER"       , "NUMBER"             , "NUMBER"              , "VARCHAR2:50" , "CHAR:1"       , "CHAR:1"     , "CHAR:1"           , "CHAR:1"             , "CHAR:1"       , "NUMBER"     , "NUMBER"          , "NUMBER"     , "VARCHAR2:15"      , "NUMBER")
        Required = Array(True      , False          , False          , False    , False    , False        , False          , False          , False    , False      , False         , False          , False                , False                 , False         , False          , False        , False              , False                , False          , False        , False             , False        , False              , False)
    End Sub

    Private Sub Class_Terminate()
    End Sub

    '=============================
    'Atributos

    Private m_updateMetadata

    '---

    Private m_cdItem
    Private m_nmItem
    Private m_dsItem
    Private m_tipo
    Private m_funcao
    Private m_formatacao
    Private m_formula
    Private m_dsQuery
    Private m_ordem
    Private m_situacao
    Private m_cdModulo
    Private m_cdUnidade
    Private m_cdItemSuperior
    Private m_qtdCasasDecimais
    Private m_estilo 
    Private m_ocultarNulo
    Private m_trimestral
    Private m_origemDados
    Private m_AH
    Private m_exibirTotal
    Private m_frequencia
    Private m_metaComparacao
    Private m_metaValor
    Private m_metaComplemento
    Private m_cdCentroCusto


    '=============================
    'Propriedades

    Public Property Get UpdateMetadata()
        UpdateMetadata = m_updateMetadata
    End Property

    Public Property Let UpdateMetadata(val)
        m_updateMetadata = val
    End Property

    '---

    Public Property Get CdItem()
	    CdItem = m_cdItem
    End Property

    Public Property Let CdItem(val)
	    m_cdItem = val
    End Property

    Public Property Get NmItem()
	    NmItem = m_nmItem
    End Property

    Public Property Let NmItem(val)
	    m_nmItem = val
    End Property

    Public Property Get DsItem()
	    DsItem = m_dsItem
    End Property

    Public Property Let DsItem(val)
	    m_dsItem = val
    End Property

    Public Property Get Tipo()
	    Tipo = m_tipo
    End Property

    Public Property Let Tipo(val)
	    m_tipo = val
    End Property

    Public Property Get Funcao()
	    Funcao = m_funcao
    End Property

    Public Property Let Funcao(val)
	    m_funcao = val
    End Property

    Public Property Get Formatacao()
	    Formatacao = m_formatacao
    End Property

    Public Property Let Formatacao(val)
	    m_formatacao = val
    End Property

    Public Property Get Formula()
	    Formula = m_formula
    End Property

    Public Property Let Formula(val)
	    m_formula = val
    End Property

    Public Property Get DsQuery()
	    DsQuery = m_dsQuery
    End Property

    Public Property Let DsQuery(val)
	    m_dsQuery = val
    End Property

    Public Property Get Ordem()
	    Ordem = m_ordem
    End Property

    Public Property Let Ordem(val)
	    m_ordem = val
    End Property

    Public Property Get Situacao()
	    Situacao = m_situacao
    End Property

    Public Property Let Situacao(val)
	    m_situacao = val
    End Property

    Public Property Get CdModulo()
	    CdModulo = m_cdModulo
    End Property

    Public Property Let CdModulo(val)
	    m_cdModulo = val
    End Property

    Public Property Get CdUnidade()
	    CdUnidade = m_cdUnidade
    End Property

    Public Property Let CdUnidade(val)
	    m_cdUnidade = val
    End Property

    Public Property Get CdItemSuperior()
	    CdItemSuperior = m_cdItemSuperior
    End Property

    Public Property Let CdItemSuperior(val)
	    m_cdItemSuperior = val
    End Property

    Public Property Get QtdCasasDecimais()
	    QtdCasasDecimais = m_qtdCasasDecimais
    End Property

    Public Property Let QtdCasasDecimais(val)
	    m_qtdCasasDecimais = val
    End Property

    Public Property Get Estilo()
	    Estilo  = m_estilo 
    End Property

    Public Property Let Estilo(val)
	    m_estilo  = val
    End Property

    Public Property Get OcultarNulo()
	    OcultarNulo  = m_ocultarNulo 
    End Property

    Public Property Let OcultarNulo(val)
	    m_ocultarNulo  = val
    End Property

    Public Property Get Trimestral()
	    Trimestral  = m_trimestral 
    End Property

    Public Property Let Trimestral(val)
	    m_trimestral  = val
    End Property

    Public Property Get OrigemDados()
	    OrigemDados  = m_origemDados 
    End Property

    Public Property Let OrigemDados(val)
	    m_origemDados  = val
    End Property

    Public Property Get AH()
	    AH  = m_AH 
    End Property

    Public Property Let AH(val)
	    m_AH  = val
    End Property

    Public Property Get ExibirTotal()
	    ExibirTotal  = m_exibirTotal 
    End Property

    Public Property Let ExibirTotal(val)
	    m_exibirTotal  = val
    End Property

    Public Property Get Frequencia()
	    Frequencia  = m_frequencia 
    End Property

    Public Property Let Frequencia(val)
	    m_frequencia  = val
    End Property

    Public Property Get MetaComparacao()
	    MetaComparacao  = m_metaComparacao 
    End Property

    Public Property Let MetaComparacao(val)
	    m_metaComparacao  = val
    End Property

    Public Property Get MetaValor()
	    MetaValor  = m_metaValor 
    End Property

    Public Property Let MetaValor(val)
	    m_metaValor  = val
    End Property
    
    Public Property Get MetaComplemento()
	    MetaComplemento  = m_metaComplemento 
    End Property

    Public Property Let MetaComplemento(val)
	    m_metaComplemento  = val
    End Property

    Public Property Get CdCentroCusto()
	    CdCentroCusto  = m_cdCentroCusto 
    End Property

    Public Property Let CdCentroCusto(val)
	    m_cdCentroCusto  = val
    End Property
End Class
%>