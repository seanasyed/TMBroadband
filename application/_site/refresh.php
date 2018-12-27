<?php 
$input = fopen("input.txt", "r");
$data = fread($input, filesize("input.txt"));

fclose($input);

if (!is_null($data)) {
    setcookie("refresh", "1");
    setcookie("id", $data);
}
?>