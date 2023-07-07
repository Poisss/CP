<?php
    include './connect.php';
    try {
    
        $sql = "SELECT r.text as user_comment_text, u.id as user_id,
        u.name_first as user_name, u.name_last as user_name_last,
        u.img as user_img, g.number as user_grade, p.id as product_id,
        p.title as product_title, p.logo as product_img
        FROM review as r 
        JOIN users as u ON r.user_id=u.id 
        JOIN grade as g ON r.grade_id=g.id 
        JOIN product as p ON r.product_id=p.id
        ORDER BY r.date DESC";
        $result = mysqli_query($conn, $sql);
        $data = mysqli_fetch_all($result, MYSQLI_ASSOC);
    
        header("Access-Control-Allow-Origin: *");
        header("Access-Control-Allow-Methods: POST, GET, OPTIONS"); 
        header("Access-Control-Allow-Headers: Content-Type");
        echo json_encode($data, JSON_NUMERIC_CHECK);
    } catch(Exception $e) {
        echo "Ошибка при выполнении запроса: " . $e->getMessage();
    }
    mysqli_close($conn);
?>