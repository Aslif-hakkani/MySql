Microsoft Windows [Version 10.0.19045.6456]
(c) Microsoft Corporation. All rights reserved.

C:\xampp\mysql\bin>mysql -u root -h localhost
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 10.4.25-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> show databases
    -> ;
+--------------------+
| Database           |
+--------------------+
| customer_db        |
| details            |
| information_schema |
| mysql              |
| performance_schema |
| personnel_db       |
| phpmyadmin         |
| pscompany          |
| students           |
| test               |
| world              |
+--------------------+
11 rows in set (0.048 sec)

MariaDB [(none)]> use pscompany;
Database changed
MariaDB [pscompany]> show tables;
+---------------------+
| Tables_in_pscompany |
+---------------------+
| products            |
| products_suppliers  |
| suppliers           |
+---------------------+
3 rows in set (0.001 sec)

MariaDB [pscompany]> select * from products;
+-----------+-------------+-------------+----------+-------+
| productID | productCode | productName | quantity | price |
+-----------+-------------+-------------+----------+-------+
|      1001 | PEN         | Pen Red     |     5000 |  1.23 |
|      1002 | PEN         | Pen Blue    |     8000 |  1.25 |
|      1004 | PEC         | Pencil 2B   |    10000 |  0.48 |
|      1005 | PEC         | Pencil 2H   |     8000 |  0.49 |
|      1006 | PEC         | Pencil 3B   |      500 |  0.52 |
|      1007 | PEC         | Pencil 4B   |      200 |  0.62 |
|      1008 | PEC         | Pencil 5B   |      100 |  0.73 |
|      1009 | PEC         | Pencil 6B   |      500 |  0.47 |
+-----------+-------------+-------------+----------+-------+
8 rows in set (0.034 sec)

MariaDB [pscompany]> select productName,price from products;
+-------------+-------+
| productName | price |
+-------------+-------+
| Pen Red     |  1.23 |
| Pen Blue    |  1.25 |
| Pencil 2B   |  0.48 |
| Pencil 2H   |  0.49 |
| Pencil 3B   |  0.52 |
| Pencil 4B   |  0.62 |
| Pencil 5B   |  0.73 |
| Pencil 6B   |  0.47 |
+-------------+-------+
8 rows in set (0.000 sec)

MariaDB [pscompany]> select productName ,price from products where productName NOT LIKE 'Pencil%';
+-------------+-------+
| productName | price |
+-------------+-------+
| Pen Red     |  1.23 |
| Pen Blue    |  1.25 |
+-------------+-------+
2 rows in set (0.000 sec)

MariaDB [pscompany]> select productName ,price from products where productName LIKE 'P__%';
+-------------+-------+
| productName | price |
+-------------+-------+
| Pen Red     |  1.23 |
| Pen Blue    |  1.25 |
| Pencil 2B   |  0.48 |
| Pencil 2H   |  0.49 |
| Pencil 3B   |  0.52 |
| Pencil 4B   |  0.62 |
| Pencil 5B   |  0.73 |
| Pencil 6B   |  0.47 |
+-------------+-------+
8 rows in set (0.001 sec)

MariaDB [pscompany]> select quantity, price from products where quantity>=5000 , where price <1.24;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ' where price <1.24' at line 1
MariaDB [pscompany]> select * from products quantity>=5000 AND price <1.24 AND productName LIKE 'Pen%';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '>=5000 AND price <1.24 AND productName LIKE 'Pen%'' at line 1
MariaDB [pscompany]> select * from products where quantity>=5000 AND price <1.24 AND productName LIKE 'Pen%';
+-----------+-------------+-------------+----------+-------+
| productID | productCode | productName | quantity | price |
+-----------+-------------+-------------+----------+-------+
|      1001 | PEN         | Pen Red     |     5000 |  1.23 |
|      1004 | PEC         | Pencil 2B   |    10000 |  0.48 |
|      1005 | PEC         | Pencil 2H   |     8000 |  0.49 |
+-----------+-------------+-------------+----------+-------+
3 rows in set (0.000 sec)

MariaDB [pscompany]> select * from products where price >1.0 AND price <2.0;
+-----------+-------------+-------------+----------+-------+
| productID | productCode | productName | quantity | price |
+-----------+-------------+-------------+----------+-------+
|      1001 | PEN         | Pen Red     |     5000 |  1.23 |
|      1002 | PEN         | Pen Blue    |     8000 |  1.25 |
+-----------+-------------+-------------+----------+-------+
2 rows in set (0.001 sec)

