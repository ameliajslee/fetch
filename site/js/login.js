$( document ).on('submit', '#LoginForm', function(e) {
	e.preventDefault();

	if(! SignInErrStyle()) return;

	var $inputs = $('#LoginForm :input');
	var vals = {};
	$inputs.each(function() {
		vals[this.name] = $(this).val();
	});

	$.ajax({
		url: 'login.php',
		type: 'post',
		data: vals,
		success: function(output) {
			if(output[0] == 0)
				$(location).attr("href", output[1]);
			else
				alert(output[1]);
		},
		error: function(xhr, error) {
			console.debug(xhr); console.debug(error);
		}
	});
});

$( document ).on('submit', "#SignupForm", function(e) {
	e.preventDefault();

	if(! SignUpErrStyle()) return;

	var $inputs = $('#SignupForm :input');
	var vals = {};
	$inputs.each(function() {
		vals[this.name] = $(this).val();
	});

	$.ajax({
		url: 'signup.php',
		type: 'POST',
		data: vals,
		success: function(output) {
			alert(output);
		},
		error: function(xhr, error) {
			console.debug(xhr); console.debug(error);
		}
	});

});


function SignUpErrStyle() {
	var accept = true;

	var input = $("#Email");
	if(input.val().match(/^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+$/)){
		input.removeClass("Error");
	} else {
		input.addClass("Error");
		accept = false;
	}

	input = $("#Username");
	if(input.val().match(/^[^\s]+$/)
			&& input.val().length >= 4
			&& input.val().length <= 20) {
		input.removeClass("Error");
	} else {
		input.addClass("Error");
		accept = false;
	}

	var pass1 = $("#Password1");
	var pass2 = $("#Password2");
	if(pass1.val() == pass2.val() && pass1.val().length >= 1){
		pass1.removeClass("Error");
		pass2.removeClass("Error");
	} else {
		pass1.addClass("Error");
		pass2.addClass("Error");
		accept = false;
	}

	return accept;
}

function SignInErrStyle() {
	var accept = true;

	var input = $("#InUsername");
	if(input.val().match(/^[^\s]+$/)
			&& input.val().length  >= 4
			&& input.val().length <= 20 ) {
		input.removeClass("Error");
	} else {
		input.addClass("Error");
		accept = false;
	}

	var pass = $("#Password");
	if(pass.val().length >= 1) {
		pass.removeClass("Error");
	} else {
		pass.addClass("Error");
		accept = false;
	}

	return accept;
}

