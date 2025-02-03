<?php
include 'config/config.php';
$sql2 = 'UPDATE "public"."T_Role_Festival" SET "dwGetTimes" = 0 WHERE "dwLine" = 250221';
$ret1 = pg_query($sql_game, $sql2);
print_r("ok");
?>