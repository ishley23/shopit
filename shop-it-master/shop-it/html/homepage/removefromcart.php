<?php
  session_start();
  $con = mysqli_connect("localhost","root","","ishley_db");
  $cid = $_POST['cid'];
  $flag = isset($_SESSION["Username"]);
  if($flag){
    $sql = "delete from cart where cartID = '$cid'";
    $result = mysqli_query($con, $sql) or die($con->error);
    header("Location: cart.php");
  }
?>