<?php
header('Content-type: text/plain');

class FunctionResult {
    public bool $value = false;
    public string $resultComm = "Error: Empty value";

    public function init($value, $resultComm = "Ok"): FunctionResult {
        $this -> value = $value;
        $this -> resultComm = $resultComm;
        return $this;
    }
}

/**
 * Check if it is valid identifier or not
 * @param $text
 * @return FunctionResult
 */
function checkIdentifierField($text): FunctionResult {
    $len = strlen($text);
    $result = new FunctionResult();
    if ($len === 0) return $result;
    if ($len === 1)
        if(ctype_alpha($text)) return $result -> init(true, "Correct identifier");
        else return $result -> init(false, "First must be an alpha character");
    $buf = str_split($text,  $len - 1);
    if(!is_numeric($buf[1]) && !ctype_alpha($buf[1]))
        return $result -> init(false, "Identifier must contain only numbers and alpha characters");
    return checkIdentifierField($buf[0]);
}

$result = checkIdentifierField($_GET["identifier"] ?? "");
echo ($result -> value ? "yes" : ("no" . "\n" . $result -> resultComm));