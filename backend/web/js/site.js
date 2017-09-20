$(function() {
	$('.nav-body>a').click(function() {
        $("body").hasClass("mini-navbar") && $(".navbar-minimalize").trigger("click");
        $(this).toggleClass('active');
        
        var ul = $(this).siblings('ul');
        if (ul.length) {
            ul.toggleClass('in');
            $(this).find('.arrow i').toggleClass("fa-chevron-left").toggleClass("fa-chevron-down");
            return false;
        }
	});

    $('.navbar-minimalize').click(function() {
        $('body').toggleClass('mini-navbar');

        if ($("body").hasClass("mini-navbar")) {
            $("#side-menu").hide();
            setTimeout(function() {
                $("#side-menu").fadeIn(500)
            }, 300);
        } else {
            $("#side-menu").hide(), setTimeout(function() {
                $("#side-menu").fadeIn(500)
            }, 100)
        }
    })

});

$(document).pjax('a.pjax', '#container', {type: 'post', scrollTo: false});

// $(window).on('pjax:popstate', function(event) {
//     $.pjax.reload('#container', {url: event.state.url});
// });

$(document).on('submit', 'form.pjax', function(event) {
    $.pjax.submit(event, '#container');
});

$(document).on('pjax:success', function(event, json, status, xhr) {
    $('.grid-view').yiiGridView({"filterUrl": location.href, "filterSelector": "#w0-filters input, #w0-filters select"});
});