$(document).bind('page:change', function() {
 initialise();
 customer();
});

function initialise() {
  $("#cofig_code").validate({
    	rules: {
      'user_info[company_name]': {
  		required: true,
  	   	},
        },
    	messages:
    	{
    			'user_info[company_name]':
              {
              	required: "*Enter company Name"
              },
    	},
         errorElement: 'div',
          errorPlacement: function(error, element) {
               error.insertAfter(element);
               
          }
    });	
}

function customer() {
  $("#customer_care").validate({
      rules: {
      'customer_care[customer_care_number]': {
        required: true,
        minlength: 10,
        maxlength: 10,
        },
      'customer_care[customer_care_email]': {
        required: true,        
        },
        },
      messages:
      {
        'customer_care[customer_care_number]':
            {
              required: "*Enter mobile number"
            },
        'customer_care[customer_care_email]':
            {
              required: "*Enter Email-id"
            },
      },
         errorElement: 'div',
          errorPlacement: function(error, element) {
               error.insertAfter(element);
               
          }
    }); 
}

$(window).bind('page:change',function() {
  $("#second :input").attr("disabled", true);
  $("#third :input").attr("disabled", true);
 
});

function enableSecondDiv (argument) {
  $("#second :input").attr("disabled", false);
  var c_name = $("#c_name").val();
  alert(c_name);
  $("#first :input").attr("disabled", true);
  $("#comp_name").val(c_name);

  $.ajax({
        type: "get",
            url: '/home/company_code_generator',
            data: {
                c_name: c_name
            },
            success: function(data){
              $("#code1").val(data);
              document.getElementById("code1").disabled = true;
              $("#hidden_code").val(data);

            }
          });

}

function enableThirdDiv (argument) {
  $("#third :input").attr("disabled", false);
  $("#second :input").attr("disabled", true);
}

