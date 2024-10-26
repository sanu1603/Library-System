<?php
$server = "localhost";
$username = "root";
$password = "";
$databasename = "lib_system";
$port = 4306; // Specify the custom port here

// Connect to MySQL with the specified port
$conn = mysqli_connect($server, $username, $password, $databasename, $port);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// echo "Connection successful";

// Optionally select the database if not specified in mysqli_connect
$abc = mysqli_select_db($conn, $databasename);

if (!$abc) {
    die("Database selection failed");
}
?>
