$(function() {
	$('.nav-body>a').click(function() {
		var ul = $(this).siblings('ul');

		if (ul.length) {
			$(this).toggleClass('white');
			ul.slideToggle();
			$(this).find('.arrow i').toggleClass("fa-chevron-left").toggleClass("fa-chevron-down");

			return false;
		}
	})

});