<?php

header("Content-Type: text/html;charset=utf_8");
$db = new mysqli('127.0.0.1:3307', 'root', '', 'bar_dakiti');
if ($db->connect_error) {
    die('Error de conexión: ' . $db->connect_error);
}
?>

