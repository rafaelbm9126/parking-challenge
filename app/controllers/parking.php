<?php

require_once("../lib/conn.php");
require_once("../lib/parking_lib.php");

$parking = new Parking();

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
  echo $parking->find_by_position($conn, $_GET["floor"], $_GET["place"]);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  echo $parking->input($conn, $_POST["floor"], $_POST["place"], $_POST["car_id"]);
}

if ($_SERVER['REQUEST_METHOD'] === 'PUT') {
  $_PUT = [];
  parse_str(file_get_contents('php://input'), $_PUT);
  echo $parking->output($conn, $_PUT['id']);
}