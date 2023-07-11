<?php
require_once('./connect.php');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

$name = $_POST['name'];
$name_last = $_POST['name_last'];
$date= $_POST['date'];
$sex= $_POST['sex'];
$id= $_POST['id'];

$sql = "UPDATE users SET name_first='$name', name_last='$name_last',
 birthdate='$date', sex='$sex' 
WHERE id='$id'";
if(mysqli_query($conn, $sql)){
    $response = [
        'success' => true,
        'message' => 'Успех при добавлении данных пользователя'
      ];
}else{
    $response = [
        'success' => false,
        'message' => 'Ошибка при обновлении данных пользователя'
      ];
}

header("Content-Type: application/json");
echo json_encode($response);
mysqli_close($conn);