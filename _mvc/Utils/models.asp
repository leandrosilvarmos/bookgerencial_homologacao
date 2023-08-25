<%
    Class EnumClass
        Private m_valor
        Private m_descricao
        
        Public Property Get Valor()
            Valor = m_valor
        End Property

        Public Property Let Valor(val)
            m_valor = val
        End Property

        Public Property Get Descricao()
            Descricao = m_descricao
        End Property

        Public Property Let Descricao(val)
            m_descricao = val
        End Property
    End Class

    Class FiltroClass
        Private m_meta
        Private m_value
        Private m_operadorLog
        Private m_operadorRel
        
        Public Property Get Meta()
	        Meta = m_meta
        End Property

        Public Property Let Meta(val)
	        m_meta = val
        End Property

        Public Property Get Value()
	        Value = m_value
        End Property

        Public Property Let Value(val)
	        m_value = val
        End Property

        Public Property Get OperadorLog()
	        OperadorLog = m_operadorLog
        End Property

        Public Property Let OperadorLog(val)
	        m_operadorLog = val
        End Property

        Public Property Get OperadorRel()
	        OperadorRel = m_operadorRel
        End Property

        Public Property Let OperadorRel(val)
	        m_operadorRel = val
        End Property
    End Class

    Class OrderByClass
        Private m_meta
        Private m_tipo
        
        Public Property Get Meta()
	        Meta = m_meta
        End Property

        Public Property Let Meta(val)
	        m_meta = val
        End Property

        Public Property Get Tipo()
	        Tipo = m_tipo
        End Property

        Public Property Let Tipo(val)
	        m_tipo = val
        End Property
    End Class

    Public Function GetObjMetadataIndex(ByRef obj, pMetadata)
        Dim i, find

        i = 0
        find = False

        For Each vMetadata In obj.Metadata
            If vMetadata = pMetadata Then
                find = True

                Exit For
            End If

            i = i + 1
        Next

        If Not find Then
            i = -1
        End If

        GetObjMetadataIndex = i
    End Function

    Public Function GetObjMetadataColumn(ByRef obj, pMetadata)
        Dim i, find, vColumn

        vColumn = ""
        i = 0

        For Each vMetadata In obj.Metadata
            If vMetadata = pMetadata Then
                vColumn = obj.Columns(i)

                Exit For
            End If

            i = i + 1
        Next

        GetObjMetadataColumn = vColumn
    End Function

    Public Function GetArrMetadataIndex(ByRef obj, pArrMetadata)
        Dim i, j, find, arrIndex

        ReDim arrIndex(Ubound(pArrMetadata))

        i = 0
        j = 0
        find = False

        For j = 0 To Ubound(arrIndex)
            For Each vMetadata In obj.Metadata
                If vMetadata = pArrMetadata(j) Then
                    arrIndex(j) = i

                    find = True

                    Exit For
                End If

                i = i + 1
            Next

            If Not find Then
                arrIndex(j) = -1
            End If

            i = 0
            find = False
        Next

        GetArrMetadataIndex = arrIndex
    End Function

    Public Function GetEnumList(pNomeEnum)
        Dim List, valores
        Set List = Server.CreateObject("Scripting.Dictionary")
     
        valores = Texts.EnumValores(pNomeEnum)
        
        For Each item In Split(valores, "|")
            Dim objEnum, valor, descricao
        
            valor = Split(item,";")(0)
            descricao = Split(item,";")(1)

            Set objEnum = new EnumClass

            objEnum.Valor = valor
            objEnum.Descricao = descricao

            List.Add valor, objEnum
        Next

        Set GetEnumList = List
    End Function

    Public Function GetModelDisplay(pClassName, pMetadata)
        Dim ObjModel, i

        Set ObjModel = Eval("new " & pClassName)

        i = GetObjMetadataIndex(ObjModel, pMetadata)
        
        GetModelDisplay = ObjModel.Display(i)
    End Function

    Public Function GetFiltroObj(pOperadorRel, pMeta, pOperadorLog, pValue)
        Dim objFiltro

        Set objFiltro = new FiltroClass

        objFiltro.OperadorRel = pOperadorRel
        objFiltro.Meta        = pMeta
        objFiltro.OperadorLog = pOperadorLog
        objFiltro.Value       = pValue

        Set GetFiltroObj = objFiltro
    End Function

    Public Function GetOrderByObj(pMeta, pTipo)
        Dim objOrderBy

        Set objOrderBy = new OrderByClass

        objOrderBy.Meta        = pMeta
        objOrderBy.Tipo        = pTipo

        Set GetOrderByObj = objOrderBy
    End Function

    Public Function IsRequired(ByRef pModel, pMetadata)
        Dim vRequired

        vRequired = ""
        
        If Not IsNothing(pModel) Then
            Dim i

            i = GetObjMetadataIndex(pModel, pMetadata)
            
            If i > -1 Then
                vRequired = iif(pModel.Required(i), "required", "")
            End If
        End If

        IsRequired = vRequired
    End Function

    Public Function GetMaxlength(ByRef pModel, pMetadata)
        Dim vMaxlength

        vMaxlength = ""
        
        If Not IsNothing(pModel) Then
            Dim i, vType, vMax

            vMax = ""

            i = GetObjMetadataIndex(pModel, pMetadata)
            
            If i > -1 Then
                vType = Split(pModel.ColTypes(i), ":")

                If Ubound(vType) > 0 Then
                    vMax = vType(1)
                End If

                vMaxlength = iif(IsNumeric(vMax), "maxlength='" & vMax & "'", "")
            End If
        End If

        GetMaxlength = vMaxlength
    End Function
%>