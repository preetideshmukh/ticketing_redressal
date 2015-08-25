// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require tickets
//= require ticket_search
//= require graph
//= require user
//= require comment
//= require home
//= require bootstrap
//= require turbolinks
//= require bootstrap-sprockets
//= require rails-timeago
//= require rails-timeago-all
//= require sort
//= require_tree .


$(document).on('page:change',function(){
	alert("rrrrrrrrrrrr");
	$("#hide").click(function() {
		hideAlert();
	});

	$('.config-link, .configured').css( 'cursor', 'no-drop' );
	$('.config-link').click(function (event) {
	  event.preventDefault(); // Prevent link from following its href
	});

	$('.configured').click(function (event) {
	  event.preventDefault(); // Prevent link from following its href
	});
});


function hideAlert(){
$(".message").slideUp();
}


