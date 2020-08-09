$( document ).on('submit', "#PostForm", function(e) {
	e.preventDefault();
	
	if(! PostErr()) return;
	
	var $inputs = $('#PostForm :input');
	var vals = {};
	$inputs.each(function() {
		vals[this.name] = $(this).val();
	});
	
	$.ajax({
		url: 'post_image.php',
		type: 'post',
		data: vals,
		success: function(output) {
			if(output[0] == 0)
				$(location).attr("href", output[1]);
			else
				alert(output[1]);
		},
		error: function(xhr, error) {
			console.log(vals);
			console.log(xhr, error);
			console.debug(xhr); console.debug(error);
		}
	});
});

function PostErr() {
	var accept = true;

	var file = $("#ImageFile").val();
	var content = $("#Content");
	var title = $("#Title");

	if (file || content.val().length > 0 || title.val().length > 0){
		title.removeClass("Error");
	} else {
		title.addClass("Error");
		accept = false;
	}
	
	return accept;
}

