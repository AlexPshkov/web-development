<?php

const siteName = "Test site with form";
const userFilesDirPath = "./userFiles/";
const sitePatternsDirPath = "./site-patterns/fileChecker/";

define("isDataReceived", isset($_POST['email']));


/**
 * Make form section for the site
 * @return array|bool|string
 */
function getSiteMainForm(): array|bool|string {
//    if(isDataReceived) return ""; TODO Must be uncommented
    return file_get_contents(sitePatternsDirPath . "_fileChecker-form.html");
}

/**
 * Get file data by the email
 * @return string
 */
function getFileData(): string {
    if(!isDataReceived) return "";
    $fileName = userFilesDirPath . $_POST['email'] . ".txt";
    if(!file_exists($fileName)) return "Данного файла не существует";
    return nl2br(file_get_contents($fileName));
}

/**
 * Make site
 * @return array|bool|string
 */
function makeSiteFromPatterns(): array|bool|string {
    $strFile = file_get_contents(sitePatternsDirPath . "_fileChecker.html");
    return str_replace(["{%site-title%}", "{%main-form%}", "{%file-data%}"], [siteName, getSiteMainForm(), getFileData()], $strFile);
}

echo makeSiteFromPatterns();