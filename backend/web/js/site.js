$(function() {
	$('.nav-body>a').click(function() {
		var ul = $(this).siblings('ul');

		if (ul.length) {
			$(this).toggleClass('white');
            // ul.slideToggle();
			ul.toggleClass('in');
			$(this).find('.arrow i').toggleClass("fa-chevron-left").toggleClass("fa-chevron-down");

			return false;
		}
	});

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