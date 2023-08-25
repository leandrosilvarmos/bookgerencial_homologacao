<div class="row">
   
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
        <div class="col-12 col-sm-6 col-md-4">
            <a href="?action=IndexMsg&unidade=<%=vCdUnidade%>&ancora=book">
                <div class="single_advisor_profile">
                    <!-- Team Thumb -->
                    <div class="advisor_thumb">
                        <img src="Content/img/<%=vUrlFoto%>" alt="">

                        <!-- Social Info -->
                        <div class="social-info">
                            <img src="Content/img/<%=vUrlLogo%>" style="width: 20%; margin-right: -5%;"/>
                        </div>
                    </div>
                    <!-- Team Details -->
                    <div class="single_advisor_details_info">
                        <h6><%=vSigla%></h6>
                        <p class="designation"><%=vNmUnidade%></p>
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
