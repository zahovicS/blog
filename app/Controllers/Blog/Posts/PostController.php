<?php

namespace App\Controllers\Blog\Posts;

use App\Controllers\Controller;
use App\Models\PostModel;

class PostController extends Controller{
    protected PostModel $postModel;
    function __construct() {
        $this->postModel = new PostModel;
    }
    public function posts($page = 1){
        $posts = $this->postModel->orderBy("posted_at","DESC")->paginate($page);
        return viewHandlebars("posts/posts", array_merge(["titleHTML" => "Publicaciones"],$posts));
    }
    public function post($slug){
        $post = $this->postModel->getPostBySlug($slug);
        return viewHandlebars("posts/post", $post);
    }
}