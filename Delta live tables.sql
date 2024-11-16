-- Databricks notebook source

SET datasets.path=dbfs:/mnt/demo-datasets/bookstore;

-- COMMAND ----------

create or refresh streaming live table orders_raw
as select * from  cloud_files("${datasets,path}/orders-raw","parquet",
                        map("schema","order_id string,order_timestamp long, customer_id string , quantity long") )

-- COMMAND ----------

describe table orders_raw

-- COMMAND ----------


CREATE OR REFRESH LIVE TABLE customers
COMMENT "The customers lookup table, ingested from customers-json"
AS SELECT * FROM json.`${datasets.path}/customers-json`

-- COMMAND ----------

CREATE OR REFRESH STREAMING LIVE TABLE orders_cleaned
COMMENT "The cleaned books orders with valid order_id"
AS
SELECT 
  o.order_id, 
  o.quantity, 
  o.customer_id, 
  c.profile.first_name AS f_name, 
  c.profile.last_name AS l_name,
  CAST(FROM_UNIXTIME(o.order_timestamp, 'yyyy-MM-dd HH:mm:ss') AS TIMESTAMP) AS order_timestamp, 
  o.books,
  c.profile.address.country AS country
FROM LIVE.orders_raw o
LEFT JOIN LIVE.customers c
  ON o.customer_id = c.customer_id
WHERE o.order_id IS NOT NULL;
