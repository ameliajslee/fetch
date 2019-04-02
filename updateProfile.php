<?php

include_once "config.php";

// Make sure POST method is used
if(!isset($_POST))
	goto_404();
// Make sure Email and/or Password variables are sent
if(!isset($_POST['Email']) && !isset($_POST['Password1']))
	goto_404();

if(session_status() != PHP_SESSION_ACTIVE) {
	session_start(); // Start the session
}
// Make sure user is logged in, or redirect to login page
if(!isset($_SESSION['username'])) {
	redirect("loginPage.php");
}

header("Content-Type: text/plain");
$conn = get_db();

// Update the user's email address
if(isset($_POST['Email']) && !empty($_POST['Email'])) {
	$query = "UPDATE FetchUsers SET Email=? WHERE UserID=?";
	$stmt = mysqli_prepare($conn, $query);
	mysqli_stmt_bind_param($stmt, "si", $_POST['Email'], $_SESSION['userid']);
	mysqli_execute($stmt);
	
	if(mysqli_affected_rows($conn) == 1) {
		echo "Email udated successfully. ";
	} else {
		echo "Failed to update Email address. ";
	}
}

if(isset($_POST['Password1']) && isset($_POST['Password2']) && !empty($_POST['Password1'])) {
	if($_POST['Password1'] != $_POST['Password2']) {
		echo "Passwords do not match. ";
	} else if(FALSE) {
		// TODO: Amelia's password checker function
	} else {
		$query = "UPDATE FetchUsers SET Password=? WHERE UserID=?";
		$stmt = mysqli_prepare($conn, $query);
		$password = password_hash($_POST['Password1'], PASSWORD_DEFAULT);
		mysqli_stmt_bind_param($stmt, "si", $password, $_SESSION['userid']);
		mysqli_execute($stmt);

		if(mysqli_affected_rows($conn) == 1) {
			echo "Password updated successfully. ";
		} else {
			echo "Failed to update password. ";
		}
	}
}

mysqli_close($conn);

redirect("profilePage.php");

?>

