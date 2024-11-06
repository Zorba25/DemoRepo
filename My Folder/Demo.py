# Databricks notebook source
print('hello world')

# COMMAND ----------

# MAGIC %sql
# MAGIC select "hello world from sql!"

# COMMAND ----------

dbutils.help()

# COMMAND ----------

dbutils.fs.ls('/databricks-datasets/')
cnt=dbutils.fs.ls('/databricks-datasets/')
print(cnt)


# COMMAND ----------

display(cnt)

# COMMAND ----------

# MAGIC %md
# MAGIC # title 1
