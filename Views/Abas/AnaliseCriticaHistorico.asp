<% 
    If Not IsNothing(Model) Then 
%>
<div id="vertical-timeline" class="vertical-container light-timeline">
    <%
        For i = 0 To (Model.Count - 1) Step 1
            If Not IsNothing(Model.GetValue("CD_USUARIO_APR",i)) Then
    %>
    <div class="vertical-timeline-block">
        <div class="vertical-timeline-icon <%=iif(Model.GetValue("APROVACAO",i) = "A","navy-bg","red-bg")%>">
            <i class="fa <%=iif(Model.GetValue("APROVACAO",i) = "A","fa-thumbs-up","fa-thumbs-down")%>"></i>
        </div>

        <div class="vertical-timeline-content">
            <span class="vertical-date"><b class="<%=iif(Model.GetValue("APROVACAO",i) = "A","text-navy","text-danger")%>"><%=Model.GetValue("DS_APROVACAO",i)%>&nbsp;em&nbsp;</b><%=Model.GetValue("DT_APROVACAO",i)%><b class="<%=iif(Model.GetValue("APROVACAO",i) = "A","text-navy","text-danger")%>">&nbsp;por&nbsp;</b><%=Model.GetValue("USUARIO_APR",i)%></span>
            <% If Model.GetValue("APROVACAO",i) <> "A" Then %>
            <br/>
            <p style="white-space: pre-wrap;"><%=Model.GetValue("MOTIVO",i)%></p>
            <% End If %>
        </div>
    </div>
    <%
            End if
    %>
    <div class="vertical-timeline-block">
        <div class="vertical-timeline-icon blue-bg">
            <i class="fa fa-save"></i>
        </div>

        <div class="vertical-timeline-content">
            <span class="vertical-date"><b class="text-success">Salvo em&nbsp;</b><%=Model.GetValue("DT_CADASTRO",i)%><b class="text-success">&nbsp;por&nbsp;</b><%=Model.GetValue("USUARIO_CAD",i)%></span>
            <br/>
            <p style="white-space: pre-wrap;"><%=Model.GetValue("DS_ANALISE_CRITICA",i)%></p>
        </div>
    </div>
    <%
            Response.Flush
        Next
    %>
</div>
<%
    End If
%>