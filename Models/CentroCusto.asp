<%
Class CentroCusto
    Public Table
    Public Sequence

    Public Display
    Public Metadata
    Public Columns
    Public ColTypes
    Public Required

    Private Sub Class_Initialize()
        Table = "BOOK_CENTRO_CUSTO"
        Sequence = ""

        Display  = Array("Cуdigo"          , "Centro de Custo" , "Descriзгo"       , "Situaзгo" , "Cуd. Unidade")
        Metadata = Array("CdCentroCusto"   , "NmCentroCusto"   , "DsCentroCusto"   , "Situacao" , "CdUnidade")
	    Columns  = Array("CD_CENTRO_CUSTO" , "NM_CENTRO_CUSTO" , "DS_CENTRO_CUSTO" , "SITUACAO" , "CD_UNIDADE")
        ColTypes = Array("NUMBER"          , "VARCHAR2:100"    , "VARCHAR2:255"    , "CHAR:1"   , "NUMBER")
        Required = Array(True              , True              , False             , True       , False)
    End Sub

    Private Sub Class_Terminate()
    End Sub

    '=============================
    'Atributos

    Private m_updateMetadata

    '---

    Private m_cdCentroCusto
    Private m_nmCentroCusto
    Private m_dsCentroCusto
    Private m_situacao 
    Private m_cdUnidade

    '=============================
    'Propriedades

    Public Property Get UpdateMetadata()
        UpdateMetadata = m_updateMetadata
    End Property

    Public Property Let UpdateMetadata(val)
        m_updateMetadata = val
    End Property

    '---

    Public Property Get CdCentroCusto()
	    CdCentroCusto = m_cdCentroCusto
    End Property

    Public Property Let CdCentroCusto(val)
	    m_cdCentroCusto = val
    End Property

    Public Property Get NmCentroCusto()
	    NmCentroCusto = m_nmCentroCusto
    End Property

    Public Property Let NmCentroCusto(val)
	    m_nmCentroCusto = val
    End Property

    Public Property Get DsCentroCusto()
	    DsCentroCusto = m_dsCentroCusto
    End Property

    Public Property Let DsCentroCusto(val)
	    m_dsCentroCusto = val
    End Property

    Public Property Get Situacao()
	    Situacao = m_situacao
    End Property

    Public Property Let Situacao(val)
	    m_situacao = val
    End Property

    Public Property Get CdUnidade()
	    CdUnidade = m_cdUnidade
    End Property

    Public Property Let CdUnidade(val)
	    m_cdUnidade = val
    End Property

    Public Property Get CdNmCentroCusto()
	    CdNmCentroCusto = iif(m_cdCentroCusto > 10, m_cdCentroCusto & " - ", "") & m_nmCentroCusto
    End Property

End Class
%>