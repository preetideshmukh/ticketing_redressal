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
//= require jquery
//= require user
//= require sort
//= require_tree .
//= require home
//= require graph
//= require comment
//= require admin
//= require ticket

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
});

$(document).ready(function(){	
    $("#wrapper").mouseleave(function(){
        $("#panel").slideUp("fast");
    });
});
