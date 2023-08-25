<%
Const adCmdText         = 1
Const adCmdStoredProc   = 4
Const adCmdUnknown      = 8

Const adUseClient       = 3
Const adOpenForwardOnly = 0

Const adChar            = 129
Const adDate            = 7
Const adDecimal         = 14
Const adEmpty           = 0
Const adInteger         = 3
Const adNumeric         = 131
Const adVarChar         = 200

Const adParamInput      = 1
Const adParamOutput     = 2

Dim oConn
Set oConn = Nothing

Public Function DbOpenConnection()
    If oConn Is Nothing Then
        Set oConn = CreateObject("ADODB.Connection")

        oConn.Mode = 3

        If IsTest Then
            oConn.ConnectionString = connectionStringIntrates
        Else
            oConn.ConnectionString = connectionStringIntranet
        End If

        oConn.Open
    End If

    Set DbOpenConnection = oConn
End Function

Public Function DbCloseConnection()
    If not oConn Is Nothing Then
        oConn.Close

        Set oConn = Nothing
    End If

    Set DbCloseConnection = oConn
End Function

Public Function DbExecute(sql)
    Dim oConnection

    Set oConnection = DbOpenConnection()
    Set DbExecute = oConnection.execute(sql)
End Function

Public Function DbAddParameters( ByRef objCommand,  values)
    'Set objCommand=Server.CreateObject("ADODB.command")

    If Not IsArray( values) Then
        DbAddParameters = False

        Exit Function
    End If

    If objCommand.Parameters.Count = UBound (values)+1 Then
        For i=0 to objCommand.Parameters.Count -1
            'objCommand.Parameters(i) = values(i)
            objCommand.Parameters(i) = DBSafeValue  (objCommand.Parameters(i), values(i))
        Next

        DbAddParameters = True
    Else
        DbAddParameters = False

        Exit Function
    End If
End Function

Function DBSafeValue(param, value)
    If Not TypeName(param) = "Parameter" Then
        Exit Function
    End If

    If IsNothing(value)or (value = "")  Then
        DBSafeValue = null
    Else
        Select Case param.Type
            Case 129,130,200,201,202,203:
                If (param.Size<>-1) And (Len(CStr(value))> param.Size) Then
                    Err.Raise 8, "db utilites: DBSafeAssign ", "string is too long(" & value & ")"
                End If

                DBSafeValue = CStr(value)

            Case 72:
                DBSafeValue = CStr(value)

            Case  7,135:
                DBSafeValue = CDate(value)

            Case 20,3,131,2,17 :
                DBSafeValue = CLng(value)

            Case 4,5,14,6 :
                DBSafeValue = CDbl(value)

            Case 11:
                DBSafeValue = CBool(value)

            Case Else:
                Err.Raise 8, "db utilites: DBSafeAssign ", "unsupported type(" & param.Type & ") of database field"
        End Select
    End If
End Function

'=============================
'Procedure

Class ParameterProcedure
    Private m_name
    Private m_tipo
    Private m_direction
    Private m_size
    Private m_value

    Public Property Get Name()
	    Name = m_name
    End Property

    Public  Property Let Name(val)
	    m_name = val
    End Property

    Public Property Get Tipo()
	    Tipo = m_tipo
    End Property

    Public  Property Let Tipo(val)
	    m_tipo = val
    End Property

    Public Property Get Direction()
	    Direction = m_direction
    End Property

    Public  Property Let Direction(val)
	    m_direction = val
    End Property

    Public Property Get Size()
	    Size = m_size
    End Property

    Public  Property Let Size(val)
	    m_size = val
    End Property

    Public Property Get Value()
	    Value = m_value
    End Property

    Public  Property Let Value(val)
	    m_value = val
    End Property
End Class

