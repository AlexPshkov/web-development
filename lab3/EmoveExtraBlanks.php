<?php
header('Content-type: text/plain');

/**
 * Trim string
 * @param $text
 * @return string
 */
function fixSpaces($text): string {
    if(strlen($text) === 0)
        return "Error: Empty string";
    $lastCharacter = "";
    $result = "";
    $wereAnyChar = false;
    foreach (str_split($text) as $char) {
        if ($char !== ' ') {
            if ($lastCharacter == ' ') $result = $result . ' ';
            $result = $result . $char;
            $wereAnyChar = true;
        }
        if($wereAnyChar) $lastCharacter = $char;
    }
    return $result;
}

echo fixSpaces($_GET["text"] ?? "");