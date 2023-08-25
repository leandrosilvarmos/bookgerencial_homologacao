<%
Class UsrUnidade
    Public Table
    Public Sequence

    Public Display
    Public Metadata
    Public Columns
    Public ColTypes
    Public Required

    Private Sub Class_Initialize()
        Table = "BOOK_USR_UNIDADE"
        Sequence = "BOOK_CD_CTRL_USR_UND_SQ"

        Display  = Array("Cуdigo"      , "Cуd. Usuбrio" , "Cуd. Unidade" , "Situaзгo" , "Dt. Alteraзгo" , "Cуd. Usuбrio Alt.")
        Metadata = Array("CdControle"  , "CdUsuario"    , "CdUnidade"    , "Situacao" , "DtAlteracao"   , "CdUsuarioAlt")
	    Columns  = Array("CD_CONTROLE" , "CD_USUARIO"   , "CD_UNIDADE"   , "SITUACAO" , "DT_ALTERACAO"  , "CD_USUARIO_ALT")
        ColTypes = Array("NUMBER"      , "NUMBER"       , "NUMBER"       , "CHAR:1"   , "NUMBER"        , "NUMBER")
        Required = Array(True          , True           , True           , True       , True            , True)
    End Sub

    Private Sub Class_Terminate()
    End Sub

    '=============================
    'Atributos

    Private m_updateMetadata

    '---

    Private m_cdControle
    Private m_cdUsuario
    Private m_cdUnidade
    Private m_situacao
    Private m_dtAlteracao
    Private m_CdUsuarioAlt

    '=============================
    'Propriedades

    Public Property Get UpdateMetadata()
        UpdateMetadata = m_updateMetadata
    End Property

    Public Property Let UpdateMetadata(val)
        m_updateMetadata = val
    End Property

    '---

    Public Property Get CdControle()
	    CdControle = m_cdControle
    End Property

    Public Property Let CdControle(val)
	    m_cdControle = val
    End Property

    Public Property Get CdUsuario()
	    CdUsuario = m_cdUsuario
    End Property

    Public Property Let CdUsuario(val)
	    m_cdUsuario = val
    End Property

    Public Property Get CdUnidade()
	    CdUnidade = m_cdUnidade
    End Property

    Public Property Let CdUnidade(val)
	    m_cdUnidade = val
    End Property

    Public Property Get Situacao()
	    Situacao = m_situacao
    End Property

    Public Property Let Situacao(val)
	    m_situacao = val
    End Property

    Public Property Get DtAlteracao()
	    DtAlteracao = m_dtAlteracao
    End Property

    Public Property Let DtAlteracao(val)
	    m_dtAlteracao = val
    End Property

    Public Property Get CdUsuarioAlt()
	    CdUsuarioAlt = m_CdUsuarioAlt
    End Property

    Public Property Let CdUsuarioAlt(val)
	    m_CdUsuarioAlt = val
    End Property

End Class
%>