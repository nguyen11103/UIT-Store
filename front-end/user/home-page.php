<!DOCTYPE html>
<html>
<head>
<title>Page Title</title>
</head>
<body>
<center>
<?php 

session_start();

if(isset($_SESSION["uname"])){ 
    
 echo "<h1>You Google Details </h1>";

 echo   $_SESSION["upic"];
 echo   $_SESSION["uid"];
 echo   $_SESSION["uname"];
 echo   $_SESSION["uemail"];
 echo   $_SESSION["logout"];
    
}else{
    
    header("index.php");
}

?>
</center>
</body>
</html>