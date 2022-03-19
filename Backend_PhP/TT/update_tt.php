<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$db_conn = mysqli_connect("localhost","root","","trees");

$data = json_decode(file_get_contents("php://input"));

if(isset($data->idC) && isset($data->idSP) && isset($data->idPL) && isset($data->tenCC) && isset($data->mota) && isset($data->giaban) && isset($data->anh) 
    && !empty(trim($data->idC)) && !empty(trim($data->idSP))&& !empty(trim($data->idPL))&& !empty(trim($data->tenCC))&& !empty(trim($data->mota))&& !empty(trim($data->giaban))&& !empty(trim($data->anh))
	){
    
    
    $tenc = mysqli_real_escape_string($db_conn, trim($data->tenCC));
    $mo   = mysqli_real_escape_string($db_conn, trim($data->mota));
    $gia  = mysqli_real_escape_string($db_conn, trim($data->giaban));
    $anhP = mysqli_real_escape_string($db_conn, trim($data->anh));

    if (filter_var($tenc)) {
        $updateUser = mysqli_query($db_conn,"UPDATE `thongtinsp` SET `tenCC`='$tenc', `mota`='$mo', 
                                                                    `giaban`='$gia', `anh`='$anhP'  WHERE `idC`='$data->idc'");

        if($updateUser){
            echo json_encode(["success"=>1,"msg"=>"User Updated."]);
        }
        else{
            echo json_encode(["success"=>0,"msg"=>"C Not Updated!"]);
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