window.onload = function() {
	get("PostButton").addEventListener("click",PostErr); 
}

function PostErr() {

    var file = get("Image").files[0];
    var content = get("Content");
    var title = get("Title");

    if (file || content.value.length>0 || title.value.length>0){
    	title.classList.remove("Error");
    }
    else {
    	title.classList.add("Error");
    }
}

// Helper function to get an element by Id in less characters
function get(id) {
	return document.getElementById(id);
}
