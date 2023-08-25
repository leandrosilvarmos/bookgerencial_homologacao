<% 
Select Case UCase(Action)
    Case UCase("Index"), UCase("IndexMsg")
%>
<style type="text/css">
    .table td a {
        color: #197380 !important;
        font-weight: 600;
        text-decoration: underline;
    }

    .table tr td:first-child {
        text-align: center;
        font-weight: 600;
    }

    .table tr th {
        text-align: center;
    }

    #page-wrapper div.wrapper-content {
        padding-top: 0px !important;
    }

        #page-wrapper div.wrapper-content div.page-heading {
            margin-bottom: 20px !important;
        }

    .btn-azul-seconci {
        border-color: #2b8895;
    }

        .btn-azul-seconci.btn-outline {
            color: #2b8895;
        }

        .btn-azul-seconci:hover {
            background-color: #2b8895;
            color: #ffffff;
        }

    .product-name {
        color: #2b8895 !important;
    }

    .product-box {
        color: #000000;
    }

        .product-box:hover, .product-box.active {
            box-shadow: 5px 5px 10px 0px #9db6b9;
        }

    .product-desc {
        padding-right: 5px !important;
        padding-left: 15px !important;
    }

    .forum-content:hover .forum-icon i,
    .forum-content:hover .forum-item-title {
        color: #2b8895;
    }

    .forum-item {
        padding-left: 10px;
        padding-top: 15px;
        padding-bottom: 20px;
        margin-bottom: 0px;
        margin-top: 0px;
        cursor: pointer;
    }

        .forum-item:hover {
            background-color: #f2fbff;
        }

    #spanBook, #h2Unidade {
        cursor: alias !important;
    }
</style>

<%
    Case UCase("List")
%>
<link href="/_mvc/Content/css/plugins/jqGrid/ui.jqgrid.css" rel="stylesheet">

<link href="/_mvc/Content/css/plugins/c3/c3.css" rel="stylesheet">

