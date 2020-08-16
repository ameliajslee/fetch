<?php

include_once 'config.php';

if(session_status() != PHP_SESSION_ACTIVE) {
	session_start(); // Start the session
}

header("Content-Type: text/plain");

$runquery = TRUE;

if(!isset($_POST)) goto_404();
if(!isset($_POST['comment'])) goto_404();
if(strlen($_POST['comment']) < $COMMENT_MIN) {
	echo "Comment to short to post (Minimum is " . $COMMENT_MIN . "characters)";
	$runquery = FALSE;
}
if(strlen($_POST['comment']) > $COMMENT_MAX) {
	echo "Comment to long to post (Maximum is " . $COMMENT_MAX . " characters)";
	$runquery = FALSE;
}

// Make sure user is logged in, or redirect to login page
if(!isset($_SESSION['username']) || empty($_SESSION['username'])) {
	redirect("loginPage.php");
}

if(	$runquery ) {
	$query = "INSERT INTO FetchComments (`PostID`, `UserID`, `CommentText`)
	VALUES (?, ?, ?)";

	$conn = get_db();
	if($conn == null) {
		die("Unable to open database connection");
	}

	// Prepare and run the query
	if ($statement = mysqli_prepare($conn, $query)) {
		mysqli_stmt_bind_param($statement, 'iis', $_POST['PostID'], $_SESSION['userid'], $_POST['comment']);
		mysqli_stmt_execute($statement);
		
		if( mysqli_affected_rows($conn) <= 0 ) {
			echo "Failed to post comment";
		}
	}
}

// Go back to post page
//redirect($_SERVER['HTTP_REFERER']);

?>

