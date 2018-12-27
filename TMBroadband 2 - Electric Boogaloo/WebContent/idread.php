<?php 

$input = fopen("input.txt", "w"); 
fwrite($input, $_GET["id"]); 
fclose($input); 

?>