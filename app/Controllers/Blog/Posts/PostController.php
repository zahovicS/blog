<?php

namespace App\Controllers\Blog\Posts;

use App\Controllers\Controller;
use App\Models\PostModel;

class PostController extends Controller{
    protected PostModel $postModel;
    function __construct() {
        $this->postModel = new PostModel;
    }
    public function post($slug){
        $post = $this->postModel->getPostBySlug($slug);
        return viewHandlebars("posts/post", $post);
    }
}