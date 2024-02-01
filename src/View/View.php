<?php

namespace Src\View;

use Exception;

class View
{
    public function render(string $template, $data = []): void
    {
        $content = $this->extract($template, $data);
        echo $content;
        exit;
    }
    public function extract(string $template, $data = []): string
    {
        if (!empty($data)) {
            extract($data);
        }
        $template = str_replace(".", "/", $template);
        $this->validateTemplateExists($template);
        $template = view_path($template) . ".php";
        // require $template;
        return $this->processHTML($template);
    }
    private function validateTemplateExists(string $template): void
    {
        $path_template = view_path("$template.php");
        if (!file_exists($path_template)) {
            throw new Exception("No View exists");
        }
    }
    private function processHTML($template): string
    {
        ob_start();
        require $template;
        $content_html = ob_get_clean(); // Obtener el contenido del búfer de salida y limpiarlo
        return $content_html;
    }
    /*
    // private function processHTML($template): string
    // {
    //     $content = file_get_contents($template);
    //     $content = preg_replace('/{{\s*(.+?)\s*}}/', '<?php echo $1; ?>', $content);
    //     $content = preg_replace('/@if\(\s*(.+?)\s*\)/', '<?php if($1) : ?>', $content);
    //     $content = str_replace('@endif', '<?php endif;?>', $content);
    //     $content = preg_replace('/@foreach\(\s*(.+?)\s*\)/', '<?php foreach($1) : ?>', $content);
    //     $content = str_replace('@endforeach', '<?php endforeach;?>', $content);
    //     ob_start();

    //     eval('?>' . $content);

    //     $content_html = ob_get_clean(); // Obtener el contenido del búfer de salida y limpiarlo

    //     return $content_html;
    // }
    */
}
