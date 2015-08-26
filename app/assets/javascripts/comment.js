$(document).bind('page:change', function() {
	if ($('#comment').length){        
        initPage(); 
    }
});

function initPage() {
  $("#comment").validate({
   rules: {
    'comment[body]':{
      required: true
    },    
   },
   messages: {
    'comment[body]':{
      required: '*Enter comment'
    },    
   },
   errorElement: 'div',
        errorPlacement: function(error, element) {
             error.insertAfter(element);
             
        }
  });
}

