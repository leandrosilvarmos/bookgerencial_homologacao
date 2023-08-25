<% 
Class cTexts
    Public JsonTexts

    Private Sub Class_Initialize()
        CarregaTextsJson()
    End Sub

    Public Function CarregaTextsJson()
        Dim jsonString, idGrupo, idItem, idSub

        Set JsonTexts = New aspJSON

        If FileExists("json\texts.json") Then
            jsonString = FileToString(Server.MapPath("Json") & "\texts.json", "ISO-8859-1")

            JsonTexts.loadJSON(jsonString)
        End If
    End Function

    Public Function Titulo()
        Dim ret

        ret = ""
        
        For Each r In JsonTexts.data("titulo")(0).item("itens")
            Dim i, vController, vAction, vDescricao
            Set i = JsonTexts.data("titulo")(0).item("itens").item(r)
            
            vController = i.item("controllerName")
            vAction = i.item("actionName")
            vDescricao = i.item("descricao")
            
            If vController = Controller And vAction = Action Then
                ret = vDescricao
                Exit For
            End If
        Next

        Titulo = ret
    End Function

    Public Function Mensagem(pId)
        Dim ret

        ret = ""
        
        For Each r In JsonTexts.data("mensagem")(0).item("itens")
            Dim i, vId, vDescricao
            Set i = JsonTexts.data("mensagem")(0).item("itens").item(r)
            
            vId = i.item("id")
            vDescricao = i.item("descricao")
            
            If vId = pId Then
                ret = vDescricao
                Exit For
            End If
        Next

        Mensagem = ret
    End Function

    Public Function EnumValores(pNome)
        Dim ret

        ret = ""
        
        For Each r In JsonTexts.data("enum")(0).item("itens")
            Dim i, vNome
            Set i = JsonTexts.data("enum")(0).item("itens").item(r)

            vNome = i.item("nome")

            If vNome = pNome Then
                For Each r1 In i.item("valores")
                    Dim s, vDescricao, vValor
                    Set s = i.item("valores").item(r1)

                    vDescricao = s.item("descricao")
                    vValor = s.item("valor")
                    
                    If ret <> "" Then
                        ret = ret & "|"
                    End If

                    ret = ret & vValor & ";" & vDescricao
                Next
                
                Exit For
            End If
        Next

        EnumValores = ret
    End Function

    Public Function EnumDescricao(pNome, pValor)
        Dim ret

        ret = ""
        
        For Each r In JsonTexts.data("enum")(0).item("itens")
            Dim i, vNome
            Set i = JsonTexts.data("enum")(0).item("itens").item(r)

            vNome = i.item("nome")

            If vNome = pNome Then
                For Each r1 In i.item("valores")
                    Dim s, vDescricao, vValor
                    Set s = i.item("valores").item(r1)

                    vDescricao = s.item("descricao")
                    vValor = s.item("valor")
                    
                    If pValor = vValor Then
                        ret = vDescricao
                        Exit For
                    End If
                Next
                
                Exit For
            End If
        Next

        EnumDescricao = ret
    End Function

    Public Function EnumMultipleDescricao(pNome, pMultipleValor)
        Dim ret

        ret = ""
        
        For Each r In JsonTexts.data("enum")(0).item("itens")
            Dim i, vNome
            Set i = JsonTexts.data("enum")(0).item("itens").item(r)

            vNome = i.item("nome")

            If vNome = pNome Then
                For Each r1 In i.item("valores")
                    Dim s, vDescricao, vValor
                    Set s = i.item("valores").item(r1)

                    vDescricao = s.item("descricao")
                    vValor = s.item("valor")
                    
                    If Not IsNothing(pMultipleValor) Then
                        For Each vVal In Split(pMultipleValor,",")
                            If vVal = vValor Then
                                If ret <> "" Then
                                    ret = ret & ", "
                                End If
                                
                                ret = ret & vDescricao
                            End If
                        Next
                    End If
                Next
                
                Exit For
            End If
        Next

        EnumMultipleDescricao = Trim(ret)
    End Function
End Class

Public Texts

Set Texts = new cTexts
%>