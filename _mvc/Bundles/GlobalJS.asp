<!-- Mainly scripts -->
<!--[if (!IE)|(gt IE 8)]><!-->
<script src="/_mvc/Content/js/jquery-2.1.1.js"></script>
<!--<![endif]-->

<!--[if lte IE 8]>
    <script src="/_mvc/Content/js/jquery-1.9.1.min.js"></script>
<![endif]-->

<script src="/_mvc/Content/js/bootstrap.min.js"></script>
<script src="/_mvc/Content/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="/_mvc/Content/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="/_mvc/Content/js/inspinia.js"></script>
<script src="/_mvc/Content/js/plugins/pace/pace.min.js"></script>
<script src="/_mvc/Content/js/load.js"></script>

<!--[if IE]><script src="/_mvc/Content/js/excanvas.compiled.js" type="text/javascript"></script><![endif]-->

<%Include("/_mvc/Bundles/toastrJS.asp")%>

<script type="text/javascript">
    $(document).ready(function () {
        $("a.fa-reply[title='Voltar']").addClass("btn btn-white");
        $("a.fa-plus[title='Novo'], a.fa-plus[title='Nova']").addClass("btn btn-success");
        $(".form-group a.fa-pencil[title='Editar']").addClass("btn btn-primary");
    });

    $(window).load(function () {
        var vId = '<%=Request("Ancora")%>';

        if (vId !== undefined) {
            setTimeout(function () {
                $("#" + vId).focus();
            }, 240);
        }
    });

    (function ($) {
        var _oldShow = $.fn.show;

        $.fn.show = function (/*speed, easing, callback*/) {
            var argsArray = Array.prototype.slice.call(arguments),
                duration = argsArray[0],
                easing,
                callback,
                callbackArgIndex;

            // jQuery recursively calls show sometimes; we shouldn't
            //  handle such situations. Pass it to original show method.
            if (!this.selector) {
                _oldShow.apply(this, argsArray);
                return this;
            }

            if (argsArray.length === 2) {
                if ($.isFunction(argsArray[1])) {
                    callback = argsArray[1];
                    callbackArgIndex = 1;
                } else {
                    easing = argsArray[1];
                }
            } else if (argsArray.length === 3) {
                easing = argsArray[1];
                callback = argsArray[2];
                callbackArgIndex = 2;
            }

            return $(this).each(function () {
                var obj = $(this),
                    oldCallback = callback,
                    newCallback = function () {
                        if ($.isFunction(oldCallback)) {
                            oldCallback.apply(obj);
                        }

                        obj.trigger('afterShow');
                    };

                if (callback) {
                    argsArray[callbackArgIndex] = newCallback;
                } else {
                    argsArray.push(newCallback);
                }

                obj.trigger('beforeShow');

                _oldShow.apply(obj, argsArray);
            });
        };
    })(jQuery);

    function errorFunc(jqXHR, textStatus, errorThrown) {
        var vTMensagem = ''
        var vMensagem = ''

        if (jqXHR.responseJSON != undefined) {
            vTMensagem = jqXHR.responseJSON.vTMensagem;
            vMensagem = jqXHR.responseJSON.vMensagem;
        } else {
            vTMensagem = 'Ocorreu um erro:'
            vMensagem = '500 - Internal Server Error';
        }

        toastr.error(vMensagem, vTMensagem);
    }

    function lpad(s, c, n) {
        if (!s || !c || s.length >= n) {
            return s;
        }
        var max = (n - s.length) / c.length;
        for (var i = 0; i < max; i++) {
            s = c + s;
        }
        return s;
    }

    function rpad(s, c, n) {
        if (!s || !c || s.length >= n) {
            return s;
        }
        var max = (n - s.length) / c.length;
        for (var i = 0; i < max; i++) {
            s += c;
        }
        return s;
    }
</script>
