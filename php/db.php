<?php
/**
 * Created by PhpStorm.
 * User: sem
 * Date: 14.11.18
 * Time: 21:56
 */


include_once "views.php";

function get_connection(){

    $host = "localhost";
    $user = "admin";
    $password = "";
    $db_name = "aggregator";

    $connection = mysqli_connect($host, $user, $password,$db_name) or die (mysqli_connect_error());
    if ($connection->connect_errno) {
        echo "Не удалось подключиться к MySQL: (" . $connection->connect_errno . ") " . $connection->connect_error;
    }

    return $connection;

}

function get_goods_data($parameters){

    $query_text = "CREATE OR REPLACE VIEW goods_rating AS SELECT
                        good_id, 
                        COUNT( reviews.comment) as comments_quantity
                    FROM
                        reviews
                    GROUP BY good_id";

    execute_query($query_text);
        
    $query_goods = "
        SELECT
            name,
            image_path,
            created_at,
            creator,
            IF (
                ISNULL(goods_rating.comments_quantity),
                0 ,
                goods_rating.comments_quantity
              ) as CommentsQuantity,
            id
        FROM
             goods AS goods
        LEFT JOIN 
            goods_rating as goods_rating
        ON 
            goods_rating.good_id = goods.id
     ";

    if (isset($parameters) && check_parameters($parameters)){

        $query_goods = $query_goods . " ORDER BY " . $parameters["value"] . " " . $parameters["type"];

        $result = execute_query($query_goods,true);

//        var_dump($query_goods);

    } else {
        $result = execute_query($query_goods,true);
    }

//    var_dump($result);

    show_add_new_good_button();

    if (!isset($result) || sizeof($result) == 0){
        echo " <div>Кажется тут пока ничего нет! :( </div> ";
        return;
    }

    show_goods_table_header();

    foreach ( $result as $key){
        display_goods_table_row($key);
    }

    show_goods_table_footer();

}

function check_parameters($parameters){

    if (isset($_GET["value"]) && isset($_GET["type"])){

        $value = strtolower($_GET["value"]);
        $type = strtolower($_GET["type"]);
        $result_type = ($type == "asc" || $type == "desc");
        $result_value = ($value == "name" || $value == "created_at" || $value == "creator" || $value == "commentsquantity");

        return $result_type && $result_value;
    } else {

        return false;
    }

}

function get_reviews_data($id){



    $data = get_average_rating_data($id);
    //var_dump($data);

//    name,
//    image_path,
//    comment,
//    average_rating

    show_head_of_reviews($data,$id);

    if ( !isset($data) || !$data ||sizeof($data) == 0){
        return;
    }

    show_head_of_reviews_table();

    $name = $data[0][0];
    $image_uri = $data[0][1];
    $average_rating = $data[0][3];

    show_head_of_good_review($name, $image_uri, $average_rating);

    show_table_comments_to_good($data);

}

/**
 * @param $query_text
 */
function execute_query($query_text,$returns_value=false)
{
    $connection = get_connection();

//    $query_text = mysqli_real_escape_string($connection,$query_text);
    $statement = $connection->prepare($query_text);

    if ($statement) {

        if (!$statement->execute()) {
            echo "Не удалось выполнить запрос: (" . $statement->errno . ") " . $statement->error;
        }

        if ($returns_value){

            $result = $statement->get_result();

            if (!$result) {
                echo "Не удалось получить результат: (" . $statement->errno . ") " . $statement->error;
            }

            $value = $result->fetch_all();
            return $value;
        }

        //var_dump($value);

    } if (!$statement) {
        show_dev_info("Не удалось подготовить запрос: (" . $connection->errno . ") \n" . $connection->error);
//        echo $query_text;
        return null;
    }
}

function show_dev_info($text){
    return;
    echo "<br>";
    echo $text;
    echo "<br>";
}

