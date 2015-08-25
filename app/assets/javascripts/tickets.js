$(document).bind('page:change',function() {
$("#ticket_form").validate({
  	rules: {
    'ticket[participant_name]': {
		required: true,
		minlength: 2,
	   	},
   	'ticket[participant_mobile_no]': {
		required: true,
		number: true,
		minlength: 10,
		maxlength: 10,
	   	},
	'ticket[description]':{ 
	  		required: true
   	   }       
      },
  	messages:
  	{
  			'ticket[participant_name]':
            {
            	required: "*Enter name"
            },
           
           'ticket[participant_mobile_no]':
            {
            	required: "*Enter mobile number"
            },
           'ticket[description]':
            {
            	required: "*Enter description"
            },
            
  	},
       errorElement: 'div',
        errorPlacement: function(error, element) {
             error.insertAfter(element);
        }
  });	
});

$(document).ready(function(){
  
    $('#comment_body').keypress(function(e){
      if(e.keyCode==13)
      {
      $('#add-comment').click();
      }
    });
});