<?php

header("Content-Type: text/html;charset=utf_8");
$db = new mysqli('localhost', 'root', '', 'bar_dakiti');
if ($db->connect_error) {
    die('Error de conexión: ' . $db->connect_error);
}
?>