<style type="text/css">
    .ui-jqgrid tr.jqgrow td:not(:first-child) {
        text-align: right;
    }

    .ui-widget {
        font-family: Verdana,Arial,sans-serif;
    }

    .ui-widget-content {
        color: #222;
    }

    .ibox {
        border: 1px solid #c9d0d6 !important;
    }

    .ui-jqgrid-bdiv tr:not(.tpG):not(.OverFlowSubItem):not(.separador):hover {
        background: #f5f5f5;
    }

    .ibox-content {
        padding: 0px;
    }

    .ui-jqgrid-hbox {
        padding-right: 17px !important;
    }

    .ui-jqgrid tr.jqgrow td {
        padding: 6px;
    }

    #btnMaxmizeComparativo > i:before {
        content: "\f2d0";
    }

    .full-screen {
        width: 100% !important;
        height: 100%;
        padding: 0;
        margin: 0;
        padding-left: 0px !important;
    }

        .full-screen .modal-content {
            height: 100%;
            min-height: 100%;
            height: auto;
            border-radius: 0;
            border: none;
        }

        .full-screen .modal-footer {
            margin-bottom: 28px;
        }

        .full-screen #btnMaxmizeComparativo > i:before {
            content: "\f2d2";
        }

    tr.tpG {
        background-color: #c9d0d6;
        font-weight: 600 !important;
    }

    tr.tpS, tr.stlN {
        font-weight: 600 !important;
    }

        tr.tpS td:first-child {
            padding-left: 8px !important;
        }

            tr.tpS td:first-child i {
                float: left;
                padding-top: 2px;
                color: #9fabb5;
                cursor: pointer;
            }

                tr.tpS td:first-child i:hover {
                    color: #2b8895;
                }

                tr.tpS td:first-child i:before {
                    content: "\f105";
                }

            tr.tpS td:first-child.ativo i:before {
                content: "\f107";
            }

    tr.nvl2 td:first-child {
        padding-left: 20px;
    }

    tr.nvl3 td:first-child {
        padding-left: 35px;
    }

    tr.nvl3.tpS td:first-child {
        padding-left: 23px !important;
    }

    tr.nvl4 td:first-child {
        padding-left: 50px;
    }

    tr.nvl4.tpS td:first-child {
        padding-left: 38px !important;
    }

    tr.nvl5 td:first-child {
        padding-left: 65px;
    }

    tr.nvl5.tpS td:first-child {
        padding-left: 53px !important;
    }

    tr.nvl6 td:first-child {
        padding-left: 80px;
    }

    .tr-hide {
        display: none !important;
    }


    tr.tpS i {
        margin-right: 5px;
    }

    tr.separador td {
        border-bottom: 1px;
    }

    #page-wrapper {
        padding: 0px !important;
        position: fixed !important;
        top: 0px;
        left: 0px;
    }

    .wrapper-content {
        padding: 0px !important;
    }

    body::-webkit-scrollbar {
        display: none;
    }

    body::-webkit-scrollbar-button {
        display: none;
    }

    body {
        -ms-overflow-style: none;
    }

    .dias-mes th {
        background-color: #FFFFFF !important;
        border-top: 1px solid #dddddd !important;
        font-weight: 500;
        color: #9fabb5;
    }

    .trimestre th {
        background-color: #FFFFFF !important;
        border-top: 1px solid #dddddd !important;
        font-weight: 500;
        color: #9fabb5;
    }

    /*.ibox.mdl_22, .ibox.mdl_25 {
        box-shadow: none !important;
        border-bottom: none !important;
    }

        .ibox.mdl_22 > .ibox-content, .ibox.mdl_25 > .ibox-content {
            overflow-x: hidden;
            overflow-y: scroll;
        }

        .ibox.mdl_25 > .ibox-content {
            padding: 15px;
            background-color: transparent !important;
        }

        .ibox.mdl_22 > .ibox-content .stlN {
            font-weight: 700;
        }

        .ibox.mdl_22 > .ibox-content th {
            height: 27px;
            padding: 1px 2px 1px 2px;
        }

        .ibox.mdl_22 > .ibox-content .thtitle th {
            background-color: #f5f5f5;
        }

        .ibox.mdl_22 > .ibox-content th, .ibox.mdl_22 > .ibox-content td {
            text-align: center !important;
            vertical-align: middle !important;
        }

        .ibox.mdl_22 > .ibox-content .acumulado td {
            background-color: #f5f5f5;
            font-weight: 700;
            color: #f00 !important;
        }*/

    .chart {
        display: block !important;
        width: 100% !important;
        height: 140px !important;
    }

    .tpG + .separador, .tpS + .separador {
        display: none;
    }

    .tpS.OverFlowSubItem > td:first-child {
        overflow: visible;
    }

    .tpS.OverFlowSubItem > td {
        border-left: none !important;
        border-right: none !important;
    }

    /*.ui-jqgrid .ui-jqgrid-btable {
        table-layout: auto !important;
    }*/

    /*.jqgfirstrow td:first-child, .jqGrid_wrapper th:first-child {
        width: 200px !important;
    }*/

    .btn-azul-seconci {
        border-color: #2b8895;
    }

        .btn-azul-seconci.btn-outline {
            color: #2b8895;
        }

        .btn-azul-seconci:hover {
            background-color: #2b8895;
            color: #ffffff;
        }

    .product-name {
        color: #2b8895 !important;
    }

    .product-box {
        color: #000000;
    }

    .product-desc {
        padding-right: 10px !important;
        padding-left: 20px !important;
    }

    .product-box:hover, .product-box.active {
        box-shadow: 5px 5px 10px 0px #9db6b9;
    }

    .forum-content:hover .forum-icon i,
    .forum-content:hover .forum-item-title {
        color: #2b8895;
    }

    .forum-item {
        padding-left: 10px;
        padding-top: 15px;
        padding-bottom: 20px;
        margin-bottom: 0px;
        margin-top: 0px;
        cursor: pointer;
    }

        .forum-item:hover {
            background-color: #f2fbff;
        }

    #spanBook, #h2Unidade {
        cursor: alias !important;
    }

    @media (max-width: 768px) {
        #h2Unidade {
            margin-top: 0px !important;
            margin-bottom: 0px !important;
        }
    }

    .tooltip {
        position: fixed;
    }

    .trimestre, .ah-var {
        background-color: #fce4d6 !important;
        color: #900000;
    }

        .trimestre td, .ah-var td {
            font-weight: 600;
        }

        .trimestre td {
            text-align: center !important;
            padding: 2px !important;
        }

    td:first-child:hover span {
        display: block !important;
    }

    /*.content-scrolled .navbar-fixed-top {
        z-index: -1000;
    }

    .content-scrolled .navbar-fixed-top * {
        display: none;
    }

    .content-scrolled #page-wrapper {
        margin-top: 0px !important;
        z-index: 50;
    }

    .content-scrolled .side-menu {
        z-index: 5;
    }

    .content-scrolled .navbar-static-side {
        padding-top: 0px !important;

    }*/

    .gray-bg {
        position: fixed;
        left: 35px;
        right: 0px;
        width: 100%;
    }

    .bg-red:before {
        font-family: 'Font Awesome 5 Free';
        content: "\f111";
        font-weight: 900;
        color: #c50000;
        float: left;
    }

    .bg-green:before {
        font-family: 'Font Awesome 5 Free';
        content: "\f111";
        font-weight: 900;
        color: #009806;
        float: left;
    }

    .navbar-static-side {
        z-index: 2001;
        position: absolute;
    }

    .rodape {
        padding: 20px;
        position: relative;
    }

        .rodape::after {
            content: " ";
            clear: both;
            display: table;
        }

    tr:not(.tpG) .tdAnual, tr:not(.tpG) .tdMedia, tr:not(.tpG) .tdAnualAnoAnterior, tr:not(.tpG) .tdMediaAnoAnterior, tr:not(.tpG) .tdComparacaoAnos, tr:not(.tpG) .tdAv {
        background-color: #fdefe6 !important;
    }

    tr:not(.tpG):not(.ah-var):not(.OverFlowSubItem) .tdFrequencia, tr:not(.tpG):not(.ah-var):not(.OverFlowSubItem) .tdMeta {
        background-color: #f8f8f8 !important;
        text-align: center !important;
        font-weight: 600;
    }

    tr.ah-var .tdFrequencia, tr.ah-var .tdMeta {
        text-align: center !important;
    }

    tr.separador + tr > td {
        border-top: 1px solid #DDDDDD;
    }

    .comp-unidade1:not(i) {
        background-color: #f1f7ff !important;
    }

    .comp-unidade2:not(i) {
        background-color: #fff1e2 !important;
    }

    i.comp-unidade1 {
        color: #f1f7ff !important;
    }

    i.comp-unidade2 {
        color: #fff1e2 !important;
    }

    @media (min-width: 768px) {
        /* fixa 1 coluna do thead*/
        .ui-jqgrid-htable tr th:first-child {
            position: fixed;
        }
    }

    @media (max-width: 767px) {
        /* desfixa 1 coluna do tbody*/
        .ui-jqgrid-btable tr td:first-child {
            position: inherit !important;
        }
    }
