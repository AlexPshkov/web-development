<?php

const userFilesDirPath = "./userFiles/";
const sitePatternsDirPath = "./site-patterns/";

define("isPostDataReceived", isset($_POST['email']));


//=======================[GET DATA]===================================
/**
 * Gets all users from userFiles dir
 * @return array
 */
function getAllUserData(): array {
    $result = "";
    $count = 0;
    foreach(scandir(userFilesDirPath) as $file) {
        $filePath = userFilesDirPath . $file;
        if (!str_contains($filePath, "@")) continue;
        $box = file_get_contents(sitePatternsDirPath . "userBox.html");
        $userData = getUserData($filePath);
        $box = str_replace("%username%", $userData["username"], $box);
        $box = str_replace("%email%", $userData["email"], $box);
        $box = str_replace("%activity%", $userData["activity"], $box);
        $box = str_replace("%policy%", $userData["policy"] === "on" ? "Да" : "Нет", $box);
        $result .= $box;
        $count++;
    }
    if ($count == 0) $result = "Сохраненных пользователей нет";
    return ["status" => 200, "message" => "Данные получены", "content" => $result];
}

/**
 * Get data from user
 * @param $filePath
 * @return string[]
 */
function getUserData($filePath): array {
    $result = ["username" => "", "email" => "", "activity" => "", "policy" => ""];
    foreach (file($filePath) as $str) {
        $buf = explode(": ", str_replace("\n", "", $str));
        $result[$buf[0]] = $buf[1];
    }
    return $result;
}
//=======================[GET DATA]===================================


//=======================[SAVE DATA]===================================
/**
 * Save post
 * @return array
 */
function savePostEntity(): array {
    $text = "";
    foreach ($_POST as $key => $value) $text .= $key . ": " . $value . "\n";
    file_put_contents(userFilesDirPath . $_POST['email'] . ".txt", $text);
    return ["status" => 200, "message" => "Данные " . $_POST['email']  . " успешно сохранены"];
}
//=======================[SAVE DATA]===================================


echo json_encode(isPostDataReceived ? savePostEntity() : getAllUserData());