Class RecordsetDb
    Private m_collumns
    Private m_values

    Public Property Get Collumns()
	    Collumns = m_collumns
    End Property

    Public  Property Let Collumns(val)
	    m_collumns = val
    End Property

    Public Property Get Values()
	    Values = m_values
    End Property

    Public  Property Let Values(val)
	    m_values = val
    End Property

    Public Function GetColumnIndex(pColumn)
        Dim i, find

        i = 0
        find = False

        For Each vColumn In m_collumns
            If UCase(vColumn) = UCase(pColumn) Then
                find = True

                Exit For
            End If

            i = i + 1
        Next

        If Not find Then
            i = -1
        End If

        GetColumnIndex = i
    End Function

    Public Function GetRowIndexById(pId)
        Dim i, x, find

        i = 0
        find = False

        For x = 0 To Count - 1
            If CStr(m_values(0, x)) = CStr(Nvl(pId,"")) Then
                find = True

                Exit For
            End If

            i = i + 1
        Next

        If Not find Then
            i = -1
        End If

        GetRowIndexById = i
    End Function

    Public Function GetValue(pColumn, pValIndex)
        Dim vColumnIndex
        vColumnIndex = GetColumnIndex(pColumn)

        If vColumnIndex = -1 Then
            GetValue = ""
        Else
            GetValue = m_values(vColumnIndex, pValIndex)
        End If
    End Function

    Public Function GetValueById(pColumn, pId)
        Dim vColumnIndex, vRowIndex
        vColumnIndex = GetColumnIndex(pColumn)
        vRowIndex    = GetRowIndexById(pId)

        If vColumnIndex = -1 Or vRowIndex = -1 Then
            GetValueById = null
        Else
            GetValueById = m_values(vColumnIndex, vRowIndex)
        End If
    End Function

    Public Function GetMaxValue(pColumn)
        Dim vColumnIndex, vMaxValue, i
        vColumnIndex = GetColumnIndex(pColumn)

        If vColumnIndex = -1 Then
            GetMaxValue = null
        Else
            vMaxValue = iif(IsNothing(m_values(vColumnIndex, 0)), null, CDbl(Nvl(m_values(vColumnIndex, 0), 0)))

            For i = 1 To Ubound(m_values, 2) Step 1
               If iif(IsNothing(m_values(vColumnIndex, i)), false, CDbl(Nvl(m_values(vColumnIndex, i),0)) > vMaxValue Or IsNull(vMaxValue)) Then
                  vMaxValue = CDbl(Nvl(m_values(vColumnIndex, i),0))
               End If
            Next

            GetMaxValue = vMaxValue
        End If
    End Function

    Public Function GetMinValue(pColumn)
        Dim vColumnIndex, vMinValue, i
        vColumnIndex = GetColumnIndex(pColumn)

        If vColumnIndex = -1 Then
            GetMinValue = null
        Else
            vMinValue = iif(IsNothing(m_values(vColumnIndex, 0)), null, CDbl(Nvl(m_values(vColumnIndex, 0), 0)))

            For i = 1 To Ubound(m_values, 2) Step 1
               If iif(IsNothing(m_values(vColumnIndex, i)), false, CDbl(Nvl(m_values(vColumnIndex, i),0)) < vMinValue Or IsNull(vMinValue)) Then
                  vMinValue = CDbl(Nvl(m_values(vColumnIndex, i),0))
               End If
            Next

            GetMinValue = vMinValue
        End If
    End Function

    Public Function SetValue(pColumn, pValIndex, pValue)
        Dim vColumnIndex
        vColumnIndex = GetColumnIndex(pColumn)

        If vColumnIndex > -1 Then
            m_values(vColumnIndex, pValIndex) = pValue
        End If
    End Function

    Public Function SetValueById(pColumn, pId, pValue)
        Dim vColumnIndex, vRowIndex
        vColumnIndex = GetColumnIndex(pColumn)
        vRowIndex    = GetRowIndexById(pId)

        If vColumnIndex > -1 And vRowIndex > -1 Then
            m_values(vColumnIndex, vRowIndex) = pValue
        End If
    End Function

    Public Function Count()
        Count = Ubound(m_values, 2) + 1
    End Function

