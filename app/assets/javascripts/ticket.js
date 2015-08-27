$(document).bind('page:change',function() {	
	registercomplainpage();
	ticketpage();	
});

function ticketpage() {
	("#ticket_form1").validate({
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
	       errorElement : 'div',
		errorPlacement : function(error, element) {
			error.insertAfter(element);

		}
	  });
}	

function registercomplainpage() {	
	("#reg_cmpl").validate({
	  	rules: {
	    'ticket[user_id]': {
			required: true,			
		   	},
		'ticket[participant_name]': {
			required: true,			
		   	},
	   	'ticket[participant_mobile_no]': {
			required: true,
			number: true,
			minlength: 10,
			maxlength: 10,
		   	},
		'ticket[participant_email]':{
			required: true,
		},
		'ticket[description]':{ 
		  		required: true
	   	   }       
	      },
	  	messages:
	  	{
	  			'ticket[user_id]':
	            {
	            	required: "*Please select company"
	            },
	            'ticket[participant_name]':
	            {
	            	required: "*Enter Name"
	            },
	           'ticket[participant_email]':
	           {
	            	required: "*Enter email"
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
	       errorElement : 'div',
		errorPlacement : function(error, element) {
			error.insertAfter(element);

		}
	  });
}	

$(document).ready(function(){
  
    $('#comment_body').keypress(function(e){
      if(e.keyCode==13)
      {
      $('#add-comment').click();
      }
    });
});

