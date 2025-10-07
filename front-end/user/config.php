<?php

// Google API configuration
define('GOOGLE_CLIENT_ID', '71016818050-on2vvoebljqnmc5jkgfkiqndglrf4ito.apps.googleusercontent.com');
define('GOOGLE_CLIENT_SECRET', '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');
define('GOOGLE_REDIRECT_URL', 'http://localhost/DATT/DuAn_ROUTINE/front-end/index.php');

// Start session
if(!session_id()){
    session_start();
}

// Include Google API client library
require_once 'google-api-php-client/Google_Client.php';
require_once 'google-api-php-client/contrib/Google_Oauth2Service.php';

// Call Google API
$gClient = new Google_Client();
$gClient->setApplicationName('Login to coderglass.com');
$gClient->setClientId(GOOGLE_CLIENT_ID);
$gClient->setClientSecret(GOOGLE_CLIENT_SECRET);
$gClient->setRedirectUri(GOOGLE_REDIRECT_URL);

$google_oauthV2 = new Google_Oauth2Service($gClient);

?>