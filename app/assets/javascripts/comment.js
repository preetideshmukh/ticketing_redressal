$(document).bind('page:change', function() {
 initPage(); 
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

