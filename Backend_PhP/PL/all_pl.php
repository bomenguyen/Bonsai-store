<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET, POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$db_conn = mysqli_connect("localhost","root","","trees");

$allPL = mysqli_query($db_conn,"SELECT * FROM donhang where so = so order by so DESC");

if(mysqli_num_rows($allPL) > 0){

    $all_PL = mysqli_fetch_all($allPL,MYSQLI_ASSOC);
    
    echo json_encode(["success"=>1,"type"=>$all_PL]);
}
else{
    echo json_encode(["success"=>0]);
}

?>