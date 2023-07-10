<?php
 include './connect.php';
 try {
    header("Access-Control-Allow-Origin: *");
     header("Access-Control-Allow-Methods: POST, GET, OPTIONS"); 
     header("Access-Control-Allow-Headers: Content-Type");

     $id = $_GET['id'];

     $sql = "SELECT r.text as text, r.date as date,
     r.product_id as product_id, g.number as grade,
     p.title as title, p.logo as img
     FROM users as u 
     JOIN review as r ON r.user_id=u.id 
     JOIN grade as g ON r.grade_id=g.id 
     JOIN product as p ON r.product_id=p.id
     WHERE u.id='$id'";
     $result = mysqli_query($conn, $sql);
     $data = mysqli_fetch_all($result, MYSQLI_ASSOC);
 
     echo json_encode($data, JSON_NUMERIC_CHECK);
 } catch(Exception $e) {
     echo "Ошибка при выполнении запроса: " . $e->getMessage();
 }
 
 mysqli_close($conn);