<?php

include_once "config.php";

if(! isset($_POST)) goto_404();
if(! isset($_POST['PostID'])) goto_404();

if(session_status() != PHP_SESSION_ACTIVE) {
	session_start();
}

$conn = get_db();
$query = "SELECT * FROM FetchPosts WHERE PostID=?";

if($statement = mysqli_prepare($conn, $query)) {
	mysqli_stmt_bind_param($statement, 'i', $_POST["PostID"]);
	mysqli_stmt_execute($statement);
}
$result = mysqli_stmt_get_result($statement); // Get result
if(mysqli_num_rows($result) > 0) {
	$post = mysqli_fetch_assoc($result);
	// Logged in user can only delete their own posts
	if($post['UserID'] == $_SESSION['userid']) { 
		if(!empty($post['ImageURL']) && file_exists($post['ImageURL']))
			unlink($post['ImageURL']); // Delete the image file
 		$query = "DELETE FROM FetchPosts WHERE PostID=?";
		if($statement = mysqli_prepare($conn, $query)) {
			mysqli_stmt_bind_param($statement, 'i', $_POST["PostID"]);
			mysqli_stmt_execute($statement);
		}
	}
}

mysqli_close($conn);

?>
