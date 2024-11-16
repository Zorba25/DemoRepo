-- Databricks notebook source
-- MAGIC
-- MAGIC %run /Workspace/Users/norwayperon@gmail.com/Databricks-Certified-Data-Engineer-Associate/Includes/Copy-Datasets

-- COMMAND ----------

-- MAGIC %python
-- MAGIC files= dbutils.fs.ls(f"{dataset_bookstore}/customers-json")
-- MAGIC display(files)

-- COMMAND ----------

select * from json.`${dataset.bookstore}/customers-json/export_*.json`

-- COMMAND ----------

select count(*) from json.`${dataset.bookstore}/customers-json/export_*.json`

-- COMMAND ----------

select *, input_file_name() source_file from json.`${dataset.bookstore}/customers-json/export_*.json`

-- COMMAND ----------

select * from text.`${dataset.bookstore}/customers-json/export_*.json`

-- COMMAND ----------

select * from binaryfile.`${dataset.bookstore}/customers-json/export_*.json`

-- COMMAND ----------

select * from csv.`${dataset.bookstore}/books-csv`

-- COMMAND ----------

create table book_csv
(book_id string ,title string , author string , category string , price double )
using csv
options(header= "true",
          delimiter =";")
    location "${dataset.bookstore}/books-csv"

-- COMMAND ----------

select * from book_csv

-- COMMAND ----------

describe extended book_csv

-- COMMAND ----------

use catalog hive_metastore;

-- COMMAND ----------

-- MAGIC
-- MAGIC %python
-- MAGIC (spark.read.table("hive_metastore.default.book_csv").write.mode("append").format("csv").option('header','true').
-- MAGIC  option('delimiter',';')
-- MAGIC  .save(f"{dataset_bookstore}/book-csv"
-- MAGIC        ))

-- COMMAND ----------

-- MAGIC %python
-- MAGIC files= dbutils.fs.ls(f"dataset_bookstore}/book-csv")
-- MAGIC display(files)
-- MAGIC
-- MAGIC
-- MAGIC

-- COMMAND ----------

create table orders as 
select * from parquet.`${dataset.bookstore}/orders`

-- COMMAND ----------

select * from orders

-- COMMAND ----------

describe history orders

-- COMMAND ----------

insert overwrite table  orders 
select * from parquet.`${dataset.bookstore}/orders` 

-- COMMAND ----------

insert overwrite table  orders 
select current_timestamp() from parquet.`${dataset.bookstore}/orders` 

-- COMMAND ----------

insert into  orders 
select * from parquet.`${dataset.bookstore}/orders` 
