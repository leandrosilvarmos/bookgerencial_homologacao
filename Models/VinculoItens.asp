<%
Class VinculoItens
    Public Table
    Public Sequence

    Public Display
    Public Metadata
    Public Columns
    Public ColTypes
    Public Required

    Private Sub Class_Initialize()
        Table = "BOOK_VINCULO_ITENS"
        Sequence = "BOOK_CD_VINCULO_ITENS_SQ"

        Display  = Array("Cуdigo"     , "Cуd. Item" , "Cуd. Item Sub" , "Situaзгo")
        Metadata = Array("CdVinculo"  , "CdItem"    , "CdItemSub"     , "Situacao")
	    Columns  = Array("CD_VINCULO" , "CD_ITEM"   , "CD_ITEM_SUB"   , "SITUACAO")
        ColTypes = Array("NUMBER"     , "NUMBER"    , "NUMBER"        , "CHAR:1")
        Required = Array(True         , False       , False           , False)
    End Sub

    Private Sub Class_Terminate()
    End Sub

    '=============================
    'Atributos

    Private m_updateMetadata

    '---

    Private m_cdVinculo
    Private m_cdItem
    Private m_cdItemSub
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

    Public Property Get CdVinculo()
	    CdVinculo = m_cdVinculo
    End Property

    Public Property Let CdVinculo(val)
	    m_cdVinculo = val
    End Property

    Public Property Get CdItem()
	    CdItem = m_cdItem
    End Property

    Public Property Let CdItem(val)
	    m_cdItem = val
    End Property

    Public Property Get CdItemSub()
	    CdItemSub = m_cdItemSub
    End Property

    Public Property Let CdItemSub(val)
	    m_cdItemSub = val
    End Property

    Public Property Get Situacao()
	    Situacao = m_situacao
    End Property

    Public Property Let Situacao(val)
	    m_situacao = val
    End Property

End Class
%>