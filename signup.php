<?php

include_once "config.php";

/* Registers a user with username + password + email
 * ON SUCCESS:
 *      -> redirected to loginpage with login prompt 
 * ON FAILURE:
 *      -> redirected to loginpage with error message
 */

// Make sure username + password + email are posted
if(!isset($_POST))
	goto_404();
if(!isset($_POST['Username']) || !isset($_POST['Password']) || !isset($_POST['Email']))
	goto_404();

if(session_status() != PHP_SESSION_ACTIVE) {
	session_start();
}

// Select a user based on unique username
$query = "INSERT INTO FetchUsers (`Username`, `Password`, `Email`)
VALUES (?, ?, ?)";

$conn = get_db();
if($conn == null) {
	die("Unable to open database connection");
}

header("Content-Type:application/json");

// Prepare and run the query
if ($statement = mysqli_prepare($conn, $query)) {
	// Generate password hash
	$username = strtolower($_POST["Username"]); // Lowercase the username
	$passhash = password_hash($_POST['Password'], PASSWORD_DEFAULT); // Hash the password
	$email = $_POST['Email']; // Get the email

	mysqli_stmt_bind_param($statement, 'sss', $username, $passhash, $email);
	mysqli_stmt_execute($statement);
}

// SQL insert failed, likely user not unique
if(mysqli_affected_rows($conn) <= 0) {
	$ret = "User already exists";
	echo json_encode($ret);
} else {
	$ret = "Sign up successful! Log in to start fetching!";
	echo json_encode($ret);
}

//redirect("loginPage.php");

?>
