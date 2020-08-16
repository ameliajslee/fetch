<?php

include_once "config.php";

// Start the session if not started
if(session_status() != PHP_SESSION_ACTIVE) {
	session_start();
}
// Make sure user is logged in, or redirect to login page
if(!isset($_SESSION['username'])) {
	redirect("loginPage.php");
}

header("Content-Type: application/json");

// POST method is used
if(!isset($_POST)) {
	goto_404();
}
// postid, userid, vote are all provided
if(!isset($_POST["postid"]) || !isset($_POST["vote"])) {
	goto_404();
}
// vote value is valid (vote == +1 or -1)
if($_POST["vote"] != "-1" && $_POST["vote"] != "1") {
	goto_404();
}


$conn = get_db(); // Open database connection
$query = "INSERT INTO FetchVotes (UserID, PostID, Vote)
VALUES (?, ?, ?)
ON DUPLICATE KEY UPDATE
	Vote = ?";

// Prepare and run the query
if($statement = mysqli_prepare($conn, $query)) {
	mysqli_stmt_bind_param($statement, 'iiii', $_SESSION['userid'], $_POST["postid"], $_POST["vote"], $_POST["vote"]);
	mysqli_stmt_execute($statement);
	if(mysqli_affected_rows($conn) < 1) {
		echo json_encode("Error submitting vote: " .  mysqli_error($conn));
		mysqli_close($conn);
		exit();
		//redirect($_SERVER['HTTP_REFERER']);
	}
}

echo json_encode(FALSE);

mysqli_close($conn);

?>
