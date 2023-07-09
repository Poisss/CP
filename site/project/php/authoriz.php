<?php
include './connect.php';

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

$email = $_POST['email'];
$password = $_POST['password'];
$hash_password= md5($password);
$sql = "SELECT u.id as id, u.name_first as name, u.img as img, u.name_last as name_last, r.id as role
        FROM users as u
        JOIN userrole as ar ON u.id = ar.user_id
        JOIN role as r ON ar.role_id=r.id
        WHERE u.email = '$email' AND u.password = '$hash_password'";
$result = mysqli_query($conn, $sql);
if (!$result) {
    die('Ошибка выполнения запроса: ' . mysqli_error($conn));
}
$row = mysqli_fetch_assoc($result);
if ($row) {
  $response = [
    'id' => $row['id'],
    'img' => $row['img'],
    'name' => $row['name'],
    'name_last' => $row['name_last'],
    'role' => $row['role'],
    'success' => true,
    'message' => 'Авторизация прошла успешно'
  ];
} else {

  $response = [
    'success' => false,
    'message' => 'Неверная почта или пароль'
  ];
}
header("Content-Type: application/json");
echo json_encode($response);
?>