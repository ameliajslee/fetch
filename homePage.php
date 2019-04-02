<?php

include_once 'config.php';

if(session_status() != PHP_SESSION_ACTIVE) {
	session_start(); // Start the session
}

// Make sure user is logged in, or redirect to login page
if(!isset($_SESSION['username'])) {
	redirect("loginPage.php");
}

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
  	</head>

<!-- Main body -->
	<body>
		<?php include "header.php"; ?>
		<div class="MidBar">
		  		<span class="NewTop"><b>New
			  		<label class="NewTopToggle">
	  					<form method="POST" action="" onChange="submit()">
						<input type="checkbox" name="NewTopToggle"
						<?php if(isset($_POST['NewTopToggle'])) echo "checked"; ?> />
	  					<span class="NewTopSlider round"></span>
						</form>
					</label> Top</b>
				</span>
			  	<div class="Yards">
					<form action="#">
					<button class="MainYard" name="MainYard" value="0">Main</button>
					<button class="CuteYard" name="CuteYard" value="1">Cute</button>
					<button class="DiscussYard" name="DiscussYard" value="2">Discussion</button>
					</form>
			  	</div>
			  	<form class="Search" method="get" action="" id="SearchBar">
				  	<input class="SearchBar" name="Query" type="text" placeholder="Search...">
				  	<button class="SearchButton" type="submit"><img src="images/search.png" alt="search"/></button>
				</form>
			</div>
		
		
		<!-- Content/Posts Area -->
		<div class="Body">
			<div class="AllPosts">
<?php
$conn = get_db();

$ordering = 0;
if(isset($_POST['NewTopToggle']))
	$ordering = 1;

$posttype = 2;
if(isset($_GET['CuteYard']))
	$posttype = $CUTE_POST;
else if(isset($_GET['DiscussYard']))
	$posttype = $DISC_POST;


if(!isset($_GET['UserID']) || empty($_GET['UserID'])) {
	$sql = "SELECT *
	FROM FetchPosts AS P, FetchUsers AS U
	WHERE P.UserID = U.UserID AND (PostType=? OR ?=2)";
	if(isset($_GET['Query']) && !empty($_GET['Query'])) {
		$sql = $sql . " AND (PostTitle LIKE ? OR PostContent LIKE ?)";
	}
	if($ordering == 0) $sql = $sql . " ORDER BY CreateTime DESC";
	else $sql = $sql . " ORDER BY NumVotes DESC";

	$stmt = mysqli_prepare($conn, $sql);
	if(isset($_GET['Query']) && !empty($_GET['Query'])) {
		$searchterm = '%' . $_GET['Query'] . '%';
		mysqli_stmt_bind_param($stmt, "iiss", $posttype, $posttype, $searchterm, $searchterm);
	} else {
		mysqli_stmt_bind_param($stmt, "ii", $posttype, $posttype);
	}
	mysqli_execute($stmt);
	$result = mysqli_stmt_get_result($stmt);
} else {
	$sql = "SELECT *
	FROM FetchPosts AS P, FetchUsers AS U
	WHERE P.UserID = U.UserID AND U.UserID=? and (PostType=? OR ?=2)";
	if(isset($_GET['Query']) && !empty($_GET['Query'])) {
		$sql = $sql . " AND (PostTitle LIKE ? OR PostContent LIKE ?)";
	}
	if($ordering == 0) $sql = $sql . " ORDER BY CreateTime DESC";
	else $sql = $sql . " ORDER BY NumVotes DESC";

	$stmt = mysqli_prepare($conn, $sql);
	if(isset($_GET['Query']) && !empty($_GET['Query'])) {
		$searchterm = '%' . $_GET['Query'] . '%';
		mysqli_stmt_bind_param($stmt, "iiiss", $_GET['UserID'], $posttype, $posttype, $searchterm, $searchterm);
	} else {
		mysqli_stmt_bind_param($stmt, "iii", $_GET['UserID'], $posttype, $posttype);
	}
	mysqli_execute($stmt);
	$result = mysqli_stmt_get_result($stmt);
}

while ($post = mysqli_fetch_assoc($result)) {
	make_post($post);
}

// Close the database connection
mysqli_close($conn);
?>
			</div>
	  	</div>

		<p style="text-align:center"><b>~~ End of posts ~~</b></p>

	  	<div class=BottomBar>
			<form method="POST" action="postPage.php">
				<button class="PostNewButton">+</button><div>
			</form>
		  	<div class=BottomLine>
		  	</div>
	  	</div>
  	</body>
 </html>
