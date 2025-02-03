<?php
header('Content-type:text/html;charset=utf-8');
$db_host = '127.0.0.1';
$db_username = 'postgres';
$db_password = 'Tranphuongthanh87..';
$db_port = '5432';
$database = 'acc1';
$database2 = 'game1';
$conn_string = "host=$db_host port=$db_port dbname=$database user=$db_username password=$db_password";
$conn_string2 = "host=$db_host port=$db_port dbname=$database2 user=$db_username password=$db_password";
$sql_acc = pg_connect($conn_string) or die ("0");
$sql_game = pg_connect($conn_string2) or die ("0");
?>