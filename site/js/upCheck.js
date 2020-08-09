window.onload = function() {
	get("ProfileButton").addEventListener("click",UpdateErr); 
}

function UpdateErr() {

	var input = get("Email");
	if (input.value.match(/^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+$/)){
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

// Helper function to get an element by Id in less characters
function get(id) {
	return document.getElementById(id);
}
