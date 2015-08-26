$(document).bind('page:change', function() {
	if ($('#cofig_code').length) {		
		customer();
	}
});

function customer() {	
  $("#cofig_code").validate({
      rules: {
      'user_info[customer_care_number]': {
        required: true,
        minlength: 10,
        maxlength: 10,
        },
      'user_info[customer_care_email]': {
        required: true,        
        },
        },
      messages:
      {
        'user_info[customer_care_number]':
            {
              required: "*Enter mobile number"
            },
        'user_info[customer_care_email]':
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

function homepage(){	
	$('#next').attr("disabled", false);
}	

function enableSecondDiv (argument) {
  $("#second :input").attr("disabled", false);
  var c_name = $("#c_name").val();  
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

	$("#third :input").attr("disabled", false);
	$("#second :input").attr("disabled", true);
}

// function enableThirdDiv (argument) {
  // $("#third :input").attr("disabled", false);
  // $("#second :input").attr("disabled", true);
// }