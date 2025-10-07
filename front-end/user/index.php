<?php 
// Include configuration file 
require_once 'config.php'; 
session_start();
 
if(isset($_GET['code'])){ 
    $gClient->authenticate($_GET['code']); 
    $_SESSION['token'] = $gClient->getAccessToken(); 
    header('Location: ' . filter_var(GOOGLE_REDIRECT_URL, FILTER_SANITIZE_URL)); 
} 
 
if(isset($_SESSION['token'])){ 
    $gClient->setAccessToken($_SESSION['token']); 
} 
 
if($gClient->getAccessToken()){ 
    // Get user profile data from google 
    $gProfile = $google_oauthV2->userinfo->get(); 
    
    // Getting user profile info 
$gData = array(); 
$gData['oauth_uid']  = !empty($gProfile['id'])?$gProfile['id']:''; 
$gData['first_name'] = !empty($gProfile['given_name'])?$gProfile['given_name']:''; 
$gData['last_name']  = !empty($gProfile['family_name'])?$gProfile['family_name']:''; 
$gData['email']      = !empty($gProfile['email'])?$gProfile['email']:''; 
$gData['gender']     = !empty($gProfile['gender'])?$gProfile['gender']:''; 
$gData['locale']     = !empty($gProfile['locale'])?$gProfile['locale']:''; 
$gData['picture']    = !empty($gProfile['picture'])?$gProfile['picture']:''; 
     
    $userData = $gData; 
     
    // Storing user data in the session 
    $_SESSION['userData'] = $userData; 
     
    // storing user profile data in session
    if(!empty($userData)){ 
        
$_SESSION["upic"]= '<img width="100" src="'.$userData['picture'].'">'; 
$_SESSION["uid"]= '<p><b>Google ID:</b> '.$userData['oauth_uid'].'</p>'; 
$_SESSION["uname"]= '<p><b>Name:</b> '.$userData['first_name'].'</p>'; 
$_SESSION["uemail"]= '<p><b>Email:</b> '.$userData['email'].'</p>'; 
$_SESSION["logout"]= '<p><a href="logout.php"><b>Logout</b></a></p>'; 
       
    header("Location: home-page.php");
        
 }else{ 
 $out_error = '<h3 style="color:red">Some problem occurred, please try again.</h3>'; 
 echo $out_error;
  } 
}else{ 
    // Get login url 
    $authUrl = $gClient->createAuthUrl(); 
     
    // google login button 
    $login_image = '<a href="'.filter_var($authUrl, FILTER_SANITIZE_URL).'">
    <img src="images/google-sign-in-btn.png" alt=""/></a>'; 
    echo $login_image;
} 
?>