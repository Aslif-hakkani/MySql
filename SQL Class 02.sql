MariaDB [customer]> INSERT INTO tutorial_tb2 (tutorial_title,tutorial_author,submission_date)
    -> VALUES("Learn PHP","JOHN", NOW());

MariaDB [customer]> describe tutorial_tb2;
+-----------------+--------------+------+-----+---------+----------------+
| Field           | Type         | Null | Key | Default | Extra          |
+-----------------+--------------+------+-----+---------+----------------+
| tutorial_id     | int(11)      | NO   | PRI | NULL    | auto_increment |
| tutorial_title  | varchar(100) | NO   |     | NULL    |                |
| tutorial_author | varchar(40)  | NO   |     | NULL    |                |
| submission_date | date         | YES  |     | NULL    |                |
+-----------------+--------------+------+-----+---------+----------------+

MariaDB [customer]> select * from tutorial_tb2;
+-------------+----------------+-----------------+-----------------+
| tutorial_id | tutorial_title | tutorial_author | submission_date |
+-------------+----------------+-----------------+-----------------+
|           1 | Learn PHP      | JOHN            | 2026-01-01      |
+-------------+----------------+-----------------+-----------------+

MariaDB [customer]> INSERT INTO tutorial_tb2 (tutorial_title,tutorial_author,submission_date)
    -> VALUES("Learn SQL","CENA", NOW());
Query OK, 1 row affected, 1 warning (0.043 sec)

MariaDB [customer]> INSERT INTO tutorial_tb2 (tutorial_title,tutorial_author,submission_date)
    -> VALUES("Learn java","ROCK", NOW());
Query OK, 1 row affected, 1 warning (0.037 sec)

MariaDB [customer]> select * from tutorial_tb2;
+-------------+----------------+-----------------+-----------------+
| tutorial_id | tutorial_title | tutorial_author | submission_date |
+-------------+----------------+-----------------+-----------------+
|           1 | Learn PHP      | JOHN            | 2026-01-01      |
|           2 | Learn SQL      | CENA            | 2026-01-01      |
|           3 | Learn java     | ROCK            | 2026-01-01      |
+-------------+----------------+-----------------+-----------------+

MariaDB [customer]> create table Customer_db(
    -> Person_Id varchar(20) NOT NULL,
    -> First_Name varchar(20) NOT NULL,
    -> Last_Name varchar(50) NOT NULL,
    -> City varchar(20) NOT NULL,
    -> primary key (Person_Id));
Query OK, 0 rows affected (0.119 sec)

MariaDB [customer]> describe customer_db
    -> ;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| Person_Id  | varchar(20) | NO   | PRI | NULL    |       |
| First_Name | varchar(20) | NO   |     | NULL    |       |
| Last_Name  | varchar(50) | NO   |     | NULL    |       |
| City       | varchar(20) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0.015 sec)

MariaDB [customer]> INSERT INTO customer_db (Person_Id,First_Name,Last_Name,City)
    -> VALUES("P001","Nick", "Wright", "colombo");
Query OK, 1 row affected (0.029 sec)

MariaDB [customer]> INSERT INTO customer_db (Person_Id,First_Name,Last_Name,City)
    -> VALUES("P002","Tom", "Cruse", "London");
Query OK, 1 row affected (0.046 sec)

MariaDB [customer]> INSERT INTO customer_db (Person_Id,First_Name,Last_Name,City)
    -> VALUES("P003","Alex", "Pandiyan", "Madurai");
Query OK, 1 row affected (0.035 sec)

MariaDB [customer]> INSERT INTO customer_db (Person_Id,First_Name,Last_Name,City)
    -> VALUES("P004","Andrew", "Tate", "Los Angels");
Query OK, 1 row affected (0.030 sec)

MariaDB [customer]> INSERT INTO customer_db (Person_Id,First_Name,Last_Name,City)
    -> VALUES("P005","Tom", "Holland", "New York");
Query OK, 1 row affected (0.039 sec)

