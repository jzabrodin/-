<?php
/**
 * Created by PhpStorm.
 * User: sem
 * Date: 14.11.18
 * Time: 22:06
 */

// common components {

function get_header(){

    echo '
        <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <title>Title</title>
                  <link rel="stylesheet" href="other/main.css">
            </head>
                        
            <body> 
                <div class="header">АГРЕГАТОР 0.0.1</div>
                <div class="container"/>
            
            
            ';

}

function get_footer(){

    echo '
            
            <div class="container"/>
            <div class="footer" >ВСЕ ПРАВА ЗАЩИЩЕНЫ</div>
            <script type="text/javascript" src="other/script.js"></script>
        </body>

        </html>
    ';

}

// common components }

// add page {

function get_add_good_page(){

    echo '           
            
                <form method="post" class="pure-form-aligned" action="../add_good.php" enctype="multipart/form-data">
           
                    <p><b>Добавление нового товара :</b></p>
           
                    <table>
            
                        <tr>
                            <td><img class="pure-img" id="downloaded_image" width="300" height="200" src="" alt=""></td>
                        </tr>
            
            
                        <tr>
                            <td><br>Наименование</br></td>
                            <td><input class="pure-input-rounded" type="text" name="name"><input type="hidden" name="MAX_FILE_SIZE" value="2000000"></td>
                        </tr>
            
                        <tr>
                            <td><br>Путь к файлу</br></td>
                            <td><input class="pure-input-rounded" type="file" name="image_file" id="image_file"></td>
                        </tr>
            
                        <tr>
                            <td><br>Ссылка на изображение</br></td>
                            <td> <input class="pure-input-rounded" onchange="loadImage()" type="text" id="image_url" name="image_url"></td>
                        </tr>
            
                        <tr>
                            <td><br>Автор</br></td>
                            <td><input class="pure-input-rounded" type="text" name="creator"></td>
                        </tr>
            
                        <tr>
                            <td><br>Средняя цена</td>
                        <td><input class="pure-input-rounded" type="number" name="average_price"></td>
                        </tr>
            
                        <tr>
                            <td></td>
                            <td><button class="pure-button" type="submit">Отправить</button>
                            </td>
                        </tr>
            
            
                    </table>
            
                </form>
     ';

}

function get_add_review_page($id){

    echo '
    
        <form class="pure-form-aligned" action="../add_review.php" method="post">

            <p><b>Добавление нового отзыва:</b></p>
            <input type="hidden" value="'.$id.'" name="good_id"/>

            <table>
        
                <tr>
                    <td>Автор</td>
                    <td><input class="pure-input-rounded" type="text" name="name"></td>
                </tr>
                <tr>
                    <td>Оценка</td>
                    <td><input class="pure-input-rounded" type="number" maxlength="1" minlength="1" min="1" max="10" name="rating"></td>
                </tr>
                <tr>
                    <td>Комментарий</td>
                    <td><input class="pure-input-rounded" type="text" name="comment" ></td>
                </tr>
        
                <tr>
                    <td><button class="pure-button" type="submit">Отправить</button></td>
                </tr>
            </table>
        
        </form>
    
    ';

}

// add page }

// goods table {

function show_add_new_good_button(){


    echo '<a class="pure-button" href="../view_add_good.php">Добавить новый товар!</a>';
    echo '<div><br></div>';

}

function show_goods_table_header(){

//      name,
//      created_at,
//      creator
//      CommentsQuantity

    echo "

        <table class='pure-table-striped' border='1'>
        
            
            <form action='index.php'>
            
                <a>Упорядочить по : </a>
                <select name='value'>
                    <option value='name'>По наименованию</option>
                    <option value='created_at'>По дате добавления</option>
                    <option value='CommentsQuantity'>По количеству комментариев</option>
                    <option value='creator'>По имени добавившего</option>
                </select>
                
                <select name='type'>
                   <option value='asc'> по возрастанию </option>
                   <option value='desc'> по убыванию </option>
                </select>
                <button type='submit'>ОК</button>
            
            </form>
                
            <tr>
                <th>Название товара</th>
                <th>Изображение</th>
                <th>Дата добавления</th>
                <th>Имя добавившего</th>
                <th>Количество отзывов</th>
            </tr>
        

    ";

}

function display_goods_table_row($data){

// Порядок полей возвращаемых запросом
//    name,
//    image_path,
//    created_at,
//    creator,
//    CommentsQuantity
//    id

    //var_dump($data);

    echo "
        <tr>
            <td> <a href='../view_show_reviews.php?id=$data[5]'>$data[0]</a> </td>
            <td><img src='$data[1]' alt='' height='100px'></td>
            <td>$data[2]</td>
            <td>$data[3]</td>
            <td>$data[4]</td>
        </tr>
       ";

}

function show_head_of_reviews_table(){
    echo ' <table class="pure-table" border="1">
            <th>Наименование</th>
            <th>Изображение</th>
            <th>Средний рейтинг</th> ';
}

function show_goods_table_footer(){
    echo "</table>";
}

// goods table }

//reviews table {

function show_head_of_reviews($data,$id){
    if ( !isset($data) || sizeof($data) == 0){
        echo "<br><a href='./view_add_review.php?id=$id'> Добавить новый отзыв </a>";
        echo '<br><a href="index.php">Вернуться на главную страницу</a>';
        echo "<br> <h2>К сожалению отзывов пока нету.</h2>";
        return;
    } else {
        echo '<br><a href="index.php">На главную страницу</a>';
        echo "<br><a href='./view_add_review.php?id=$id'> Добавить новый отзыв </a>";
    };
}

/**
 * @param $name
 * @param $image_uri
 * @param $average_rating
 */
function show_head_of_good_review($name, $image_uri, $average_rating)
{
    echo "
            <tr>
                <td>$name</td>
                <td><img src='$image_uri' height='300px' alt=''></td>
                <td>$average_rating</td>
            </tr>";

    echo '</table>';

    echo '<br>';
    echo '<br>';
    echo '<h3>Отзывы к товару</h3>';
    echo '<br>';
}

function show_reviews_table_header(){


    echo "

        <table class='pure-table' border='1'>
            <tr>
                <th>Отзыв</th>
                <th>Рейтинг</th>
                <th>Дата добавления</th>
                <th>Автор</th>
            </tr>
        

    ";

}

function display_reviews_table_row($data){

// Порядок полей возвращаемых запросом
//    name,
//    image_path,
//    created_at,
//    creator,
//    CommentsQuantity

    //var_dump($data);

    echo "
        <tr>
            <td>$data[0]</td>
            <td>$data[1]></td>
            <td>$data[2]</td>
            <td>$data[3]</td>
        </tr>
       ";

}

function show_reviews_table_footer(){
    echo "</table>";
}

/**
 * @param $data
 */
function show_table_comments_to_good($data)
{
    echo '<table class="pure-table" border="1"> <th>Комментарий</th>';

    foreach ($data as $row) {
        echo "<tr>
                  <td>$row[2]</td>
              </tr>";
    }

    echo '</table>';
}

//reviews table }