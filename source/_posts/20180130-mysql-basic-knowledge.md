---
title: 数据库基础
date: 2018-01-30 12:27:44
tags: 数据库
---

实验楼 MySQL 基础笔记

本文假设在 Linux 环境下，

# MySQL简单操作

## MySQL服务

打开 MySQL 服务：

```sql
sudo service mysql start
```

如果没有安装MySQL的话，会有下面的提示：

```sql
mysql: unrecognized service`
```

## 打开 MySQL

```SQL
mysql -u root -p
```

## 新建数据库

```SQL
CREATE DATABASE database_name;
```

## 显示数据库

```SQL
SHOW DATABASE;
```

## 连接数据库

```SQL
USE database_name
```

## 数据类型

1. INT
1. FLOAT
1. DOUBLE
1. ENUM
1. SET
1. DATA
1. TIME
1. YEAR
1. CHAR
1. VARCHAR
1. TEXT

ENUM和SET的区别: ENUM 类型的数据的值，必须是定义时枚举的值的其中之一，即单选，而 SET 类型的值则可以多选

```SQL
CREATE TABLE table_name(
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) UNIQUE KEY NOT NULL,
  sex ENUM('Male', 'Female', 'Unknow') DEFAULT 'Unknow');
)
```

## 插入数据

```SQL
INSERT INTO table_name(column_name_a, column_name_b, column_name_c) VALUES(value1, value2, value3);
```

# SQL的约束

## 主键

```SQL
CREATE TABLE employee (
  id INT(10) PRIMARY KEY,
  name CHAR(20),
);
```

```SQL
CREATE TABLE employee (
  id INT(10),
  name CHAR(20),
  CONTRAINT emp_pk PRIMARY KEY (id)
);
```

复合主键

```SQL
CREATE TABLE employee (
  id INT(10),
  name CHAR(20),
  CONTRAINT emp_pk PRIMARY KEY (id,name)
);
```

## 默认值

```sql
CREATE TABLE employee (
  id INT(10),
  name CHAR(20),
  age INT(10) DEFAULT '10',
);
```

## 唯一约束

```sql
CREATE TABLE employee (
  id INT(10),
  name CHAR(20),
  UNIQUE (name),
);
```

## 外键约束

```sql
CREATE TABLE employee (
  id INT(10),
  in_dpt CHAR(20),
  CONSTRAINT emp_fk FOREIGN_KEY(in_dpt) REFERENCES department(dpt_name)
)
```

## 非空约束

```SQL
CREATE TABLE employee (
  id INT (10) NOT NULL,
)
```

# SELECT语句

```SQL
SELECT name,age FROM employee;

SELECT name,age FROM employee age>25;

SELECT name,age FROM employee WHERE name='Mary';

SELECT name,age FROM employee WHERE age<25 OR age>30;
SELECT name,age FROM employee WHERE age>25 AND age<30;
SELECT name,age FROM employee WHERE age BETWEEN 25 AND 30;
```

## IN 和 NOT IN

```SQL
SELECT name,age FROM employee WHERE in_dpt IN ('dpt3', 'dpt4');
```

## 通配符

`_` 代表一个未指定字符，`%` 代表不定个未指定字符。

```SQL
SELECT name,age FROM employee WHERE phone LIKE '1101__';
```

```SQL
SELECT name,age,phone FROM employee WHERE name LIKE 'j%';
```

## 排序

ASC：升序，DESC：降序

```SQL
SELECT name,age FROM employee ORDER BY salary DESC;
```

## SQL 内置函数和计算

1. COUNT：计数
1. SUM：求和
1. AVG：求平均值
1. MAX：最大值
1. MIN：最小值

```sql
SELECT MAX(salary) AS max_salary,MIN(salary) FROM employee;
```

## 子查询

```sql
SELECT of_dpt,COUNT(proj_name) AS count_project
FROM project
WHERE of_dpt IN (SELECT in_dpt FROM employee WHERE name='Tom')
```

## 连接查询

```sql
SELECT id,name,people_num
FROM employee,department
WHERE employee.in_dpt = department.dpt_name
ORDER BY id;
```

```sql
SELECT id,name,people_num
FROM employee JOIN department
ON employee.in_dpt = department.dpt_name
ORDER BY id;
```

# 修改与删除

## 删除数据库

```sql
DROP DATABASE database_name
```

## 重命名一张表

```sql
RENAME TABLE old_table_name TO new_table_name

ALTER TABLE old_table_name TO new_table_name

ALTER TABLE old_table_name RENAME TO new_table_name
```

## 删除表

```sql
DROP TABLE table_name
```

## 对表中列的修改

### 增加一列

```sql
ALTER TABLE table_name ADD COLUMN column_name column_definition
ALTER TABLE table_name ADD column_name column_definition
```

将新增列放在某一列的后面

```sql
ALTER TABLE table_name ADD column_name column_definition AFTER existing_column;
```

将新添加的列，添加到表第一列的位置
```sql
ALTER TABLE table_name ADD colum _name column_definition FIRST
```

### 删除一列

```sql
ALTER TABLE table_name DROP COLUMN column_name

ALTER TABLE table_name DROP column_name
```

### 重命名一列

```sql
ALTER TABLE table_name CHANGE old_column_name new_column_name column_definition
```

### 改变数据类型

```sql
ALTER TABLE table_name MODIFY column_name new_column_definition
```

## 对表的内容修改

### 修改表中某个值

```sql
UPDATE table_name SET column1=value1, column2=value2 WHERE condition
```

### 删除一行记录

```sql
DELETE FROM table_name WHERE condition
```

# 索引

对一张表中的某个列建立索引

```sql
ALTER TABLE table_name ADD INDEX 索引名 (column_name)
```
