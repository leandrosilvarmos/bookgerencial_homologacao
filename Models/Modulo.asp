<%
Class Modulo
    Public Table
    Public Sequence

    Public Display
    Public Metadata
    Public Columns
    Public ColTypes
    Public Required

    Private Sub Class_Initialize()
        Table = "BOOK_MODULO"
        Sequence = "BOOK_CD_MODULO_SQ"

        Display  = Array("Cуdigo"    , "Nome"        , "Descriзгo"    , "Situaзгo" , "Icone"       , "Url Path"    , "Origem dos Dados" , "Ocultar Nulo" , "Anбlise Crнtica" , "Ordem")
        Metadata = Array("CdModulo"  , "NmModulo"    , "DsModulo"     , "Situacao" , "Icone"       , "UrlPath"     , "OrigemDados"      , "OcultarNulo"  , "AnaliseCritica"  , "Ordem")
	    Columns  = Array("CD_MODULO" , "NM_MODULO"   , "DS_MODULO"    , "SITUACAO" , "ICONE"       , "URL_PATH"    , "ORIGEM_DADOS"     , "OCULTAR_NULO" , "ANALISE_CRITICA" , "ORDEM")
        ColTypes = Array("NUMBER"    , "VARCHAR2:50" , "VARCHAR2:255" , "CHAR:1"   , "VARCHAR2:30" , "VARCHAR2:30" , "CHAR:1"           , "CHAR:1"       , "CHAR:1"          , "NUMBER")
        Required = Array(True        , True          , False          , True       , False         , False         , True               , False          , True              , False)
    End Sub

    Private Sub Class_Terminate()
    End Sub

    '=============================
    'Atributos

    Private m_updateMetadata

    '---

    Private m_cdModulo
    Private m_nmModulo
    Private m_dsModulo
    Private m_situacao
    Private m_icone
    Private m_urlPath 
    Private m_origemDados
    Private m_ocultarNulo
    Private m_analiseCritica
    Private m_ordem

    '=============================
    'Propriedades

    Public Property Get UpdateMetadata()
        UpdateMetadata = m_updateMetadata
    End Property

    Public Property Let UpdateMetadata(val)
        m_updateMetadata = val
    End Property

    '---

    Public Property Get CdModulo()
	    CdModulo = m_cdModulo
    End Property

    Public Property Let CdModulo(val)
	    m_cdModulo = val
    End Property

    Public Property Get NmModulo()
	    NmModulo = m_nmModulo
    End Property

    Public Property Let NmModulo(val)
	    m_nmModulo = val
    End Property

    Public Property Get DsModulo()
	    DsModulo = m_dsModulo
    End Property

    Public Property Let DsModulo(val)
	    m_dsModulo = val
    End Property

    Public Property Get Situacao()
	    Situacao = m_situacao
    End Property

    Public Property Let Situacao(val)
	    m_situacao = val
    End Property

    Public Property Get Icone()
	    Icone = m_icone
    End Property

    Public Property Let Icone(val)
	    m_icone = val
    End Property

    Public Property Get UrlPath()
	    UrlPath = m_urlPath
    End Property

    Public Property Let UrlPath(val)
	    m_urlPath = val
    End Property

    Public Property Get OrigemDados()
	    OrigemDados = m_origemDados
    End Property

    Public Property Let OrigemDados(val)
	    m_origemDados = val
    End Property

    Public Property Get OcultarNulo()
	    OcultarNulo = m_ocultarNulo
    End Property

    Public Property Let OcultarNulo(val)
	    m_ocultarNulo = val
    End Property

    Public Property Get AnaliseCritica()
	    AnaliseCritica = m_analiseCritica
    End Property

    Public Property Let AnaliseCritica(val)
	    m_analiseCritica = val
    End Property

    Public Property Get Ordem()
	    Ordem = m_ordem
    End Property

    Public Property Let Ordem(val)
	    m_ordem = val
    End Property

    Public Property Get CdNmModulo()
        If m_cdModulo <> 0 Then
            CdNmModulo = m_cdModulo & " - " & m_nmModulo
        Else
            CdNmModulo = m_nmModulo
        End If
    End Property

End Class
%>