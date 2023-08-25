<% 
Select Case UCase(Action)
    Case UCase("Index"), UCase("IndexMsg")
%>
<style type="text/css">
    @media (min-width: 768px) {
        dt {
            float: left;
            width: 25% !important;
            overflow: hidden;
            clear: left;
            text-align: right;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        dd {
            margin-left: 27% !important;
        }

        #tab-book > .panel-body > .row > .col-xs-12 {
            Top: -120px;
        }
    }

    @media (max-width: 768px) {
        .li-tab {
            text-align: center;
            margin-left: -10px;
        }

            .li-tab span {
                display: none !important;
            }

        .tabs-home .panel-body {
            width: 100% !important;
            margin-left: 0px !important;
        }
    }

    /*@media (min-width: 1262px) {
        #imgLogoInicial {
            max-width: 900px;
        }
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

    .certONA_III > label + label::after {
        content: url(Content/img/logo_ona_100px.jpg);
    }

    .certQmentumDiamante > label + label::after {
        content: url(Content/img/logo_qmentum_100px.jpg);
    }

    .certONA_III.certQmentumDiamante > label + label::after {
        content: url(Content/img/logo_ona_100px.jpg) url(Content/img/logo_qmentum_100px.jpg);
    }


    .gray-bg::after,
    .wrapper.wrapper-content::after,
    .tabs-container::after {
        clear: both;
        content: ' ';
        display: table;
    }

    #wrapper {
        height: auto !important;
        min-height: 100% !important;
    }

    .advisor_thumb {
        padding: 0px !important;
    }

    .section_heading h3 span {
        color: #0e6275;
    }

    .forum-icon {
        float: left;
        margin-right: 20px;
    }

        .forum-icon .fa {
            font-size: 30px;
            margin-top: 8px;
            color: #9b9b9b;
        }

    a.forum-item-title {
        color: inherit;
        display: block;
        font-size: 17px;
        font-weight: 600;
    }

    body {
        font-size: 14px;
    }
</style>
<%
End Select 
%>