<?php

$dbname   = 'demande-releves-notes';
$username = 'root';
$password = '';

try {
    $pdo = new PDO("mysql:host=localhost;dbname=$dbname", $username,  $password);
} catch (Exception $e) {
    print $e->getMessage() . "\n";
}

$pdo->exec("SET CHARACTER SET utf8");

?>
