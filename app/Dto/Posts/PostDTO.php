<?php

namespace App\Dto\Posts;

use Carbon\Carbon;

class PostDTO
{
    public ?int $id;
    public int $id_user;
    public ?string $header_image;
    public string $title;
    public string $slug;
    public string $content;
    public Carbon $posted_at;
    function __construct(?int $id, int $id_user, ?string $header_image, string $title, string $slug, string $content, string $posted_at)
    {
        $this->id = $id;
        $this->id_user = $id_user;
        $this->header_image = $header_image;
        $this->title = $title;
        $this->slug = $slug;
        $this->content = $content;
        $this->posted_at = Carbon::parse($posted_at);
    }
}
