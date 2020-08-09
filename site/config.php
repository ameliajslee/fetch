<?php

$SERVERNAME = "localhost";
$USERNAME = "leex2170";
$PASSWORD = "BananaExplosion2";
$DBNAME = "leex2170";

// Make some status variables for session
$NOERROR     = 0;
$LOGIN_FAIL  = 1;
$SIGNUP_FAIL = 2;
$SIGNUP_SUCC = 3;

// Define some global variables
$COMMENT_MIN = 2;
$COMMENT_MAX = 2000;
$CUTE_POST = 1;
$DISC_POST = 0;


function get_db() {
	global $SERVERNAME, $USERNAME, $PASSWORD, $DBNAME;
	// Create connection
	$conn = mysqli_connect($SERVERNAME, $USERNAME, $PASSWORD, $DBNAME);

	// Check connection
	if ($conn->connect_error) {
		return null;
	}

	// Return connection
	return $conn;
}

function redirect($url) {
	header("Location: " . $url);
	exit();
}

function goto_404() {
	header("Location: 404.html");
	exit();
}

function is_owner($postid) {
	if(session_status() != PHP_SESSION_ACTIVE) {
		session_start();
	}

	$check = FALSE;
	$conn = get_db();
	$query = "SELECT * FROM FetchPosts WHERE PostID=?";
	if($statement = mysqli_prepare($conn, $query)) {
		mysqli_stmt_bind_param($statement, "i", $postid);
		mysqli_stmt_execute($statement);
		$result = mysqli_stmt_get_result($statement); // Get result
		$post = mysqli_fetch_assoc($result);
		
		if($post['UserID'] == $_SESSION['userid'])
			$check = TRUE;
	}
	mysqli_close($conn);

	return $check;
}

function make_filename($path, $ext) {
	$n = rand(); // Generate random number
	while(file_exists($path . $n . "." . $ext)) {
		$n = rand(); // Choose next random number
	}
	return $path . $n . "." . $ext;
}

function make_post($post) {
	if(session_status() != PHP_SESSION_ACTIVE) {
		session_start();
	}

	$conn = get_db();
	$query = "SELECT * FROM FetchVotes WHERE UserID=? AND PostID=?";
	$stmt = mysqli_prepare($conn, $query);
	mysqli_stmt_bind_param($stmt, "ii", $_SESSION['userid'], $post['PostID']);
	mysqli_execute($stmt);

	$result = mysqli_stmt_get_result($stmt);
	$vote = FALSE;

	if(mysqli_num_rows($result) > 0) {
		$row = mysqli_fetch_assoc($result);
		$vote = $row['Vote'];
	}
	mysqli_close($conn);
?>

<div class="OnePost" id="<?php echo $post['PostID']; ?>">
	<div class="Votes">
	<?php if($_SESSION['userid'] != $post['UserID']) { ?>
		<form method="post" action="vote.php" class="voteupForm">
			<input value="1" name="vote" type="hidden" />
			<input value="<?php echo $post['PostID']; ?>" name="postid" type="hidden" />
			<button class="Upvote">
				<?php if($vote == 1) { ?>
					<img src="images/up_clicked.png" class="UpImage" alt="UpVote"/>
				<?php } else { ?>
					<img src="images/up.png" class="UpImage" alt="UpVote"/>
				<?php } ?>
			</button>
		</form>
		<p class="NumVotes"> <?php echo $post['NumVotes']; ?> </p>
		<form method="post" action="vote.php" class="votedownForm">
			<input value="-1" name="vote" type="hidden" />
			<input value="<?php echo $post['PostID']; ?>" name="postid" type="hidden" />
			<button class="Downvote">
				<?php if($vote == -1) { ?>
					<img src="images/down_clicked.png" class="DownImage" alt="UpVote"/>
				<?php } else { ?>
					<img src="images/down.png" class="DownImage" alt="UpVote"/>
				<?php } ?>
			</button>
		</form>
	<?php } else { ?>
		<form class="EditForm" action="#" method="POST">
			<input type="hidden" value="<?php echo $post['PostID']; ?>" name="PostID">
			<button class="EditPost">
				<img src="images/edit.png" alt="EditPost"/>
			</button>
		</form><br>
		<form class="DeleteForm" action="#" method="POST">
			<input type="hidden" value="<?php echo $post['PostID']; ?>" name="PostID">
			<button class="DeletePost">
				<img src="images/delete.png" alt="DeletePost"/>
			</button>
		</form>
	<?php } ?>
	</div>
	<div class="PostsContent" onclick="location.href='onePostPage.php?PostID=<?php echo $post['PostID']; ?>';">
		<h4>
			<a href="onePostPage.php?PostID=<?php echo $post['PostID']; ?>">
			<?php echo $post['PostTitle']; ?>
			</a>
		</h4>
		<p class="ByAuthor">by <b><a href="homePage.php?UserID=<?php echo $post["UserID"]; ?>"><?php echo utf8_encode($post['Username']); ?></a></b> <?php echo $post['NumComments']; ?> comment(s)</p>
		<p>
		<?php echo utf8_encode($post['PostContent']); ?></p>
		<?php
		if(!empty($post['ImageURL'])) {
			echo "<div class=\"ImageDiv\">";
			echo "<a href=\"onePostPage.php?PostID=" . $post['PostID'] . "\">";
			echo "<img class=\"postImage\" src=\"" . $post['ImageURL'] . "\" />";
			echo "</a></div>";
		}
		?>
	</div>
</div>

<?php
}
?>
