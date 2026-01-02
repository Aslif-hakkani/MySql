C:\xampp\mysql\bin>mysql -u root -h localhost

show databases;
use student;

MariaDB [student]> CREATE TABLE tutorial_tb2 (
    ->     tutorial_id INT NOT NULL AUTO_INCREMENT,
    ->     tutorial_title VARCHAR(100) NOT NULL,
    ->     tutorial_author VARCHAR(40) NOT NULL,
    ->     submission_date DATE,
    ->     PRIMARY KEY (tutorial_id)
    -> );
	
	MariaDB [student]> describe tutorial_tb2
    -> ;
+-----------------+--------------+------+-----+---------+----------------+
| Field           | Type         | Null | Key | Default | Extra          |
+-----------------+--------------+------+-----+---------+----------------+
| tutorial_id     | int(11)      | NO   | PRI | NULL    | auto_increment |
| tutorial_title  | varchar(100) | NO   |     | NULL    |                |
| tutorial_author | varchar(40)  | NO   |     | NULL    |                |
| submission_date | date         | YES  |     | NULL    |                |
+-----------------+--------------+------+-----+---------+----------------+
4 rows in set (0.012 sec)

MariaDB [student]> create table marksheet(
    -> Student_id VARCHAR(50) NOT NULL,
    -> Student_Name VARCHAR(50) NOT NULL,
    -> Age INT NOT NULL,
    -> NIC CHAR(12) NOT NULL,
    -> Marks DOUBLE NOT NULL,
    -> Submisson_date DATE,
    -> Primary key (Student_id)
    -> );
Query OK, 0 rows affected (0.143 sec)

MariaDB [student]> describe marksheet
    -> ;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| Student_id     | varchar(50) | NO   | PRI | NULL    |       |
| Student_Name   | varchar(50) | NO   |     | NULL    |       |
| Age            | int(11)     | NO   |     | NULL    |       |
| NIC            | char(12)    | NO   |     | NULL    |       |
| Marks          | double      | NO   |     | NULL    |       |
| Submisson_date | date        | YES  |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
6 rows in set (0.011 sec)

