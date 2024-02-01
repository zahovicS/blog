<?php

namespace Src\Router;

class Router {

    public function __construct() {
        
    }

    private static $uris = array();

    public static function add($method, $uri, $function = null) {
        self::$uris[] = new Uri(self::parseUri($uri), $method, $function);
        //Retornará un Middleware...
        return;
    }

    public static function get($uri, $function = null) {
        return self::add("GET", $uri, $function);
    }

    public static function post($uri, $function = null) {
        return self::add("POST", $uri, $function);
    }

    public static function put($uri, $function = null) {
        return self::add("PUT", $uri, $function);
    }

    public static function delete($uri, $function = null) {
        return self::add("DELETE", $uri, $function);
    }

    public static function any($uri, $function = null) {
        return self::add("ANY", $uri, $function);
    }

    private static function parseUri($uri) {
        $uri = trim($uri, '/');
        $uri = (strlen($uri) > 0) ? $uri : '/';
        return $uri;
    }

    public static function run() {
        $method = $_SERVER['REQUEST_METHOD'];
        $uri = isset($_GET['uri']) ? $_GET['uri'] : '';
        $uri = self::parseUri($uri);
        //Verifica si la uri que está pidiendo el usuario se encuentra registrada...
        foreach (self::$uris as $key => $recordUri) {
            if ($recordUri->match($uri)) {
                return $recordUri->call();
            }
        }

        //Muestra el mensaje de error 404...
        header("Content-Type: text/html");
        echo 'La uri (<a href="' . $uri . '">' . $uri . '</a>) no se encuentra regiostrada en el método ' . $method . '.';
    }

}
