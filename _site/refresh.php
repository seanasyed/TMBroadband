<?php 
$currID = $_POST["id"];
$input = fopen("input.txt", "r");
$newID = fread($input, filesize("input.txt"));
fclose($input);


unlink("input.txt"); 
$input = fopen("input.txt", "w"); 
fclose($input); 

echo $newID; 

?>