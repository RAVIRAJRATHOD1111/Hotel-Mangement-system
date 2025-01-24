<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  
  <?php require('inc/links.php'); ?>
  <title><?php echo $settings_r['site_title'] ?>  BOOKING STATUS</title>



</head>

<body class="bg-light">
  <?php require('inc/header.php'); ?>

  <?php

  

  if(!(isset($_SESSION['login']) && $_SESSION['login'] == true)){
    redirect('index.php');
  }

  // filter and get room and user data

  

  $data = filteration($_GET);

  $room_res = select("SELECT * FROM `rooms` WHERE `id`=? AND `status`=? AND `removed`=?", [$data['id'], 1, 0], 'iii');

  if (mysqli_num_rows($room_res) == 0) {
    redirect('rooms.php');
  }

  $room_data = mysqli_fetch_assoc($room_res);
  $_SESSION['room'] =[
    "id"=> $room_data['id'],
    "name"=> $room_data['name'],
    "price"=> $room_data['price'],
    "payment"=> null,
    "available"=> false,
  ];
  $user_res = select( "SELECT * FROM `user_cred` WHERE `id`=? LIMIT 1",[$_SESSION['uId']],"i");
$user_data = mysqli_fetch_assoc($user_res);

  
  ?>


  <div class="container">
    <div class="row">

      <div class="col-12 my-5 mb-3 px-4">
        <h2 class="fw-bold">PAYMENT STATUS</h2>
        
      </div>

      <div class="col-lg-7 col-md-12 px-4">
       
     <?php 
     
    $frm_data = filteration($_GET);
    if (!(isset($_SESSION['login']) && $_SESSION['login'] == true)) {
    redirect('index.php');
}

 $booking_q = "SELECT bo.*, bd.* FROM `booking_order` bo 
  INNER JOIN `booking_details` bd ON bo.booking_id=bd.booking_id
  WHERE bo.order_id=?  AND bo.user_id=? AND bo.booking_status!=? ";

  $booking_res = select($booking_q,[$frm_data['order'],$_SESSION['uId'],'pending'],'sis');

  if(mysqli_num_rows($booking_res)==0){
    redirect('index.php');
  }

  $booking_fetch = mysqli_fetch_assoc($booking_res);
  if($booking_fetch['trans_status'=="txt_success"]){
    echo<<<data
    <div class="col-12 px-4">
    <p class="fw-bold alert alert-success">
    <i class="bi bi-check-circle-fill"></i>
    PAYMENT done ! Booking successful.
    <br><br>
    <a href='bookings.php'>Go to Bookings</a>
    </p>
    </div>
    data;
  }
  else{
       echo<<<data
    <div class="col-12 px-4">
    <p class="fw-bold alert alert-danger">
    <i class="bi bi-exclamation-triangle-fill"></i>
    PAYMENT failed ! $booking_fetch[trans_resp_msg]
    <br><br>
    <a href='bookings.php'>Go to Bookings</a>
    </p>
    </div>
    data;
  }
    ?>
      


      

    </div>
  </div>

  <?php require('inc/footer.php'); ?>
  
</body>

</html>