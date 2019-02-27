window.onload = function() {
	get("CommentButton").addEventListener("click",CommentErr); 
}

function CommentErr() {

    var content = get("CommentBox");

    if (content.value.length>=2){
    	content.classList.remove("Error");
    }
    else {
    	content.classList.add("Error");
    }
}

// Helper function to get an element by Id in less characters
function get(id) {
	return document.getElementById(id);
}
