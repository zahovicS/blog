<?php

namespace App\Dto\Socials;

use Carbon\Carbon;

class SocialDTO
{
    public ?int $id;
    public string $name;
    public string $icon;
    public Carbon $created_at;
    function __construct(?int $id, string $name, string $icon, string $created_at)
    {
        $this->id = $id;
        $this->name = $name;
        $this->icon = $icon;
        $this->created_at = Carbon::parse($created_at);
    }
}
