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
	<head>
		<meta charset="utf-8">
  		<title>Post a Fetch</title>
		<link rel="stylesheet" type="text/css" href="design.css">
		<link rel="icon" href="images/logo.png" type="image" sizes="16x16">
  	</head>

	<body>
		<?php include "header.php"; 
		$post = FALSE;
		if(isset($_GET['edit']) && !empty($_GET['edit'])) {
			$conn = get_db();
			$query = "SELECT * FROM FetchPosts WHERE PostID=?";
			$statement = mysqli_prepare($conn, $query);
			mysqli_stmt_bind_param($statement, "i", $_GET['edit']);
			mysqli_stmt_execute($statement);
			$result = mysqli_stmt_get_result($statement);
			$post = mysqli_fetch_assoc($result);
			if($_SESSION['userid'] != $post['UserID']) {
				$post = FALSE;
			}
		}
		?>		
	  	<div class="PostBox">
	  		<h1>Post a Fetch</h1>
	  		<form method="POST" id="PostForm" action="post_image.php" enctype="multipart/form-data">
				<?php if($post) { ?>
					<input type="hidden" name="edit" value="<?php echo $_GET['edit']; ?>" />
				<?php } ?>
		  		<span class="CuteDiscuss"><b>Cute
			  		<label class="CuteDiscussToggle">
	  					<input type="checkbox" name="Type" <?php if($post && $post['PostType'] == $DISC_POST) echo "checked"; ?>>
	  						<span class="CuteDiscussSlider round"></span>
					</label> Discussion</b>
				</span>
				<b>Title</b> <br>
				<input id="Title" class="TitleBox" type="text" name="Title"
				<?php if($post) echo "value=\"" . $post['PostTitle'] . "\""; ?> />
				<br><br>
				<b>Content</b><br>
				<textarea id="Content" class="ContentBox" type="text" name="Content"><?php if($post) echo utf8_decode($post['PostContent']); ?></textarea>
				<br><br>
				<b>Include Image: </b>
				<?php if(! $post) { /* Changing image not allowed */ ?>
					<input id="ImageFile" class="PostImage" type="file" name="ImageFile" accept="image/*" />
				<?php } ?>
		  		<button id="PostButton" name="PostButton" class="PostButton">Post</button>
	  		</form>
		</div>	
	  	<div class=BottomBar>
		  	<div class=BottomLine>
		  	</div>
	  	</div>
  	</body>
 </html>