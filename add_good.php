<?php
/**
 * Created by PhpStorm.
 * User: sem
 * Date: 14.11.18
 * Time: 22:13
 */

include "php/db.php";

//var_dump($_POST);
//POST =>
//  'name' => string 'Pizza' (length=5)
//  'image_file' => string '' (length=0)
//  'image_url' => string 'https://i.allo.ua/media/catalog/product/cache/1/image/425x295/799896e5c6c37e11608b9f8e1d047d15/a/p/apple_iphone_xr_red_1_1.jpg' (length=126)
//  'creator' => string 'Yevgen' (length=6)

if ($_POST['image_url'] != "" ){
    insert_goods( $_POST );
    return;
}

//var_dump($_FILES);

$userfile = $_FILES["image_file"];

if (!isset($userfile)) {
    echo "Файл отсутствует!";
    return;
}

echo "<br> Проверяем ошибки!";

if ($userfile['error'] > 0) {
    echo "Хьюстон, у нас проблема.";

    switch ($userfile['error']) {

        case 1:
        case 2:
            echo "Size of file is bigger than required";
            break;
        case 3:
            echo "Загружена только часть файла, другая часть у Вашего провайдера :(";
            break;
        case 4:
            echo "Авария на линии!";
            break;
        case 6:
            echo "Не задан временный каталог, загрузка невозможна";
            break;
        case 7:
            echo "Места на диске нет, и вообще у нас обед!";
            break;
    }

}

echo "<br> проверяем тип файла! \n";
echo $userfile['type'];

if( ! ( $userfile['type'] == 'image/jpeg' || $userfile['type'] == 'image/png' || $userfile == "image/pjpeg" )){
    echo "Похоже что Вы хотите загрузить что-то запрещенное.";
    return;
}

$upfile = 'pictures/'.$userfile["name"];

$directory_created = mkdir('pictures');
$file_created = touch($upfile);

if ($directory_created){
    echo "Директория создана!";
}

echo "<br> загрузка файла...\n";

if ( is_uploaded_file($userfile["tmp_name"])){
    if( !move_uploaded_file($userfile["tmp_name"],$upfile)){
        echo "<br>Невозможно переместить файл в место назначения!";
        exit;
    }
} else {
    echo '<br>Проблема, возможна атака через загрузку файла!';
    echo $userfile["name"];
    exit;
}

echo " <br> Файл успешно загружен!";

$_POST['image_url'] = $upfile;
insert_goods( $_POST );