</style>

<% 
    Case UCase("ComparativoExcel")
%>
<style type="text/css">
    * {
        box-sizing: border-box;
    }

    table {
        table-layout: fixed;
        margin: 0;
        outline-style: none;
        border-collapse: separate;
        background-color: transparent;
        border-spacing: 0;
        display: table;
        text-align: left;
        font-size: 11px;
        color: #222;
        font-family: Verdana,Arial,sans-serif;
        line-height: 1.42857143;
    }

        table thead {
            border-collapse: separate;
            border-spacing: 0;
            text-align: left;
            color: #222;
            font-family: Verdana,Arial,sans-serif;
        }

        table tbody {
            display: table-row-group;
            vertical-align: middle;
            border-color: inherit;
            border-collapse: separate;
            text-align: left;
            font-size: 11px;
            color: #222;
            font-family: Verdana,Arial,sans-serif;
        }

        table tr {
            display: table-row;
            vertical-align: inherit;
            border-color: inherit;
            border-collapse: separate;
            text-align: left;
            font-size: 11px;
            color: #222;
            font-family: Verdana,Arial,sans-serif;
        }

            table tr th {
                background: #F9F9F9;
                border: 1px solid #404040;
                line-height: 15px;
                font-weight: bold;
                color: #676a6c;
                text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
                overflow: hidden;
                white-space: nowrap;
                display: table-cell;
                vertical-align: inherit;
                border-collapse: separate;
                font-size: 11px;
                font-family: Verdana,Arial,sans-serif;
            }

            table tr td {
                border-right-width: 1px;
                border-right-color: inherit;
                border-right-style: solid;
                overflow: hidden;
                white-space: pre;
                height: 23px;
                border-bottom-width: 1px;
                border-bottom-color: inherit;
                border-bottom-style: solid;
                border-color: #404040;
                background-color: inherit;
                display: table-cell;
                vertical-align: inherit;
                color: #222;
                font-size: 11px;
                font-family: Verdana,Arial,sans-serif;
            }

