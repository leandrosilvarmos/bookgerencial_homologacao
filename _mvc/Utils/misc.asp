<%
Public Function FileExists(path)
    Dim fso, vPath

    Set fso = Server.CreateObject("Scripting.FilesystemObject")

    vPath = Server.MapPath(path)

    FileExists = fso.FileExists(vPath)
End Function

Public Function iif(psdStr, trueStr, falseStr)
    If psdStr Then
        iif = trueStr
    Else
        iif = falseStr
    End If
End Function

Public Function if_then_else(psdStr, trueStr, falseStr)
    if_then_else = iif(psdStr, trueStr, falseStr)
End Function

Public Function IsNothing(var)
    If(IsObject(var)) Then
        IsNothing = (var Is Nothing) Or IsEmpty(var) Or IsNull(var)
    Else
        IsNothing = IsEmpty(var) Or IsNull(var)
    End If
End Function

Public Function Nvl(var,ret)
    If IsNothing(var) Then
        Nvl = ret
    Else
        Nvl = var
    End If
End Function

Public Function StringFormat(ByVal SourceString , Arguments() )
    Dim objRegEx 'As RegExp  ' regular expression object
    Dim objMatch 'As Match   ' regular expression match object
    Dim strReturn 'As String ' the string that will be returned

    Set objRegEx = New RegExp

    objRegEx.Global = True
    objRegEx.Pattern = "(\{)(\d)(\})"

    strReturn = SourceString

    For Each objMatch In objRegEx.Execute(SourceString)
        strReturn = Replace(strReturn, objMatch.Value, Arguments(CInt(objMatch.SubMatches(1))))
    Next

    StringFormat = strReturn
End Function

Function PrepareVariables(args())
    Dim keyPairs, keyPair, key, keyValue

    Set results = Server.CreateObject("Scripting.Dictionary")

    If Not IsArray(args) Then
        args = Split(args, ",")
    End If

    for each keyPair In args
        keyPairs = Split(keyPair,"=")

        If UBound(keyPairs) = 1 Then
            key = Trim(keyPairs(0))
            keyValue = Trim(keyPairs(1))

            If InStr(1,"controller, action, partial",key,1)=0 Then
                results.Add key,keyValue
            End If
        End If
    Next

    If results.Count=0 Then
        Set PrepareVariables = Nothing
    Else
        Set PrepareVariables = results
    End If
End Function

Function CreateGUID
    Dim TypeLib

    Set TypeLib = CreateObject("Scriptlet.TypeLib")

    CreateGUID = Mid(TypeLib.Guid, 2, 36)

    Set TypeLib = Nothing
End Function

Const blackPattern = "(?:\'|is\s+null|--|=|%|values|where|count|\sand\s|\sor\s|;|\slike\s|,|\/\*|\*\/|@@|\s@|\schar|nchar|varchar|nvarchar|alter|begin|cast|create\s|cursor|declare|database|delete|drop|end|exec|execute|fetch|from|insert|kill|open|select|sys|sysobjects|syscolumns|table|update|values|xp_cmdshell)"

Function detectInjection(strtoclean)
    Set absoluteNoValidator = New RegExp

    absoluteNoValidator.Pattern = blackPattern
    absoluteNoValidator.IgnoreCase = True

    If absoluteNoValidator.Test(strtoclean) Then
        detectInjection = True

        Exit Function
    End If

    detectInjection = False
End Function

Public Function ArrayToString(pArray)
    Dim vStr

    vStr = ""

    For each vString In pArray
        If vStr <> "" Then
            vStr = vStr & ", "
        End If

        vStr = vStr & vString
    Next

    ArrayToString = vStr
End Function

Public Function FileToString(strPath, strCharSet)
    Dim objStream, strData

    Set objStream = CreateObject("ADODB.Stream")

    objStream.CharSet = strCharSet
    objStream.Open
    objStream.LoadFromFile(strPath)

    FileToString = objStream.ReadText()

    objStream.Close

    Set objStream = Nothing
