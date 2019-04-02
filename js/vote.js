$( document ).on('submit', ".voteupForm", function(e) {
	e.preventDefault();

	var $inputs = $(this).children(":input");
	var vals = {};
	$inputs.each(function() {
		vals[this.name] = $(this).val();
	});
	var id = vals['postid'];
	var post = $('#'+id);
	var votes = post.find(".Votes .NumVotes");
	var nvotes = parseInt(votes.html());
	var downimg = post.find(".DownImage");
	var upimg = post.find(".UpImage");
	
	$.ajax({
		url: 'vote.php',
		type: 'post',
		data: vals,
		success: function(output) {
			if(output) alert(output);
			// Update the votes HTML
			if (upimg.attr("src") == "images/up.png") {
				if (downimg.attr("src") == "images/down_clicked.png") {
					nvotes += 1;
					downimg.attr("src","images/down.png");
				}
				nvotes += 1;
				upimg.attr("src","images/up_clicked.png");
			}
			else {
				nvotes -= 1;
				upimg.attr("src","images/up.png");
			}
			
			votes.html(nvotes);
			if(nvotes <= -5) {
				post.empty();
				post.remove();
			}
		},
		error: function(xhr, error) {
			console.log(xhr); console.log(error);
		}
	});
});


$( document ).on('submit', ".votedownForm", function(e) {
	e.preventDefault();

	var $inputs = $(this).children(":input");
	var vals = {};
	$inputs.each(function() {
		vals[this.name] = $(this).val();
	});
	var id = vals['postid'];
	var post = $('#'+id);
	var votes = post.find(".Votes .NumVotes");
	var nvotes = parseInt(votes.html());
	var downimg = post.find(".DownImage");
	var upimg = post.find(".UpImage");

	$.ajax({
		url: 'vote.php',
		type: 'post',
		data: vals,
		success: function(output) {
			if(output) alert(output);
			if (downimg.attr("src") == "images/down.png") {
				if (upimg.attr("src") == "images/up_clicked.png") {
					nvotes -= 1;
					upimg.attr("src","images/up.png");
				}
				nvotes -= 1;
				downimg.attr("src","images/down_clicked.png");
			} else {
				nvotes += 1;
				downimg.attr("src","images/down.png");
			}
			// Update the votes HTML
			votes.html(nvotes);
                        if(nvotes <= -5) {
                                post.empty();
                                post.remove();
                        }
		},
		error: function(xhr, error) {
			console.log(xhr); console.log(error);
		}
	});
});

