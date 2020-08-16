<?php

include_once "config.php";
/* Logs a user given by the username + password into the site
 * ON SUCCESS:
 *      -> new session started with user info in $_SESSION['username'] , $_SESSION['userid'] 
 * ON FAILURE:
 *      -> exit() or 404, no session set
 */

// Make sure username + password are posted
if(!isset($_POST)) goto_404();
if(!isset($_POST['Username']) || !isset($_POST['Password'])) goto_404();

if(session_status() != PHP_SESSION_ACTIVE) {
	session_start();
}

$conn = get_db();
if($conn == null) {
	die("Could not connect to database");
}

header("Content-Type:application/json");

// Select a user based on unique username
$query = "SELECT * FROM FetchUsers WHERE Username=?";

// Prepare and run the query
if ($statement = mysqli_prepare($conn, $query)) {
	$username = strtolower($_POST["Username"]); // Lowercase username
	mysqli_stmt_bind_param($statement, 's', $username);
	mysqli_stmt_execute($statement);
} else {
	mysqli_close($conn);
	echo json_encode([1, "prepare failed: " . $query]);
	exit();
}
$result = mysqli_stmt_get_result($statement); // Get result
if(mysqli_num_rows($result) == 0) {// User not found
	mysqli_close($conn);
	$arr = array(1, "Invalid username or password");
	echo json_encode($arr);
	//redirect("loginPage.php");
} else {
	$user = mysqli_fetch_assoc($result); // Get result array
	if(!password_verify($_POST['Password'], $user['Password'])) {// Password doesn't match
		mysqli_close($conn);
		$arr = array(1, "Invalid username or password");
		echo json_encode($arr);
		//redirect("loginPage.php");
	} else {
		// Close MySQL connection
		mysqli_close($conn);

		// Store session info for this user
		$_SESSION['username'] = $user['Username'];
		$_SESSION['userid']   = $user['UserID'];

		$arr = array(0, "homePage.php");
		echo json_encode($arr);
		// Redirect to homepage
		//redirect("homePage.php");
	}
}

?>
