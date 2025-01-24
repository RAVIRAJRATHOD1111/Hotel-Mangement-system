<?php
require('admin/inc/db_config.php');
require('admin/inc/essentials.php');

session_start();

if (!(isset($_SESSION['login']) && $_SESSION['login'] == true)) {
    redirect('index.php');
}

if (isset($_POST['pay_now'])) {
    $order_id = 'ORD_' . $_SESSION['uId'] . random_int(11111, 9999999);
    $cust_id = $_SESSION['uId'];
    $txn_amount = $_SESSION['room']['payment'];

    $paramlist = array();
    $paramlist['order_id'] = $order_id;
    $paramlist['cust_id'] = $cust_id;
    // $paramlist['INDUSTRY_TYPE_ID'] = 'Retail';
    // $paramlist['CHANNEL_ID'] = 'WEB';
    $paramlist['txn_amount'] = $txn_amount;
    // $paramlist['WEBSITE'] = 'WEBSTAGING';
    // $paramlist['CALLBACK_URL'] = 'http://localhost/php/hotel/pay_response.php';

    //insert payment data into database

    $frm_data = filteration($_POST);
    $book = 'booked';
    $trans_status = 'done';

    $query1 = "INSERT INTO `booking_order`(`user_id`, `room_id`, 
`check_in`, `check_out`,`booking_status`,`order_id`,`trans_amt`,`trans_status`) VALUES (?,?,?,?,?,?,?,?)";

    insert($query1, [$cust_id, $_SESSION['room']['id'], $frm_data['checkin'], $frm_data['checkout'], $book, $order_id, $txn_amount, $trans_status], 'isssssis');

    $booking_id = mysqli_insert_id($con);

    $query2 = "INSERT INTO `booking_details`( `booking_id`, `room_name`, `price`, `total_pay`,  `user_name`, `phonenum`, `address`) 
VALUES (?,?,?,?,?,?,?)";
    insert($query2, [
        $booking_id,
        $_SESSION['room']['name'],
        $_SESSION['room']['price'],
        $txn_amount,
        $frm_data['name'],
        $frm_data['phonenum'],
        $frm_data['address']
    ], 'issssss');
}
?>


<html>

<head>
    <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"> -->
</head>

<body>
    <form action="rooms.php" method="post">
        <div x-data="{ isOpen: true }" class="relative flex justify-center">
            <div class="flex items-end justify-center min-h-screen px-4 pt-4 pb-20 text-center sm:block sm:p-0">
                <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>

                <div class="relative inline-block p-4 overflow-hidden text-left align-middle transition-all transform bg-white shadow-xl sm:max-w-sm rounded-xl dark:bg-gray-900 sm:my-8 sm:w-full sm:p-6">
                    <div class="flex items-center justify-center mx-auto">
                        <img class="h-full rounded-lg" src="../hotel/images/ok-emoji.jpg" alt="Payment Successfully Done" />
                    </div>

                    <div class="mt-5 text-center">
                        <h3 class="text-lg font-medium text-gray-800 dark:text-white" id="modal-title">
                            Your Booking Is Successfully Done
                        </h3>

                        <p class="mt-2 text-gray-500 dark:text-gray-400">
                            have a good day.
                        </p>
                    </div>


                    <div class="mt-4 sm:flex sm:items-center sm:justify-between sm:mt-6 sm:-mx-2">

                        <button class="px-4 sm:mx-2 w-full py-3 mt-3 sm:mt-0 text-sm font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-blue-700 rounded-md hover:bg-blue-400 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-40">
                            <i class="bi bi-arrow-left-short"></i> Back To Home
                        </button>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </form>
</body>

</html>