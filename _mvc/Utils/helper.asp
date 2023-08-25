<%
'======================
Class Helper

    Dim selectSQL
    Dim ObjModel
    Dim ClassName

    Private Sub Class_Initialize()
    End Sub

    Private Sub Class_Terminate()
    End Sub

    Public Default Function Construct(pClassName)
        ClassName = pClassName

        Set ObjModel = Eval("new " & ClassName)

        Set Construct = Me
    End Function

    '=============================
    'Funções

    Public Function StrColumns()
        Dim vStrColumns

        vStrColumns = ArrayToString(ObjModel.Columns)

        StrColumns = vStrColumns
    End Function

    '---
    Public Function ArrIndexMetaToStrColumns(arrIndex)
        Dim vRetStr, i

        vRetStr = ""

        For Each i In arrIndex
            If i <> -1 Then
                If vRetStr <> "" Then
                    vRetStr = vRetStr & ","
                End If

                vRetStr = vRetStr & ObjModel.Columns(i)
            End If
        Next

        ArrIndexMetaToStrColumns = vRetStr
    End Function

    '---
    Public Function ArrFiltrosToStrColumns(arrFiltros)
        Dim vRetStr

        vRetStr = ""

        For Each filtro In arrFiltros
            vRetStr = vRetStr & " " & filtro.OperadorRel
            vRetStr = vRetStr & " " & GetObjMetadataColumn(ObjModel, filtro.Meta)
            vRetStr = vRetStr & " " & filtro.OperadorLog
            vRetStr = vRetStr & " " & filtro.Value
        Next

        ArrFiltrosToStrColumns = vRetStr
    End Function

    '---
    Public Function ArrOrderByToStrColumns(arrOrderBy)
        Dim vRetStr

        vRetStr = ""

        For Each orderBy In arrOrderBy
            If vRetStr <> "" Then
                vRetStr = vRetStr & ","
            End If

            vRetStr = vRetStr & " " & GetObjMetadataColumn(ObjModel, orderBy.Meta) & " " & orderBy.Tipo
        Next

        ArrOrderByToStrColumns = vRetStr
    End Function

    '---
    Public Function ObjToStrColumns(ByRef obj)
        Dim vRetStr, i

        vRetStr = ""

        For Each vUpdMeta In obj.UpdateMetadata
            If vRetStr <> "" Then
                vRetStr = vRetStr & ","
            End If

            i = GetMetadataIndex(vUpdMeta)

            If i <> -1 Then
                vRetStr = vRetStr & obj.Columns(i)
            End If
        Next

        ObjToStrColumns = vRetStr
    End Function

    '---
    Public Function ObjToStrValues(ByRef obj)
        Dim vRetStr, i

        vRetStr = ""

        For Each vUpdMeta In obj.UpdateMetadata
            If vRetStr <> "" Then
                vRetStr = vRetStr & ","
            End If

            i = GetMetadataIndex(vUpdMeta)

            If i <> -1 Then
                vRetStr = vRetStr & RetSqlValue(Eval("obj." & vUpdMeta), obj.ColTypes(i))
            End If
        Next

        ObjToStrValues = vRetStr
    End Function

    '---
    Public Function ObjToStrColumnsValues(ByRef obj)
        Dim vRetStr, i

        vRetStr = ""

        For Each vUpdMeta In obj.UpdateMetadata
            If vRetStr <> "" Then
                vRetStr = vRetStr & ","
            End If

            i = GetMetadataIndex(vUpdMeta)

            If i <> -1 Then
                vRetStr = vRetStr & obj.Columns(i) & " = " & RetSqlValue(Eval("obj." & vUpdMeta), obj.ColTypes(i))
            End If
        Next

        ObjToStrColumnsValues = vRetStr
    End Function

    '----
    Public Function GetMetadataIndex(pMetadata)
        GetMetadataIndex = GetObjMetadataIndex(ObjModel, pMetadata)
    End Function

    '---
    Public Function RetIndexMetadata()
        Dim vRet

        vRet = ObjModel.Metadata(0)

        RetIndexMetadata = vRet
    End Function

    '---
    Public Function RetMetadataValue(obj, pMetadata)
        Dim vRet

        Execute("vRet = obj." & pMetadata)

        RetMetadataValue = vRet
    End Function

    '---
    Public Function RetSqlValue(pValue, pType)
        Dim vRet, vType

        vType = Split(pType,":")

        Select Case UCase(vType(0))
            Case "NUMBER"
                If IsNull(pValue) Or IsEmpty(pValue) Or pValue = "" Then
                    vRet = "NULL"
                Else
                    vRet = pValue
                End If
            Case "VARCHAR2"
                vRet = "q'[" & pValue & "]'"
            Case "CHAR"
                vRet = "'" & pValue & "'"
            Case "DATE"
                If IsNull(pValue) Or IsEmpty(pValue) Or pValue = "" Then
                    vRet = "NULL"
                ElseIf UCase(pValue) = "SYSDATE" Then
                    vRet = "SYSDATE"
                Else
                    vRet = "TO_DATE('" & pValue & "','" & vType(1) & "')"
                End If
            Case Else
                vRet = pValue
        End Select

        RetSqlValue = vRet
    End Function

    '=============================
    'CRUD

    ' Inserir
    Public Function Insert(ByRef obj)
        Dim strSQL, strSQLId , execResult, vCdObj

        strSQL = " INSERT INTO " & ObjModel.Table & " (" & ObjToStrColumns(obj) & ")" & _
                 " VALUES (" & ObjToStrValues(obj)  & ")"

        Set objCommand = Server.CreateObject("ADODB.command")
            objCommand.ActiveConnection = DbOpenConnection()
            objCommand.NamedParameters = False
            objCommand.CommandText = strSQL
            objCommand.CommandType = adCmdText

        Set execResult = objCommand.Execute

        If ObjModel.Sequence <> "" Then
            strSQLId = " SELECT " & ObjModel.Sequence & ".CURRVAL FROM DUAL"

            objCommand.CommandText = strSQLId

            Set execResult = objCommand.Execute

            vCdObj = CInt(execResult(0))

            Execute("obj." & obj.Metadata(0) & " = vCdObj ")
        Else
            Execute("vCdObj = obj." & obj.Metadata(0))
        End If

        DbCloseConnection()

        GravarLogHistorico 1, ObjModel.Table, "", vCdObj '1 - Insert

        Insert = True
    End Function

    ' Atualizar
    Public Function Update(obj)
        Dim strSQL, vCdObj
           
        vCdObj = RetMetadataValue(obj, RetIndexMetadata())

        strSQL = "UPDATE " & ObjModel.Table & " SET " & ObjToStrColumnsValues(obj) & " WHERE " & ObjModel.Columns(0) & " = " & vCdObj & " "

        Set objCommand = Server.CreateObject("ADODB.command")
            objCommand.ActiveConnection = DbOpenConnection()
            objCommand.NamedParameters = False
            objCommand.CommandText = strSQL
            objCommand.CommandType = adCmdText

        objCommand.Execute

        DbCloseConnection()

        GravarLogHistorico 2, ObjModel.Table, "", vCdObj '2 - Update

        Update = True
    End Function

    ' Deletar
    Public Function Delete(Id)
        Dim strSQL
            strSQL = "DELETE FROM " & ObjModel.Table & " WHERE " & ObjModel.Columns(0) & " = " & Id & " "

        Set objCommand = Server.CreateObject("ADODB.command")
            objCommand.ActiveConnection = DbOpenConnection()
            objCommand.NamedParameters = False
            objCommand.CommandText = strSQL
            objCommand.CommandType = adCmdText

            objCommand.Execute

        DbCloseConnection()

        GravarLogHistorico 3, ObjModel.Table, "", Id '3 - Delete

        Delete = True
    End Function

    ' Consultar
    Public Function SelectBy(arrCampos, arrFiltros, arrOrderBy)
        Dim records, vSqlOrder, vStrCampos, vStrFiltro, arrIndexCampos

        vStrFiltro = ""
        vSqlOrder  = ""
        
        arrIndexCampos  = GetArrMetadataIndex(ObjModel, arrCampos)

        If Ubound(arrFiltros) > -1 Then
            vStrFiltro = " WHERE " & ArrFiltrosToStrColumns(arrFiltros)
        End If

        If Ubound(arrOrderBy) > -1 Then
            vSqlOrder = " ORDER BY " & ArrOrderByToStrColumns(arrOrderBy)
        End If

        Set objCommand = Server.CreateObject("ADODB.command")
            objCommand.ActiveConnection = DbOpenConnection()
            objCommand.NamedParameters = False
            objCommand.CommandText = " SELECT " & ArrIndexMetaToStrColumns(arrIndexCampos) & " FROM " & ObjModel.Table & vStrFiltro & vSqlOrder
            objCommand.CommandType = adCmdText

        Set records = objCommand.Execute

        If records.eof Then
            Set SelectBy = Nothing
        Else
            Dim results, obj, record

            Set results = Server.CreateObject("Scripting.Dictionary")

            While not records.eof
                Set obj = PopulateObjectFromRecordArrIndex(records, arrIndexCampos)
                results.Add Eval("obj." & obj.Metadata(0)), obj
                records.MoveNext
            Wend

            Set SelectBy = results

            records.Close
        End If

        Set records = Nothing

        DbCloseConnection()
    End Function

    ' Consultar Por Id
    Public Function SelectById(id)
        Dim record

        Set objCommand = Server.CreateObject("ADODB.command")
            objCommand.ActiveConnection = DbOpenConnection()
            objCommand.NamedParameters = False
            objCommand.CommandText = " SELECT " & StrColumns() & " FROM " & ObjModel.Table & " WHERE " & ObjModel.Columns(0) & "=" & id & " "
            objCommand.CommandType = adCmdText

        Set record = objCommand.Execute
        Set SelectById = PopulateObjectFromRecord(record)

        record.Close

        Set record = Nothing

        DbCloseConnection()
    End Function

    ' Listar Todos
    Public Function SelectAll()
        Dim records

        Set objCommand = Server.CreateObject("ADODB.command")
            objCommand.ActiveConnection = DbOpenConnection()
            objCommand.NamedParameters = False
            objCommand.CommandText = " SELECT " & StrColumns() & " FROM " & ObjModel.Table & " "
            objCommand.CommandType = adCmdText

        Set records = objCommand.Execute

        If records.eof Then
            Set SelectAll = Nothing
        Else
            Dim results, obj, record

            Set results = Server.CreateObject("Scripting.Dictionary")

            While not records.eof
                Set obj = PopulateObjectFromRecord(records)
                results.Add Eval("obj." & obj.Metadata(0)), obj
                records.MoveNext
            Wend

            Set SelectAll = results

            records.Close
        End If

        Set records = Nothing

        DbCloseConnection()
    End Function

    ' Listar Todos Com Ordenação
    Public Function SelectAllOrderBy(pOrder)
        Dim records, vSqlOrder

        vSqlOrder = ""

        If pOrder <> "" Then
            vSqlOrder = "ORDER BY " & pOrder
        End If

        Set objCommand = Server.CreateObject("ADODB.command")
            objCommand.ActiveConnection = DbOpenConnection()
            objCommand.NamedParameters = False
            objCommand.CommandText = " SELECT " & StrColumns() & " FROM " & ObjModel.Table & " " & vSqlOrder
            objCommand.CommandType = adCmdText

        Set records = objCommand.Execute

        If records.eof Then
            Set SelectAll = Nothing
        Else
            Dim results, obj, record

            Set results = Server.CreateObject("Scripting.Dictionary")

            While not records.eof
                Set obj = PopulateObjectFromRecord(records)
                results.Add Eval("obj." & obj.Metadata(0)), obj
                records.MoveNext
            Wend

            Set SelectAllOrderBy = results

            records.Close
        End If

        Set records = Nothing

        DbCloseConnection()
    End Function

    ' Consultar Por Campo
    Public Function SelectByField(fieldName, value)
        Dim records

        Set objCommand = Server.CreateObject("ADODB.command")
            objCommand.ActiveConnection = DbOpenConnection()
            objCommand.NamedParameters = False
            objCommand.CommandText = " SELECT " & StrColumns() & " FROM " & ObjModel.Table & " WHERE " & fieldName & "=" & value & " "
            objCommand.CommandType = adCmdText

        Set records = objCommand.Execute

        If records.eof Then
            Set SelectByField = Nothing
        Else
            Dim results, obj, record

            Set results = Server.CreateObject("Scripting.Dictionary")

            While not records.eof
                Set obj = PopulateObjectFromRecord(records)
                results.Add Eval("obj." & obj.Metadata(0)), obj
                records.MoveNext
            Wend

            Set SelectByField = results

            records.Close
        End If

        Set records = Nothing

        DbCloseConnection()
    End Function

    '=============================
    'Populate

    Private Function PopulateObjectFromRecord(record)
        If record.eof Then
            Set PopulateObjectFromRecord = Nothing
        Else
            Dim obj, i

            Set obj = Eval("new " & ClassName)

            For i = 0 To (record.Fields.Count - 1)
                Execute("obj." & obj.Metadata(i) & " = record(" & chr(34) & obj.Columns(i) & chr(34) & ")")
            Next

            Set PopulateObjectFromRecord = obj
        End If
    End Function

    '-----
    Private Function PopulateObjectFromRecordArrIndex(record, arrIndex)
        If record.eof Then
            Set PopulateObjectFromRecord = Nothing
        Else
            Dim obj, i

            Set obj = Eval("new " & ClassName)

            For Each i In arrIndex
                Execute("obj." & ObjModel.Metadata(i) & " = record(" & chr(34) & ObjModel.Columns(i) & chr(34) & ")")
            Next

            Set PopulateObjectFromRecordArrIndex = obj
        End If
    End Function

    '-----
    Public Function PopulateObjectFromArgs(args, bind)
        If IsEmpty(args) Or IsNull(args) Then
            Set PopulateObjectFromArgs = Nothing
        Else
            Dim obj, i

            Set obj = Eval("new " & ClassName)

            For Each item In bind
                Execute("obj." & item & " = args(" & chr(34) & item & chr(34) & ")")
            Next

            obj.UpdateMetadata = bind

            Set PopulateObjectFromArgs = obj
        End If
    End Function

End Class 'Helper
%>