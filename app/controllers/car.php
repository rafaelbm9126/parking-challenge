<?php

require_once("../lib/conn.php");
require_once("../lib/car_lib.php");

$car = new Car();

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
  echo $car->unique($conn, $_GET['registration']);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  echo $car->create($conn, $_POST['registration'], $_POST['description'], $_POST['model_id'], $_POST['json_colors']); 
}

if ($_SERVER['REQUEST_METHOD'] === 'PUT') {
  $_PUT = [];
  parse_str(file_get_contents('php://input'), $_PUT);
  echo $car->update($conn, $_PUT['registration'], $_PUT['description'], $_PUT['model_id'], $_PUT['json_colors']);
}

if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
  $_DELETE = [];
  parse_str(file_get_contents('php://input'), $_DELETE);
  echo $car->delete($conn, $_DELETE['id']);
}
