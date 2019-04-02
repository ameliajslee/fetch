<?php

include_once 'config.php';

if(session_status() != PHP_SESSION_ACTIVE) {
	session_start(); // Start the session
}

$runquery = TRUE;

if(!isset($_POST)) goto_404();
if(!isset($_POST['Content']) || !isset($_POST['Title']) || !isset($_POST['PostButton'])) goto_404();

// Make sure user is logged in, or redirect to login page
if(!isset($_SESSION['username']) || empty($_SESSION['username'])) {
	redirect("loginPage.php");
}

// print_r($_POST); exit(); // DEBUG

$imageUploaded = 0;
$uploadOk = 1;
$target_file = "";
if(!isset($_POST['edit']) || empty($_POST['edit'])) {
	if(file_exists($_FILES['ImageFile']['tmp_name']) && is_uploaded_file($_FILES['ImageFile']['tmp_name'])) {
		$imageUploaded = 1;
		$imageFileType = strtolower(pathinfo($_FILES["ImageFile"]["name"], PATHINFO_EXTENSION));
		$target_dir = "uploads/";
		$target_file = make_filename($target_dir, $imageFileType);
		
		if(isset($_POST["PostButton"])) {
			$check = getimagesize($_FILES["ImageFile"]["tmp_name"]);
			if($check !== false) {
				$uploadOk = 1;
			} else {
				$uploadOk = 0;
			}
		}

		// Check if $uploadOk is set to 0 by an error
		if ($uploadOk == 0) {
			redirect($_SERVER['HTTP_REFERER']);
			// if everything is ok, try to upload file
		} else {
			if (move_uploaded_file($_FILES["ImageFile"]["tmp_name"], $target_file)) {
				$uploadOk = 1;
			} else {
				$uploadOk = 0;
			}
		}
	}
}

if(	$runquery ) {
	$conn = get_db();
	if($conn == null) {
		die("Unable to open database connection");
	}
	$post_type = isset($_POST['Type']) ? $DISC_POST : $CUTE_POST; // Get post type

	if(isset($_POST['edit']) && !empty($_POST['edit'])) {
		$id = $_POST['edit'];
		if(is_owner($id)) {
			$query = "UPDATE FetchPosts SET PostType=?, PostTitle=?,PostContent=? WHERE PostID=?";
			if($statement = mysqli_prepare($conn, $query)) {
				mysqli_stmt_bind_param($statement, "issi", $post_type, $_POST['Title'], $_POST['Content'], $id);
				mysqli_stmt_execute($statement);
			}
		} else {
			mysqli_close($conn);
			die("Cannot modify another user's post");
		}
	} else {
		$query = "INSERT INTO FetchPosts (`UserID`, `PostType`, `ImageURL`, `PostTitle`, `PostContent`)
		VALUES (?, ?, ?, ?, ?)";

		// Prepare and run the query
		if($statement = mysqli_prepare($conn, $query)) {			
			// If a file was uploaded successfully, set image url
			$image_url = '';
			if($imageUploaded == 1 and $uploadOk == 1) {
				$image_url = $target_file;
			}
			mysqli_stmt_bind_param($statement, 'iisss', $_SESSION['userid'], $post_type, $image_url, $_POST['Title'], $_POST['Content']);
			mysqli_stmt_execute($statement);
		}
		$id = mysqli_insert_id($conn);	
	}

	if( mysqli_affected_rows($conn) <= 0 ) {
		echo "<script type=\"text/javascript\">alert(\"Error submitting post\");</script>";
		redirect($_SERVER['HTTP_REFERER']);
	}

	redirect('homePage.php');
	mysqli_close($conn);
} else {
	echo "<script type=\"text/javascript\">alert(\"Error submitting post\");</script>";
	redirect($_SERVER['HTTP_REFERER']);
}

?>

