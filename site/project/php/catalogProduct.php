<?php
    include './connect.php';
    try {
    
        $sql = "SELECT p.id as product_id, p.title as product_title,
        p.description as product_description, 
        (SELECT t.name from producttag as pt JOIN tag as t ON t.id=pt.tag_id where pt.product_id=p.id) as tag
        FROM product as p 
        JOIN producttag as pt ON p.id=pt.product_id";
        $result = mysqli_query($conn, $sql);
        // if (!$result) {
        //     throw new Exception(mysqli_error($conn));
        // }
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