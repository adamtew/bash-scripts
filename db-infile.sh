o 'Wordpress import started';

DB_USER='';
DB_PASSWD='';

DB_NAME='';
TABLE='';

INPUT_FILE='/path/to/file.txt';

#SQL="USE $DB_NAME; LOAD LOCAL DATA INFILE '$INPUT_FILE' REPLACE INTO TABLE `$TABLE` LINES TERMINATED BY '|' CHARACTER SET utf8;"

SQL="

USE database;
CREATE TABLE IF NOT EXISTS perfumania
(
  title VARCHAR(79),
  description VARCHAR(1000),
  price DECIMAL(6,2) UNSIGNED,
  product_url VARCHAR(255),
  image_url VARCHAR(255),
  product_id BIGINT UNSIGNED NOT NULL DEFAULT '0',                                                                    
  my_category VARCHAR(20),                                                                                            
  gifts_category VARCHAR(25),                                                                                         
  ISBN BIGINT UNSIGNED,                                                                                               
  MFN VARCHAR(255),                                                                                                   
  click_bid VARCHAR(255),  
  upc VARCHAR(255),
  brand VARCHAR(20),
  short_description VARCHAR(100) NULL DEFAULT '',
  keywords VARCHAR(255) NOT NULL DEFAULT '',
  shipping_promo VARCHAR(255),
  in_stock VARCHAR(255),
  gift_wrappable VARCHAR(255),
  personalized VARCHAR(255),
  days_till_ship VARCHAR(255),
  promotion VARCHAR(255),
  short_promotion VARCHAR(255)
);
LOAD DATA LOCAL INFILE '/path/to/file.txt' REPLACE INTO TABLE table_name;

"

mysql --user=$DB_USER --password=$DB_PASSWD --default_character_set utf8 $DB_NAME -e "$SQL" --local-infile=1

echo 'import finished';