MariaDB [customer]> select * from customer_db ;
+-----------+------------+-----------+------------+
| Person_Id | First_Name | Last_Name | City       |
+-----------+------------+-----------+------------+
| P001      | Nick       | Wright    | colombo    |
| P002      | Tom        | Cruse     | London     |
| P003      | Alex       | Pandiyan  | Madurai    |
| P004      | Andrew     | Tate      | Los Angels |
| P005      | Tom        | Holland   | New York   |
+-----------+------------+-----------+------------+
5 rows in set (0.001 sec)

MariaDB [personal_db]> create table Personal (
    -> ID int NOT NULL auto_increment,
    -> FirstName varchar(50),
    -> LastName varchar(50),
    -> Position varchar(30),
    -> DEpartment varchar(30),
    -> Salary decimal(10,2),
    -> StartDate date,
    -> EndDate date,
    -> primary key (ID)
    -> );
Query OK, 0 rows affected (0.125 sec)

MariaDB [personal_db]> describe Personal ;
+------------+---------------+------+-----+---------+----------------+
| Field      | Type          | Null | Key | Default | Extra          |
+------------+---------------+------+-----+---------+----------------+
| ID         | int(11)       | NO   | PRI | NULL    | auto_increment |
| FirstName  | varchar(50)   | YES  |     | NULL    |                |
| LastName   | varchar(50)   | YES  |     | NULL    |                |
| Position   | varchar(30)   | YES  |     | NULL    |                |
| DEpartment | varchar(30)   | YES  |     | NULL    |                |
| Salary     | decimal(10,2) | YES  |     | NULL    |                |
| StartDate  | date          | YES  |     | NULL    |                |
| EndDate    | date          | YES  |     | NULL    |                |
+------------+---------------+------+-----+---------+----------------+
8 rows in set (0.014 sec)

 INSERT INTO Personal
    -> (FirstName, LastName, Position, DEpartment, Salary, StartDate, EndDate)
    -> VALUES
    -> ('John', 'Wick', 'Manager', 'Operations', 80000, '2020-01-15', '2022-05-31'),
    -> ('Jennifer' , 'Lawrence', 'Supervisor' , 'Finace', 70000 , '2019-07-01' , '2023-12-31'),
    -> ('Robert' , 'Pattinson', 'Technician' , 'IT Support', 450000 , '2021-01-01' , ''),
    -> ('Emily', 'clark', 'Analst', 'Marcketing', 80000, '2020-09-10', '2022-08-21'),
    -> ('Michel', 'Jackson', 'Developer', 'Technlogy', 55000, '2018-03-05', '2021-06-12'),
    -> ('Jessika', 'Simth', 'Analissit', 'HR', 65000, '2016-03-05', '2021-05-22');
Query OK, 5 rows affected, 1 warning (0.043 sec)
Records: 5  Duplicates: 0  Warnings: 1

  MariaDB [personal_db]> select * from personal ;
+----+-----------+-----------+------------+------------+-----------+------------+------------+
| ID | FirstName | LastName  | Position   | DEpartment | Salary    | StartDate  | EndDate    |
+----+-----------+-----------+------------+------------+-----------+------------+------------+
|  1 | John      | Wick      | Manager    | Operations |  80000.00 | 2020-01-15 | 2022-05-31 |
|  2 | Jennifer  | Lawrence  | Supervisor | Finace     |  70000.00 | 2019-07-01 | 2023-12-31 |
|  3 | Robert    | Pattinson | Technician | IT Support | 450000.00 | 2021-01-01 | 0000-00-00 |
|  4 | Emily     | clark     | Analst     | Marcketing |  80000.00 | 2020-09-10 | 2022-08-21 |
|  5 | Michel    | Jackson   | Developer  | Technlogy  |  55000.00 | 2018-03-05 | 2021-06-12 |
|  6 | Jessika   | Simth     | Analissit  | HR         |  65000.00 | 2016-03-05 | 2021-05-22 |
+----+-----------+-----------+------------+------------+-----------+------------+------------+
6 rows in set (0.001 sec)


