<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$db_conn = mysqli_connect("localhost","root","","trees");

$data = json_decode(file_get_contents("php://input"));

if(isset($data->idSP) 
	&& isset($data->idPL) 
	&& isset($data->tenSP) 
	&& is_numeric($data->idSP) 
	&& !empty(trim($data->idPL)) 
	&& !empty(trim($data->tenSP))
	){
    $idpl = mysqli_real_escape_string($db_conn, trim($data->idPL));
    $ten = mysqli_real_escape_string($db_conn, trim($data->tenSP));

    if (filter_var($ten)) {
        $updateUser = mysqli_query($db_conn,"UPDATE `sanpham` SET `idPL`='$idpl', `tenSP`='$ten' WHERE `idSP`='$data->idSP'");

        if($updateUser){
            echo json_encode(["success"=>1,"msg"=>"User Updated."]);
        }
        else{
            echo json_encode(["success"=>0,"msg"=>"User Not Updated!"]);
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