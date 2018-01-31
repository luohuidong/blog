---
title: 数据库基础
date: 2018-01-30 12:27:44
tags: 数据库
---

目录：

<!-- TOC -->

- [MySQL 服务](#mysql-服务)
- [打开 MySQL](#打开-mysql)
- [新建数据库](#新建数据库)
- [显示数据库](#显示数据库)
- [连接数据库](#连接数据库)
- [数据类型](#数据类型)
- [插入数据](#插入数据)
- [SQL的约束](#sql的约束)
    - [主键](#主键)
    - [默认值](#默认值)
    - [唯一约束](#唯一约束)
    - [外键约束](#外键约束)
    - [非空约束](#非空约束)
- [SELECT语句](#select语句)
    - [IN 和 NOT IN](#in-和-not-in)
    - [通配符](#通配符)
    - [排序](#排序)
    - [SQL 内置函数和计算](#sql-内置函数和计算)
    - [子查询](#子查询)
    - [连接查询](#连接查询)
- [修改与删除](#修改与删除)
    - [删除数据库](#删除数据库)
    - [重命名一张表](#重命名一张表)
    - [删除表](#删除表)
    - [对表中列的修改](#对表中列的修改)
        - [增加一列](#增加一列)

<!-- /TOC -->

本文假设在 Linux 环境下，

## MySQL 服务

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

## SQL的约束

### 主键

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

### 默认值

```sql
CREATE TABLE employee (
  id INT(10),
  name CHAR(20),
  age INT(10) DEFAULT '10',
);
```

### 唯一约束

CREATE TABLE employee (
  id INT(10),
  name CHAR(20),
  UNIQUE (name),
);

### 外键约束

```sql
CREATE TABLE employee (
  id INT(10),
  in_dpt CHAR(20),
  CONSTRAINT emp_fk FOREIGN_KEY(in_dpt) REFERENCES department(dpt_name)
)
```

### 非空约束

```SQL
CREATE TABLE employee (
  id INT (10) NOT NULL,
)
```

## SELECT语句

```SQL
SELECT name,age FROM employee;

SELECT name,age FROM employee age>25;

SELECT name,age FROM employee WHERE name='Mary';

SELECT name,age FROM employee WHERE age<25 OR age>30;
SELECT name,age FROM employee WHERE age>25 AND age<30;
SELECT name,age FROM employee WHERE age BETWEEN 25 AND 30;
```

### IN 和 NOT IN

```SQL
SELECT name,age FROM employee WHERE in_dpt IN ('dpt3', 'dpt4');
```

### 通配符

`_` 代表一个未指定字符，`%` 代表不定个未指定字符。

```SQL
SELECT name,age FROM employee WHERE phone LIKE '1101__';
```

```SQL
SELECT name,age,phone FROM employee WHERE name LIKE 'j%';
```

### 排序

ASC：升序，DESC：降序

```SQL
SELECT name,age FROM employee ORDER BY salary DESC;
```

### SQL 内置函数和计算

1. COUNT：计数
1. SUM：求和
1. AVG：求平均值
1. MAX：最大值
1. MIN：最小值

```sql
SELECT MAX(salary) AS max_salary,MIN(salary) FROM employee;
```

### 子查询

```sql
SELECT of_dpt,COUNT(proj_name) AS count_project
FROM project
WHERE of_dpt IN (SELECT in_dpt FROM employee WHERE name='Tom')
```

### 连接查询

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

## 修改与删除

### 删除数据库

```sql
DROP DATABASE database_name
```

### 重命名一张表

```sql
RENAME TABLE old_table_name TO new_table_name

ALTER TABLE old_table_name TO new_table_name

ALTER TABLE old_table_name RENAME TO new_table_name
```

### 删除表

```sql
DROP TABLE table_name
```

### 对表中列的修改

#### 增加一列

```sql
ALTER TABLE table_name ADD COLUMN column_name column_definition
```

将新增列放在某一列的后面

```sql
ALTER TABLE table_name ADD existing_column 
```