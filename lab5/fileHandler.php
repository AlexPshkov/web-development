<?php

const siteName = "Test site with form";
const userFilesDirPath = "./userFiles/";
const sitePatternsDirPath = "./site-patterns/";

define("isPostDataReceived", isset($_POST['email']));
define("isGetDataReceived", isset($_GET['email']));

/**
 * Make form section for the site
 * @return array|bool|string
 */
function getSiteMainForm(): array|bool|string {
//    if(isPostDataReceived || isGetDataReceived) return ""; TODO Must be uncommented
    return file_get_contents(sitePatternsDirPath . "fileChecker/_fileChecker-form.html");
}

/**
 * Make text content
 * @return string
 */
function getTextContent(): string {
    if(isGetDataReceived) return getFileContent();
    if(isPostDataReceived) return saveUserData();
}

/**
 * Get file content
 * @return string
 */
function getFileContent(): string {
    $fileName = userFilesDirPath . $_GET['email'] . ".txt";
    if(!file_exists($fileName)) return "Данного файла не существует";
    return nl2br(file_get_contents($fileName));
}

/**
 * Make site
 * @return array|bool|string
 */
function makeSiteFromPatterns(): array|bool|string {
    $strFile = file_get_contents(sitePatternsDirPath . "fileChecker/_fileChecker.html");
    return str_replace(["{%site-title%}", "{%main-form%}", "{%text-content%}"], [siteName, getSiteMainForm(), getTextContent()], $strFile);
}

/**
 * Save user data to file
 * @return string
 */
function saveUserData(): string {
    $text = "";
    if(!isPostDataReceived) return $text;
    foreach ($_POST as $key => $value) $text .= $key . ": " . $value . "\n";
    file_put_contents(userFilesDirPath . $_POST['email'] . ".txt", $text);
    return "Данные " . $_POST['email']  . " успешно сохранены";
}


if (!(isPostDataReceived || isGetDataReceived)) return;
echo makeSiteFromPatterns();


