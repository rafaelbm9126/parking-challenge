<?php

require_once("../tools/uidv4.php");

class Car
{

  public function __construct()
  {
  }

  public function create($conn, $registration, $description, $model_id, $json_colors)
  {
    $id = guidv4();
    $sql = "INSERT INTO cars (id, registration, description, model_id) VALUES ('" . $id . "','" . $registration . "','" . $description . "','" . $model_id . "');";
    $conn->query($sql);
    $this->register_colors($conn, $registration, $json_colors);
    return $this->unique($conn, $registration);
  }

  public function update($conn, $registration, $description, $model_id, $json_colors)
  {
    $sql = "UPDATE cars SET description='" . $description . "', model_id='" . $model_id . "' WHERE registration='" . $registration . "';";
    $conn->query($sql);
    $this->register_colors($conn, $registration, $json_colors);
    return $this->unique($conn, $registration);
  }

  private function register_colors($conn, $registration, $json_colors)
  {
    $colors = json_decode($json_colors);
    $car = $this->unique($conn, $registration, true);

    $sql = "DELETE FROM colors WHERE car_id='" . $car['id'] . "';";
    $conn->query($sql);

    foreach ($colors as &$color) {
      $id = guidv4();
      $sql = "INSERT INTO colors (id, name, car_id) VALUES ('" . $id . "','" . $color . "','" . $car['id'] . "');";
      $conn->query($sql);
    }
  }

  public function unique($conn, $registration, $internal = false)
  {
    $sql = "SELECT * FROM cars WHERE registration='" . $registration . "';";
    $result = mysqli_query($conn, $sql);
    $car = mysqli_fetch_assoc($result);

    if ($car != null) {
      $sql = "SELECT * FROM models WHERE id='" . $car['model_id'] . "';";
      $result = mysqli_query($conn, $sql);
      $model = mysqli_fetch_assoc($result);
  
      $sql = "SELECT * FROM brands WHERE id='" . $model['brand_id'] . "';";
      $result = mysqli_query($conn, $sql);
      $brand = mysqli_fetch_assoc($result);
  
      $model["brand"] = $brand;
  
      $car["model"] = $model;
  
      $sql = "SELECT * FROM colors WHERE car_id='" . $car['id'] . "';";
      $result = $conn->query($sql);
      $colors = array();
      while ($color = mysqli_fetch_assoc($result)) {
        $colors[] = $color;
      }
  
      $car["colors"] = $colors;
  
      if ($internal == true) {
        return $car;
      }
  
      return json_encode($car);
    }
    return json_encode([]);
  }

  public function delete($conn, $id)
  {
    $sql = "DELETE FROM colors WHERE car_id='" . $id . "';";
    $conn->query($sql);
    $sql = "DELETE FROM parking WHERE car_id='" . $id . "';";
    $conn->query($sql);
    $sql = "DELETE FROM cars WHERE id='" . $id . "';";
    $conn->query($sql);
    return true;
  }

  public function find_by_id($conn, $id)
  {
    $sql = "SELECT * FROM cars WHERE id='" . $id . "';";
    $result = mysqli_query($conn, $sql);
    $car = mysqli_fetch_assoc($result);
    return $this->unique($conn, $car['registration'], true);
  }
}