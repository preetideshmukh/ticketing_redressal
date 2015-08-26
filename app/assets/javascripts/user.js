$(document).bind('page:change', function() {
	editpage();
	activationpage();
	initpage();
	editcustomerpage();
	forgetpasswordpage();

});

function initpage() {
	$("#log_up").validate({
		rules : {
			'user[firstname]' : {
				required : true
			},
			'user[lastname]' : {
				required : true
			},
			'user[email]' : {
				required : true
			},
			'user[mobile_no]' : {
				required : true,
				number : true,
				minlength : 10,
				maxlength : 10
			},
			'user[address_1]' : {
				required : true
			},
		},
		messages : {
			'user[firstname]' : {
				required : '*Enter first name'
			},
			'user[lastname]' : {
				required : '*Enter last name'
			},
			'user[email]' : {
				required : '*Enter email address'
			},
			'user[mobile_no]' : {
				required : '*Enter user mobile number'
			},
			'user[address_1]' : {
				required : '*Enter address'
			},

		},
		errorElement : 'div',
		errorPlacement : function(error, element) {
			error.insertAfter(element);

		}
	});
}

function editpage() {
	$("#edit_user").validate({
		rules : {
			'user[firstname]' : {
				required : true
			},
			'user[lastname]' : {
				required : true
			},
			'user[email]' : {
				required : true
			},
			'user[mobile_no]' : {
				required : true,
				number : true,
				minlength : 10,
				maxlength : 10
			},
			'user[address_1]' : {
				required : true
			},
			'user[current_password]' : {
				required : true
			},
		},
		messages : {
			'user[firstname]' : {
				required : '*Enter first name'
			},
			'user[lastname]' : {
				required : '*Enter last name'
			},
			'user[email]' : {
				required : '*Enter email address'
			},
			'user[mobile_no]' : {
				required : '*Enter user mobile number'
			},
			'user[address_1]' : {
				required : '*Enter the address'
			},
			'user[current_password]' : {
				required : '*Enter Current Password'
			}

		},
		errorElement : 'div',
		errorPlacement : function(error, element) {
			error.insertAfter(element);

		}
	});
}

function loginpage() {
	$("#log_in").validate({
		rules : {
			'user[email]' : {
				required : true
			},
			'user[password]' : {
				required : true
			},
		},
		messages : {
			'user[email]' : {
				required : '*Invalid Email'
			},
			'user[password]' : {
				required : '*Invalid password'
			},
		},
		errorElement : 'div',
		errorPlacement : function(error, element) {
			error.insertAfter(element);

		}
	});
}

function forgetpasswordpage() {	
	$("#forget-pass").validate({
		rules : {
			'user[email]' : {
				required : true
			},
		},
		messages : {
			'user[email]' : {
				required : '*Invalid Email'
			},
		},
		errorElement : 'div',
		errorPlacement : function(error, element) {
			error.insertAfter(element);

		}
	});
}

function activationpage() {
	$("#activation-form").validate({
		rules : {
			'user[password]' : {
				required : true,
				minlength : 8,
			},
			'user[password_confirmation]' : {
				required : true,
				minlength : 8,
			},
		},
		messages : {
			'user[password]' : {
				required : '*Password too short'
			},
			'user[password_confirmation]' : {
				required : '*Confirm Password too short'
			},
		},
		errorElement : 'div',
		errorPlacement : function(error, element) {
			error.insertAfter(element);

		}
	});
}

function editcustomerpage() {
	$("#edit_customer").validate({
		rules : {
			'user[customer_care_email]' : {
				required : true
			},
			'user[customer_care_number]' : {
				required : true,
				number : true,
				minlength : 10,
				maxlength : 10
			},
			'user[current_password]' : {
				required : true
			},
		},
		messages : {
			'user[customer_care_email]' : {
				required : '*Enter email address'
			},
			'user[customer_care_number]' : {
				required : '*Enter customer care number'
			},
			'user[current_password]' : {
				required : '*Enter Current Password'
			}

		},
		errorElement : 'div',
		errorPlacement : function(error, element) {
			error.insertAfter(element);

		}
	});
}