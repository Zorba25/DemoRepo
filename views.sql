-- Databricks notebook source
-- Create table if it doesn't exist
use catalog hive_metastore ;
CREATE TABLE IF NOT EXISTS smartphone (
    id INT,
    name STRING,
    brand STRING,
    year INT
);

-- Insert data
INSERT INTO smartphone (id, name, brand, year) VALUES
    (1, 'iPhone 13', 'Apple', 2021),
    (2, 'Galaxy S21', 'Samsung', 2021),
    (3, 'Pixel 6', 'Google', 2021),
    (4, 'OnePlus 9', 'OnePlus', 2021),
    (5, 'iPhone 12', 'Apple', 2020),
    (6, 'Galaxy S20', 'Samsung', 2020),
    (7, 'Pixel 5', 'Google', 2020),
    (8, 'OnePlus 8T', 'OnePlus', 2020),
    (9, 'Xperia 5 II', 'Sony', 2020),
    (10, 'Xperia 1 II', 'Sony', 2020);


-- COMMAND ----------

create view  view_apple_phones
as select * from smartphone where brand= 'Apple'

-- COMMAND ----------

show tables

-- COMMAND ----------

create temporary view dis_ph
as select distinct brand from smartphone

-- COMMAND ----------

create global temp view global_test
as select * from hive_metastore.default.smartphone

-- COMMAND ----------

show tables in global_temp ;
