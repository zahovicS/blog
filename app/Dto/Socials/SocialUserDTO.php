<?php

namespace App\Dto\Socials;

use Carbon\Carbon;

class SocialUserDTO
{
    public ?int $id;
    public string $name;
    public string $icon;
    public string $link;
    public Carbon $created_at;
    function __construct(?int $id, string $name, string $icon,string $link, string $created_at)
    {
        $this->id = $id;
        $this->name = $name;
        $this->icon = $icon;
        $this->link = $link;
        $this->created_at = Carbon::parse($created_at);
    }
}
