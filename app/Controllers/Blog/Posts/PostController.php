<?php

namespace App\Controllers\Blog\Posts;

use App\Controllers\Controller;

class PostController extends Controller{
    public function post($slug){
        return viewHandlebars("posts/post",[
            "title" => "MUNDO BLOG PHP",
            "titleHTML" => "MUNDO BLOG PHP",
            "date_post" => "Ene 02 2024",
            "author" => [
                "name" => "Zahovic",
                "profile_image" => assets("images/author.jpg"),
                "description" => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam vel nunc tincidunt sagittis auctor id justo.",
                "social" => [
                    [
                        "name" => "Instagram",
                        "icon" => "ri-instagram-line",
                        "link" => "#!"
                    ],
                    [
                        "name" => "Facebook",
                        "icon" => "ri-facebook-circle-line",
                        "link" => "#!"
                    ],
                    [
                        "name" => "Twitter",
                        "icon" => "ri-twitter-line",
                        "link" => "#!"
                    ]
                ]
            ],
            "hasImage" => true,
            "imageLandscape" => assets("images/featured/featured-1.jpg"),
            "content" => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam vel nunc tincidunt sagittis auctor id justo. Mauris ullamcorper risus velit, et tincidunt justo varius sed. Sed blandit orci sit amet faucibus euismod. Etiam consectetur nunc a erat viverra egestas. Nunc dictum ornare felis ac ultrices. Integer in sapien laoreet, ultricies elit vitae, consequat sem. Mauris sit amet urna quis felis lobortis lobortis sed at nibh. In consequat porttitor est, eget elementum orci lobortis ac. In ornare purus non consequat porttitor. Vivamus finibus arcu ante, a faucibus nibh pretium in. Vestibulum ornare massa convallis pretium maximus. Sed sodales massa enim, ac imperdiet urna blandit in. Quisque non aliquet libero. Sed ac molestie neque, a tristique sem.
            Mauris id convallis enim. Aenean a luctus neque. Duis non consequat mi, quis venenatis est. Mauris ultricies sodales urna. Fusce justo ipsum, tempus quis magna at, tincidunt aliquam velit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse commodo, nunc a hendrerit blandit, nibh neque commodo sapien, vel malesuada erat lectus ut libero."
        ]);
    }
}