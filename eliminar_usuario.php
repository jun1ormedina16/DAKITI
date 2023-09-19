<?php
include('conexion.php');

if (isset($_GET['id'])) {
    $id_usuario = $_GET['id'];
} else {
    // Manejar el caso en el que no se proporciona un ID válido en la URL
    header("location: listar_usuarios.php");
    exit();
}

// Verificar si el formulario se envió para eliminar al usuario
if (isset($_POST['eliminar'])) {
    // Realizar la eliminación del usuario
    $query = "DELETE FROM usuarios WHERE id_usuario = $id_usuario";
    mysqli_query($db, $query);

    // Redirigir a la página de listado de usuarios después de eliminar
    header("location: crud.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Eliminar Usuario</title>
    <link rel="stylesheet" href="css/confirmelim.css">
</head>
<body>
    <?php
    include("navbaradmin.html");
    ?>
    <center>
    <h1>Eliminar Usuario</h1>
    <p>¿Estás seguro de que deseas eliminar este usuario?</p>
    <form method="post" action="">
        <button type="submit" name="eliminar">Eliminar</button>
        <a href="crud.php">Cancelar</a>
    </form>
</body>
</center>
<?php
include("footer.html");
?>
</html>
