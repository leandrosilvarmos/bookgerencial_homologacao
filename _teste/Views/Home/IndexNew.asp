<section id="book" class="section_padding_100_70">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-sm-8 col-lg-6">
                <!-- Section Heading -->
                <div class="section_heading text-center" style="margin-bottom: 35px;">
                    <% 
                        If Not IsNothing(ViewData.Item("CdUnidade")) And ViewData.Item("CdUnidade") <> 0 Then
                    %>
                    <p></p>
                    <%
                        Else
                    %>
                    <h3>Books</h3>
                    <p>Selecione uma unidade:</p>
                    <div class="line"></div>
                    <%
                        End If 
                    %>
                </div>
            </div>
        </div>

        <% 
            If Not IsNothing(ViewData.Item("CdUnidade")) And ViewData.Item("CdUnidade") <> 0 Then
                View "BookNew"
            Else
                View "UnidadesNew"
            End If 
        %>
    </div>
</section>