function get_average_rating_data($id){

    if (!isset($id)){
        $id = null;
    }

    $id = strip_tags($id);

    show_dev_info("Стартует запуск запроса по расчету среднего рейтинга!");

    $query_text_view_average_rating = "
        CREATE OR REPLACE VIEW goods_average_rating AS
          SELECT
            good_id,
            AVG( reviews.rating) as average_rating
          FROM
            reviews
          GROUP BY
            good_id";

    execute_query($query_text_view_average_rating);

    show_dev_info("Успешно закончен запуск запроса по расчету среднего рейтинга!");

    show_dev_info("Стартует запуск запроса по соединению комментариев с рейтингом!");


    $query_text_comments_with_good = "
        CREATE OR REPLACE VIEW goods_comments AS
          SELECT
            goods.ID AS ID,
            name,
            image_path,
            reviews.comment
          FROM
            goods
          RIGHT JOIN
            reviews
          ON
            goods.ID = reviews.good_id";
        
    execute_query($query_text_comments_with_good);

    show_dev_info("Успешно окончен запуск запроса по соединению комментариев с рейтингом!");

    $query_text_final = '
        SELECT  
          GC.name,
          GC.image_path,
          GC.comment AS comment,
          GAR.average_rating AS average_rating
        FROM
             goods_comments AS GC
        LEFT JOIN
            goods_average_rating AS GAR
        ON
           GC.ID = GAR.good_id';

//    $query_text_final = $query_text_final.
    $tail = !is_integer($id) ? "  where good_id = $id" : "";

    show_dev_info("Стартует запуск финального запроса!");

    show_dev_info("Текст финального запроса!");
    show_dev_info($query_text_final.$tail);

    $result = execute_query(
        $query_text_final.$tail,
        true
    );

    show_dev_info("Окончен запуск финального запроса!");

    if (isset($result))
        show_dev_info("УРА ТОВАРИЩИ!");

    return $result;

}

function insert_review($data){

//    'good_id' => string '11' (length=2)
//  'name' => string 'Johny' (length=5)
//  'rating' => string '6' (length=1)
//  'comment' => string 'Привет всем!' (length=22)

    if ( ! isset($data["name"]) ){
        echo ("author is not set!");
        return;
    }

    if ( ! isset($data["rating"]) ){
        echo ("rating is not set!");
        return;
    }

    if ( ! isset($data["comment"]) ){
        echo ("comment is not set!");
        return;
    }

    if ( ! isset($data["good_id"]) ){
        echo ("good_id is not set!");
        return;
    }

    $author = strip_tags($data["name"]);
    $rating = strip_tags($data["rating"]);
    $comment = strip_tags($data["comment"]);
    $good_id = strip_tags($data["good_id"]);

    $query = "INSERT INTO 
                aggregator.reviews 
                (
                  good_id,
                  rating, 
                  comment,  
                  author
                ) 
              VALUES (
                $good_id,
                $rating,
                \"$comment\",
                \"$author\"
              )";


    //    echo $query;
    execute_query($query);

    echo '<p><b>Отзыв успешно добавлен!</b></p>';
    echo '<a href="../view_show_reviews.php?id='.$good_id.'">Вернуться на страницу с отзывами</a>';
    echo '<br><a href="../index.php">Вернуться на Главную страницу</a>';

}

function insert_goods($data){

    if ( ! isset($data["name"]) ){
        echo ("name is not set!");
        return;
    }

    if ( ! isset($data["creator"]) ){
        echo ("creator is not set!");
        return;
    }

    $creator = strip_tags($data["creator"]);
    $name    = strip_tags($data["name"]);
    $average_price = isset($data["average_price"]) ? floatval($data["average_price"]) : 0;

    if ( isset( $data["image_url"] ) ){
        $image_path = strip_tags($data["image_url"]);
    }

    $query = "INSERT INTO 
                    aggregator.goods ( name, creator,image_path , average_price) 
              VALUES (\"$name\",\"$creator\",\"$image_path\" , $average_price )";


    $result = execute_query($query);
    echo $result;

    echo '<br><p><b>Товар успешно добавлен!</b></p>';
    echo '<br><a href="../index.php">Перейти на главную страницу!</a>';

}