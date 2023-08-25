<% If Not (UCase(Controller) = UCase("Home") And UCase(Action) = UCase("Index")) Then %>

<div id="page-heading" class="row wrapper border-bottom white-bg page-heading" style="border-left: 1px solid #f3f3f4; padding: 10px;">
    <% 
        If UCase(Controller) = UCase("Abas") Or (UCase(Controller) = UCase("Home") And UCase(Action) = UCase("Book")) Then 
    %>
    <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 hidden-xs">
        <img class="img-responsive" style="max-width: 70px !important;" src="Content/img/<%=ViewData.Item("UnidadeLogo")%>" />
    </div>
    <div class="col-xs-9 col-sm-7 col-md-9 col-lg-9">
        <h2 id="h2Unidade" title="Alterar Unidade" data-create="<%=iif(UCase(Action) = UCase("CreateMsg"), "true", "false")%>" style="margin-top: 15px; font-weight: 500; color: #2b8895;"><%=ViewData.Item("Unidade")%>&nbsp;<i class="fas fa-ellipsis-v" style="font-size: 15px;"></i></h2>
    </div>
    <% If Not IsNothing(ViewData.Item("Ano")) Then %>
    <div class="col-xs-3 col-sm-3 col-md-2 col-lg-2" style="text-align: right; margin-top: 5px; font-size: 15px;">
        <% If Not UCase(Action) = UCase("CreateMsg") Then %>
        <span id="spanBook" title="Alterar BOOK" class="no-tooltip">
            <strong>BOOK</strong>
            <br class="hidden-xs" />
            <strong><span class="hidden-xs">Ano de</span>&nbsp;<%=ViewData.Item("Ano")%></strong>
            <i class="fas fa-ellipsis-v" style="margin-right: -7px;"></i>
        </span>
        <% Else %>
        <span class="no-tooltip">
            <strong>BOOK</strong>
            <br />
            <strong>Ano de&nbsp;<%=ViewData.Item("Ano")%></strong>
        </span>
        <% End If %>
    </div>
    <% End If %>
    <% Else %>
    <div class="col-sm-12">
        <%=GetTitle(true)%>

        <%=GetBreadcrumbs(null)%>
    </div>
    <% End If %>
</div>

<div id="myModal" class="modal fade">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">&nbsp;</h4>
            </div>
            <div class="modal-body">
                <div class="sk-spinner sk-spinner-pulse"></div>
            </div>
            <div class="modal-footer" style="border-top-width: 0px;">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            </div>
        </div>
    </div>
</div>

<% End If %>