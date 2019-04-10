CREATE DATABASE IF NOT EXISTS aggregator CHARACTER SET utf8 COLLATE utf8_bin;

CREATE schema if not exists aggregator character set utf8 collate utf8_bin;

use aggregator;

CREATE TABLE IF NOT EXISTS aggregator.goods(
  ID int not null auto_increment  primary key,
  name char(255) not null,
  created_at timestamp default CURRENT_TIMESTAMP,
  creator char(255) not null,
  image_path text,
  average_price float
);

CREATE TABLE IF NOT EXISTS reviews
(
  ID int auto_increment
    primary key,
  rating tinyint not null,
  comment text null,
  created_at timestamp default CURRENT_TIMESTAMP not null,
  author char(255) not null,
  good_id int not null,
  constraint reviews_fk_good_id
  foreign key (good_id) references goods (ID)
);
