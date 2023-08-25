<%
Function ObterLDAP(pUsrName)
  Dim srtldap

  Set rootDSE = GetObject("LDAP://RootDSE")
  base  = "<LDAP://" & rootDSE.Get("defaultNamingContext") & ">"
  'filter on user objects with the given account name
  fltr  = "(&(objectClass=user)(objectCategory=Person)" & _
          "(sAMAccountName=" & pUsrName & "))"
  'add other attributes according to your requirements
  attr  = "distinguishedName,sAMAccountName"
  scope = "subtree"

  Set conn = CreateObject("ADODB.Connection")
  conn.Provider = "ADsDSOObject"
  conn.Open "Active Directory Provider"

  Set cmd = CreateObject("ADODB.Command")
  Set cmd.ActiveConnection = conn
  cmd.CommandText = base & ";" & fltr & ";" & attr & ";" & scope

  Set rs = cmd.Execute
  Do Until rs.EOF
    srtldap = srtldap & rs.Fields("distinguishedName").Value
    rs.MoveNext
  Loop
  rs.Close

  conn.Close

  ObterLDAP = srtldap
End Function

Function ObterObjUser(pUsrName)
  Set ObterObjUser = GetObject("LDAP://" & ObterLDAP(pUsrName))
End Function
%>