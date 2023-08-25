<link href="/_mvc/Content/css/bootstrap.min.css" rel="stylesheet">
<link href="/_mvc/Content/font-awesome/5.0.13/css/fontawesome-all.css" rel="stylesheet" />
<link href="/_mvc/Content/css/animate.css" rel="stylesheet">
<link href="/_mvc/Content/css/style.css" rel="stylesheet">

<% Include("/_mvc/Bundles/toastrCSS.asp") %>

<style type="text/css">
    a.fa {
        color: #337ab7;
    }

        a.fa:hover {
            color: #589ad3;
        }

        a.fa:active {
            color: #23527c;
        }

        a.fa.fa-plus {
            color: #0f4dfa;
        }

            a.fa.fa-plus:hover {
                color: #5984fc;
            }

            a.fa.fa-plus:active {
                color: #0030b7;
            }

        a.fa.fa-trash {
            color: #b50c0c;
        }

            a.fa.fa-trash:hover {
                color: #c73030;
            }

            a.fa.fa-trash:active {
                color: #8b0707;
            }

        a.fa.fa-eye {
            color: #0f40c8;
        }

            a.fa.fa-eye:hover {
                color: #4672ee;
            }

            a.fa.fa-eye:active {
                color: #0934ac;
            }

        a.fa.fa-pencil {
            color: #08652f;
        }

            a.fa.fa-pencil:hover {
                color: #20854a;
            }

            a.fa.fa-pencil:active {
                color: #03421d;
            }

        a.fa.fa-sitemap {
            color: #1a1a1a;
        }

            a.fa.fa-sitemap:hover {
                color: #6f6f6f;
            }

            a.fa.fa-sitemap:active {
                color: #000000;
            }

        a.fa.fa-history {
            color: #1a1a1a;
        }

            a.fa.fa-history:hover {
                color: #6f6f6f;
            }

            a.fa.fa-history:active {
                color: #000000;
            }

        a.fa.fa-sign-in {
            color: #1ab394;
        }

            a.fa.fa-sign-in:hover {
                color: #17c7a4;
            }

            a.fa.fa-sign-in:active {
                color: #12846d;
            }

    a.fa-lg {
        font-size: 1.2em;
    }

    a.fa.btn {
        vertical-align: 1px;
        padding-top: 11px;
        padding-bottom: 11px;
        height: 34px;
        font-size: 14px;
        font-weight: 400;
    }

        a.fa.btn.btn-success {
            color: #ffffff;
        }

    a.fa.btn {
        vertical-align: 1px;
        padding-top: 11px;
        padding-bottom: 11px;
        height: 34px;
        font-size: 14px;
        font-weight: 400;
    }

        a.fa.btn.btn-primary {
            color: #ffffff;
        }

    .table td.Situacao.A {
        color: #01690e;
        font-weight: 700;
    }

    .table td.Situacao.I {
        color: #800707;
        font-weight: 700;
    }

    .table td.Bolean_1 {
        color: #01690e;
        font-weight: 700;
    }

    .table td.Bolean_0 {
        color: #800707;
        font-weight: 700;
    }

    dl dt, dl dd {
        margin-bottom: 7px;
    }

    select.select2-hidden-accessible {
        height: 0px !important;
    }

    .btn.fa {
        font-size: 14px !important;
        padding-top: 10px !important;
        padding-bottom: 10px !important;
        font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
    }

        .btn.fa::before {
            margin-right: 5px !important;
            font-family: FontAwesome !important;
        }

    #preloader {
        padding: 50px;
        margin-top: 25%;
        z-index: 1;
    }

        #preloader:not([style*="display: none"]) + div,
        #preloader:not([style*="display: none"]) + div + div.footer {
            display: none;
        }

    body:not([data-loaded*="true"]) {
        overflow: hidden;
    }

    .sk-spinner-circle.sk-spinner {
        width: 70px;
        height: 70px;
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        margin: auto;
    }

    .hr-line-dashed {
        border-color: #d0d0d0;
    }

    nav.navbar {
        background-color: #2b8895 !important;
        color: #ffffff;
    }

    nav.navbar-static-side {
        width: 35px !important;
        margin-top: 0px !important;
        padding-top: 50px !important;
        padding-bottom: 45px !important;
        height: 100% !important;
        background-color: #293846 !important;
    }

        nav.navbar-static-side > div.sidebar-collapse {
            padding-top: 5px;
        }

    .wrapper-content {
        padding: 20px 0px 20px !important;
    }


    #page-wrapper {
        margin-left: 35px !important;
    }

    #side-menu {
        overflow: visible !important;
        background-color: #293846 !important;
        padding-bottom: 45px !important;
    }

        #side-menu li.active,
        #side-menu > li:hover {
            background-color: #334f69;
        }

        #side-menu li a {
            padding: 5px 10px 5px 10px;
            text-align: center;
            font-size: 14px;
            color: #dcdcdc;
        }

            #side-menu li a i {
                font-size: 14px !important;
                margin-right: 0px;
            }



        #side-menu .nav-second-level {
            padding: 0px;
            left: 35px;
            background-color: #293846;
            min-width: 40px;
        }

            #side-menu .nav-second-level li {
                margin: 0px;
                width: 230px;
                width: max-content;
            }

                #side-menu .nav-second-level li a {
                    font-weight: 700;
                    color: #e6e6e6;
                    font-size: 13px;
                    padding-top: 6px;
                    padding-bottom: 6px;
                }

        #side-menu li.active .nav-second-level {
            left: 30px;
        }

    div.footer {
        margin-left: 0px !important;
        z-index: 9999999 !important;
    }

    .navbar-top-links li a {
        padding: 15px 10px !important;
    }

    .nav-item-user {
        color: #ffffff !important;
    }

    .nav-item-sair {
        padding: 5px;
    }

        .nav-item-sair a {
            color: #676a6c !important;
        }

    .nav .open > a,
    .nav .open > a:hover,
    .nav .open > a:focus {
        color: #676a6c !important;
        background-color: #ffffff !important;
    }

    .disable-sidebar + #page-wrapper {
        margin-left: 0px !important;
    }

    .ibox-title h5 {
        font-weight: 500 !important;
    }

        .ibox-title h5 small {
            font-weight: 400 !important;
        }

    .ibox-tools a {
        color: #676a6c;
    }

        .ibox-tools a:hover {
            color: #2b8895;
        }

    .nav > li.active {
        border-left-color: #2b8895 !important;
    }

    body {
        background-color: #293846 !important;
    }

    .sk-spinner-circle .sk-circle:before {
        background-color: #2b8895 !important;
    }

    .footer {
        padding-top: 5px !important;
        padding-bottom: 5px !important;
        margin-left: 35px !important;
    }
</style>
