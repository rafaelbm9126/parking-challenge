<?php

$conn = new mysqli(getenv("DB_HOST"), getenv("DB_USERNAME"), getenv("DB_PASSWORD"), getenv("DB_NAME"));

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
