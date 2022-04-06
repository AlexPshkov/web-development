<?php
const userFilesDirPath = "../userFiles/";

define("isDataReceived", isset($_POST['Email']));

if(isDataReceived) {
    $text = "";
    foreach($_POST as $key => $value) {
        $text .= $key . ": " . $value . "\n";
    }
    file_put_contents(userFilesDirPath . $_POST['Email'] . ".txt", $text);
}
