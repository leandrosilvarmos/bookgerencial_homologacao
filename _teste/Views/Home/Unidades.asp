<div class="row">
    <div class="col-xs-12">
        <%
    If Not IsNothing(Model) Then
        For i = 0 To (Model.Count - 1) Step 1
            Dim vCdUnidade, vNmUnidade, vDsUnidade, vSigla, vUrlLogo, vUrlFoto, vSituacao, vDsMissao, vDsVisao, vDsValores

            vCdUnidade = Model.GetValue("CD_UNIDADE",i)
            vNmUnidade = Model.GetValue("NM_UNIDADE",i)
            vDsUnidade = Model.GetValue("DS_UNIDADE",i)
            vSigla     = Model.GetValue("SIGLA",i)
            vUrlLogo   = Model.GetValue("URL_LOGO",i)
            vUrlFoto   = Model.GetValue("URL_FOTO",i)
            vSituacao  = Model.GetValue("SITUACAO",i)
			vDsMissao  = Model.GetValue("DS_MISSAO",i)
            vDsVisao   = Model.GetValue("DS_VISAO",i)
            vDsValores = Model.GetValue("DS_VALORES",i)
        %>
        <div class="col-xs-12 col-sm-6 col-md-4">
            <% If Partial Then %>
                <% If Not ViewData.Item("Create") Then %>
                    <% If Not ViewData.Item("Item") = "" Then %>
            <a href="?controller=Abas&action=List&unidade=<%=vCdUnidade%>&ano=<%=ViewData.Item("Ano")%>&item=<%=ViewData.Item("Item")%>">
                    <% Else %>
            <a href="?controller=Abas&action=IndexMsg&unidade=<%=vCdUnidade%>&ano=<%=ViewData.Item("Ano")%>">
                    <% End If %>
                <% Else %>
            <a href="?controller=Abas&action=CreateMsg&unidade=<%=vCdUnidade%>&item=<%=ViewData.Item("Item")%>">
                <% End If %>
            <% Else %>
            <a href="?action=IndexMsg&unidade=<%=vCdUnidade%>">
            <% End If %>
                <div class="ibox">
                    <div class="ibox-content product-box">
                        <div class="product-imitation" style="padding: 0px;">
                            <img src="Content/img/<%=vUrlFoto%>" class="img-responsive" style="margin: auto;" />
                        </div>
                        <div class="product-desc">
                            <div class="row">
                                <div class="col-xs-3" style="padding-right: 0px; padding-left: 3px;">
                                    <img src="Content/img/<%=vUrlLogo%>" class="img-responsive" />
                                </div>
                                <div class="col-xs-9" style="padding-left: 10px; padding-right: 10px;">
                                    <span class="product-name"><%=vSigla%></span>
                                    <div class="small m-t-xs">
                                        <%=vNmUnidade%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <% 
                    Response.Flush
                Next
            Else 
        %>
        <div>
            <div class="row">
                <h4 style="text-align: center;">Nenhuma unidade encontrada</h4>
            </div>
        </div>
        <% 
            End If 
        %>
    </div>
</div>
