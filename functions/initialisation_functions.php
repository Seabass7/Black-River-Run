<?php
	/* INITIALISATION */
	
	session_start();

	include_once("database.php");

	// Try to connect to the database.
	try {
		$db = new PDO(
			"mysql:host=".$dbhost.";dbname=".$dbname.";charset=utf8mb4",
			$dbusername, 
			$dbpassword
		);
	}
	
	catch(PDOexception $e) {
		die("Error while trying to connect to the database...");
	}
?>