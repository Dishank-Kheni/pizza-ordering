<?php

function send_mail($subject, $sub_msg, $msg)
{
    if (session_status() === PHP_SESSION_NONE) {
        session_start();
    }
    var_dump($_SESSION);
    $to = $_SESSION['userEmail'];
    $name = $_SESSION['userName'];
    $header = "MIME-Version: 1.0" . "\r\n";
    $header .= "Content-type:text/html; charset=iso-8859-1" . "\r\n";
    $subject = "Order success $name";

    $message = "<h2>Hello $name</h2> <p>$sub_msg</p> $msg";
    if (mail($to, $subject, $message, $header)) {
        return true;
    } else {
        die("mail not sent!!");
    }
}

function get_cartId()
{
    if (session_status() === PHP_SESSION_NONE) {
        session_start();
    }
    include "dbconfig.php";
    $cart_qry = "SELECT cartid FROM carttb WHERE custid=" . $_SESSION['userId'];
    $cart_res=$con->query($cart_qry);
    if($cart_res)
    {
        if($cart_res->num_rows==1)
        {
            $cart_id=$cart_res->fetch_array()['cartid'];
            return $cart_id;
        }
        else{
            return false;
        }
    }
    else{
        die("Error While Fetching Cart!");
    }
}

// functions.php

// Function to check if an email exists in the database

require_once 'dbconfig.php';

function checkEmailExists($email) {
    global $con;

    $email = mysqli_real_escape_string($con, $email); // Sanitize the email input

    $query = "SELECT COUNT(*) FROM customertb WHERE BINARY email='$email'";
    $result = mysqli_query($con, $query);

    if ($result) {
        $row = mysqli_fetch_row($result);
        $count = $row[0];
        return $count > 0; // Returns true if the email exists in the database
    } else {
        return false; // Returns false if there is an error in the query
    }
}