MariaDB [student]> alter table marksheet add column average_marks double not null after marks;
Query OK, 0 rows affected (0.074 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [student]> describe marksheet;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| Student_id     | varchar(50) | NO   | PRI | NULL    |       |
| Student_Name   | varchar(50) | NO   |     | NULL    |       |
| Age            | int(11)     | NO   |     | NULL    |       |
| NIC            | char(12)    | NO   |     | NULL    |       |
| Marks          | double      | NO   |     | NULL    |       |
| average_marks  | double      | NO   |     | NULL    |       |
| Submisson_date | date        | YES  |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
7 rows in set (0.044 sec)


MariaDB [student]> ALTER TABLE tutorial_tb2
    -> add COLUMN totorial_fee DECIMAL (2,1) NOT NULL
    -> AFTER tutorial_author;
Query OK, 0 rows affected (0.105 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [student]> select * from tutorial_tb2
    -> ;
Empty set (0.001 sec)

MariaDB [student]> describe tutorial_tb2
    -> ;
+-----------------+--------------+------+-----+---------+----------------+
| Field           | Type         | Null | Key | Default | Extra          |
+-----------------+--------------+------+-----+---------+----------------+
| tutorial_id     | int(11)      | NO   | PRI | NULL    | auto_increment |
| tutorial_title  | varchar(100) | NO   |     | NULL    |                |
| tutorial_author | varchar(40)  | NO   |     | NULL    |                |
| totorial_fee    | decimal(2,1) | NO   |     | NULL    |                |
| submission_date | date         | YES  |     | NULL    |                |
+-----------------+--------------+------+-----+---------+----------------+
5 rows in set (0.016 sec)



MariaDB [student]> ALTER TABLE tutorial_tb2
    -> MODIFY COLUMN tutorial_title varchar(150) NULL
    -> select * from tutorial_tb2;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'select * from tutorial_tb2' at line 3
MariaDB [student]> ALTER TABLE tutorial_tb2
    -> MODIFY COLUMN tutorial_title varchar(150) NULL;
Query OK, 0 rows affected (0.367 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [student]> select * from tutorial_tb2;
Empty set (0.001 sec)

MariaDB [student]> describe tutorial_tb2;
+-----------------+--------------+------+-----+---------+----------------+
| Field           | Type         | Null | Key | Default | Extra          |
+-----------------+--------------+------+-----+---------+----------------+
| tutorial_id     | int(11)      | NO   | PRI | NULL    | auto_increment |
| tutorial_title  | varchar(150) | YES  |     | NULL    |                |
| tutorial_author | varchar(40)  | NO   |     | NULL    |                |
| totorial_fee    | decimal(2,1) | NO   |     | NULL    |                |
| submission_date | date         | YES  |     | NULL    |                |
+-----------------+--------------+------+-----+---------+----------------+
5 rows in set (0.031 sec)



MariaDB [student]> ALTER TABLE tutorial_tb2 CHANGE COLUMN totorial_fee fee Decimal(2,1) NULL ;
Query OK, 0 rows affected (0.314 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [student]> select * from tutorial_tb2;
Empty set (0.001 sec)

MariaDB [student]> describe tutorial_tb2;
+-----------------+--------------+------+-----+---------+----------------+
| Field           | Type         | Null | Key | Default | Extra          |
+-----------------+--------------+------+-----+---------+----------------+
| tutorial_id     | int(11)      | NO   | PRI | NULL    | auto_increment |
| tutorial_title  | varchar(150) | YES  |     | NULL    |                |
| tutorial_author | varchar(40)  | NO   |     | NULL    |                |
| fee             | decimal(2,1) | YES  |     | NULL    |                |
| submission_date | date         | YES  |     | NULL    |                |
+-----------------+--------------+------+-----+---------+----------------+
5 rows in set (0.015 sec)


MariaDB [student]> ALTER TABLE tutorial_tb2 DROP COLUMN fee;
Query OK, 0 rows affected (0.100 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [student]> select * from tutorial_tb2;
Empty set (0.001 sec)

MariaDB [student]> describe tutorial_tb2;
+-----------------+--------------+------+-----+---------+----------------+
| Field           | Type         | Null | Key | Default | Extra          |
+-----------------+--------------+------+-----+---------+----------------+
| tutorial_id     | int(11)      | NO   | PRI | NULL    | auto_increment |
| tutorial_title  | varchar(150) | YES  |     | NULL    |                |
| tutorial_author | varchar(40)  | NO   |     | NULL    |                |
| submission_date | date         | YES  |     | NULL    |                |
+-----------------+--------------+------+-----+---------+----------------+
4 rows in set (0.016 sec)


// how to add a column
MariaDB [student]> ALTER TABLE marksheet
    -> add COLUMN test_column VARCHAR(50) NOT NULL
    -> after marks ;
Query OK, 0 rows affected (0.136 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [student]> select * from marksheet;
Empty set (0.001 sec)

MariaDB [student]> describe marksheet;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| Student_id     | varchar(50) | NO   | PRI | NULL    |       |
| Student_Name   | varchar(50) | NO   |     | NULL    |       |
| Age            | int(11)     | NO   |     | NULL    |       |
| NIC            | char(12)    | NO   |     | NULL    |       |
| Marks          | double      | NO   |     | NULL    |       |
| test_column    | varchar(50) | NO   |     | NULL    |       |
| average_marks  | double      | NO   |     | NULL    |       |
| Submisson_date | date        | YES  |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
8 rows in set (0.055 sec)


//How to modify a column
MariaDB [student]> ALTER TABLE marksheet
    -> MODIFY COLUMN test_column decimal(2,1) NOT NULL;
Query OK, 0 rows affected (0.538 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [student]> describe marksheet;
+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| Student_id     | varchar(50)  | NO   | PRI | NULL    |       |
| Student_Name   | varchar(50)  | NO   |     | NULL    |       |
| Age            | int(11)      | NO   |     | NULL    |       |
| NIC            | char(12)     | NO   |     | NULL    |       |
| Marks          | double       | NO   |     | NULL    |       |
| test_column    | decimal(2,1) | NO   |     | NULL    |       |
| average_marks  | double       | NO   |     | NULL    |       |
| Submisson_date | date         | YES  |     | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
8 rows in set (0.013 sec)



//How to change a column name
MariaDB [student]> ALTER TABLE marksheet
    -> CHANGE COLUMN test_column test_column_2 decimal(2,1) NOT NULL;
Query OK, 0 rows affected (0.046 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [student]> select * from marksheet;
Empty set (0.001 sec)

MariaDB [student]> describe marksheet;
+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| Student_id     | varchar(50)  | NO   | PRI | NULL    |       |
| Student_Name   | varchar(50)  | NO   |     | NULL    |       |
| Age            | int(11)      | NO   |     | NULL    |       |
| NIC            | char(12)     | NO   |     | NULL    |       |
| Marks          | double       | NO   |     | NULL    |       |
| test_column_2  | decimal(2,1) | NO   |     | NULL    |       |
| average_marks  | double       | NO   |     | NULL    |       |
| Submisson_date | date         | YES  |     | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
8 rows in set (0.034 sec)


//how to remove a column
MariaDB [student]> ALTER TABLE marksheet DROP COLUMN test_column_2;
Query OK, 0 rows affected (0.094 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [student]> select * from marksheet;
Empty set (0.001 sec)

MariaDB [student]> describe marksheet;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| Student_id     | varchar(50) | NO   | PRI | NULL    |       |
| Student_Name   | varchar(50) | NO   |     | NULL    |       |
| Age            | int(11)     | NO   |     | NULL    |       |
| NIC            | char(12)    | NO   |     | NULL    |       |
| Marks          | double      | NO   |     | NULL    |       |
| average_marks  | double      | NO   |     | NULL    |       |
| Submisson_date | date        | YES  |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
7 rows in set (0.040 sec)