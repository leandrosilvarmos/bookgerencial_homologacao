<%
Class Valor
    Public Table
    Public Sequence

    Public Display
    Public Metadata
    Public Columns
    Public ColTypes
    Public Required

    Private Sub Class_Initialize()
        Table = "BOOK_VALOR"
        Sequence = "BOOK_CD_VALOR_SQ"

        Display  = Array("Cуdigo"   , "Valor"       , "Valor Txt"    , "Tipo"   , "Mкs"    , "Ano"    , "Cуd. Seзгo" , "Cуd. Modulo" , "Cуd. Unidade" , "Cуd. Item" , "Situaзгo")
        Metadata = Array("CdValor"  , "ValorNum"    , "ValorTxt"     , "Tipo"   , "Mes"    , "Ano"    , "CdSecao"    , "CdModulo"    , "CdUnidade"    , "CdItem"    , "Situacao")
	    Columns  = Array("CD_VALOR" , "VALOR_NUM"   , "VALOR_TXT"    , "TIPO"   , "MES"    , "ANO"    , "CD_SECAO"   , "CD_MODULO"   , "CD_UNIDADE"   , "CD_ITEM"   , "SITUACAO")
        ColTypes = Array("NUMBER"   , "NUMBER:10,2" , "VARCHAR2:100" , "CHAR:1" , "NUMBER" , "NUMBER" , "NUMBER"     , "NUMBER"      , "NUMBER"       , "NUMBER"    , "CHAR:1")
        Required = Array(True       , False         , False          , False    , False    , False    , False        , False         , False          , False       , False)
    End Sub

    Private Sub Class_Terminate()
    End Sub

    '=============================
    'Atributos

    Private m_updateMetadata

    '---

    Private m_cdValor
    Private m_valorNum
    Private m_valorTxt
    Private m_tipo
    Private m_mes
    Private m_ano
    Private m_cdSecao
    Private m_cdModulo
    Private m_cdUnidade
    Private m_cdItem
    Private m_situacao

    '=============================
    'Propriedades

    Public Property Get UpdateMetadata()
        UpdateMetadata = m_updateMetadata
    End Property

    Public Property Let UpdateMetadata(val)
        m_updateMetadata = val
    End Property

    '---

    Public Property Get CdValor()
	    CdValor = m_cdValor
    End Property

    Public Property Let CdValor(val)
	    m_cdValor = val
    End Property

    Public Property Get ValorNum()
	    ValorNum = m_valorNum
    End Property

    Public Property Let ValorNum(val)
	    m_valorNum = val
    End Property

    Public Property Get ValorTxt()
	    ValorTxt = m_valorTxt
    End Property

    Public Property Let ValorTxt(val)
	    m_valorTxt = val
    End Property

    Public Property Get Tipo()
	    Tipo = m_tipo
    End Property

    Public Property Let Tipo(val)
	    m_tipo = val
    End Property

    Public Property Get Mes()
	    Mes = m_mes
    End Property

    Public Property Let Mes(val)
	    m_mes = val
    End Property

    Public Property Get Ano()
	    Ano = m_ano
    End Property

    Public Property Let Ano(val)
	    m_ano = val
    End Property

    Public Property Get CdSecao()
	    CdSecao = m_cdSecao
    End Property

    Public Property Let CdSecao(val)
	    m_cdSecao = val
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

    Public Property Get CdItem()
	    CdItem = m_cdItem
    End Property

    Public Property Let CdItem(val)
	    m_cdItem = val
    End Property

    Public Property Get Situacao()
	    Situacao = m_situacao
    End Property

    Public Property Let Situacao(val)
	    m_situacao = val
    End Property

End Class
%>