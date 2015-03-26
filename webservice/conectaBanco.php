<?php 
	$hostname = "mysql.hostinger.com.br";
	$username = "u450409665_weapp";
	$password = "8q4KAPiZ30";
	$database = "u450409665_weapp";

	$con = mysql_connect($hostname, $username, $password);
	mysql_select_db($database, $con) or 
		die ("Não for possível conectar ao banco");

	mysql_query("SET NAMES 'utf8'", $con);	
?>
