<?php

namespace Src\Database;

use PDO;
use PDOException;

abstract class Connection
{

    private static string $driver;
    private static string $host;
    private static string $database;
    private static int $port;
    private static string $user;
    private static string $password;
    private static string $charset;

    public static function config(array $config)
    {
        self::$driver = $config["driver"];
        self::$database = $config["database"];
        self::$port = $config["port"];
        self::$user = $config["username"];
        self::$password = $config["password"];
        self::$host = $config["host"];
        self::$charset = $config["charset"];
    }
    public static function connection()
    {
        $options = [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            // PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
        ];
        $diver = self::$driver;
        $host = self::$host;
        $database = self::$database;
        $port = self::$port;
        $user = self::$user;
        $password = self::$password;
        $charset = self::$charset;
        $url = "{$diver}:host={$host}:{$port};dbname={$database};charset={$charset}";
        return new PDO($url, $user, $password, $options);
    }
}
