$(window).load(function() 
{
   // executes when complete page is fully loaded, including all frames, objects and images
		$(document).on("click","#tickets th a", function() {
		$.getScript(this.href);
		return false;
		});

		$("#tickets_search input").keyup(function() {
		$.get($("#tickets_search").attr("action"), $("#tickets_search").serialize(), null, "script");
		return false;
		});

  
   
}); 