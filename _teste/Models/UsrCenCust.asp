<%
Class UsrCenCust
    Public Table
    Public Sequence

    Public Display
    Public Metadata
    Public Columns
    Public ColTypes
    Public Required

    Private Sub Class_Initialize()
        Table = "BOOK_USR_CENTRO_CUSTO"
        Sequence = "BOOK_CD_CTRL_USR_CEN_CUST_SQ"

        Display  = Array("Cуdigo"      , "Cуd. Grupo Permissгo" , "Cуd. Usuбrio" , "Cуd. Centro Custo" , "Situaзгo")
        Metadata = Array("CdControle"  , "CdGrupoPermissao"     , "CdUsuario"    , "CdCentroCusto"     , "Situacao")
	    Columns  = Array("CD_CONTROLE" , "CD_GRUPO_PERMISSAO"   , "CD_USUARIO"   , "CD_CENTRO_CUSTO"   , "SITUACAO")
        ColTypes = Array("NUMBER"      , "NUMBER"               , "NUMBER"       , "NUMBER"            , "CHAR:1")
        Required = Array(True          , False                  , False          , True                , True)
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
    Private m_cdCentroCusto
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

    Public Property Get CdCentroCusto()
	    CdCentroCusto = m_cdCentroCusto
    End Property

    Public Property Let CdCentroCusto(val)
	    m_cdCentroCusto = val
    End Property

    Public Property Get Situacao()
	    Situacao = m_situacao
    End Property

    Public Property Let Situacao(val)
	    m_situacao = val
    End Property

End Class
%>