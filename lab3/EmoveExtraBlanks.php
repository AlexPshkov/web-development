<?php

header('Content-type: text/plain');

/**
 * Trim string
 * @param $text
 * @return string|null
 */
function fixSpaces($text): ?string {
    $lastCharacter = "";
    $result = "";
    foreach (str_split($text) as $char) {
        if ($char !== ' ') {
            if ($lastCharacter == ' ') $result = $result . ' ';
            $result = $result . $char;
        }
        $lastCharacter = $char;
    }
    return $result;
}

echo fixSpaces($_GET["text"] ?? "");