<?php

namespace App\Models;

use App\Dto\Users\UserDTO;
use Src\Database\DB;

class UserModel extends DB
{
    protected $table = "users";

    public function setToDTO(array $user): UserDTO
    {
        return new UserDTO($user["id"] ?? null, $user["full_name"], $user["username"], $user["password"], $user["email"], $user["description"], $user["profile_image"], $user["created_at"]);
    }
}
