<?php
require ("SurveyUtils.php");
header('Content-type: text/plain');

if(!isset($_GET["email"])) {
    echo "Error: Email parameter required";
    return;
}
$cur_path = ".\\data\\" . $_GET["email"] . ".txt";
if(!file_exists($cur_path)) {
    echo "Error: No such file";
    return;
}

foreach (getValues($cur_path) as $key => $value)
    echo $key . $value;
