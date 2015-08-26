//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require_tree
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require bootstrap
//= require turbolinks
//= require bootstrap-sprockets
//= require rails-timeago
//= require rails-timeago-all
//= require user
//= require ticket
//= require home
//= require graph
//= require comment

$(document).on('page:change',function(){		
	$("#hide").click(function() {
		$(".message").slideUp();
	});
});

$(document).on('page:change',function(){
	$('.config-link, .configured').css( 'cursor', 'no-drop' );
	$('.config-link').click(function (event) {
	  event.preventDefault(); // Prevent link from following its href
	});

	$('.configured').click(function (event) {
	  event.preventDefault(); // Prevent link from following its href
	});
});

$("#panel").hide();

$(document).ready(function(){
    $("#button1").mouseover(function(){
        $("#panel").slideDown("fast");
    });
    
    $("#buton1").mouseover(function(){
        $("#panel").slideDown("fast");
    });
});

$(document).ready(function(){	
    $("#wrapper").mouseleave(function(){
        $("#panel").slideUp("fast");
    });
});

