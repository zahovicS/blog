<?php

namespace Src\Database;

use Exception;
use PDOException;

class DB
{

    protected $table;
    protected $connection;
    protected $selects = "*";
    protected $wheres = "";
    protected $limits = "";
    protected $joins = "";
    protected $ordersBy = "";
    protected $sql = null;

    public function getConnection()
    {
        if ($this->connection == null) {
            $connection = Connection::connection();
            $this->connection = $connection;
        }
        return $this->connection;
    }
    public function get()
    {
        $this->getConnection();
        try {
            $this->sql = trim("SELECT {$this->selects} FROM {$this->table} {$this->joins} {$this->wheres} {$this->ordersBy} {$this->limits};");
            $sth = $this->connection->prepare($this->sql);
            $sth->execute();
            $this->reiniciarValores();
            return $sth->fetchAll();
        } catch (PDOException $exc) {
            echo $exc->getTraceAsString();
        }
    }

    public function first()
    {
        $this->getConnection();
        try {
            $this->limit(1);
            $this->sql = trim("SELECT{$this->selects} FROM {$this->table} {$this->joins} {$this->wheres} {$this->ordersBy} {$this->limits};");
            $sth = $this->connection->prepare($this->sql);
            $sth->execute();
            $this->reiniciarValores();
            return $sth->fetch();
        } catch (PDOException $exc) {
            echo $exc->getTraceAsString();
        }
    }

    public function insert($obj)
    {
        $this->getConnection();
        try {
            $campos = implode("`, `", array_keys($obj)); //nombre`, `apellido`, `edad
            $valores = ":" . implode(", :", array_keys($obj)); //:nombre, :apellido, :edad
            $this->sql = "INSERT INTO {$this->table} (`{$campos}`) VALUES ({$valores});";
            $this->ejecutar($obj);
            $id = $this->connection->lastInsertId();
            return $id;
        } catch (PDOException $exc) {
            echo $exc->getTraceAsString();
        }
    }

    public function update($obj)
    {
        $this->getConnection();
        try {
            $campos = "";
            foreach ($obj as $llave => $valor) {
                $campos .= "`$llave`=:$llave,"; //`nombres`=:nombres,`edad`=:edad
            }
            $campos = rtrim($campos, ",");
            $this->sql = "UPDATE {$this->table} SET {$campos} {$this->wheres};";
            $filasAfectadas = $this->ejecutar($obj);
            return $filasAfectadas;
        } catch (PDOException $exc) {
            echo $exc->getTraceAsString();
        }
    }

    public function delete()
    {
        $this->getConnection();
        try {
            $this->sql = "DELETE FROM {$this->table} {$this->wheres};";
            $filesAfectadas = $this->ejecutar();
            return $filesAfectadas;
        } catch (PDOException $exc) {
            echo $exc->getTraceAsString();
        }
    }

    public function select($columns)
    {
        if (is_string($columns)) {
            $this->selects = $columns;
        } else if (is_array($columns)) {
            $this->selects = "";
            foreach ($columns as $column) {
                $this->selects .= "{$column} ,";
            }
            $this->selects = trim(substr($this->selects, 0, -1));
        } else {
            throw new Exception("Not insert columns in query", 1);
        }
        return $this;
    }

    public function join(string $table, string $condition, string $operator = "=", string $conditionTwo, string $type = "inner")
    {
        $type = mb_strtoupper($type);
        $this->joins .= "{$type} JOIN {$table} ON {$condition} {$operator} {$conditionTwo}";
        return $this;
    }
    public function leftjoin(string $table, string $condition, string $operator = "=", string $conditionTwo)
    {
        return $this->join($table, $condition, $operator, "left");
    }
    public function rightjoin(string $table, string $condition, string $operator = "=", string $conditionTwo)
    {
        return $this->join($table, $condition, $operator, "right");
    }

    public function limit(int $limit)
    {
        $this->limits = "LIMIT {$limit}";
    }
    public function orderBy(string $column, string $order = "ASC"){
        $this->ordersBy .= strpos($this->ordersBy, "ORDER BY") !== false ? ",{$column} {$order}" : "ORDER BY {$column} {$order}";
        return $this;
    }
    public function where(string $column, string $operator, $value)
    {
        $this->wheres .= (strpos($this->wheres, "WHERE")) ? " AND " : " WHERE ";
        $this->wheres .= "$column $operator " . ((is_string($value)) ? "\"$value\"" : $value) . " ";
        return $this;
    }
    public function orWhere(string $column, string $operator, $value)
    {
        $this->wheres .= (strpos($this->wheres, "WHERE")) ? " OR " : " WHERE ";
        $this->wheres .= "$column $operator " . ((is_string($value)) ? "\"$value\"" : $value) . " ";
        return $this;
    }

    private function ejecutar($obj = null)
    {
        $this->getConnection();
        $sth = $this->connection->prepare($this->sql);
        if ($obj !== null) {
            foreach ($obj as $llave => $valor) {
                if (empty($valor)) {
                    $valor = NULL;
                }
                $sth->bindValue(":$llave", $valor);
            }
        }
        $sth->execute();
        $this->reiniciarValores();
        return $sth->rowCount();
    }

    private function reiniciarValores()
    {
        $this->selects = "*";
        $this->wheres = "";
        $this->sql = null;
        $this->limits = "";
        $this->joins = "";
        $this->ordersBy = "";
    }
    public function paginate($page = 1, $limit = 10)
    {
        $this->getConnection();
        try {
            $offset = ($page - 1) * $limit;
            $this->limits = "LIMIT {$offset},{$limit}";
            $rows = $this->connection->query("SELECT COUNT(*) FROM {$this->table} {$this->wheres};")->fetchColumn();
            $pages = ceil($rows / $limit);
            $this->sql = "SELECT * FROM {$this->table} {$this->wheres} {$this->ordersBy} {$this->limits};";
            $sth = $this->connection->prepare($this->sql);
            $sth->execute();
            $this->reiniciarValores();
            $data = $sth->fetchAll();
            return [
                'data' => $data,
                'page' => (int) $page,
                'limit' => (int) $limit,
                'pages' => (int) $pages,
                'renderLessPages' => ($page - 1) > 0,
                'renderMorePages' => ($page + 1) <= $pages,
                'rows' => (int) $rows,
            ];
        } catch (PDOException $exc) {
            echo $exc->getTraceAsString();
        }
    }
}
