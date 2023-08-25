<% 
    If Ucase(Controller) = UCase("Abas") And UCase(Action) = UCase("List") Then 
%>
<nav class="navbar-default navbar-static-side" role="navigation" style="box-shadow: none !important;">
    <div class="sidebar-collapse">
        <ul class="nav metismenu" id="side-menu">
            <li>
                <a href="?controller=Abas">
                    <i class="fa fa-home"></i>
                </a>
                <ul class="nav nav-second-level collapse">
                    <li>
                        <a href="?controller=Abas">Início</a>
                    </li>
                </ul>
            </li>
            <%
                Dim vModulos
                                
                Set vModulos = ExecProcedure("BOOK_GERENCIAL_PKG.OBTER_LISTA_MODULO_SPR", Nvl(Session("CdUsuario"), "0") & ",0,'A'," & Nvl(Request.QueryString("unidade"),"0"), True)

                If Not IsNothing(vModulos) Then
                    For i = 0 To (vModulos.Count - 1) Step 1
                        Dim vCdModulo, vNmModulo, vDsModulo, vIcone

                        vCdModulo = vModulos.GetValue("CD_MODULO",i)
                        vNmModulo = vModulos.GetValue("NM_MODULO",i)
                        vDsModulo = vModulos.GetValue("DS_MODULO",i)
                        vIcone    = vModulos.GetValue("ICONE",i)
            %>
            <li class="<%=iif(CStr(Request.QueryString("item")) = CStr(vCdModulo), "active", "")%>" title="<%=vDsModulo%>">
                <a href="?controller=Abas&action=List&unidade=<%=Request.QueryString("unidade")%>&ano=<%=Request.QueryString("ano")%>&item=<%=vCdModulo%>">
                    <i class="fas <%=vIcone%>"></i>
                </a>
                <ul class="nav nav-second-level collapse">
                    <li>
                        <a href="?controller=Abas&action=List&unidade=<%=Request.QueryString("unidade")%>&ano=<%=Request.QueryString("ano")%>&item=<%=vCdModulo%>"><%'=iif(vCdModulo=0,"",vCdModulo & " - ")%><%=vNmModulo%></a>
                    </li>
                </ul>
            </li>
            <% 
                    Next
                End If 
            %>
        </ul>
    </div>
</nav>
<% Else %>

<div class="disable-sidebar"></div>

<% End If %>