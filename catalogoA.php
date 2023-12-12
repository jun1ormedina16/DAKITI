<?php
session_start();

if (!isset($_SESSION['correo'])) {
    header("Location: iniciarsesion.html");
    exit();
 }
include("navbaradmin.html");
include("catalogo.html");
include("footer.html");
?>