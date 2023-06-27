<?php

    $conexion = mysqli_connect("localhost", "root", "", "login_register_db");

    if($conexion){
        echo 'BIENVENIDO A DAKITI';
    }else{
        echo 'No se ha podido conectar a la base de datos';
    }

?>