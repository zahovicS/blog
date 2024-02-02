<?php

use Src\View\HandlebarsView;
use Src\View\View;

function base_url()
{
    return BASE_URL;
}
function route($to)
{
    return base_url() . $to;
}
function view_path(string $path = "")
{
    return VIEW_PATH . DS . $path;
}
function redirect($url, $mensajes = [])
{
    $data = [];
    $params = '';

    foreach ($mensajes as $key => $value) {
        array_push($data, $key . '=' . $value);
    }
    $params = join('&', $data);

    if ($params != '') {
        $params = '?' . $params;
    }
    header('Location: ' . base_url() . "{$url}{$params}");
    exit();
}
function encrypt($value)
{
    return base64_encode($value);
}
function redirectEncode($url, $mensajes = [])
{
    $data = [];
    $params = '';

    foreach ($mensajes as $key => $value) {
        $data[] = $key . '=' . encrypt($value);
    }

    $params = join('&', $data);

    if ($params != '') $params = '?' . $params;

    header('Location: ' . base_url() . "{$url}{$params}");
    exit();
}
function assets($uri_asset): string
{
    return ASSETS_URL . $uri_asset;
}
function view(string $template, array $data = [])
{
    return (new View)->render($template, $data);
}
function urlIs(string $route = "")
{
    if($route == "/") return true;
    return cleanUri($_GET['uri'] ?? "/") === $route;
}
function cleanUri(string $uri)
{
    if ($uri === "/") return $uri;
    $hashLast = substr($uri, -1) === "/";
    if ($hashLast) return substr($uri, 0, -1);
    return "/{$uri}";
}
function viewHandlebars(string $template, array $data = [])
{
    return (new HandlebarsView)->render($template, $data);
}
function string_starts_with(string $haystack, string $needle): bool
{
    return 0 === strncmp($haystack, $needle, \strlen($needle));
}
function cleanHTML(string $html)
{
    $text = strip_tags($html);
    $text = str_replace("&rsquo;", "'", $text);
    return  preg_replace("/&#?[a-z0-9]{2,8};/i", "", $text);
}
function dd($varData)
{
    dump($varData);
    die;
}
function dump($data)
{
    echo "<pre style='background-color: #191919;padding: 20px; color: white; font-size:15px;text-wrap: wrap;'>";
    var_dump($data);
    echo "</pre>";
    echo "<br>";
}
