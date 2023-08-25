<% 
Select Case UCase(Action)
    Case UCase("Index"), UCase("IndexMsg")
        Include("/_mvc/Bundles/DatePickerCSS.asp") 
        Include("/_mvc/Bundles/DatatableCSS.asp")
%>
<style type="text/css">
    .table-indicadores {
        width: 100%;
        max-width: 100%;
    }

        .table-indicadores > tbody > tr > td {
            line-height: 1.42857;
            padding: 8px;
            vertical-align: top;
        }

    .ibox-title h5 {
        font-size: 17px;
    }

    .indicadores tr {
        border-top: 1px solid #e7eaec;
        cursor: pointer;
    }

        .indicadores tr > td {
            border-top: none !important;
        }

            .indicadores tr > td:first-child {
                width: 30px !important;
                text-align: center;
                padding-left: 2px;
                padding-right: 2px;
            }

            .indicadores tr > td:nth-child(2) {
                width: 25px !important;
                text-align: center;
                padding-top: 9px;
                padding-bottom: 7px;
                padding-left: 2px;
                padding-right: 2px;
            }

            .indicadores tr > td:nth-child(3) {
                width: 20px !important;
                text-align: center;
                padding-left: 2px;
                padding-right: 2px;
            }

            .indicadores tr > td:nth-child(4) {
                width: 30px !important;
                text-align: center;
                padding-left: 2px;
                padding-right: 2px;
            }

            .indicadores tr > td:nth-child(5) {
                /*width: 25px !important;*/
                text-align: center;
                padding-left: 2px;
                padding-right: 2px;
            }

        .indicadores tr:hover {
            background-color: #e0effd;
        }

    #accordion .panel-heading {
        height: 55px;
    }

        #accordion .panel-heading img {
            max-width: 50px;
            float: left;
            margin-right: 10px;
        }

        #accordion .panel-heading h4 {
            margin-top: 10px;
            font-size: 16px;
            color: #107990;
        }

    .legenda, .legenda + span {
        cursor: pointer;
    }

        .legenda:hover + span, .legenda + span:hover {
            font-weight: 600;
        }

    span.aprovacao-P {
        color: #f8ac59;
    }

    span.aprovacao-R {
        color: #ed5565;
    }

    span.aprovacao-A {
        color: #1ab394;
    }

    span.label {
        padding: 1px 6px;
    }

    div.itemLegenda {
        background-color: #ffeddb;
        height: 18px;
        width: 24px;
        float: left;
        margin-right: 4px;
        border: 1px solid #a2a2a2;
    }

    tr.permissao-criar {
        background-color: #ffeddb;
    }

    .filtro {
        display: none;
        padding-left: 17px;
        margin-top: -23px;
    }

    .filtrado tr {
        display: none;
    }

        .filtrado tr.item-filtrado {
            display: block;
        }

    .filtrado .filtro {
        display: block;
    }

    .nav-tabs > li > a {
        background-color: #e7eaec;
        color: #868686;
    }

        .nav-tabs > li > a:hover, .nav-tabs > li > a:focus, .tabs-container .nav-tabs > li a:hover {
            background-color: #cbcbcb;
            color: #565656;
        }
</style>
<%
End Select
%>