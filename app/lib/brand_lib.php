<?php

require_once("../tools/uidv4.php");

class Brand
{

  public function __construct()
  {
  }

  public function create($conn, $name)
  {
    $id = guidv4();
    $sql = "INSERT INTO brands (id, name) VALUES ('" . $id . "','" . $name . "');";
    $conn->query($sql);
    $object["id"] = $id;
    $object["name"] = $_POST["name"];
    return json_encode($object);
  }

  public function all($conn)
  {
    $sql = "SELECT * FROM brands;";
    $result = $conn->query($sql);
    $rows = array();
    while ($row = mysqli_fetch_assoc($result)) {
      $rows[] = $row;
    }
    return json_encode($rows);
  }
}