<?php

namespace App\Controllers\Blog\Home;

use App\Controllers\Controller;
use App\Models\UserModel;
use Src\Http\Request;

class HomeController extends Controller
{
    public function index(){
        return viewHandlebars("home",["name" => "zahovic", "posts" => [
            ["content" => "POST 1"],
            ["content" => "POST 2"],
            ["content" => "POST 3"],
            ["content" => "POST 4"],
            ["content" => "POST 5"],
            ["content" => "POST 6"],
        ]]);
    }
}