MariaDB [pscompany]> select * from products where price <1.0 AND price >2.0;
Empty set (0.000 sec)

MariaDB [pscompany]> select * from products where price <1.0 or price >2.0;
+-----------+-------------+-------------+----------+-------+
| productID | productCode | productName | quantity | price |
+-----------+-------------+-------------+----------+-------+
|      1004 | PEC         | Pencil 2B   |    10000 |  0.48 |
|      1005 | PEC         | Pencil 2H   |     8000 |  0.49 |
|      1006 | PEC         | Pencil 3B   |      500 |  0.52 |
|      1007 | PEC         | Pencil 4B   |      200 |  0.62 |
|      1008 | PEC         | Pencil 5B   |      100 |  0.73 |
|      1009 | PEC         | Pencil 6B   |      500 |  0.47 |
+-----------+-------------+-------------+----------+-------+
6 rows in set (0.000 sec)

MariaDB [pscompany]> select * from producta where price between 1.0 AND 2.0 AND quantity between 1000 AND 2000;
ERROR 1146 (42S02): Table 'pscompany.producta' doesn't exist
MariaDB [pscompany]> select * from producta where price BETWEEN 1.0 AND 2.0 AND quantity BETWEEN 1000 AND 2000;
ERROR 1146 (42S02): Table 'pscompany.producta' doesn't exist
MariaDB [pscompany]> SELECT *
    -> FROM product
    -> WHERE price BETWEEN 1.0 AND 2.0
    ->   AND quantity BETWEEN 1000 AND 2000;
ERROR 1146 (42S02): Table 'pscompany.product' doesn't exist
MariaDB [pscompany]> select * from producta where price< 1.0 AND price> 2.0 AND quantity < 1000 AND quantity> 2000;
ERROR 1146 (42S02): Table 'pscompany.producta' doesn't exist
MariaDB [pscompany]> select * from producta where price> 1.0 AND price<2.0 AND quantity > 1000 AND quantity> 2000;
ERROR 1146 (42S02): Table 'pscompany.producta' doesn't exist
MariaDB [pscompany]> select productCode, COUNT(*) AS total from products GROUP BY productCode ORDER BY total;
+-------------+-------+
| productCode | total |
+-------------+-------+
| PEN         |     2 |
| PEC         |     6 |
+-------------+-------+
2 rows in set (0.001 sec)

MariaDB [pscompany]> select avg(price) as average_price from products;
+---------------+
| average_price |
+---------------+
|      0.723750 |
+---------------+
1 row in set (0.001 sec)

MariaDB [pscompany]> select sum(quantity) as total_quantity from products;
+----------------+
| total_quantity |
+----------------+
|          32300 |
+----------------+
1 row in set (0.000 sec)

MariaDB [pscompany]> select max(price) as highest_price , min(price) as lowest_price from products
    -> where productName like 'pen%' AND productName like 'pencil%';
+---------------+--------------+
| highest_price | lowest_price |
+---------------+--------------+
|          0.73 |         0.47 |
+---------------+--------------+
1 row in set (0.001 sec)

MariaDB [pscompany]> select max(price) as highest_price , min(price) as lowest_price from products
    -> where productName like 'pen%';
+---------------+--------------+
| highest_price | lowest_price |
+---------------+--------------+
|          1.25 |         0.47 |
+---------------+--------------+
1 row in set (0.000 sec)

MariaDB [pscompany]> update products set price=1.23, quantity=quantity+150
    -> where productName='pen Red';
Query OK, 1 row affected (0.032 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [pscompany]> select * from products;
+-----------+-------------+-------------+----------+-------+
| productID | productCode | productName | quantity | price |
+-----------+-------------+-------------+----------+-------+
|      1001 | PEN         | Pen Red     |     5150 |  1.23 |
|      1002 | PEN         | Pen Blue    |     8000 |  1.25 |
|      1004 | PEC         | Pencil 2B   |    10000 |  0.48 |
|      1005 | PEC         | Pencil 2H   |     8000 |  0.49 |
|      1006 | PEC         | Pencil 3B   |      500 |  0.52 |
|      1007 | PEC         | Pencil 4B   |      200 |  0.62 |
|      1008 | PEC         | Pencil 5B   |      100 |  0.73 |
|      1009 | PEC         | Pencil 6B   |      500 |  0.47 |
+-----------+-------------+-------------+----------+-------+
8 rows in set (0.000 sec)

MariaDB [pscompany]>