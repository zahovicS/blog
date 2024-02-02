<?php

namespace App\Models;

use App\Dto\Posts\PostDTO;
use Exception;
use Src\Database\DB;

class PostModel extends DB
{
    protected $table = "posts";

    public function getPostBySlug(string $slug): array
    {
        $userModel = new UserModel;
        $socialModel = new SocialModel;
        $post = $this->where("slug", "=", $slug)->first();
        if (!$post) {
            throw new Exception("No POST exists", 1);
        }
        $post = $this->setToDTO($post);
        $author = $userModel->where("id", "=", $post->id_user)->first();
        if (!$author) {
            throw new Exception("No Author exists", 1);
        }
        $author = $userModel->setToDTO($author);
        $socialUser = $socialModel->getSocialsByUser($author->id);
        $content = str_replace(["\r\n", "\r", "\n", "\\n"], "<br/>", $post->content);
        $content = $this->replaceQuotes($content);
        return [
            "title" => $post->title,
            "titleHTML" => $post->title,
            "date_post" => $post->posted_at->translatedFormat("l d F Y g:i a"),
            "author" => [
                "name" => $author->full_name,
                "profile_image" => assets($author->profile_image),
                "description" => $author->description,
                "social" => $socialUser
            ],
            "hasImage" => $post->header_image ?? false,
            "imageLandscape" => $post->header_image ? assets($post->header_image) : null,
            "content" => $content
        ];
    }
    public function setToDTO(array $post): PostDTO
    {
        return new PostDTO($post["id"] ?? null, $post["id_user"], $post["header_image"], $post["title"], $post["slug"], $post["content"], $post["posted_at"]);
    }

    private function replaceQuotes($content){
        $content = str_replace("<blockquote>",'<blockquote class="quote"><p><span><i class="ri-double-quotes-l"></i></span>', $content);
        $content = str_replace("</blockquote>",'<span><i class="ri-double-quotes-r"></i></span></p></blockquote>', $content);
        $content = preg_replace('/<br\s*\/?>\s*<span/', '<span', $content);
        return $content;
    }
}
