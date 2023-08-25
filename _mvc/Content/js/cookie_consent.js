var purecookieTitle = "Cookies";
var purecookieDesc = "Este site utiliza cookies para fornecer a melhor experi�ncia poss�vel para voc�, al�m de monitorar e analisar o tr�fego no nosso website. Suas prefer�ncias podem ser alteradas a qualquer momento nas defini��es de cookies de seu navegador."//"Este site utiliza cookies para te proporcionar uma melhor experi�ncia. Ao clicar em aceitar ou continuar navegando em nosso site, voc� aceita nossa "

var purecookieLink = ""//'<a href="/politica-privacidade" target="_blank">Pol�tica de Privacidade</a>.'

var purecookieButton = "Li e aceito";

function pureFadeIn(e, o) {
    var i = document.getElementById(e); i.style.opacity = 0, i.style.display = o || "block", function e() {
        var o = parseFloat(i.style.opacity); (o += .02) > 1 || (i.style.opacity = o, requestAnimationFrame(e))
    }()
}

function pureFadeOut(e) {
    var o = document.getElementById(e); o.style.opacity = 1, function e() {
        (o.style.opacity -= .02) < 0 ? o.style.display = "none" : requestAnimationFrame(e)
    }()
}

function setCookie(e, o, i) {
    var t = "";

    if (i) {
        var n = new Date();
        n.setTime(n.getTime() + 24 * i * 60 * 60 * 1e3), t = "; expires=" + n.toUTCString()
    }

    document.cookie = e + "=" + (o || "") + t + "; path=/"
}

function getCookie(e) {
    var i = document.cookie.split(";");

    for (var t = 0; t < i.length; t++) {
        var n = i[t].split("=");

        if (n[0].trim() == e) {
            return n[1];
        }     
    }

    return null;
}

function eraseCookie(e) {
    document.cookie = e + "=; Max-Age=-99999999;"
}

function cookieConsent() {
    getCookie("cookieDismiss") || (document.body.innerHTML += '<div class="cookieConsentContainer" id="cookieConsentContainer"><div class="cookieTitle"><a>' + purecookieTitle + '</a><a class="closeButton" onclick="pureFadeOut(\'cookieConsentContainer\')";>x</a></div><div class="cookieDesc"><p>' + purecookieDesc + " " + purecookieLink + '</p></div><div class="cookieButton"><a onClick="purecookieDismiss();">' + purecookieButton + "</a></div></div>", pureFadeIn("cookieConsentContainer"))
}

function purecookieDismiss() {
    setCookie("cookieDismiss", "1", 7), pureFadeOut("cookieConsentContainer")
}