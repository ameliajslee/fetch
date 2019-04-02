<?php
include_once 'config.php';

if(session_status() != PHP_SESSION_ACTIVE) {
	session_start(); // Start the session
}

// Make sure user is logged in, or redirect to login page
if(!isset($_SESSION['username'])) {
	redirect("loginPage.php");
}

if(!isset($_GET)) goto_404();
if(!isset($_GET['postid']) || !isset($_GET['notifid'])) goto_404();

$conn = get_db();

$sql = "DELETE FROM FetchNotifs WHERE NotifID=?";
$stmt = mysqli_prepare($conn, $sql);
mysqli_stmt_bind_param($stmt, "i", $_GET['notifid']);
mysqli_execute($stmt);


redirect("onePostPage.php?PostID=" . $_GET['postid']);

?>
