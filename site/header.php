<div class="Navigation">
	<div class="TopBar">
		<a class="TopBarLogo" href="homePage.php">
			<img src="images/logo.png" alt="fetch"/>
		</a>
		<a class="TopBarFetch" href="homePage.php">
			<b>fetch</b>
		</a>
<?php
include_once 'config.php';

if(session_status() != PHP_SESSION_ACTIVE) {
	session_start(); // Start the session
}

// Don't show user navigation bar if user not logged in
if(!isset($_SESSION['userid']) || empty($_SESSION['userid'])) {
	return;
}

$db = get_db();
if($db == null) {
	die("Could not connect to database");
}

$query = "SELECT * FROM FetchUsers
WHERE UserID=?";

$stmt = mysqli_prepare($db, $query);
mysqli_stmt_bind_param($stmt, "i", $_SESSION['userid']);
mysqli_execute($stmt);
$result = mysqli_stmt_get_result($stmt);

// If user not found just return
if(mysqli_num_rows($result) != 1) {
	echo "</div></div>";
	return;
}

$user = mysqli_fetch_assoc($result);
?>
		<div class="TopBarUserDiv">
			<button class="TopBarUser">
				<img src="images/user.png" alt="User Profile"/>
			</button>
			<div class="UserDropdown">
				<p><i><?php echo $user['Username']; ?></i></p>
				<p><b>Treats: </b><i><?php echo $user["NumTreats"]; ?></i></p>
				<form method="GET" action="homePage.php">
					<input type="hidden" name="UserID" value="<?php echo $_SESSION['userid']; ?>"></input>
					<button class="MyPostsButton"><b>My Posts</b></button>
				</form>
				<form method="POST" action="profilePage.php">
					<button class="EditProfileButton"><b>Edit Profile</b></button>
				</form>
				<form method="POST" action="logout.php">
					<button class="LogoutButton"><b>Logout</b></button>
				</form>
			</div>
		</div>
		<div class="TopBarNotificationDiv">
			<button class="TopBarNotification">
			<?php
				$query = "SELECT * FROM FetchNotifs WHERE UserID=?";
				$statement = mysqli_prepare($db, $query);
				if(! $statement) {
					echo "Error: " . mysqli_error($db);
					exit();
				}
				mysqli_stmt_bind_param($statement, 'i', $_SESSION['userid']);
				mysqli_stmt_execute($statement);
				$result = mysqli_stmt_get_result($statement);
				$rowcount=mysqli_num_rows($result);
				if($rowcount == 0) {
					echo "<img src=\"images/notification.png\" alt=\"Notification\"/>";
					
				}
				else{
					echo "<img src=\"images/notification_exists.png\" alt=\"Notification\"/>";
				}
			?>
			</button>
			<div class="NotificationDropdown">
			<?php
				while($notif = mysqli_fetch_assoc($result)) {
			?>
				<div class="Notification">
					<a href="clearNotif.php?postid=<?php echo $notif['PostID']; ?>&notifid=<?php echo $notif['NotifID']; ?>">
					<?php echo $notif['CommenterName']; ?> commented on your post!
					</a>
				</div>
			<?php } ?>
			</div>
		</div>
	</div>
</div>


<?php mysqli_close($db); ?>
