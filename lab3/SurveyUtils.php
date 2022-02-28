<?php

/**
 * Get old or new values
 * @param $cur_path
 * @return string[]
 */
function getValues($cur_path): array {
    $result = ["Email: " => "", "First Name: " => "", "Last Name: " => "", "Age: " => ""];
    if(!file_exists($cur_path)) return $result;
    foreach (file($cur_path) as $str) {
        $buf = explode(": ", $str);
        if(count($buf) > 1) $result[$buf[0] . ": "] = $buf[1];
    }
    return $result;
}

/**
 * Save array to file
 * @param $fields - array of type key => value
 * @return void
 */
function save($fields) {
    $cur_path = ".\\data\\" . $fields["Email: "] . ".txt";
    $values = getValues($cur_path);
    foreach ($fields as $key => $value)
        $values[$key] = $value;
    $fileStream = fopen($cur_path, "w");
    foreach ($values as $key => $value)
        fwrite($fileStream,$key . $value . (str_ends_with($value, "\n") ? "" : "\n"));
    fclose($fileStream);
}