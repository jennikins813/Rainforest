// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
	$('#search-form').submit(function(event) {
		event.preventDefault();
		var searchValue = $('#search').val();

		$.getScript('/products?search=' + searchValue);
	});

	$(window).scroll(function(){
		var url = $('.pagination span.next').children().attr('href');
		if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
			$('.pagination').text("Fetching more products...");
			$.getScript(url);
		}
		//scroll bar will not be more than 50px from where we're at. when it's close to 50px from bottom of page, will fetch more products/requests to show on page.
	});
});