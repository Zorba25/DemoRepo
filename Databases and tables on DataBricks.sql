-- Databricks notebook source
use catalog hive_metastore;
create table managed_default
(width int ,length int ,height int);
insert into managed_default
values(3 int , 2 int , 1 int)

-- COMMAND ----------

describe extended  managed_default

-- COMMAND ----------

create table external_default
(width int ,length int ,height int)
location 'dbfs:/mnt/demo/external_default'

-- COMMAND ----------

insert into external_default
values (3 int ,2 int ,  1 int)

-- COMMAND ----------

describe extended external_default

-- COMMAND ----------

drop table external_default

-- COMMAND ----------

-- MAGIC %fs ls 'dbfs:/mnt/demo/external_default'

-- COMMAND ----------

create schema custom
location 'dbfs:/Shared/schemas/custom.db'

-- COMMAND ----------

describe database extended custom

-- COMMAND ----------

create table emp
deep clone employees1
