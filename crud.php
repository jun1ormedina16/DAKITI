<?php
session_start();

if (!isset($_SESSION['correo'])) {
    header("Location: iniciarsesion.html");
    exit();
 }
include('conexion.php');
include("navbaradmin.html");
$query = "SELECT usuarios.id_usuario, usuarios.nombre, usuarios.correo, roles.nombre AS rol
          FROM usuarios
          INNER JOIN roles ON usuarios.id_rol = roles.id";

$resultado = mysqli_query($db, $query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <center>

    <title>Listado de Usuarios</title>
    <link rel="stylesheet" href="css/crud.css">
</head>
<body>
    <h1>Listado de Usuarios</h1>
    <table class="table">
    <tr>
        <th>ID Usuario</th>
        <th>Nombre</th>
        <th>Correo</th>
        <th>Rol</th>
        <th>Acciones</th>
    </tr>
    <?php while ($row = mysqli_fetch_assoc($resultado)) { ?>
        <tr>
            <td><?php echo $row['id_usuario']; ?></td>
            <td><?php echo $row['nombre']; ?></td>
            <td><?php echo $row['correo']; ?></td>
            <td><?php echo $row['rol']; ?></td>
            

            <td>
                <a href="editar_rol_usuario.php?id=<?php echo $row['id_usuario']; ?>" class="button">Editar Rol</a>
                <a href="eliminar_usuario.php?id=<?php echo $row['nombre']; ?>" class="button">Eliminar</a>
            </td>

        </tr>
    <?php } ?>
</table>
</center>
<br>
<center>
<a href="registroadmin.html" class="add-button">Agregar Administrador</a>
</center>
</body>
</html>
<?php
include("footer.html");
?>