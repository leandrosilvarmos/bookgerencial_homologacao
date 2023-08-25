<%
Function fixInclude(content)
    out=""
    content  =regreplace(content,"<!-- *# *include file *= *""(.+)"" *-->","<"&"%include(""$1"")%"&">",false)
    'content = regreplace(content,"<!-- *# *include virtual *= *"".+"" *-->","<BR><font color=red><B>ERROR: 'include virtual' not supported!</B></font><BR>",false)
    content = replace(content,"<"&"%=","<"&"%response.write ")
    content = replace(content,"<"&"% =","<"&"%response.write ")
    'content=regreplace(content,"<"&"% *= *","<"&"%response.write ",false)
    pos1 = instr(content,"<%")
    pos2 = instr(content,"%"&">")

    If pos1 > 0 Then
        before = mid(content,1,pos1-1)
        before = replace(before,"""","""""")
        before = replace(before,vbcrlf,""""&vbcrlf&"response.write vbcrlf&""")
        before = vbcrlf & "response.write """ & before & """" &vbcrlf
        middle = mid(content,pos1+2,(pos2-pos1-2))
        after = mid(content,pos2+2,len(content))
        out = before & middle & fixInclude(after)
    Else
        content = replace(content,"""","""""")
        content = replace(content,vbcrlf,""""&vbcrlf&"response.write vbcrlf&""")
        out = vbcrlf & "response.write """ & content &""""
    End If

    fixInclude = out
End Function

Function regreplace(strOriginalString, strPattern, strReplacement, varIgnoreCase)
    Dim objRegExp : Set objRegExp = New RegExp

    With objRegExp
        .Pattern = strPattern
        .IgnoreCase = varIgnoreCase
        .Global = True
    End With

    regreplace = objRegExp.replace(strOriginalString, strReplacement)

    Set objRegExp = Nothing
End Function

Function getMappedFileAsString(byVal strFilename)
    Dim fso,td

    Set fso = Server.CreateObject("Scripting.FilesystemObject")
    Set ts = fso.OpenTextFile(Server.MapPath(strFilename), 1)

    getMappedFileAsString = ts.ReadAll
    ts.close

    Set ts = nothing
    Set fso = Nothing
End Function

Function Include(filename)
    executeglobal(fixInclude(getMappedFileAsString(filename)))
End Function
%>