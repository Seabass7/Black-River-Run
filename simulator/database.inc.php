<?php

    function connectToDatabase(){
        include_once("../database.php");
        // Try to connect to the database.
        try {
            $db = new PDO(
                "mysql:host=".$dbhost.";dbname=".$dbname, 
                $dbusername, 
                $dbpassword, 
                array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8")
            );
        } catch(PDOexception $e) {
            die("Error while trying to connect to the database...");
        }

        return $db;
    }
    
    function clearTestData(&$db){

        $stmt = $db->prepare("DELETE FROM `runner_units` WHERE `Race` = ?;");
        if ($stmt->execute(array(1000))){
            echo 'Cleared old test runner_units<br />';
        } else {
            echo 'ERROR while clearing runner_units: '.$stmt->errorCode().'<br />';
        }
        $stmt = null;

        $stmt = $db->prepare("DELETE FROM si_unit WHERE NOT EXISTS (SELECT 1 FROM runner_units WHERE runner_units.SI_unit = si_unit.ID )");
        if ($stmt->execute()){
            echo 'Cleared unused si_units<br />';
        } else {
            echo 'ERROR while clearing si_units: '.$stmt->errorCode().'<br />';
        }
        $stmt = null;

        $stmt = $db->prepare("DELETE FROM `timestamp` WHERE `RaceInstance` = ? OR `RaceInstance` = ? OR `RaceInstance` = ? OR `RaceInstance` = ? OR `RaceInstance` = ? OR `RaceInstance` = ?;");
        if ($stmt->execute(array(100012, 100015, 1000110, 100022, 100025, 1000210))){
            echo 'Cleared old test timestamps<br />';
        } else {
            echo 'ERROR while clearing test timestamps: '.$stmt->errorCode().'<br />';
        }
        $stmt = null;

        $stmt = $db->prepare("DELETE FROM `race_runner` WHERE `RaceInstance` = ? OR `RaceInstance` = ? OR `RaceInstance` = ? OR `RaceInstance` = ? OR `RaceInstance` = ? OR `RaceInstance` = ?;");
        if ($stmt->execute(array(100012, 100015, 1000110, 100022, 100025, 1000210))){
            echo 'Cleared old test race_runners<br />';
        } else {
            echo 'ERROR while clearing test race_runners: '.$stmt->errorCode().'<br />';
        }
        $stmt = null;

        $stmt = $db->prepare("DELETE FROM `runner` WHERE `Country` = ?;");
        if ($stmt->execute(array('Automatic_Backend_Test'))){
            echo 'Cleared old test runners<br />';
        } else {
            echo 'ERROR while clearing test runners: '.$stmt->errorCode().'<br />';
        }
        $stmt = null;

    }