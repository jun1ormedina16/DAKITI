<?php
include('conexion.php');
include("navbaradmin.html");

if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET["id"])) {
    // Obtén el ID del usuario que se va a editar desde la URL
    $id_usuario = $_GET["id"];

    // Consulta el usuario específico que se va a editar
    $query = "SELECT id_usuario, nombre, id_rol FROM usuarios WHERE id_usuario = ?";
    $stmt = mysqli_prepare($db, $query);

    if (!$stmt) {
        die('Error en la consulta: ' . mysqli_error($db));
    }

    mysqli_stmt_bind_param($stmt, "i", $id_usuario);
    mysqli_stmt_execute($stmt);
    $resultado = mysqli_stmt_get_result($stmt);

    if ($row = mysqli_fetch_assoc($resultado)) {
        // El usuario existe, muestra el formulario de edición
        $nombre_usuario = $row['nombre'];
        $rol_actual = $row['id_rol'];
    } else {
        // El usuario no existe, redirige o muestra un mensaje de error
        header('Location: error.html');
        exit();
    }
} else if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["id_usuario"]) && isset($_POST["nuevo_rol"])) {
    // Manejar el formulario de actualización del rol
    $id_usuario = $_POST["id_usuario"];
    $nuevo_rol = $_POST["nuevo_rol"];

    // Actualiza el rol del usuario en la base de datos
    $query = "UPDATE usuarios SET id_rol = ? WHERE id_usuario = ?";
    $stmt = mysqli_prepare($db, $query);

    if (!$stmt) {
        die('Error en la consulta de actualización: ' . mysqli_error($db));
    }

    mysqli_stmt_bind_param($stmt, "ii", $nuevo_rol, $id_usuario);

    if (mysqli_stmt_execute($stmt)) {
        // Redirige a la página de listado de usuarios después de la actualización
        header('Location: crud.php');
        exit();
    } else {
        // Error en la actualización, redirige o muestra un mensaje de error
        header('Location: error.html');
        exit();
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <center>

    <title>Editar Rol de Usuario</title>
    <link rel="stylesheet" href="css/crud.css">
</head>
<body>
    <h1>Editar Rol de Usuario</h1>
    <form method="POST" action="editar_rol_usuario.php">
        <input type="hidden" name="id_usuario" value="<?php echo $id_usuario; ?>">
        <label for="nuevo_rol">Nuevo Rol:</label>
        <select name="nuevo_rol">
            <option value="1" <?php echo ($rol_actual == 1) ? "selected" : ""; ?>>Administrador</option>
            <option value="2" <?php echo ($rol_actual == 2) ? "selected" : ""; ?>>Usuario</option>
        </select>
        <input type="submit" value="Guardar Cambios">
    </form>
</center>
</body>
</html>
<?php
include("footer.html");
?>
