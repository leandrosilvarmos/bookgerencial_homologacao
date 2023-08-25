/*Page Preloading*/
$(window).load(function () {
    $('#spinner').fadeOut(230);
    $('#preloader').fadeOut(230);
    $('body').attr('data-loaded', 'true');
});

window.onbeforeunload = OnBeforeUnLoad;
function OnBeforeUnLoad() {
    $('#spinner').fadeIn();
    $('#preloader').fadeIn(230);
    $('body').attr('data-loaded', 'false');
}