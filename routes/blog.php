<?php

use App\Controllers\Blog\Home\HomeController;
use App\Controllers\Blog\Posts\PostController;
use Src\Router\Router;

Router::get("/", [HomeController::class, "index"]);
Router::get("/test", function(){
    return viewHandlebars("test/test");
});
Router::get("/posts/:page", [PostController::class, "posts"]);
Router::get("/posts/post/:slug", [PostController::class, "post"]);