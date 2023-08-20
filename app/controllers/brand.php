<?php

require_once("../lib/conn.php");
require_once("../lib/brand_lib.php");

$brand = new Brand();

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
  echo $brand->all($conn);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  echo $brand->create($conn, $_POST['name']);
}