</style>
<%
    Case UCase("Create"), UCase("CreateMsg")
%>

<% Include("/_mvc/Bundles/DatePickerCSS.asp") %>

<% Include("/_mvc/Bundles/JasnyCSS.asp") %>

<style type="text/css">
    .btn-azul-seconci {
        border-color: #2b8895;
    }

        .btn-azul-seconci.btn-outline {
            color: #2b8895;
        }

        .btn-azul-seconci:hover {
            background-color: #2b8895;
            color: #ffffff;
        }

    .product-name {
        color: #2b8895 !important;
    }

    .product-box {
        color: #000000;
    }

        .product-box:hover, .product-box.active {
            box-shadow: 5px 5px 10px 0px #9db6b9;
        }

    .forum-content:hover .forum-icon i,
    .forum-content:hover .forum-item-title {
        color: #2b8895;
    }

    #page-heading {
        margin: -20px -25px 20px -25px;
    }

    tr.tpG {
        background-color: #c9d0d6;
        font-weight: 600 !important;
    }

    .table.table-bordered > tbody > tr > td {
        vertical-align: middle;
    }

    .table-bordered tr td:not(:first-child), .table-bordered tr th:not(:first-child) {
        text-align: center;
    }

    tr.tpS, tr.stlN {
        font-weight: 600 !important;
    }

    tr.stlTitleRed > td {
        color: #c50000 !important;
    }

    tr.tpS td:first-child i {
        float: left;
        padding-top: 2px;
        color: #9fabb5;
        cursor: pointer;
    }

        tr.tpS td:first-child i:hover {
            color: #2b8895;
        }

        tr.tpS td:first-child i:before {
            content: "\f105";
        }

    tr.tpS td:first-child.ativo i:before {
        content: "\f107";
    }

    tr.nvl2 td:first-child {
        padding-left: 20px;
    }

    tr.nvl3 td:first-child {
        padding-left: 35px;
    }

    tr.nvl3.tpS td:first-child {
        padding-left: 23px !important;
    }

    tr.nvl4 td:first-child {
        padding-left: 50px;
    }

    tr.nvl4.tpS td:first-child {
        padding-left: 38px !important;
    }

    tr.nvl5 td:first-child {
        padding-left: 65px;
    }

    tr.nvl5.tpS td:first-child {
        padding-left: 53px !important;
    }

    tr.nvl6 td:first-child {
        padding-left: 80px;
    }

    table.table-bordered, tr.separador td, th {
        border: none !important;
    }

    .ibox-content table.table-bordered, #AnaliseCritica, label[for="AnaliseCritica"] {
        color: #222 !important;
    }

    label[for="AnaliseCritica"] {
        text-align: right;
    }

    .verde {
        color: #009806;
    }

    .vermelho {
        color: #c50000;
    }

    .amarelo {
        color: #f5b700;
    }

    td:first-child:hover span {
        display: block !important;
    }

    table.table-bordered tr td.mes-atual {
        background-color: #f7f7f7;
    }

    .aprA > div {
        color: #004603 !important;
    }

    .aprR > div {
        color: #6b0000 !important;
    }

    .row.analise:not(:first-child) {
        padding-top: 20px;
        border-top: 1px solid #ddd;
    }

    .mes-atual > .excluir-valor {
        display: none;
        color: #b50c0c;
        cursor: pointer;
    }

        .mes-atual > .excluir-valor:hover {
            color: #c73030;
        }

        .mes-atual > .excluir-valor:active {
            color: #8b0707;
        }

    .mes-atual:hover > .excluir-valor {
        display: inline-block;
    }
</style>
<%
End Select 
%>