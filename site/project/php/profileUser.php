<?php
 include './connect.php';
 try {
    header("Access-Control-Allow-Origin: *");
     header("Access-Control-Allow-Methods: POST, GET, OPTIONS"); 
     header("Access-Control-Allow-Headers: Content-Type");

     $id = $_GET['id'];

     $sql = "SELECT u.name_first as name, u.name_last as name_last, 
     u.img as img, u.birthdate as birthdate, s.name as sex
     FROM users as u JOIN sex as s ON u.sex=s.id
     WHERE u.id='$id'";
     $result = mysqli_query($conn, $sql);
     $data = mysqli_fetch_all($result, MYSQLI_ASSOC);
 
     echo json_encode($data, JSON_NUMERIC_CHECK);
 } catch(Exception $e) {
     echo "Ошибка при выполнении запроса: " . $e->getMessage();
 }
 
 mysqli_close($conn);
?>