End Function

Function Rpad(sValue, sPadchar, iLength)
    Rpad = sValue & string(iLength - Len(sValue), sPadchar)
End Function

Function Lpad(sValue, sPadchar, iLength)
    Lpad = string(iLength - Len(sValue),sPadchar) & sValue
End Function

Public Function Initcap(pStr)
    Dim retStr

    retStr = ""

    If pStr <> "" Then
        If Len(pStr) > 1 Then
            retStr = UCase(Left(pStr, 1)) & LCase(Mid(pStr, 2))
        Else
            retStr = UCase(pStr) 
        End If
    End If

    Initcap = retStr
End Function

Public Function CapitalizarNome(pStr)
    Dim retStr, arrStr, word

    retStr = ""
    arrStr = Split(pStr," ")

    For Each word In arrStr
        If retStr <> "" Then
            retStr = retStr & " "
        End If

	    retStr = retStr & Initcap(word)
    Next

    retStr = Replace(Replace(Replace(Replace(Replace(Replace(Replace(Replace(Replace(Replace(Replace(Replace(Replace(retStr," De ", " de ")," A ", " a ")," E "," e ")," Ao "," ao  ")," Do ", " do "), " No ", " no "), " Na ", " na ")," Em ", " em ")," Das ", " das "), " Da ", " da ")," Dos ", " dos ")," O ", " o ")," Para "," para ")

    CapitalizarNome = retStr
End Function

Public Function GetHostName()
    Dim vUserIPAddress, vHostName

    vUserIPAddress = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
    vHostName = ""

    If vUserIPAddress = "" Then
      vUserIPAddress = Request.ServerVariables("REMOTE_ADDR")
    End If

    'If vUserIPAddress <> "" Then
    '    Dim objShell, objExec, strResult, vSplitHostNm

    '    SET objShell = CreateObject("Wscript.Shell")

    '    SET objExec = objShell.Exec("ping -a " & vUserIPAddress & " -n 1")

    '    strResult = objExec.StdOut.ReadAll

    '    vHostName = Split(UCase(strResult), " ")(1)

    '    vSplitHostNm = Split(vHostName, ".")(0)

    '    vHostName = iif(IsNumeric(vSplitHostNm), vHostName, vSplitHostNm) 
    'End If

    vHostName = vUserIPAddress

    GetHostName = vHostName
End Function

Public Function FormatarPorcentagem(valor, total)
    If valor = 0 Or total = 0 Then
        FormatarPorcentagem = FormatPercent(0)
    Else
        FormatarPorcentagem = FormatPercent(valor/total)
    End If
End Function

Function QuantosDiasMes(pMes,pAno,pVerificarMesAtual)
    Select Case cInt(pMes)
        Case 1,3,5,7,8,10,12: QuantosDiasMes = 31
        Case 4,6,9,11:        QuantosDiasMes = 30
        Case 2:
            If pAno Mod 4 = 0 And (pAno Mod 100 <> 0 Or pAno Mod 400 = 0) Then
                QuantosDiasMes = 29
            Else
                QuantosDiasMes = 28
            End If
        Case Else
            If pAno Mod 4 = 0 And (pAno Mod 100 <> 0 Or pAno Mod 400 = 0) Then
                QuantosDiasMes = 366
            Else
                QuantosDiasMes = 365
            End If

            If pVerificarMesAtual Then
                If CInt(pAno) >= Year(date()) Then
                    QuantosDiasMes = (DateDiff("d", CDate("01/01/"+pAno), date()) + 1) - Day(date())
                End If
            End If
    End Select

	If pVerificarMesAtual Then
		If CInt(pAno) > Year(date()) Or (CInt(pAno) = Year(date()) And Cint(pMes) >= Month(date())) Then
			QuantosDiasMes = 0
		End If
    End If
End Function
%>