End Class

Public Function NewDbParameter(pName, pTipo, pDirection, pSize, pValue)
    Dim parameter

    Set parameter = new ParameterProcedure

    parameter.Name      = pName
    parameter.Tipo      = pTipo
    parameter.Direction = pDirection
    parameter.Size      = pSize
    parameter.Value     = pValue

    Set NewDbParameter = parameter
End Function

Public Function GetSQLQuery(pSqlName, pArrParameters, pArrValues)
    Dim strQuery, vParameter, i

    strQuery = ""

    i = 0

    If FileExists("Sql\" & pSqlName & ".sql") Then
        strQuery = FileToString(Server.MapPath("Sql") & "\" & pSqlName & ".sql", "ISO-8859-1")
    End If

    For Each vParameter in pArrParameters
        strQuery = Replace(strQuery, "&"&vParameter, pArrValues(i))
        
        i = i + 1
    Next

    GetSQLQuery = strQuery
End Function

Public Function ExecProcedure(pNomeProcedure, pParametros, withReturn)
    Set objCommand = Server.CreateObject("ADODB.command")
        objCommand.ActiveConnection = DbOpenConnection()
        objCommand.CommandType = adCmdText
        objCommand.CommandText = "{CALL " & pNomeProcedure & "(" & pParametros & ")}"

    If withReturn Then
        Dim rs, rsProc, cols
        
        Set rs = objCommand.Execute

        ReDim cols(rs.Fields.Count - 1)
        For n = 0 To rs.Fields.Count - 1 Step 1
            cols(n) = rs.Fields(n).Name
        Next

        If Not rs.EOF Or Not rs.BOF Then
            Dim arrRows
            arrRows = rs.GetRows()

            Set rsProc = new RecordsetDb
            rsProc.Collumns = cols
            rsProc.Values = arrRows

            Set ExecProcedure = rsProc
        Else
            Set ExecProcedure = Nothing
        End If
    Else
        objCommand.Execute
        
        ExecProcedure = True
    End If
    
    DbCloseConnection()
End Function

Public Function ExecProcedureJson(pNomeProcedure, pParametros)
    Set objCommand = Server.CreateObject("ADODB.command")
        objCommand.ActiveConnection = DbOpenConnection()
        objCommand.CommandType = adCmdText
        objCommand.CommandText = "{CALL " & pNomeProcedure & "(" & pParametros & ")}"

    Dim rs

    Set rs = objCommand.Execute

    If Not rs.EOF Or Not rs.BOF Then
        Dim jsa

        Set jsa = jsArray()

        While Not (rs.EOF Or rs.BOF)
            Set jsa(Null) = jsObject()

            For Each col In rs.Fields
                jsa(Null)(col.Name) = jsEncode(col.Value)
            Next

            rs.MoveNext
        Wend

        Set ExecProcedureJson = jsa
    Else
        Set ExecProcedureJson = jsArray()
    End If
    
    DbCloseConnection()
End Function

Public Function ExecCommandText(pCommandText, withReturn)
    Set objCommand = Server.CreateObject("ADODB.command")
        objCommand.ActiveConnection = DbOpenConnection()
        objCommand.CommandType = adCmdText
        objCommand.CommandText = pCommandText

    If withReturn Then
        Dim rs, rsProc, cols
        
        Set rs = objCommand.Execute

        ReDim cols(rs.Fields.Count - 1)
        For n = 0 To rs.Fields.Count - 1 Step 1
            cols(n) = rs.Fields(n).Name
        Next

        If Not rs.EOF Or Not rs.BOF Then
            Dim arrRows
            arrRows = rs.GetRows()

            Set rsCommand = new RecordsetDb
            rsCommand.Collumns = cols
            rsCommand.Values = arrRows

            Set ExecCommandText = rsCommand
        Else
            Set ExecCommandText = Nothing
        End If
    Else
        objCommand.Execute
        
        ExecCommandText = True
    End If
    
    DbCloseConnection()
End Function

Public Function ExecCommandTextJson(pCommandText)
    Set objCommand = Server.CreateObject("ADODB.command")
        objCommand.ActiveConnection = DbOpenConnection()
        objCommand.CommandType = adCmdText
        objCommand.CommandText = pCommandText

    Dim rs

    Set rs = objCommand.Execute

    If Not rs.EOF Or Not rs.BOF Then
        Dim jsa

        Set jsa = jsArray()

        While Not (rs.EOF Or rs.BOF)
            Set jsa(Null) = jsObject()

            For Each col In rs.Fields
                jsa(Null)(col.Name) = jsEncode(col.Value)
            Next

            rs.MoveNext
        Wend

        Set ExecCommandTextJson = jsa
    Else
        Set ExecCommandTextJson = jsArray()
    End If
    
    DbCloseConnection()
End Function

Public Function GravarLogHistorico(pCdLogDescricao, pTabela, pCampo, pCdRegistro)
    Dim vCdSistema, vCdUsuario, vRet

    vRet = False

    If IsEmpty(CdSistema) Or IsNull(CdSistema) Then
        vCdSistema = -1
    Else
        vCdSistema = CdSistema
    End If

    If len(Session("CdUsuario")) > 0 Then
        vCdUsuario = CStr(Session("CdUsuario"))

        ExecProcedure "GRAVAR_LOG_HISTORICO_SPR", CStr(pCdLogDescricao) & "," & CStr(vCdUsuario) & ",'" & CStr(pTabela) & "','" & CStr(pCampo) & "'," & CStr(pCdRegistro) & "," & CStr(vCdSistema), False

        vRet = True
    End If

    GravarLogHistorico = vRet
End Function

Public Function GravarLogAcesso(pCdUsuario, pUsuario, pStatus, pMensagem)
    Dim vCdSistema, vCdUsuario, vComputador, vRet

    vRet = False

    If IsEmpty(CdSistema) Or IsNull(CdSistema) Then
        vCdSistema = -1
    Else
        vCdSistema = CdSistema
    End If

    vComputador = GetHostName()

    If pUsuario <> "" Then
        If IsEmpty(pCdUsuario) Or IsNull(pCdUsuario) Then
            pCdUsuario = "NULL"
        End If

        ExecProcedure "GRAVAR_LOG_ACESSO_SPR", CStr(pCdUsuario) & ",'" & CStr(vComputador) & "','" & CStr(pUsuario) & "','" & CStr(pStatus) & "','" & CStr(pMensagem) & "'," & CStr(vCdSistema), False

        vRet = True
    End If

    GravarLogAcesso = vRet
End Function

Public Function GravarLogExcecao(pNumero, pDescricao, pOrigem, pController, pAction, pRoute)
    Dim vCdSistema, vCdUsuario, vComputador, vRet

    Set vRet = new RecordsetDb

    If IsEmpty(CdSistema) Or IsNull(CdSistema) Then
        vCdSistema = -1
    Else
        vCdSistema = CdSistema
    End If

    vComputador = GetHostName()

    If pNumero <> "" Then
        If len(Session("CdUsuario")) > 0 Then
            vCdUsuario = CStr(Session("CdUsuario"))
        Else
            vCdUsuario = "NULL"
        End If

        Set vRet = ExecProcedure("GRAVAR_LOG_EXCECAO_SPR", CStr(vCdSistema) & "," & CStr(vCdUsuario) & "," & CStr(pNumero) & ",q'[" & CStr(pDescricao) & "]',q'[" & CStr(pOrigem) & "]','" & CStr(pController) & "','" & CStr(pAction) & "',q'[" & CStr(pRoute) & "]','" & CStr(vComputador) & "'", True)
    End If

    Set GravarLogExcecao = vRet
End Function
%>