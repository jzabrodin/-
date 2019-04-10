<?php
/**
 * Created by PhpStorm.
 * User: sem
 * Date: 17.11.18
 * Time: 10:36
 */

include "php/views.php";
include "php/db.php";

get_header();
$id = $_GET["id"];
get_reviews_data($id);
get_footer();