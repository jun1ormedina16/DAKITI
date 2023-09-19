<?php
include('conexion.php');
$correo = $_POST['correo'];
$contrasena = $_POST['contrasena'];
session_start();
$_SESSION['correo'] = $correo;

// Encripta la contraseña proporcionada por el usuario con MD5
$contrasena_encriptada = md5($contrasena);

$consulta = "SELECT * FROM usuarios WHERE correo='$correo' AND contrasena='$contrasena_encriptada'";
$resultado = mysqli_query($db, $consulta);

if (!$resultado) {
    die('Error en la consulta: ' . mysqli_error($db));
}

$filas = mysqli_num_rows($resultado);

if ($filas) {
    $usuario = mysqli_fetch_assoc($resultado);
    $id_rol = $usuario['id_rol'];
    
    if ($id_rol == 1) {
        // Redirigir al administrador a una página de administrador
        header("location: indexadmin.php");
    } elseif ($id_rol == 2) {
        // Redirigir al usuario normal a una página de usuario
        header("location: indexuser.php");
    } 
} else {
    include("iniciarsesion.html");
    echo '<h1 class="bad">ERROR DE AUTENTIFICACION</h1>';
}

mysqli_free_result($resultado);
mysqli_close($db);
 ?>