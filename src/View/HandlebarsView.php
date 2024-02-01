<?php

namespace Src\View;

use Exception;
use Handlebars\Handlebars;
use Handlebars\Loader\FilesystemLoader;

class HandlebarsView
{
    public function render(string $template, $data = []): void
    {
        # Set the template files
        $templatesDir = view_path();
        $templatesLoader = new FilesystemLoader(
            $templatesDir,
            [
                "extension" => "handlebars"
            ]
        );
        $partialsDir = view_path("components");
        $partialsLoader = new FilesystemLoader(
            $partialsDir,
            [
                "extension" => "handlebars"
            ]
        );
        # We'll use $handlebars throughout this the examples, assuming the will be all set this way
        $handlebars = new Handlebars([
            "loader" => $templatesLoader,
            "partials_loader" => $partialsLoader
        ]);

        $handlebars->addHelper("assets", function($template, $context, $args, $source){
            return assets($args);
        });

        $handlebars->addHelper("base_url", function($template, $context, $args, $source){
            return base_url();
        });

        $handlebars->addHelper("route", function($template, $context, $args, $source){
            return route($args);
        });

        $handlebars->addHelper("encrypt", function($template, $context, $args, $source){
            return encrypt($args);
        });

        $handlebars->addHelper("dd", function($template, $context, $args, $source){
            return dd($args);
        });

        # Will render the model to the templates/main.tpl template
        echo $handlebars->render($template, $data);
        exit;
    }
}
