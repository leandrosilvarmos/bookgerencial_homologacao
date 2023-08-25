<%
Class Login
    Public Table
    Public Sequence

    Public Display
    Public Metadata
    Public Columns
    Public ColTypes
    Public Required

    Private Sub Class_Initialize()
        Table = "BOOK_LOGIN"
        Sequence = "BOOK_CD_LOGIN_SQ"

        Display  = Array("Cуdigo"   , "Cod. Usuбrio" , "Login"       , "Situaзгo" , "Dt. Alteraзгo" , "Cod. Usuбrio Alt." , "Senha")
        Metadata = Array("CdLogin"  , "CdUsuario"    , "DsLogin"     , "Situacao" , "DtAlteracao"   , "CdUsuarioAlt"      , "DsSenha")
	    Columns  = Array("CD_LOGIN" , "CD_USUARIO"   , "DS_LOGIN"    , "SITUACAO" , "DT_ALTERACAO"  , "CD_USUARIO_ALT"    , "DS_SENHA")
        ColTypes = Array("NUMBER"   , "NUMBER"       , "VARCHAR2:35" , "CHAR:1"   , "DATE"          , "NUMBER"            , "VARCHAR2:100")
        Required = Array(True       , True           , True          , True       , True            , True                , False)
    End Sub

    Private Sub Class_Terminate()
    End Sub

    '=============================
    'Atributos

    Private m_updateMetadata

    '---

    Private m_cdLogin
    Private m_cdUsuario
    Private m_dsLogin
    Private m_situacao
    Private m_dtAlteracao
    Private m_cdUsuarioAlt
    Private m_dsSenha


    '=============================
    'Propriedades

    Public Property Get UpdateMetadata()
        UpdateMetadata = m_updateMetadata
    End Property

    Public Property Let UpdateMetadata(val)
        m_updateMetadata = val
    End Property

    '---

    Public Property Get CdLogin()
	    CdLogin = m_cdLogin
    End Property

    Public Property Let CdLogin(val)
	    m_cdLogin = val
    End Property

    Public Property Get CdUsuario()
	    CdUsuario = m_cdUsuario
    End Property

    Public Property Let CdUsuario(val)
	    m_cdUsuario = val
    End Property

    Public Property Get DsLogin()
	    DsLogin = m_dsLogin
    End Property

    Public Property Let DsLogin(val)
	    m_dsLogin = val
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
	    CdUsuarioAlt = m_cdUsuarioAlt
    End Property

    Public Property Let CdUsuarioAlt(val)
	    m_cdUsuarioAlt = val
    End Property

    Public Property Get DsSenha()
	    DsSenha = m_dsSenha
    End Property

    Public Property Let DsSenha(val)
	    m_dsSenha = val
    End Property

End Class
%>