<?php

require_once("../tools/uidv4.php");
require_once("car_lib.php");

class Parking
{
  private $car = null;

  public function __construct()
  {
    $this->car = new Car();
  }

  public function input($conn, $floor, $place, $car_id)
  {
    $is_occpied = $this->validate_place($conn, $floor, $place);
    if ($is_occpied == null) {
      $id = guidv4();
      $sql = "INSERT INTO parking (id, floor, place, occupied, input, car_id) VALUES ('" . $id . "', " . $floor . ", " . $place . ", 1, now(), '" . $car_id . "');";
      $conn->query($sql);
      return true;
    }
    echo 'The place is already occupied.';
  }

  private function validate_place($conn, $floor, $place)
  {
    $sql = "SELECT * FROM parking WHERE floor=" . $floor . " AND place=" . $place . " AND occupied=1;";
    $result = mysqli_query($conn, $sql);
    $space = mysqli_fetch_assoc($result);
    return $space;
  }

  public function find_by_position($conn, $floor, $place)
  {
    $sql = "SELECT * FROM parking WHERE floor=" . $floor . "";
    if (isset($place)) {
      $sql = $sql . " AND place=" . $place . " AND occupied=1;";
    } else {
      $sql = $sql . " AND occupied=1;";
    }
    $result = $conn->query($sql);
    $rows = array();
    while ($row = mysqli_fetch_assoc($result)) {
      $car_data = $this->car->find_by_id($conn, $row['car_id']);
      $row['car'] = $car_data;
      $rows[] = $row;
    }
    echo json_encode($rows);
  }

  public function output($conn, $id)
  {
    $sql = "SELECT * FROM parking WHERE id='" . $id . "';";
    $result = mysqli_query($conn, $sql);
    $space = mysqli_fetch_assoc($result);
    $is_occpied = $this->validate_place($conn, $space['floor'], $space['place']);
    if ($is_occpied != null) {
      $sql = "UPDATE parking SET output=now(), occupied=0 WHERE  id='" . $id . "';";
      $conn->query($sql);
      return true;
    }
    echo 'The place is unoccupied.';
  }
}