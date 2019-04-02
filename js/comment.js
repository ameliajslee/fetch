$( document ).on('submit', '#CommentForm', function(e) {
	e.preventDefault();
	var comment = $("#CommentBox").val();

	if(! CommentErr()) return;

	var $inputs = $(this).find(":input");
	var vals = {};
	$inputs.each(function() {
		vals[this.name] = $(this).val();
	});

	var commentText = '<div class="Comment">\
	<div class="CommentVotes">\
		<button class="CommentUpvote" id="cvoteup">\
			<img src="images/up.png" alt="UpVote" />\
		</button>\
		<p class="CommentNumVotes">0</p>\
		<button class="CommentDownvote" id="cvotedown">\
			<img src="images/down.png" alt="DownVote"/>\
		</button>\
	</div>\
	<div class="CommentContent">\
		<p class="CommentAuthor"></p>\
		<p>' + vals["comment"] + '</p>\
	</div>\
</div>';

	
	$.ajax({
		url: 'post_comment.php',
		type: 'POST',
		data: vals,
		success: function(output) {
			$("#Comments").append(commentText);
			$("#CommentBox").val('');
		},
		error: function(xhr, error) {
			console.debug(xhr); console.debug(error);
		}
	});
});

function CommentErr() {
	var accept = true;
    var content = $("#CommentBox");

    if (content.val().length >= 2){
    	content.removeClass("Error");
    } else {
    	content.addClass("Error");
		accept = false;
    }

	return accept;
}

$( document ).on('submit', ".CvoteupForm", function(e) {
	e.preventDefault();

	var $inputs = $(this).children(":input");
	var vals = {};
	$inputs.each(function() {
		vals[this.name] = $(this).val();
	});
	console.log(vals);
	var id = vals['commentid'];
	var post = $('#C' + id);
	var votes = post.find(".CommentVotes .CommentNumVotes");
	var nvotes = parseInt(votes.html());
	var downimg = post.find(".DownImage");
	var upimg = post.find(".UpImage");
	
	$.ajax({
		url: 'comment_vote.php',
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
                        }		},
		error: function(xhr, error) {
			console.log(xhr); console.log(error);
		}
	});
});

$( document ).on('submit', ".CvotedownForm", function(e) {
	e.preventDefault();

	var $inputs = $(this).children(":input");
	var vals = {};
	$inputs.each(function() {
		vals[this.name] = $(this).val();
	});
	var id = vals['commentid'];
	var post = $('#C'+id);
	var votes = post.find(".CommentVotes .CommentNumVotes");
	var nvotes = parseInt(votes.html());
	var downimg = post.find(".DownImage");
	var upimg = post.find(".UpImage");

	$.ajax({
		url: 'comment_vote.php',
		type: 'post',
		data: vals,
		success: function(output) {
			if(output) alert(output);
			if (downimg.attr("src") == "images/down.png") {
				if (upimg.attr("src") == "images/up_clicked.png") {
					nvotes -= 1;
					upimg.attr("src", "images/up.png");
				}
				nvotes -= 1;
				downimg.attr("src", "images/down_clicked.png");
			} else {
				nvotes += 1;
				downimg.attr("src", "images/down.png");
			}
			// Update the votes HTML
			votes.html(nvotes);
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

