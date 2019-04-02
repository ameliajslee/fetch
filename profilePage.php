<?php
include_once 'config.php';

if(session_status() != PHP_SESSION_ACTIVE) {
	session_start(); // Start the session
}

// Make sure user is logged in, or redirect to login page
if(!isset($_SESSION['username'])) {
	redirect("loginPage.php");
}

$conn = get_db();
if($conn == null) {
	die("Error connecting to database.");
}

$query = "SELECT * FROM FetchUsers
WHERE UserID=?";

$stmt = mysqli_prepare($conn, $query);
mysqli_stmt_bind_param($stmt, "i", $_SESSION['userid']);
mysqli_execute($stmt);
$result = mysqli_stmt_get_result($stmt);

// If post not found
if(mysqli_num_rows($result) != 1) {
	//goto_404(); // User not found, go to 404
	echo "user not found: ". mysqli_num_rows($result);
}

$user = mysqli_fetch_assoc($result);
?>

<!DOCTYPE html >
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Fetch Profile</title>
		<link rel="stylesheet" type="text/css" href="design.css">
		<link rel="icon" href="images/logo.png" type="image" sizes="16x16">
		<script type="text/javascript" src="js/upCheck.js"></script>
	</head>

	<body>

	<?php include "header.php"; ?>
	<form action="homePage.php" method="POST">
		<button class="ToHomePage">Back to Fetching</button>
	</form>

	<div class="ProfileBox">
	<h1>Profile</h1>
	<div class="userNtreats">
		<p><i><?php echo $user['Username']; ?></i><br>
		<b>Treats: </b><i><?php echo $user['NumTreats']; ?></i>
		</p>
	</div>

	<form method="POST" action="updateProfile.php">
		<table>
			<tr>
				<td colspan="2">
					<b>Email</b> <br>
					<input class="LongBox" id="Email" type="text" name="Email" placeholder="xxx@yyy.zzz">
				</td>
			</tr>
			<tr>
				<td>
					<b>Password</b> <br>
					<input class="NormalBox" type="password" name="Password1" id="Password1">
				</td>
				<td>
					<b>Confirm Password</b> <br>
					<input class="NormalBox" type="password" name="Password2" id="Password2">
				</td>
			</tr>
		</table>
		<button id="ProfileButton" class="ProfileButton">Update</button>
	</form>
	</div>
		<div class=BottomBar>
			<div class=BottomLine>
			</div>
		</div>
	</body>
</html>
