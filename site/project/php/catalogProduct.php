<?php
    include './connect.php';
    try {
        $sql = "SELECT p.id AS product_id, p.title AS product_title,
        p.description AS product_description,
        SUM(g.count) AS product_grade_count,
        (SELECT GROUP_CONCAT(pg.id SEPARATOR '|') FROM productgrade AS pg  WHERE pg.product_id=p.id) AS product_grade_id,
        (SELECT GROUP_CONCAT(t.name SEPARATOR '|') FROM producttag AS pt JOIN tag AS t ON t.id=pt.tag_id WHERE pt.product_id=p.id) AS product_tag,
        (SELECT GROUP_CONCAT(i.path SEPARATOR '|') FROM listimg AS l JOIN img AS i ON i.id=l.img_id WHERE l.product_id=p.id) AS product_img
        FROM product AS p 
        JOIN status AS s ON p.status_id=s.id
        JOIN productgrade AS g ON g.product_id=p.id
        WHERE s.name='approved'
        GROUP BY p.id";
        $result = mysqli_query($conn, $sql);
        // if (!$result) {
        //     throw new Exception(mysqli_error($conn));
        // }
        // (SELECT t.name from producttag as pt JOIN tag as t ON t.id=pt.tag_id where pt.product_id=p.id) as tag
        $data = mysqli_fetch_all($result, MYSQLI_ASSOC);

        foreach ($data as &$item) {
            // $grade = $item['product_grade_id'] * $item['product_grade_count'] / $item['product_count'];
            // $item['product_grade'] = $grade;
            $gradeid= explode('|', $item['product_grade_id']);
            $item['product_grade_id'] = $gradeid;
            foreach($item['product_grade_id'] as $num){
                $sql="SELECT (g.number*pg.count) as sum FROM productgrade AS pg JOIN grade as g ON pg.grade_id=g.id WHERE pg.id=$num";
                $result = mysqli_query($conn, $sql);
                $fr=mysqli_fetch_assoc($result);
                $grade+=$fr['sum'];
            }
            $item['product_grade'] = round($grade/$item['product_grade_count']);
            $tags = explode('|', $item['product_tag']);
            $item['product_tag'] = $tags;
            $imgs = explode('|', $item['product_img']);
            $item['product_img'] = $imgs;
            $openingTimes = [];
            $sql = "SELECT d.name AS day, o.time_open AS opening, o.time_close AS closing
                    FROM opentime o 
                    JOIN dayweek d ON d.id=o.dayweek_id 
                    WHERE o.product_id=".$item['product_id'];
            $result = mysqli_query($conn, $sql);
            while ($row = mysqli_fetch_assoc($result)) {
                $openingTimes[] = $row;
            }
            $item['openingTimes'] = $openingTimes;
            unset($item['product_grade_id']);
        }
        header("Access-Control-Allow-Origin: *");
        header("Access-Control-Allow-Methods: POST, GET, OPTIONS"); 
        header("Access-Control-Allow-Headers: Content-Type");
        echo json_encode($data, JSON_NUMERIC_CHECK);
    } catch(Exception $e) {
        echo "Ошибка при выполнении запроса: " . $e->getMessage();
    }
    mysqli_close($conn);
?>