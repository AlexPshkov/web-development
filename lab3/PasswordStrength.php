<?php
header('Content-type: text/plain');

/**
 * Get password strength
 * @param $text
 * @return int
 */
function getPasswordStrength($text): int {
    $len = strlen($text);
    $strength = 0;
    $num_amount = 0;
    $char_amount = 0;
    $UP_char_amount = 0;
    $LOW_char_amount = 0;

    $buf = [];
    foreach (str_split($text) as $char) {
        $buf[$char] = isset($buf[$char]) ? ++$buf[$char] : 1;
        if (is_numeric($char)) $num_amount++;
        elseif (ctype_alpha($char)) {
            $char_amount++;
            if (ctype_upper($char)) $UP_char_amount++;
            elseif (ctype_lower($char)) $LOW_char_amount++;
        }
    }

    $strength += 4 * $char_amount;
    $strength += 4 * $num_amount;
    if($UP_char_amount > 0) $strength += ($len - $UP_char_amount) * 2;
    if($LOW_char_amount > 0) $strength += ($len - $LOW_char_amount) * 2;

    if($num_amount === 0) $strength -= $len;
    if($char_amount === 0) $strength -= $len;

    foreach ($buf as $r) if ($r > 1) $strength -= $r;

    return $strength;
}
echo getPasswordStrength($_GET["password"] ?? "");
