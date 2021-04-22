<?php
include "../db/dbConnect.php";

echo "sayfa yenilendiğinde kayıt yapılır. <br>";
// import json

$source = file_get_contents("../data.json");
$data = json_decode($source);

foreach ($data as $key) {

    //comment 
    $stmtComment = $db->prepare("INSERT INTO comment SET created=?, rating=?, body=?, product_id=?, order_id=?");
    $commentSave = $stmtComment->execute([
        $key->comment->created,
        $key->comment->rating,
        $key->comment->body,
        $key->order->product->product_id,
        $key->order->order_id
    ]);

    // orders
    $stmtorders = $db->prepare("INSERT INTO orders SET order_id=?, owner_mail=?, product_id=?");
    $ordersSave = $stmtorders->execute([
        $key->order->order_id,
        $key->order->owner_mail,
        $key->order->product->product_id
    ]);

    // product
    $stmtproduct = $db->prepare("INSERT INTO product SET product_id=?, product_name=?");
    $productSave = $stmtproduct->execute([
        $key->order->product->product_id,
        $key->order->product->product_name
    ]);

}
if ($commentSave && $ordersSave && $productSave) {
    echo "kayıt başarılı";
}
