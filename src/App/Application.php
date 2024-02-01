<?php

namespace Src\App;

use Carbon\Carbon;
use Dotenv\Dotenv;
use Src\Database\Connection;
use Src\Http\Request;
use Src\Persistence\Session;
use Src\Router\Router;

class Application
{

    protected string $basepath;
    protected Router $router;

    function __construct(string $basepath)
    {
        $this->router = new Router();
        $this->basepath = $basepath;
        $this->loadENV();
        $this->loadConstants();
        $this->loadHelpers();
        $this->loadRoutes();
        $this->loadErrors();
        $this->loadSession();
        $this->loadDB();
        $this->loadLocale();
    }
    private function loadConstants()
    {
        define("DS", DIRECTORY_SEPARATOR);
        define("BASE_PATH", $this->basepath);
        define("APP_PATH", BASE_PATH . DS . "app");
        define("HELPERS_PATH", BASE_PATH . DS . "app" . DS . "Helpers");
        define("ROUTES_PATH", BASE_PATH . DS . "routes");
        define("VIEW_PATH", BASE_PATH . DS . "resources" . DS . "views");
        define("PUBLIC_PATH", BASE_PATH . DS . "public");
        define("BASE_URL", $_ENV["APP_URL"]);
        define("ASSETS_URL", BASE_URL . "public/assets/");
    }
    private function loadENV(): void
    {
        $dotenv = Dotenv::createImmutable($this->basepath);
        $dotenv->load();
    }
    private function loadErrors(): void
    {
        $activateErrors = boolval($_ENV['APP_DEBUG']) ?? false;
        if ($activateErrors) {
            ini_set('display_errors', 1);
            ini_set('display_startup_errors', 1);
            error_reporting(E_ALL);
        }
    }
    private function loadRoutes()
    {
        $routes_path = ROUTES_PATH . DS . "*.php";
        $this->autoloadaFiles($routes_path);
    }
    private function loadDB()
    {
        Connection::config([
            'driver' => $_ENV["APP_DB_DRIVER"] ?? "mysql",
            'database' => $_ENV["APP_DB_DATABASE"] ?? "blog",
            'port' => $_ENV["APP_DB_PORT"] ?? 3306,
            'username' => $_ENV["APP_DB_USERNAME"] ?? "root",
            'password' => $_ENV["APP_DB_PASSWORD"] ?? "",
            'host' => $_ENV["APP_DB_HOSTNAME"] ?? "localhost",
            'charset' => $_ENV["APP_DB_CHARSET"] ?? "utf8mb4"
        ]);
    }
    private function loadHelpers()
    {
        $routes_path = HELPERS_PATH . DS . "*.php";
        $this->autoloadaFiles($routes_path);
    }
    private function autoloadaFiles(string $path): void
    {
        foreach (glob($path) as $filename) {
            if (file_exists($filename)) {
                require_once $filename;
            }
        };
    }
    private function loadSession(): void
    {
        Session::init();
    }
    private function loadLocale(): void
    {
        date_default_timezone_set("America/Lima");
        setlocale(LC_TIME, 'es_PE.UTF-8', 'esp');
        setlocale(LC_ALL, 'Spanish');
        Carbon::setLocale("es");
        Carbon::setUTF8(true);
    }
    public function run()
    {
        $this->router->run();
        Session::unflash();
    }
}
