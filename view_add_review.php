<?php
/**
 * Created by PhpStorm.
 * User: sem
 * Date: 14.11.18
 * Time: 22:58
 */

include "php/views.php";

$id = $_GET["id"];

get_header();

if (!isset($id)){
    echo "Упс, что-то пошло не так";
} else {
    get_add_review_page($id);
}

get_footer();