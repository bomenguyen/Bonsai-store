<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$db_conn = mysqli_connect("localhost","root","","trees");

$data = json_decode(file_get_contents("php://input"));

if(isset($data->idC))
{
    $delID = $data->idC;

    $deleteUser = mysqli_query($db_conn,"DELETE FROM `thongtinsp` WHERE `idC`='$delID'");

    if($deleteUser)
{
        echo json_encode(["success"=>1,"msg"=>"User Deleted"]);
    }
    else
	{
        echo json_encode(["success"=>0,"msg"=>"U Not Found!"]);
    }
}
else{
    echo json_encode(["success"=>0,"msg"=>"User Not Found!"]);
}
?>