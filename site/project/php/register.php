<?php
require_once('./connect.php');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

$name = $_POST['name'];
$name_last = $_POST['name_last'];
$email = $_POST['email'];
$password = $_POST['password'];
$date= $_POST['date'];
$sex= $_POST['sex'];
$img='/src/assets/img/img2.jpg';

$sql = "SELECT * FROM users WHERE email='$email'";
$result = mysqli_query($conn, $sql);
if (mysqli_num_rows($result) > 0) {
  $response = [
    'success' => false,
    'message' => 'Пользователь с таким email уже существует'
  ];

  header("Content-Type: application/json");
  echo json_encode($response);
  exit();
}

$hashedPassword = md5($password);

$sql = "INSERT INTO users (name_first, name_last, email, password,birthdate,sex,img) 
VALUES ('$name','$name_last', '$email', '$hashedPassword','$date','$sex','$img')";
if (mysqli_query($conn, $sql)) {

  $userId = mysqli_insert_id($conn);

  $roleId = "Пользователь";

  $sql = "INSERT INTO userrole (user_id, role_id) VALUES ('$userId', '$roleId')";
  if (mysqli_query($conn, $sql)) {
    $response = [
        'success' => true,
        'message' => 'Регистрация прошла успешно',
        'role' => $roleId,
        'id' => $userId,
        'img' => $img,
        'name' => $name,
        'name_last' => $name_last,
    ];
  } else {
    $response = [
      'success' => false,
      'message' => 'Ошибка при добавлении роли пользователя'
    ];
  }
} else {
  $response = [
    'success' => false,
    'message' => 'Ошибка при выполнении запроса'
  ];
}
header("Content-Type: application/json");
echo json_encode($response);
mysqli_close($conn);
?>
