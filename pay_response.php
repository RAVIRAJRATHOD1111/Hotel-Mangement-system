<?php
require('admin/inc/db_config.php');
require('admin/inc/essentials.php');

session_start();
unset($_SESSION['room']);

if (!(isset($_SESSION['login']) && $_SESSION['login'] == true)) {
    redirect('index.php');
}

$slct_res = mysqli_query($con,$slct_query);

if(mysqli_num_rows($slct_res)==0){
    redirect('index.php');
}

$slct_fetch = mysqli_fetch_assoc($slct_res);