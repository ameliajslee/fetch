window.onload = function() {
	get("SignUpButton").addEventListener("click", SignUpErrStyle); 
	get("SignInButton").addEventListener("click", SignInErrStyle); 
}

function SignUpErrStyle() {

	var input = get("Email");
	if (input.value.match(/^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+$/)){
		input.classList.remove("Error");
	}
	else {
		input.classList.add("Error");
	}

	input = get("Username");
	if (input.value.match(/^[^\s]+$/) && input.value.length >=4 && input.value.length<=20 ){
		input.classList.remove("Error");
	}
	else {
		input.classList.add("Error");
	}

	var pass1 = get("Password1");
	var pass2 = get("Password2");
	if (pass1.value == pass2.value && pass1.value.length>=1){
		pass1.classList.remove("Error");
		pass2.classList.remove("Error");
	}  
	else{
		pass1.classList.add("Error");
		pass2.classList.add("Error");
	}
}

function SignInErrStyle() {

	var input = get("InUsername");
	if (input.value.match(/^[^\s]+$/) && input.value.length >=4 && input.value.length<=20 ){
		input.classList.remove("Error");
	}
	else {
		input.classList.add("Error");
	}

	var pass = get("Password");
	if (pass.value.length>=1){
		pass.classList.remove("Error");
	}  
	else{
		pass.classList.add("Error");
	}
}

// Helper function to get an element by Id in less characters
function get(id) {
	return document.getElementById(id);
}