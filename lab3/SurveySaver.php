<?php
require ("SurveyUtils.php");
header('Content-type: text/plain');

if(!isset($_GET["email"])) {
    echo "Error: Email parameter required";
    return;
}

$args["Email: "] = $_GET["email"];
if(isset($_GET["first_name"])) $args["First Name: "] = $_GET["first_name"];
if(isset($_GET["last_name"])) $args["Last Name: "] = $_GET["last_name"];
if(isset($_GET["age"])) $args["Age: "] = $_GET["age"];

save($args);