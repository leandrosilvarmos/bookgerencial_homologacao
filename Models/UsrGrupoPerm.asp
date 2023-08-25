<%
Class UsrGrupoPerm
    Public Table
    Public Sequence

    Public Display
    Public Metadata
    Public Columns
    Public ColTypes
    Public Required

    Private Sub Class_Initialize()
        Table = "USR_GRUPO_PERM"
        Sequence = "CD_CTRL_USR_PERM_SQ"

        Display  = Array("Cуdigo"      , "Cуd. Grupo Permissгo" , "Cуd. Usuбrio" , "Cуd. Seзгo" , "Cуd. Funзгo" , "Cуd. Local" , "Situaзгo" , "Cуd. Usuбrio Alt." , "Dt. Alteraзгo")
        Metadata = Array("CdControle"  , "CdGrupoPermissao"     , "CdUsuario"    , "CdSecao"    , "CdFuncao"    , "CdLocal"    , "Situacao" , "CdUsuarioAlt"      , "DtAlteracao")
	    Columns  = Array("CD_CONTROLE" , "CD_GRUPO_PERMISSAO"   , "CD_USUARIO"   , "CD_SECAO"   , "CD_FUNCAO"   , "CD_LOCAL"   , "SITUACAO" , "CD_USUARIO_ALT"    , "DT_ALTERACAO")
        ColTypes = Array("NUMBER"      , "NUMBER"               , "NUMBER"       , "NUMBER"     , "NUMBER"      , "NUMBER"     , "CHAR:1"   , "NUMBER"            , "DATE")
        Required = Array(True          , True                   , False          , False        , False         , False        , True       , True                , True)
    End Sub

    Private Sub Class_Terminate()
    End Sub

    '=============================
    'Atributos

    Private m_updateMetadata

    '---

    Private m_cdControle
    Private m_cdGrupoPermissao
    Private m_cdUsuario
    Private m_cdSecao
    Private m_cdFuncao
    Private m_cdLocal
    Private m_situacao
    Private m_cdUsuarioAlt
    Private m_dtAlteracao

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

    Public Property Get CdGrupoPermissao()
	    CdGrupoPermissao = m_cdGrupoPermissao
    End Property

    Public Property Let CdGrupoPermissao(val)
	    m_cdGrupoPermissao = val
    End Property

    Public Property Get CdUsuario()
	    CdUsuario = m_cdUsuario
    End Property

    Public Property Let CdUsuario(val)
	    m_cdUsuario = val
    End Property

    Public Property Get CdSecao()
	    CdSecao = m_cdSecao
    End Property

    Public Property Let CdSecao(val)
	    m_cdSecao = val
    End Property

    Public Property Get CdFuncao()
	    CdFuncao = m_cdFuncao
    End Property

    Public Property Let CdFuncao(val)
	    m_cdFuncao = val
    End Property

    Public Property Get CdLocal()
	    CdLocal = m_cdLocal
    End Property

    Public Property Let CdLocal(val)
	    m_cdLocal = val
    End Property

    Public Property Get Situacao()
	    Situacao = m_situacao
    End Property

    Public Property Let Situacao(val)
	    m_situacao = val
    End Property

    Public Property Get CdUsuarioAlt()
	    CdUsuarioAlt = m_cdUsuarioAlt
    End Property

    Public Property Let CdUsuarioAlt(val)
	    m_cdUsuarioAlt = val
    End Property

    Public Property Get DtAlteracao()
	    DtAlteracao = m_dtAlteracao
    End Property

    Public Property Let DtAlteracao(val)
	    m_dtAlteracao = val
    End Property

End Class
%>