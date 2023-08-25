<%
Class GrupoPermissao
    Public Table
    Public Sequence

    Public Display
    Public Metadata
    Public Columns
    Public ColTypes
    Public Required

    Private Sub Class_Initialize()
        Table = "GRUPO_PERMISSAO"
        Sequence = "CD_GRUPO_PERMISSAO_SQ"

        Display  = Array("Cуdigo"             , "Nome"        , "Descriзгo"    , "Situaзгo" , "Cуd. Usuбrio ALt." , "Dt. Alteraзгo" , "Cуd. Sistema")
        Metadata = Array("CdGrupoPermissao"   , "NmGrupo"     , "DsGrupo"      , "Situacao" , "CdUsuarioAlt"      , "DtAlteracao"   , "CdSistema")
	    Columns  = Array("CD_GRUPO_PERMISSAO" , "NM_GRUPO"    , "DS_GRUPO"     , "SITUACAO" , "CD_USUARIO_ALT"    , "DT_ALTERACAO"  , "CD_SISTEMA")
        ColTypes = Array("NUMBER"             , "VARCHAR2:50" , "VARCHAR2:100" , "CHAR:1"   , "NUMBER"            , "DATE"          , "NUMBER")
        Required = Array(True                 , True          , False          , True       , True                , True            , True)
    End Sub

    Private Sub Class_Terminate()
    End Sub

    '=============================
    'Atributos

    Private m_updateMetadata

    '---

    Private m_cdGrupoPermissao
    Private m_nmGrupo
    Private m_dsGrupo
    Private m_situacao
    Private m_cdUsuarioAlt
    Private m_dtAlteracao
    Private m_cdSistema


    '=============================
    'Propriedades

    Public Property Get UpdateMetadata()
        UpdateMetadata = m_updateMetadata
    End Property

    Public Property Let UpdateMetadata(val)
        m_updateMetadata = val
    End Property

    '---

    Public Property Get CdGrupoPermissao()
	    CdGrupoPermissao = m_cdGrupoPermissao
    End Property

    Public Property Let CdGrupoPermissao(val)
	    m_cdGrupoPermissao = val
    End Property

    Public Property Get NmGrupo()
	    NmGrupo = m_nmGrupo
    End Property

    Public Property Let NmGrupo(val)
	    m_nmGrupo = val
    End Property

    Public Property Get DsGrupo()
	    DsGrupo = m_dsGrupo
    End Property

    Public Property Let DsGrupo(val)
	    m_dsGrupo = val
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

    Public Property Get CdSistema()
	    CdSistema = m_cdSistema
    End Property

    Public Property Let CdSistema(val)
	    m_cdSistema = val
    End Property

End Class
%>