<?php
include_once 'config.php';

if(session_status() != PHP_SESSION_ACTIVE) {
	session_start(); // Start the session
}

if(isset($_SESSION['username']) && !empty($_SESSION['username'])) {
	redirect("profilePage.php");
}

?>

<!DOCTYPE html >
<html lang="en">
	<head>
		<meta charset="utf-8">
  		<title>Fetch: Log In</title>
		<link rel="stylesheet" type="text/css" href="design.css">
		<link rel="icon" href="images/logo.png" type="image" sizes="16x16">

		<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="js/login.js"></script>
  	</head>

	<body>
		<?php include "header.php"; ?>
		
		<div class="SignUps">
			<form method="POST" action="signup.php" id="SignupForm">
				<div class="SignUpBox">
					<h1>Sign Up</h1> 
			  		<b>Email *</b><br>
			  		<input class="NormalBox" type="text" name="Email" id="Email" placeholder="xxx@yyy.zzz">
			  		<br><br>
			  		<b>Username *</b><br>
			  		<input class="NormalBox" type="text" name="Username" id="Username" placeholder="4-20 chars, no spaces"> 
			  		<br><br>
			  		<b>Password *</b> <br>
			  		<input class="NormalBox" type="password" name="Password" id="Password1">
			  		<br><br>
			  		<b>Confirm Password *</b><br>
			  		<input class="NormalBox" type="password" name="Password_verify" id="Password2">
			  		<button id="SignUpButton" class="SignUpButton">GO!</button>
				</div>
			</form>
			<form method="POST" action="login.php" id="LoginForm">
				<div class="SignInBox">
					<h1>Sign In</h1>
					<b>Username *</b> <br>
			  		<input class="NormalBox" type="text" name="Username" id="InUsername" placeholder="4-20 chars, no spaces"> 
			  		<br><br>
			  		<b>Password *</b> <br>
			  		<input class="NormalBox" type="password" name="Password" id="Password">
			  		<button id="SignInButton" class="SignInButton">GO!</button>
				</div>	
			</form>

		  	<div class=BottomBar>
			  	<div class=BottomLine>
			  	</div>
		  	</div>
	  	</div>
  	</body>
</html>
