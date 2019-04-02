$(document).ready(function() {
	$("#CommentButton").onclick(CommentErr);
});

function CommentErr() {

    var content = $("#CommentBox");

    if (content.value.length >= 2){
    	content.removeClass("Error");
    } else {
    	content.addClass("Error");
    }
}
