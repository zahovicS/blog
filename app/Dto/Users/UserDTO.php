<?php

namespace App\Dto\Users;

use Carbon\Carbon;

class UserDTO
{
    public ?int $id;
    public string $full_name;
    public string $username;
    public string $password;
    public string $email;
    public ?string $description;
    public string $profile_image;
    public Carbon $created_at;
    function __construct(?int $id, string $full_name, string $username, string $password, string $email, ?string $description, string $profile_image, string $created_at)
    {
        $this->id = $id;
        $this->full_name = $full_name;
        $this->username = $username;
        $this->password = $password;
        $this->email = $email;
        $this->description = $description;
        $this->profile_image = $profile_image;
        $this->created_at = Carbon::parse($created_at);
    }
}
