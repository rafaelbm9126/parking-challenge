<?php

require_once("../tools/uidv4.php");

class Model
{

  public function __construct()
  {
  }

  public function create($conn, $name, $brand_id)
  {
    $id = guidv4();
    $sql = "INSERT INTO models (id, name, brand_id) VALUES ('" . $id . "','" . $name . "','" . $brand_id . "');";
    $conn->query($sql);
    $object["id"] = $id;
    $object["name"] = $_POST["name"];
    $object["brand_id"] = $_POST["brand_id"];
    return json_encode($object);
  }

  public function models_by_brand($conn, $brand_id)
  {
    $sql = "SELECT * FROM models WHERE brand_id='" . $brand_id . "';";
    $result = $conn->query($sql);
    $rows = array();
    while ($row = mysqli_fetch_assoc($result)) {
      $rows[] = $row;
    }
    return json_encode($rows);
  }
}