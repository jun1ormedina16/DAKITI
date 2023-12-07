<?php
include("conexion.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = $_POST['nombre'];
    $correo = $_POST['correo'];
    $contrasena = $_POST['contrasena']; 
    $fecha_nacimiento = $_POST['fecha_nacimiento'];
    $telefono = $_POST['telefono'];

    $hoy = new DateTime();
    $nacimiento = new DateTime($fecha_nacimiento);
    $edad = $hoy->diff($nacimiento)->y;

    // Verifica si la edad es mayor o igual a 18 años
    if ($edad >= 18) {
        $consulta_existencia = "SELECT correo FROM usuarios WHERE correo = ?";
        $stmt_existencia = mysqli_prepare($db, $consulta_existencia);

        if (!$stmt_existencia) {
            die('Error en la consulta de existencia: ' . mysqli_error($db));
        }

        mysqli_stmt_bind_param($stmt_existencia, "s", $correo);
        mysqli_stmt_execute($stmt_existencia);
        $resultado_existencia = mysqli_stmt_get_result($stmt_existencia);

        if (mysqli_num_rows($resultado_existencia) == 0) {
            // El correo no existe en la base de datos, se puede realizar la inserción

            $id_rol = 2;

            // Encriptar la contraseña utilizando MD5
            $contrasena_encriptada = md5($contrasena);

            $consulta = "INSERT INTO usuarios (id_rol, nombre, correo, contrasena, fecha_nacimiento, telefono) VALUES (?, ?, ?, ?, ?, ?)";
            $stmt_insercion = mysqli_prepare($db, $consulta);

            if (!$stmt_insercion) {
                die('Error en la consulta de inserción: ' . mysqli_error($db));
            }

            mysqli_stmt_bind_param($stmt_insercion, "ssssss", $id_rol, $nombre, $correo, $contrasena_encriptada, $fecha_nacimiento, $telefono);

            if (mysqli_stmt_execute($stmt_insercion)) {
                header('Location: iniciarsesion.html');
            } else {
                header('Location: registro.html');
            }
        } else {
            // El correo ya existe, redirige o muestra un mensaje de error
            header('Location: correoexistente.html');
        }
    } else {
        // La edad es menor de 18 años, redirige o muestra un mensaje de error
        header('Location: mensajeedad.html');
    }

    mysqli_close($db);
} else {
    // Redirige a una página de error si se accede al archivo sin enviar el formulario
    header('Location: error.html');
}
?>
