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

        # Will render the model to the templates/main.tpl template
        echo $handlebars->render($template, $data);
        exit;
    }
}
