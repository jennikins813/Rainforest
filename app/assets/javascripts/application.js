// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

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