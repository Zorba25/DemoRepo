-- Databricks notebook source

create table empoyees1
(id int , name string , salary double);



-- COMMAND ----------


DESCRIBE TABLE dev_main.default.empoyees1;


-- COMMAND ----------


DESCRIBE detail dev_main.default.empoyees1;

-- COMMAND ----------

-- Switch to the default catalog
USE CATALOG hive_metastore;
create table employees1
(id int , name string , salary double);

-- COMMAND ----------


DESCRIBE detail hive_metastore.default.empoyees1;

-- COMMAND ----------

USE CATALOG hive_metastore;
INSERT INTO employees1 (id, name, salary) VALUES
    (1, 'Alice', 55000.00),
    (2, 'Bob', 65000.00),
    (3, 'Charlie', 70000.00),
    (4, 'David', 62000.00),
    (5, 'Eve', 68000.00);


-- COMMAND ----------


DESCRIBE detail hive_metastore.default.employees1;

-- COMMAND ----------

-- MAGIC %fs ls 'dbfs:/user/hive/warehouse/employees1'
-- MAGIC

-- COMMAND ----------

USE CATALOG hive_metastore;
update employees1
set salary = salary + 100
where name like "A%"

-- COMMAND ----------

-- MAGIC %fs ls 'dbfs:/user/hive/warehouse/employees1'

-- COMMAND ----------

describe history employees1

-- COMMAND ----------


USE CATALOG hive_metastore;
delete from employees1

-- COMMAND ----------

restore table employees1 to version as of  2

-- COMMAND ----------

select * from employees1

-- COMMAND ----------

describe detail employees1

-- COMMAND ----------

optimize employees1
zorder by id

-- COMMAND ----------

describe table employees1

-- COMMAND ----------

describe detail employees1

-- COMMAND ----------

describe history employees1

-- COMMAND ----------

vacuum employees1

-- COMMAND ----------

set spark.databricks.retentiondurationcheck.enabled = true ;

-- COMMAND ----------

vacuum employees1 retain 0 hours
