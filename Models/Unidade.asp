<%
Class Unidade
    Public Table
    Public Sequence

    Public Display
    Public Metadata
    Public Columns
    Public ColTypes
    Public Required

    Private Sub Class_Initialize()
        Table = "BOOK_UNIDADE"
        Sequence = "BOOK_CD_UNIDADE_SQ"

        Display  = Array("Código"     , "Nome"         , "Descrição"    , "Sigla"       , "URL Logo"     , "URL Foto"     , "Situação" , "Ordem"  , "Certificações" , "Desc. Missão" , "Desc. Visão"  , "Desc. Valores" , "URL Mapa Estratégico")
        Metadata = Array("CdUnidade"  , "NmUnidade"    , "DsUnidade"    , "Sigla"       , "UrlLogo"      , "UrlFoto"      , "Situacao" , "Ordem"  , "Certificacoes" , "DsMissao"     , "DsVisao"      , "DsValores"     , "UrlMapaEstrategico")
	    Columns  = Array("CD_UNIDADE" , "NM_UNIDADE"   , "DS_UNIDADE"   , "SIGLA"       , "URL_LOGO"     , "URL_FOTO"     , "SITUACAO" , "ORDEM"  , "CERTIFICACOES" , "DS_MISSAO"    , "DS_VISAO"     , "DS_VALORES"    , "URL_MAPA_ESTRATEGICO")
        ColTypes = Array("NUMBER"     , "VARCHAR2:100" , "VARCHAR2:255" , "VARCHAR2:30" , "VARCHAR2:100" , "VARCHAR2:100" , "CHAR:1"   , "NUMBER" , "VARCHAR2:100"  , "VARCHAR2:500" , "VARCHAR2:500" , "VARCHAR2:500"  , "VARCHAR2:100")
        Required = Array(True         , False          , False          , False         , False          , False          , False      , False    , False           , False          , False          , False           , False)
    End Sub

    Private Sub Class_Terminate()
    End Sub

    '=============================
    'Atributos

    Private m_updateMetadata

    '---

    Private m_cdUnidade
    Private m_nmUnidade
    Private m_dsUnidade
    Private m_sigla
    Private m_urlLogo
    Private m_urlFoto
    Private m_situacao 
    Private m_ordem
    Private m_certificacoes
    Private m_dsMissao
    Private m_dsVisao
    Private m_dsValores
    Private m_urlMapaEstrategico

    '=============================
    'Propriedades

    Public Property Get UpdateMetadata()
        UpdateMetadata = m_updateMetadata
    End Property

    Public Property Let UpdateMetadata(val)
        m_updateMetadata = val
    End Property

    '---

    Public Property Get CdUnidade()
	    CdUnidade = m_cdUnidade
    End Property

    Public Property Let CdUnidade(val)
	    m_cdUnidade = val
    End Property

    Public Property Get NmUnidade()
	    NmUnidade = m_nmUnidade
    End Property

    Public Property Let NmUnidade(val)
	    m_nmUnidade = val
    End Property

    Public Property Get DsUnidade()
	    DsUnidade = m_dsUnidade
    End Property

    Public Property Let DsUnidade(val)
	    m_dsUnidade = val
    End Property

    Public Property Get Sigla()
	    Sigla = m_sigla
    End Property

    Public Property Let Sigla(val)
	    m_sigla = val
    End Property

    Public Property Get UrlLogo()
	    UrlLogo = m_urlLogo
    End Property

    Public Property Let UrlLogo(val)
	    m_urlLogo = val
    End Property

    Public Property Get UrlFoto()
	    UrlFoto = m_urlFoto
    End Property

    Public Property Let UrlFoto(val)
	    m_urlFoto = val
    End Property

    Public Property Get Situacao()
	    Situacao = m_situacao
    End Property

    Public Property Let Situacao(val)
	    m_situacao = val
    End Property

    Public Property Get Ordem()
	    Ordem = m_ordem
    End Property

    Public Property Let Ordem(val)
	    m_ordem = val
    End Property

    Public Property Get Certificacoes()
	    Certificacoes = m_certificacoes
    End Property

    Public Property Let Certificacoes(val)
	    m_certificacoes = val
    End Property

    Public Property Get DsMissao()
	    DsMissao = m_dsMissao
    End Property

    Public Property Let DsMissao(val)
	    m_dsMissao = val
    End Property

    Public Property Get DsVisao()
	    DsVisao = m_dsVisao
    End Property

    Public Property Let DsVisao(val)
	    m_dsVisao = val
    End Property

    Public Property Get DsValores()
	    DsValores = m_dsValores
    End Property

    Public Property Let DsValores(val)
	    m_dsValores = val
    End Property

    Public Property Get UrlMapaEstrategico()
	    UrlMapaEstrategico = m_urlMapaEstrategico
    End Property

    Public Property Let UrlMapaEstrategico(val)
	    m_urlMapaEstrategico = val
    End Property

End Class
%>