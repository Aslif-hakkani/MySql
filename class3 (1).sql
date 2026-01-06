Microsoft Windows [Version 10.0.19045.5737]
(c) Microsoft Corporation. All rights reserved.

C:\xampp\mysql\bin>mysql -u root -h localhost
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| customer           |
| information_schema |
| mysql              |
| performance_schema |
| personnel_db       |
| phpmyadmin         |
| student            |
| test               |
+--------------------+
8 rows in set (0.016 sec)

MariaDB [(none)]> use student;
Database changed
MariaDB [student]> create table student derails(
    -> student_id INT NOT NULL AUTO_INCREMENT,
    -> Bye
Ctrl-C -- exit!

C:\xampp\mysql\bin>mysql -u root -h localhost
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 9
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> use student;
Database changed
MariaDB [student]> create table users(
    -> user_id int not null AUTO_INCREMENT,
    -> email VARCHAR(50) NOT NULL,
    -> create_at timestamp NOT NULL,
    -> PRIMARY KEY(user_id)
    -> );
Query OK, 0 rows affected (0.140 sec)

MariaDB [student]> describe users;
+-----------+-------------+------+-----+---------------------+-------------------------------+
| Field     | Type        | Null | Key | Default             | Extra                         |
+-----------+-------------+------+-----+---------------------+-------------------------------+
| user_id   | int(11)     | NO   | PRI | NULL                | auto_increment                |
| email     | varchar(50) | NO   |     | NULL                |                               |
| create_at | timestamp   | NO   |     | current_timestamp() | on update current_timestamp() |
+-----------+-------------+------+-----+---------------------+-------------------------------+
3 rows in set (0.055 sec)

MariaDB [student]> create table orders(
    -> order_id int not null AUTO_INCREMENT,
    -> user_id int not null,
    -> foreign key(user_id) REFERENCES users(user_id),
    -> primary key(order_id));
Query OK, 0 rows affected (0.190 sec)

MariaDB [student]> describe orders;
+----------+---------+------+-----+---------+----------------+
| Field    | Type    | Null | Key | Default | Extra          |
+----------+---------+------+-----+---------+----------------+
| order_id | int(11) | NO   | PRI | NULL    | auto_increment |
| user_id  | int(11) | NO   | MUL | NULL    |                |
+----------+---------+------+-----+---------+----------------+
2 rows in set (0.012 sec)

MariaDB [student]> create table students_table(
    -> id int not null AUTO_INCREMENT,
    -> name VARCHAR(50) NOT NULL,
    -> course VARCHAR(30) NOT NULL,
    -> PRIMARY KEY(id));
Query OK, 0 rows affected (0.161 sec)

MariaDB [student]> describe students_table;
+--------+-------------+------+-----+---------+----------------+
| Field  | Type        | Null | Key | Default | Extra          |
+--------+-------------+------+-----+---------+----------------+
| id     | int(11)     | NO   | PRI | NULL    | auto_increment |
| name   | varchar(50) | NO   |     | NULL    |                |
| course | varchar(30) | NO   |     | NULL    |                |
+--------+-------------+------+-----+---------+----------------+
3 rows in set (0.011 sec)

MariaDB [student]> create table students_marks(
    -> id int not null,
    -> marks int not null,
    -> foreign key(id) REFERENCES students_table(id));
Query OK, 0 rows affected (0.193 sec)

MariaDB [student]> describe students_marks;
+-------+---------+------+-----+---------+-------+
| Field | Type    | Null | Key | Default | Extra |
+-------+---------+------+-----+---------+-------+
| id    | int(11) | NO   | MUL | NULL    |       |
| marks | int(11) | NO   |     | NULL    |       |
+-------+---------+------+-----+---------+-------+
2 rows in set (0.012 sec)


MariaDB [student]> INSERT INTO students_table(id,name,course) VALUES("2043","TOM","JAVA");
Query OK, 1 row affected (0.092 sec)

MariaDB [student]> INSERT INTO students_table(id,name,course) VALUES("2013","JERRY","C++");
Query OK, 1 row affected (0.071 sec)

MariaDB [student]> INSERT INTO students_table(id,name,course) VALUES("2054","AS","MS");
Query OK, 1 row affected (0.057 sec)

MariaDB [student]> select*from students_marks;
Empty set (0.000 sec)

MariaDB [student]> select*from students_table;
+------+-------+--------+
| id   | name  | course |
+------+-------+--------+
| 2013 | JERRY | C++    |
| 2043 | TOM   | JAVA   |
| 2054 | AS    | MS     |
+------+-------+--------+
3 rows in set (0.000 sec)


MariaDB [student]> show tables;
+-------------------+
| Tables_in_student |
+-------------------+
| orders            |
| students_marks    |
| students_table    |
| tutorial          |
| users             |
+-------------------+
5 rows in set (0.001 sec)

MariaDB [student]> select * from tutorial;
+-------------+----------------+-----------------+-----------------+
| tutorial_id | tutorial_title | tutorial_author | submission_data |
+-------------+----------------+-----------------+-----------------+
|           1 | Learn PHP      | Aslif           | 2025-12-22      |
|           2 | Learn MY SQL   | shikar          | 2025-12-22      |
|           3 | Learn java     | Arkam           | 2025-12-22      |
|           4 | Learn MY SQL   | shikar          | 0000-00-00      |
|           5 | Learn java     | Arkam           | 2019-10-12      |
+-------------+----------------+-----------------+-----------------+
5 rows in set (0.041 sec)


MariaDB [student]> update tutorial set tutorial_author="hakkani" where tutorial_id=1;
Query OK, 1 row affected (0.059 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [student]> select * from tutorial;
+-------------+----------------+-----------------+-----------------+
| tutorial_id | tutorial_title | tutorial_author | submission_data |
+-------------+----------------+-----------------+-----------------+
|           1 | Learn PHP      | hakkani         | 2025-12-22      |
|           2 | Learn MY SQL   | shikar          | 2025-12-22      |
|           3 | Learn java     | Arkam           | 2025-12-22      |
|           4 | Learn MY SQL   | shikar          | 0000-00-00      |
|           5 | Learn java     | Arkam           | 2019-10-12      |
+-------------+----------------+-----------------+-----------------+
5 rows in set (0.000 sec)


MariaDB [student]> update tutorial set tutorial_title="PHP" where tutorial_author="shikar";
Query OK, 2 rows affected (0.050 sec)
Rows matched: 2  Changed: 2  Warnings: 0

MariaDB [student]> select * from tutorial;
+-------------+----------------+-----------------+-----------------+
| tutorial_id | tutorial_title | tutorial_author | submission_data |
+-------------+----------------+-----------------+-----------------+
|           1 | Learn PHP      | hakkani         | 2025-12-22      |
|           2 | PHP            | shikar          | 2025-12-22      |
|           3 | Learn java     | Arkam           | 2025-12-22      |
|           4 | PHP            | shikar          | 0000-00-00      |
|           5 | Learn java     | Arkam           | 2019-10-12      |
+-------------+----------------+-----------------+-----------------+
5 rows in set (0.000 sec)

MariaDB [student]> delete from tutorial where tutorial_id=4;
Query OK, 1 row affected (0.052 sec)

MariaDB [student]> select * from tutorial;
+-------------+----------------+-----------------+-----------------+
| tutorial_id | tutorial_title | tutorial_author | submission_data |
+-------------+----------------+-----------------+-----------------+
|           1 | Learn PHP      | hakkani         | 2025-12-22      |
|           2 | PHP            | shikar          | 2025-12-22      |
|           3 | Learn java     | Arkam           | 2025-12-22      |
|           5 | Learn java     | Arkam           | 2019-10-12      |
+-------------+----------------+-----------------+-----------------+
4 rows in set (0.000 sec)

MariaDB [student]> select tutorial_id,tutorial_title,tutorial_author from tutorial;
+-------------+----------------+-----------------+
| tutorial_id | tutorial_title | tutorial_author |
+-------------+----------------+-----------------+
|           1 | Learn PHP      | hakkani         |
|           2 | PHP            | shikar          |
|           3 | Learn java     | Arkam           |
|           5 | Learn java     | Arkam           |
+-------------+----------------+-----------------+
4 rows in set (0.000 sec)

MariaDB [student]> select tutorial_title,tutorial_author from tutorial;
+----------------+-----------------+
| tutorial_title | tutorial_author |
+----------------+-----------------+
| Learn PHP      | hakkani         |
| PHP            | shikar          |
| Learn java     | Arkam           |
| Learn java     | Arkam           |
+----------------+-----------------+
4 rows in set (0.000 sec)

MariaDB [student]> select tutorial_author,submission_data  from tutorial;
+-----------------+-----------------+
| tutorial_author | submission_data |
+-----------------+-----------------+
| hakkani         | 2025-12-22      |
| shikar          | 2025-12-22      |
| Arkam           | 2025-12-22      |
| Arkam           | 2019-10-12      |
+-----------------+-----------------+
4 rows in set (0.000 sec)

MariaDB [student]> show tables;
+-------------------+
| Tables_in_student |
+-------------------+
| orders            |
| students_marks    |
| students_table    |
| tutorial          |
| users             |
+-------------------+
5 rows in set (0.001 sec)


MariaDB [student]> select*from students_table;
+------+-------+--------+
| id   | name  | course |
+------+-------+--------+
| 2013 | JERRY | C++    |
| 2043 | TOM   | JAVA   |
| 2054 | AS    | MS     |
+------+-------+--------+
3 rows in set (0.000 sec)

MariaDB [student]> describe students_marks;
+-------+---------+------+-----+---------+-------+
| Field | Type    | Null | Key | Default | Extra |
+-------+---------+------+-----+---------+-------+
| id    | int(11) | NO   | MUL | NULL    |       |
| marks | int(11) | NO   |     | NULL    |       |
+-------+---------+------+-----+---------+-------+
2 rows in set (0.013 sec)

MariaDB [student]> INSERT INTO students_marks(id,marks) VALUES("2013","68");
Query OK, 1 row affected (0.043 sec)

MariaDB [student]> INSERT INTO students_marks(id,marks) VALUES("2043","84");
Query OK, 1 row affected (0.078 sec)

MariaDB [student]> INSERT INTO students_marks(id,marks) VALUES("2043","84");
Query OK, 1 row affected (0.052 sec)

MariaDB [student]> INSERT INTO students_marks(id,marks) VALUES("2043","84"),("2054","54");
Query OK, 2 rows affected (0.079 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [student]> select * from students_marks;
+------+-------+
| id   | marks |
+------+-------+
| 2013 |    68 |
| 2043 |    84 |
| 2043 |    84 |
| 2043 |    84 |
| 2054 |    54 |
+------+-------+
5 rows in set (0.000 sec)

MariaDB [student]> delete from students_marks where id="2013";
Query OK, 1 row affected (0.050 sec)

MariaDB [student]> select * from students_marks;
+------+-------+
| id   | marks |
+------+-------+
| 2043 |    84 |
| 2043 |    84 |
| 2043 |    84 |
| 2054 |    54 |
+------+-------+
4 rows in set (0.000 sec)

MariaDB [student]> select * from students_table;
+------+-------+--------+
| id   | name  | course |
+------+-------+--------+
| 2013 | JERRY | C++    |
| 2043 | TOM   | JAVA   |
| 2054 | AS    | MS     |
+------+-------+--------+
3 rows in set (0.000 sec)


MariaDB [student]> delete from students_table where id="2013";
Query OK, 1 row affected (0.044 sec)

MariaDB [student]> select * from students_table;
+------+------+--------+
| id   | name | course |
+------+------+--------+
| 2043 | TOM  | JAVA   |
| 2054 | AS   | MS     |
+------+------+--------+
2 rows in set (0.000 sec)

MariaDB [student]> select * from tutorial;
+-------------+----------------+-----------------+-----------------+
| tutorial_id | tutorial_title | tutorial_author | submission_data |
+-------------+----------------+-----------------+-----------------+
|           1 | Learn PHP      | hakkani         | 2025-12-22      |
|           2 | PHP            | shikar          | 2025-12-22      |
|           3 | Learn java     | Arkam           | 2025-12-22      |
|           5 | Learn java     | Arkam           | 2019-10-12      |
+-------------+----------------+-----------------+-----------------+
4 rows in set (0.000 sec)

MariaDB [student]> select * from tutorial where tutorial_author="Arkam";
+-------------+----------------+-----------------+-----------------+
| tutorial_id | tutorial_title | tutorial_author | submission_data |
+-------------+----------------+-----------------+-----------------+
|           3 | Learn java     | Arkam           | 2025-12-22      |
|           5 | Learn java     | Arkam           | 2019-10-12      |
+-------------+----------------+-----------------+-----------------+
2 rows in set (0.000 sec)

MariaDB [student]> show databases;
+--------------------+
| Database           |
+--------------------+
| customer           |
| information_schema |
| mysql              |
| performance_schema |
| personnel_db       |
| phpmyadmin         |
| student            |
| test               |
+--------------------+
8 rows in set (0.001 sec)


MariaDB [student]> create database PSCompany;
Query OK, 1 row affected (0.001 sec)

MariaDB [student]> use PSCompany;
Database changed
MariaDB [PSCompany]> create table products(
    -> product_id int not null,
    -> product_code VARCHAR(20) NOT,NULL,
    -> NAME VARCHAR(50) NOT Bye
Ctrl-C -- exit!

C:\xampp\mysql\bin>mysql -u root -h localhost
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 10
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> use PSCompany;
Database changed
MariaDB [PSCompany]> create table products(
    -> product_id int not null,
    -> product_code CHAR(3) not null,
    -> name VARCHAR(50) NOT NULL,
    -> quantity int not null,
    -> price decimal not null,
    -> PRIMARY KEY(product_id));
Query OK, 0 rows affected (0.157 sec)

MariaDB [PSCompany]> describe products;
+--------------+---------------+------+-----+---------+-------+
| Field        | Type          | Null | Key | Default | Extra |
+--------------+---------------+------+-----+---------+-------+
| product_id   | int(11)       | NO   | PRI | NULL    |       |
| product_code | char(3)       | NO   |     | NULL    |       |
| name         | varchar(50)   | NO   |     | NULL    |       |
| quantity     | int(11)       | NO   |     | NULL    |       |
| price        | decimal(10,0) | NO   |     | NULL    |       |
+--------------+---------------+------+-----+---------+-------+
5 rows in set (0.013 sec)

MariaDB [PSCompany]> insert into products (product_id,product_code,name,quantity,price) values (1001,"PEN","Pen red",5000,1.23);
Query OK, 1 row affected, 1 warning (0.047 sec)

MariaDB [PSCompany]> insert into products (product_id,product_code,name,quantity,price) values (1002,"PEN","Pen Blue",8000,1.25) , (1003,"PEN","Pen Black",2000,1.26);
Query OK, 2 rows affected, 2 warnings (0.087 sec)
Records: 2  Duplicates: 0  Warnings: 2

MariaDB [PSCompany]> select * from products;
+------------+--------------+-----------+----------+-------+
| product_id | product_code | name      | quantity | price |
+------------+--------------+-----------+----------+-------+
|       1001 | PEN          | Pen red   |     5000 |     1 |
|       1002 | PEN          | Pen Blue  |     8000 |     1 |
|       1003 | PEN          | Pen Black |     2000 |     1 |
+------------+--------------+-----------+----------+-------+
3 rows in set (0.000 sec)

MariaDB [PSCompany]> alter table products MODIFY COLUMN price decimal(10,2) NULL;
Query OK, 3 rows affected (1.463 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [PSCompany]> select * from products;
+------------+--------------+-----------+----------+-------+
| product_id | product_code | name      | quantity | price |
+------------+--------------+-----------+----------+-------+
|       1001 | PEN          | Pen red   |     5000 |  1.00 |
|       1002 | PEN          | Pen Blue  |     8000 |  1.00 |
|       1003 | PEN          | Pen Black |     2000 |  1.00 |
+------------+--------------+-----------+----------+-------+
3 rows in set (0.001 sec)

MariaDB [PSCompany]> insert into products (product_id,product_code,name,quantity,price) values (1004,"PEN","Pen Blue",8000,"1.25") , (1005,"PEN","Pen Black",2000,"1.26");
Query OK, 2 rows affected (0.042 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [PSCompany]> select * from products;
+------------+--------------+-----------+----------+-------+
| product_id | product_code | name      | quantity | price |
+------------+--------------+-----------+----------+-------+
|       1001 | PEN          | Pen red   |     5000 |  1.00 |
|       1002 | PEN          | Pen Blue  |     8000 |  1.00 |
|       1003 | PEN          | Pen Black |     2000 |  1.00 |
|       1004 | PEN          | Pen Blue  |     8000 |  1.25 |
|       1005 | PEN          | Pen Black |     2000 |  1.26 |
+------------+--------------+-----------+----------+-------+
5 rows in set (0.000 sec)

MariaDB [PSCompany]> insert into products (product_id,product_code,name,quantity,price) values (2002,"PEC","Pencil 2H",8000,"0.45") , (2003,"PEC","Pebcil 3B",5000,"0.52"),(2001,"PEC","Pencil 2B",10000,"0.75")
    -> ;
Query OK, 3 rows affected (0.044 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [PSCompany]> select * from products;
+------------+--------------+-----------+----------+-------+
| product_id | product_code | name      | quantity | price |
+------------+--------------+-----------+----------+-------+
|       1001 | PEN          | Pen red   |     5000 |  1.00 |
|       1002 | PEN          | Pen Blue  |     8000 |  1.00 |
|       1003 | PEN          | Pen Black |     2000 |  1.00 |
|       1004 | PEN          | Pen Blue  |     8000 |  1.25 |
|       1005 | PEN          | Pen Black |     2000 |  1.26 |
|       2001 | PEC          | Pencil 2B |    10000 |  0.75 |
|       2002 | PEC          | Pencil 2H |     8000 |  0.45 |
|       2003 | PEC          | Pebcil 3B |     5000 |  0.52 |
+------------+--------------+-----------+----------+-------+
8 rows in set (0.000 sec)

MariaDB [PSCompany]> select product_id,name,quantity from products;
+------------+-----------+----------+
| product_id | name      | quantity |
+------------+-----------+----------+
|       1001 | Pen red   |     5000 |
|       1002 | Pen Blue  |     8000 |
|       1003 | Pen Black |     2000 |
|       1004 | Pen Blue  |     8000 |
|       1005 | Pen Black |     2000 |
|       2001 | Pencil 2B |    10000 |
|       2002 | Pencil 2H |     8000 |
|       2003 | Pebcil 3B |     5000 |
+------------+-----------+----------+
8 rows in set (0.000 sec)

MariaDB [PSCompany]> select * from products where quantity=5000;
+------------+--------------+-----------+----------+-------+
| product_id | product_code | name      | quantity | price |
+------------+--------------+-----------+----------+-------+
|       1001 | PEN          | Pen red   |     5000 |  1.00 |
|       2003 | PEC          | Pebcil 3B |     5000 |  0.52 |
+------------+--------------+-----------+----------+-------+
2 rows in set (0.000 sec)

MariaDB [PSCompany]> select count(product_id) from products;
+-------------------+
| count(product_id) |
+-------------------+
|                 8 |
+-------------------+
1 row in set (0.001 sec)


MariaDB [PSCompany]>