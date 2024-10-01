<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => 'http://dietplus.test/api/auth/register/',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS =>'{
    "name": "apiuser",
    "email": "apiuser@users.com",
    "password": "password",
    "password_confirmation": "password"
}',
));

$response = curl_exec($curl);

curl_close($curl);

echo "<pre>";
print_r(json_decode($response));
echo "</pre>";