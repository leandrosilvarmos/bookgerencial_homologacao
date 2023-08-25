<%
Class Permissao
    Public Table
    Public Sequence

    Public Display
    Public Metadata
    Public Columns
    Public ColTypes
    Public Required

    Private Sub Class_Initialize()
        Table = "PERMISSAO"
        Sequence = "CD_PERMISSAO_SQ"

        Display  = Array("Cуdigo"       , "Cуd. Grupo Permissгo" , "Cуd. Usuбrio" , "Cуd. Sistema" , "Criar"  , "Listar" , "Visualizar" , "Editar" , "Deletar" , "Cуd. Usuario Alt." , "Dt. Alteraзгo" , "Situaзгo" , "Cуd. Controller" , "Cуd. Item")
        Metadata = Array("CdPermissao"  , "CdGrupoPermissao"     , "CdUsuario"    , "CdSistema"    , "Criar"  , "Listar" , "Visualizar" , "Editar" , "Deletar" , "CdUsuarioAlt"      , "DtAlteracao"   , "Situacao" , "CdController"    , "CdItem")
	    Columns  = Array("CD_PERMISSAO" , "CD_GRUPO_PERMISSAO"   , "CD_USUARIO"   , "CD_SISTEMA"   , "CRIAR"  , "LISTAR" , "VISUALIZAR" , "EDITAR" , "DELETAR" , "CD_USUARIO_ALT"    , "DT_ALTERACAO"  , "SITUACAO" , "CD_CONTROLLER"   , "CD_ITEM")
        ColTypes = Array("NUMBER"       , "NUMBER"               , "NUMBER"       , "NUMBER"       , "NUMBER" , "NUMBER" , "NUMBER"     , "NUMBER" , "NUMBER"  , "NUMBER"            , "DATE"          , "CHAR:1"   , "NUMBER"          , "NUMBER")
        Required = Array(True           , False                  , False          , True           , False    , True     , False        , False    , False     , True                , True            , True       , True              , False)
    End Sub

    Private Sub Class_Terminate()
    End Sub

    '=============================
    'Atributos

    Private m_updateMetadata

    '---

    Private m_cdPermissao
    Private m_cdGrupoPermissao
    Private m_cdUsuario
    Private m_cdSistema
    Private m_criar
    Private m_listar
    Private m_visualizar
    Private m_editar
    Private m_deletar
    Private m_cdUsuarioAlt
    Private m_dtAlteracao
    Private m_situacao
    Private m_cdController
    Private m_cdItem


    '=============================
    'Propriedades

    Public Property Get UpdateMetadata()
        UpdateMetadata = m_updateMetadata
    End Property

    Public Property Let UpdateMetadata(val)
        m_updateMetadata = val
    End Property

    '---

    Public Property Get CdPermissao()
	    CdPermissao = m_cdPermissao
    End Property

    Public Property Let CdPermissao(val)
	    m_cdPermissao = val
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

    Public Property Get CdSistema()
	    CdSistema = m_cdSistema
    End Property

    Public Property Let CdSistema(val)
	    m_cdSistema = val
    End Property

    Public Property Get Criar()
	    Criar = m_criar
    End Property

    Public Property Let Criar(val)
	    m_criar = val
    End Property

    Public Property Get Listar()
	    Listar = m_listar
    End Property

    Public Property Let Listar(val)
	    m_listar = val
    End Property

    Public Property Get Visualizar()
	    Visualizar = m_visualizar
    End Property

    Public Property Let Visualizar(val)
	    m_visualizar = val
    End Property

    Public Property Get Editar()
	    Editar = m_editar
    End Property

    Public Property Let Editar(val)
	    m_editar = val
    End Property

    Public Property Get Deletar()
	    Deletar = m_deletar
    End Property

    Public Property Let Deletar(val)
	    m_deletar = val
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

    Public Property Get Situacao()
	    Situacao = m_situacao
    End Property

    Public Property Let Situacao(val)
	    m_situacao = val
    End Property

    Public Property Get CdController()
	    CdController = m_cdController
    End Property

    Public  Property Let CdController(val)
	    m_cdController = val
    End Property

    Public Property Get CdItem()
	    CdItem = m_cdItem
    End Property

    Public Property Let CdItem(val)
	    m_cdItem = val
    End Property

End Class
%>