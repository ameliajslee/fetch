<?php

include_once "config.php";

if(session_status() != PHP_SESSION_ACTIVE) {
	session_start(); // Start the session
}
session_destroy();

redirect("loginPage.php");

?>