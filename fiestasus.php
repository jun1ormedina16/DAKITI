<?php
session_start();

if (!isset($_SESSION['correo'])) {
    header("Location: iniciarsesion.html");
    exit();
 }

include("navbaruser.html");
include("main.html");
include("footer.html");
?>