######  // how to edit a content of a column ####################

MariaDB [personal_db]> update personal set Position="Assistent" where ID=6;
Query OK, 1 row affected (0.048 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [personal_db]> select * from personal ;
+----+-----------+-----------+------------+------------+-----------+------------+------------+
| ID | FirstName | LastName  | Position   | DEpartment | Salary    | StartDate  | EndDate    |
+----+-----------+-----------+------------+------------+-----------+------------+------------+
|  1 | John      | Wick      | Manager    | Operations |  80000.00 | 2020-01-15 | 2022-05-31 |
|  2 | Jennifer  | Lawrence  | Supervisor | Finace     |  70000.00 | 2019-07-01 | 2023-12-31 |
|  3 | Robert    | Pattinson | Technician | IT Support | 450000.00 | 2021-01-01 | 0000-00-00 |
|  4 | Emily     | clark     | Analst     | Marcketing |  80000.00 | 2020-09-10 | 2022-08-21 |
|  5 | Michel    | Jackson   | Developer  | Technlogy  |  55000.00 | 2018-03-05 | 2021-06-12 |
|  6 | Jessika   | Simth     | Assistent  | HR         |  65000.00 | 2016-03-05 | 2021-05-22 |
+----+-----------+-----------+------------+------------+-----------+------------+------------+
6 rows in set (0.000 sec)

############///////////select who are getting salary more than 70k///////#####################

MariaDB [personal_db]> select * from personal where Salary>70000 ;
+----+-----------+-----------+------------+------------+-----------+------------+------------+
| ID | FirstName | LastName  | Position   | DEpartment | Salary    | StartDate  | EndDate    |
+----+-----------+-----------+------------+------------+-----------+------------+------------+
|  1 | John      | Wick      | Manager    | Operations |  80000.00 | 2020-01-15 | 2022-05-31 |
|  3 | Robert    | Pattinson | Technician | IT Support | 450000.00 | 2021-01-01 | 0000-00-00 |
|  4 | Emily     | clark     | Analst     | Marcketing |  80000.00 | 2020-09-10 | 2022-08-21 |
+----+-----------+-----------+------------+------------+-----------+------------+------------+
3 rows in set (0.001 sec)

MariaDB [personal_db]> select * from personal where StartDate >'2020-07-12' ;
+----+-----------+-----------+------------+------------+-----------+------------+------------+
| ID | FirstName | LastName  | Position   | DEpartment | Salary    | StartDate  | EndDate    |
+----+-----------+-----------+------------+------------+-----------+------------+------------+
|  3 | Robert    | Pattinson | Technician | IT Support | 450000.00 | 2021-01-01 | 0000-00-00 |
|  4 | Emily     | clark     | Analst     | Marcketing |  80000.00 | 2020-09-10 | 2022-08-21 |
+----+-----------+-----------+------------+------------+-----------+------------+------------+
2 rows in set (0.001 sec)

#############################SELECT###########################################################
MariaDB [personal_db]> select * from personal limit 2 offset 5 ;
+----+-----------+----------+-----------+------------+----------+------------+------------+
| ID | FirstName | LastName | Position  | DEpartment | Salary   | StartDate  | EndDate    |
+----+-----------+----------+-----------+------------+----------+------------+------------+
|  6 | Jessika   | Simth    | Assistent | HR         | 65000.00 | 2016-03-05 | 2021-05-22 |
+----+-----------+----------+-----------+------------+----------+------------+------------+
1 row in set (0.001 sec)

MariaDB [personal_db]> select * from personal limit 1 offset 3 ;
+----+-----------+----------+----------+------------+----------+------------+------------+
| ID | FirstName | LastName | Position | DEpartment | Salary   | StartDate  | EndDate    |
+----+-----------+----------+----------+------------+----------+------------+------------+
|  4 | Emily     | clark    | Analst   | Marcketing | 80000.00 | 2020-09-10 | 2022-08-21 |
+----+-----------+----------+----------+------------+----------+------------+------------+
1 row in set (0.001 sec)

MariaDB [personal_db]> select * from personal limit 1 offset 4 ;
+----+-----------+----------+-----------+------------+----------+------------+------------+
| ID | FirstName | LastName | Position  | DEpartment | Salary   | StartDate  | EndDate    |
+----+-----------+----------+-----------+------------+----------+------------+------------+
|  5 | Michel    | Jackson  | Developer | Technlogy  | 55000.00 | 2018-03-05 | 2021-06-12 |
+----+-----------+----------+-----------+------------+----------+------------+------------+
1 row in set (0.000 sec)

MariaDB [personal_db]> select * from personal limit 2 offset 4 ;
+----+-----------+----------+-----------+------------+----------+------------+------------+
| ID | FirstName | LastName | Position  | DEpartment | Salary   | StartDate  | EndDate    |
+----+-----------+----------+-----------+------------+----------+------------+------------+
|  5 | Michel    | Jackson  | Developer | Technlogy  | 55000.00 | 2018-03-05 | 2021-06-12 |
|  6 | Jessika   | Simth    | Assistent | HR         | 65000.00 | 2016-03-05 | 2021-05-22 |
+----+-----------+----------+-----------+------------+----------+------------+------------+
2 rows in set (0.000 sec)

MariaDB [personal_db]> select * from personal limit 3 offset 1 ;
+----+-----------+-----------+------------+------------+-----------+------------+------------+
| ID | FirstName | LastName  | Position   | DEpartment | Salary    | StartDate  | EndDate    |
+----+-----------+-----------+------------+------------+-----------+------------+------------+
|  2 | Jennifer  | Lawrence  | Supervisor | Finace     |  70000.00 | 2019-07-01 | 2023-12-31 |
|  3 | Robert    | Pattinson | Technician | IT Support | 450000.00 | 2021-01-01 | 0000-00-00 |
|  4 | Emily     | clark     | Analst     | Marcketing |  80000.00 | 2020-09-10 | 2022-08-21 |
+----+-----------+-----------+------------+------------+-----------+------------+------------+
3 rows in set (0.000 sec)

######################COUNT####################################
MariaDB [personal_db]> select count(ID) from Personal;
+-----------+
| count(ID) |
+-----------+
|         6 |
+-----------+
1 row in set (0.001 sec)

########################################Activity###########################################
MariaDB [personal_db]> create database PSCompany ;
Query OK, 1 row affected (0.002 sec)

MariaDB [personal_db]> use PScompany ;
Database changed
MariaDB [PScompany]> create table Products (
    -> ProductId int not null ,
    -> ProductCode char(3) not null,
    -> Name varchar(30) not null,
    -> quantity int not null,
    -> Price decimal(10,2)
    -> );
Query OK, 0 rows affected (0.134 sec)

MariaDB [PScompany]> describe products
    -> ;
+-------------+---------------+------+-----+---------+-------+
| Field       | Type          | Null | Key | Default | Extra |
+-------------+---------------+------+-----+---------+-------+
| ProductId   | int(11)       | NO   |     | NULL    |       |
| ProductCode | char(3)       | NO   |     | NULL    |       |
| Name        | varchar(30)   | NO   |     | NULL    |       |
| quantity    | int(11)       | NO   |     | NULL    |       |
| Price       | decimal(10,2) | YES  |     | NULL    |       |
+-------------+---------------+------+-----+---------+-------+
5 rows in set (0.018 sec)

MariaDB [PScompany]> insert into products (ProductId , ProductCode , Name , Quantity,  price )
    -> values
    -> (1001, 'PEN' , "PEN RED" , 5000 , 1.23),
    -> (1002, 'PEN' , "PEN Blue" , 8000 , 1.25),
    -> (1003, 'PEN' , "PEN Black" , 2000 , 1.25),
    -> (1004, 'PEC' , "PEN Black" , 2000 , 1.25),
