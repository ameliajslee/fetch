$( document ).on('submit', ".voteupForm", function(e) {
	e.preventDefault();

	if ($("#UpImage").attr("src") == "images/up.png") {
		if ($("#DownImage").attr("src") == "images/down_clicked.png") {
			$("#DownImage").attr("src","images/down.png");
		}
		$("#UpImage").attr("src","images/up_clicked.png");
	}
	else {
		$("#UpImage").attr("src","images/up.png");
	}

	var $inputs = $(this).children(":input");
	var vals = {};
	$inputs.each(function() {
		vals[this.name] = $(this).val();
	});
	var id = vals['CommentID'];
	
	$.ajax({
		url: 'vote.php',
		type: 'post',
		data: vals,
		success: function(output) {
			//alert(output); // DEBUG
		},
		error: function(xhr, error) {
			console.debug(xhr); console.debug(error);
		}
	});
});


$( document ).on('submit', ".votedownForm", function(e) {
	e.preventDefault();

	if ($("#DownImage").attr("src") == "images/down.png") {
		if ($("#UpImage").attr("src") == "images/up_clicked.png") {
			$("#UpImage").attr("src","images/up.png");
		}
		$("#DownImage").attr("src","images/down_clicked.png");
	}
	else {
		$("#DownImage").attr("src","images/down.png");

	}

	var $inputs = $(this).children(":input");
	var vals = {};
	$inputs.each(function() {
		vals[this.name] = $(this).val();
	});
	var id = vals['CommentID'];
	
	$.ajax({
		url: 'vote.php',
		type: 'post',
		data: vals,
		success: function(output) {
			//alert(output); // DEBUG
		},
		error: function(xhr, error) {
			console.debug(xhr); console.debug(error);
		}
	});
});




