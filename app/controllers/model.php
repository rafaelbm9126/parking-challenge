<?php

require_once("../lib/conn.php");
require_once("../lib/model_lib.php");

$model = new Model();

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
  echo $model->models_by_brand($conn, $_GET["brand_id"]);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  echo $model->create($conn, $_POST["name"], $_POST["brand_id"]);
}
