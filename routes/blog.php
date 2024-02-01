<?php

use App\Controllers\Blog\Home\HomeController;
use App\Controllers\Blog\Posts\PostController;
use Src\Router\Router;

Router::get("/", [HomeController::class, "index"]);
Router::get("/post/:slug", [PostController::class, "post"]);