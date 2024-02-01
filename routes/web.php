<?php

//VISTAS

use App\Controllers\HomeController;
use Src\Router\Router;

// Router::get("/", function(){
//     echo "indexasdas";
// });
Router::get("/", [HomeController::class, "index"]);
// Router::get("/usuarios/form/edicion/:id", ControladorUsuarios::class."@formEdicionUsuario");