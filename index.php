<?php
/**
 * Created by PhpStorm.
 * User: sem
 * Date: 14.11.18
 * Time: 23:02
 */

require_once "php/views.php";
require_once "php/db.php";

//var_dump($_GET);
//var_dump($_REQUEST);
get_header();
//$action = $_REQUEST["action"];


get_goods_data($_GET);
get_footer();