<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$db_conn = mysqli_connect("localhost","root","","trees");

// POST DATA
$data = json_decode(file_get_contents("php://input"));

if(isset($data->tenPL) && !empty(trim($data->tenPL))){

   
    $tenP = mysqli_real_escape_string($db_conn, trim($data->tenPL));

    if (filter_var($tenP)) {

        $insertUser = mysqli_query($db_conn,"INSERT INTO `theloai`(`tenPL`) VALUES('$tenP')");

        if($insertUser){

            $last_id = mysqli_insert_id($db_conn);
            echo json_encode(["success"=>1,"msg"=>"User Inserted.","idPL"=>$last_id]);
        }
        else{
            echo json_encode(["success"=>0,"msg"=>"User Not Inserted!"]);
        }
    }
    else{
        echo json_encode(["success"=>0,"msg"=>"Invalid Email Address!"]);
    }
}
else{
    echo json_encode(["success"=>0,"msg"=>"Please fill all the required fields!"]);
}
?>