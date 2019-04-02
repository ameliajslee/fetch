<?php
include_once 'config.php';

if(session_status() != PHP_SESSION_ACTIVE) {
	session_start(); // Start the session
}

// Make sure user is logged in, or redirect to login page
if(!isset($_SESSION['username']) || empty($_SESSION['username'])) {
	redirect("loginPage.php");
}

// Make sure a postID is passed
if( !isset($_GET['PostID']) ) {
	goto_404(); // No post id set, go to 404
}

// Create connection
$conn = get_db();
// Check connection
if($conn == null) {
    die("Connection failed: " . mysqli_error($conn));
}

$query = "SELECT *
FROM FetchPosts AS P, FetchUsers AS U
WHERE PostID=? AND P.UserID=U.UserID";

$stmt = mysqli_prepare($conn, $query);
mysqli_stmt_bind_param($stmt, "i", $_GET['PostID']);
mysqli_execute($stmt);
$result = mysqli_stmt_get_result($stmt);

// If post not found
if(mysqli_num_rows($result) != 1) {
	goto_404(); // No post id found, go to 404
}

$post = mysqli_fetch_assoc($result);
?>

<!DOCTYPE html>
<html lang="en">
<!-- Header; includes, title, etc. -->
	<head>
		<meta charset="utf-8">
  		<title>Fetch</title>
		<link rel="stylesheet" type="text/css" href="design.css">
		<link rel="icon" href="images/logo.png" type="image" sizes="16x16">

		<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
  		<script type="text/javascript" src="js/edit_delete.js"></script>
  		<script type="text/javascript" src="js/vote.js"></script>
  		<script type="text/javascript" src="js/comment.js"></script>
  	</head>

<!-- Main body -->
	<body>
		<?php include "header.php"; ?>

		<!-- Content/Posts Area -->
		<div class="Body">
	  		<div class="AllPosts">
<?php make_post($post); ?>
		<div class="Comments" id="Comments">
<?php

$query = "SELECT CommentID, Username, CommentText, CommentScore
FROM FetchComments as C, FetchUsers as U
WHERE C.UserID=U.UserID AND PostID=?";

$stmt = mysqli_prepare($conn, $query);
if(! $stmt) {
	die("MySQL Error: " . mysqli_error($conn)); // mysqli error
}
mysqli_stmt_bind_param($stmt, "i", $_GET['PostID']);
mysqli_execute($stmt);
$result = mysqli_stmt_get_result($stmt);

while ($comment = mysqli_fetch_assoc($result)) {
	$query = "SELECT * FROM FetchCommentVotes WHERE UserID=? AND CommentID=?";
	$stmt = mysqli_prepare($conn, $query);
	mysqli_stmt_bind_param($stmt, "ii", $_SESSION['userid'], $comment['CommentID']);
	mysqli_execute($stmt);

	$res = mysqli_stmt_get_result($stmt);
	$vote = FALSE;

	if(mysqli_num_rows($res) > 0) {
		$row = mysqli_fetch_assoc($res);
		$vote = $row['Vote'];
	}

?>

<div class="Comment" id="C<?php echo $comment['CommentID']; ?>">
	<div class="CommentVotes">
		<form method="post" action="comment_vote.php" class="CvoteupForm">
			<input value="1" name="vote" type="hidden" />
			<input value="<?php echo $comment['CommentID']; ?>" name="commentid" type="hidden" />
			<button class="CommentUpvote">
				<?php if($vote == 1) { ?>
					<img src="images/up_clicked.png" class="UpImage" alt="UpVote"/>
				<?php } else { ?>
					<img src="images/up.png" class="UpImage" alt="UpVote"/>
				<?php } ?>
			</button>
		</form>
		<p class='CommentNumVotes'><?php echo $comment['CommentScore']; ?></p>
		<form method="post" action="comment_vote.php" class="CvotedownForm">
			<input value="-1" name="vote" type="hidden" />
			<input value="<?php echo $comment['CommentID']; ?>" name="commentid" type="hidden" />
			<button class="CommentDownvote">
				<?php if($vote == -1) { ?>
					<img src="images/down_clicked.png" class="DownImage" alt="UpVote"/>
				<?php } else { ?>
					<img src="images/down.png" class="DownImage" alt="UpVote"/>
				<?php } ?>
			</button>
		</form>
	</div>

	<div class="CommentContent">
		<p class="CommentAuthor"><?php echo $comment['Username']; ?> says: </p>
		<p><?php echo $comment['CommentText']; ?></p>
	</div>
</div>

<?php
}
mysqli_close($conn);
?>
				</div>
			</div>
	  	</div>
	  		
	  	<div class="BottomBar">
	  		<div>
				<form method="POST" action="post_comment.php" id="CommentForm">
					<input type="hidden" name="PostID" id="PostID" value="<?php echo $_GET['PostID']; ?>">
					<textarea id="CommentBox" name="comment" class="CommentBox" placeholder="Put your 'woof' Here! At least 2 characters"></textarea>
					<button id="CommentButton" class="CommentButton">+</button>
				</form>
			</div>
		  	<div class="BottomLine">
		  	</div>
	  	</div>
  	</body>
</html>

