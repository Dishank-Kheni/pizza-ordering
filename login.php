<?php
require_once 'dbconfig.php';
require_once './functions.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['logbtn']) == 'Log in') {
        
        $useremail=$_POST['txtuseremail'];
        $password = $_POST['txtpassword'];
        $err_msg = '';

        //check if username and email is empty or not
        if ($useremail == '' || $password == '') {
            //set error message
            $err_msg = 'All The Fields Are Required!';
        } else {
            //check if password's length is less than 8 characters or not
            if (strlen($password) < 8) {
                //set error message
                $err_msg = 'Password can not be less than 8 characters!';
            } else {
                $err_msg = '';

                //check is user exists with provided email
                if(checkEmailExists($useremail)){
                    //get user details with provided email
                    $qry="SELECT * FROM customertb WHERE BINARY email='$useremail'";
                    $stmt=$con->query($qry);
                    $user=$stmt->fetch_array();
                    $hashed_pass=$user['password'];
                    //match hashed password stored in database with provided password
                    if(password_verify($password,$hashed_pass))
                    {
                       session_start();
                       $cart=$con->query("SELECT cartid from carttb where custid=".$user['custid']);
                       if($cart)
                       {
                         if($cart->num_rows==1)
                         {
                            $cr=$cart->fetch_array();
                            $_SESSION['cartId']=$cr['cartid'];
                         }
                       }
                       else{
                         die("something went wrong in backend-login.php adding cartID");
                       }
                       //setting session
                       $_SESSION['userId']=$user['custid'];
                       $_SESSION['userName']=$user['name'];
                       $_SESSION['userEmail']=$user['email'];
                       $_SESSION['userContact']=$user['contactno'];
                       $_SESSION['isLoggedIn']=true;
                       header("Location:index.php");
                    }
                    else{
                    $err_msg='invalid password!';
                    }
                }
                else{
                    $err_msg='invalid email address';
                }
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log in</title>
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">

    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700&family=Ubuntu:wght@700&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="./css/style.css">
    <link rel="shortcut icon" href="./images/favicon.ico" type="image/x-icon">
</head>

<body>
    <div class="min-h-screen flex flex-col items-center justify-center bg-gray-300">
        <div class="flex flex-col bg-white px-4 sm:px-6 md:px-8 lg:px-10 py-8 rounded-md w-full max-w-md">
            <div class="font-medium self-center text-xl sm:text-2xl uppercase text-gray-800">
                Login To Your Account
            </div>

            <div class="mt-5">
                <form action="" method="POST">
                    <div class="flex flex-col mb-6">
                        <label for="email" class="mb-1 text-xs sm:text-sm text-gray-600">
                            Email:
                        </label>
                        <div class="relative">
                            <input id="email" type="text" name="txtuseremail" value="<?php if(isset($useremail)) echo $useremail; ?>"
                            class="text-sm sm:text-base placeholder-gray-500 pl-2 rounded-lg border border-gray-400 w-full py-2"
                            placeholder="Enter Email Address" required/>
                        </div>
                    </div>

                    <div class="flex flex-col mb-6">
                        <label for="password" class="mb-1 text-xs sm:text-sm text-gray-600">
                            Password:
                        </label>
                        <div class="relative">
                            <input id="password" type="password" name="txtpassword"
                            class="text-sm sm:text-base placeholder-gray-500 pl-2 rounded-lg border border-gray-400 w-full py-2"
                            placeholder="Enter Password" required/>
                        </div>
                    </div>
                    <?php
                if (isset($err_msg) != '')
                    echo "<div class='uppercase text-sm font-bold text-red-500'>", $err_msg, "</div><br>";
                ?>
                    <div class="flex w-full">
                        <button type="submit"  name="logbtn"
                        class="flex items-center justify-center text-white text-sm bg-orange-500 hover:scale-105 rounded py-2 w-full">
                        LOGIN
                        </button>
                    </div>
                </form>
            </div>
            <div class="regnow mt-4">
                Not Having Account? <a href="register.php" style="text-decoration: underline;">Register Now</a><br>
                </div>
        </div>
    </div>
</body>
</html>
