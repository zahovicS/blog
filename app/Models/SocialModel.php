<?php

namespace App\Models;

use App\Dto\Socials\SocialUserDTO;
use Src\Database\DB;

class SocialModel extends DB
{
    protected $table = "socials";

    public function getSocialsByUser(int $id_user): array
    {
        $socials = $this->select(["social_users.id as id", "socials.name as name", "socials.icon as icon", "social_users.link as link", "social_users.created_at as created_at"])
            ->join("social_users", "socials.id", "=", "social_users.id_social")
            ->where("social_users.id_user", "=", $id_user)
            ->get();
        $arrSocials = [];
        foreach ($socials as $social) {
            $arrSocials[] = new SocialUserDTO($social["id"], $social["name"], $social["icon"], $social["link"], $social["created_at"]);
        }
        return $arrSocials;
    }
}
