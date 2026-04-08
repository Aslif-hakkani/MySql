
MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| ecommerce_db       |
| hostelpro          |
| information_schema |
| mysql              |
| office             |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+
8 rows in set (0.045 sec)

MariaDB [(none)]> create database Assignments;
Query OK, 1 row affected (0.004 sec)

MariaDB [(none)]> use Assignments;
Database changed
MariaDB [Assignments]> create table Department
    -> (
    -> DNum int not null,
    -> DName varchar(50) not null,
    -> StartDate date,
    -> primary key (DNum)
    -> );
Query OK, 0 rows affected (0.008 sec)

MariaDB [Assignments]> describe Department;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| DNum      | int(11)     | NO   | PRI | NULL    |       |
| DName     | varchar(50) | NO   |     | NULL    |       |
| StartDate | date        | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.028 sec)

MariaDB [Assignments]> create table staff
    -> (
    -> Staff_Id int not null,
    -> FName varchar(50) not null,
    -> LName varchar(50) not null,
    -> salary int not null,
    -> DNum int not null,
    -> primary key(Staff_id),
    -> foreign key(DNum) references Department(DNum)
    -> );
Query OK, 0 rows affected (0.028 sec)

MariaDB [Assignments]> create table Units
    -> (
    -> uNum int not null,
    -> UName varchar(30) not null,
    -> DNum int not null,
    -> primary key(uNum),
    -> foreign key(DNum) references Department(DNum)
    -> );
Query OK, 0 rows affected (0.028 sec)

MariaDB [Assignments]> create table Works_on
    -> (
    -> staff_id int not null,
    -> uNum int not null,
    -> Hours double not null,
    -> foreign key(Staff_Id) references Staff(Staff_Id),
    -> foreign key(uNum) references Units(uNum)
    -> );
Query OK, 0 rows affected (0.029 sec)

MariaDB [Assignments]> show tables;
+-----------------------+
| Tables_in_assignments |
+-----------------------+
| department            |
| staff                 |
| units                 |
| works_on              |
+-----------------------+
4 rows in set (0.001 sec)

MariaDB [Assignments]> insert into Department values(5,'Research','1998-05-25');
Query OK, 1 row affected (0.040 sec)

MariaDB [Assignments]> select * from departemnt;
ERROR 1146 (42S02): Table 'assignments.departemnt' doesn't exist
MariaDB [Assignments]> select * from Department;
+------+----------+------------+
| DNum | DName    | StartDate  |
+------+----------+------------+
|    5 | Research | 1998-05-25 |
+------+----------+------------+
1 row in set (0.000 sec)

MariaDB [Assignments]> insert into Department values(4,'Administration','2005-01-01'),(1,'ELTU','1991-06-19');
Query OK, 2 rows affected (0.004 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [Assignments]> select * from Department;
+------+----------------+------------+
| DNum | DName          | StartDate  |
+------+----------------+------------+
|    1 | ELTU           | 1991-06-19 |
|    4 | Administration | 2005-01-01 |
|    5 | Research       | 1998-05-25 |
+------+----------------+------------+
3 rows in set (0.001 sec)

MariaDB [Assignments]> insert into staff values(54321,'Joy','Dilan',250000,5),(54433,'Ramya','Naresh',380000,5),(78899,'Jennifer','Mercy',430000,4),(45678,'Aila','ByeCtrl-C -- exit!


C:\xampp\mysql\bin>mysql -u root -h localhost
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 9
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> use Assignments;
Database changed
MariaDB [Assignments]> insert into Staff values(54321,'Joy','Dilan',250000,5);
Query OK, 1 row affected (0.006 sec)

MariaDB [Assignments]> insert into Staff values(54433,'Ramya','Naresh',380000,5),(78899,'Jennifer','Mercy',430000,4),(45678,'Aila','Shed',250000,4),(48866,'Dinith','Wreck',400000,5),(35435,'Jerrish','Sharan',300000,5);
Query OK, 5 rows affected (0.005 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [Assignments]> select * from staff;
+----------+----------+--------+--------+------+
| Staff_Id | FName    | LName  | salary | DNum |
+----------+----------+--------+--------+------+
|    35435 | Jerrish  | Sharan | 300000 |    5 |
|    45678 | Aila     | Shed   | 250000 |    4 |
|    48866 | Dinith   | Wreck  | 400000 |    5 |
|    54321 | Joy      | Dilan  | 250000 |    5 |
|    54433 | Ramya    | Naresh | 380000 |    5 |
|    78899 | Jennifer | Mercy  | 430000 |    4 |
+----------+----------+--------+--------+------+
6 rows in set (0.000 sec)

MariaDB [Assignments]> insert into units values(1,'Networking',5),(2,'oop',5),(3,'os',5),(10,'Computing',4),(20,'maths',1),(30,'stats',4);
Query OK, 6 rows affected (0.006 sec)
Records: 6  Duplicates: 0  Warnings: 0

MariaDB [Assignments]> select * from units;
+------+------------+------+
| uNum | UName      | DNum |
+------+------------+------+
|    1 | Networking |    5 |
|    2 | oop        |    5 |
|    3 | os         |    5 |
|   10 | Computing  |    4 |
|   20 | maths      |    1 |
|   30 | stats      |    4 |
+------+------------+------+
6 rows in set (0.000 sec)

MariaDB [Assignments]> insert into works_on values(54321,1,35.2),(54321,2,5.7),(48866,3,40.0),(35435,1,20.0);
Query OK, 4 rows affected (0.007 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [Assignments]> select * from Works_on;
+----------+------+-------+
| staff_id | uNum | Hours |
+----------+------+-------+
|    54321 |    1 |  35.2 |
|    54321 |    2 |   5.7 |
|    48866 |    3 |    40 |
|    35435 |    1 |    20 |
+----------+------+-------+
4 rows in set (0.000 sec)

MariaDB [Assignments]> insert into works_on values(35435,2,20.0),(54433,2,10.0),(54433,3,10.0),(54433,10,10.0),(78899,30,30.0);
Query OK, 5 rows affected (0.004 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [Assignments]> select * from Works_on;
+----------+------+-------+
| staff_id | uNum | Hours |
+----------+------+-------+
|    54321 |    1 |  35.2 |
|    54321 |    2 |   5.7 |
|    48866 |    3 |    40 |
|    35435 |    1 |    20 |
|    35435 |    2 |    20 |
|    54433 |    2 |    10 |
|    54433 |    3 |    10 |
|    54433 |   10 |    10 |
|    78899 |   30 |    30 |
+----------+------+-------+
9 rows in set (0.000 sec)

MariaDB [Assignments]> select * from staff order by fname asc;
+----------+----------+--------+--------+------+
| Staff_Id | FName    | LName  | salary | DNum |
+----------+----------+--------+--------+------+
|    45678 | Aila     | Shed   | 250000 |    4 |
|    48866 | Dinith   | Wreck  | 400000 |    5 |
|    78899 | Jennifer | Mercy  | 430000 |    4 |
|    35435 | Jerrish  | Sharan | 300000 |    5 |
|    54321 | Joy      | Dilan  | 250000 |    5 |
|    54433 | Ramya    | Naresh | 380000 |    5 |
+----------+----------+--------+--------+------+
6 rows in set (0.001 sec)

MariaDB [Assignments]> select Staff_Id, avg(Hours) from Works_on group by Staff_Id;
+----------+--------------------+
| Staff_Id | avg(Hours)         |
+----------+--------------------+
|    35435 |                 20 |
|    48866 |                 40 |
|    54321 | 20.450000000000003 |
|    54433 |                 10 |
|    78899 |                 30 |
+----------+--------------------+
5 rows in set (0.001 sec)

MariaDB [Assignments]> select uname,dname from units join Department using(dnum);
+------------+----------------+
| uname      | dname          |
+------------+----------------+
| Networking | Research       |
| oop        | Research       |
| os         | Research       |
| Computing  | Administration |
| maths      | ELTU           |
| stats      | Administration |
+------------+----------------+
6 rows in set (0.001 sec)

MariaDB [Assignments]> select fname from staff like '%a%';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'like '%a%'' at line 1
MariaDB [Assignments]> select * from staff fname like'%a%';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'like'%a%'' at line 1
MariaDB [Assignments]> select * from staff where fname like'%a%';
+----------+-------+--------+--------+------+
| Staff_Id | FName | LName  | salary | DNum |
+----------+-------+--------+--------+------+
|    45678 | Aila  | Shed   | 250000 |    4 |
|    54433 | Ramya | Naresh | 380000 |    5 |
+----------+-------+--------+--------+------+
2 rows in set (0.001 sec)

MariaDB [Assignments]> select concut(fname,' ',lname) from staff;
ERROR 1305 (42000): FUNCTION assignments.concut does not exist
MariaDB [Assignments]> select concat(fname,' ',lname) from staff;
+-------------------------+
| concat(fname,' ',lname) |
+-------------------------+
| Jerrish Sharan          |
| Aila Shed               |
| Dinith Wreck            |
| Joy Dilan               |
| Ramya Naresh            |
| Jennifer Mercy          |
+-------------------------+
6 rows in set (0.001 sec)

MariaDB [Assignments]> select concat(fname,' ',lname) from staff as full_name;
+-------------------------+
| concat(fname,' ',lname) |
+-------------------------+
| Jerrish Sharan          |
| Aila Shed               |
| Dinith Wreck            |
| Joy Dilan               |
| Ramya Naresh            |
| Jennifer Mercy          |
+-------------------------+
6 rows in set (0.000 sec)

MariaDB [Assignments]> select concat(fname,' ',lname) from as full_name staff;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'as full_name staff' at line 1
MariaDB [Assignments]> select concat(fname,' ',lname) as full_name from staff;
+----------------+
| full_name      |
+----------------+
| Jerrish Sharan |
| Aila Shed      |
| Dinith Wreck   |
| Joy Dilan      |
| Ramya Naresh   |
| Jennifer Mercy |
+----------------+
6 rows in set (0.000 sec)

MariaDB [Assignments]> select concat(fname,' ',lname) as full_name from staff where detween 300000 and 500000;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '300000 and 500000' at line 1
MariaDB [Assignments]> select concat(fname,' ',lname) as full_name from staff where between 300000 and 500000;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'between 300000 and 500000' at line 1
MariaDB [Assignments]> select concat(fname,' ',lname) as full_name from staff where salary between 300000 and 500000;
+----------------+
| full_name      |
+----------------+
| Jerrish Sharan |
| Dinith Wreck   |
| Ramya Naresh   |
| Jennifer Mercy |
+----------------+
4 rows in set (0.001 sec)

MariaDB [Assignments]> select concat(fname,' ',lname,'=',salary) as full_name from staff where salary between 300000 and 500000;
+-----------------------+
| full_name             |
+-----------------------+
| Jerrish Sharan=300000 |
| Dinith Wreck=400000   |
| Ramya Naresh=380000   |
| Jennifer Mercy=430000 |
+-----------------------+
4 rows in set (0.001 sec)

MariaDB [Assignments]> select max(salary) from staff;
+-------------+
| max(salary) |
+-------------+
|      430000 |
+-------------+
1 row in set (0.000 sec)

MariaDB [Assignments]> select max(salary) as second-highest-salary from staff where salary < (select max(salary) from staff);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '-highest-salary from staff where salary < (select max(salary) from staff)' at line 1
MariaDB [Assignments]> select max(salary) as second-highest-salary from staff where salary < (select max(salary) from staff);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '-highest-salary from staff where salary < (select max(salary) from staff)' at line 1
MariaDB [Assignments]> select max(salary) as second_highest_salary from staff where salary < (select max(salary) from staff);
+-----------------------+
| second_highest_salary |
+-----------------------+
|                400000 |
+-----------------------+
1 row in set (0.002 sec)

MariaDB [Assignments]> select fname,dname from staff join Department useing(dnum);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(dnum)' at line 1
MariaDB [Assignments]> select fname,dname from staff join Department using(dnum);
+----------+----------------+
| fname    | dname          |
+----------+----------------+
| Jerrish  | Research       |
| Aila     | Administration |
| Dinith   | Research       |
| Joy      | Research       |
| Ramya    | Research       |
| Jennifer | Administration |
+----------+----------------+
6 rows in set (0.003 sec)

MariaDB [Assignments]> select fname,dname from staff join Department using(dnum) where dname='Research';
+---------+----------+
| fname   | dname    |
+---------+----------+
| Jerrish | Research |
| Dinith  | Research |
| Joy     | Research |
| Ramya   | Research |
+---------+----------+
4 rows in set (0.004 sec)

MariaDB [Assignments]> select fname, max(salary) from staff group by dnum;
+---------+-------------+
| fname   | max(salary) |
+---------+-------------+
| Aila    |      430000 |
| Jerrish |      400000 |
+---------+-------------+
2 rows in set (0.001 sec)

MariaDB [Assignments]> select fname max(salary) from staff group by dnum;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'max(salary) from staff group by dnum' at line 1
MariaDB [Assignments]> select fname, max(salary) from staff group by dnum;
+---------+-------------+
| fname   | max(salary) |
+---------+-------------+
| Aila    |      430000 |
| Jerrish |      400000 |
+---------+-------------+
2 rows in set (0.004 sec)

MariaDB [Assignments]> select dnum, max(salary) as highest_Salary from staff group by dnum;
+------+----------------+
| dnum | highest_Salary |
+------+----------------+
|    4 |         430000 |
|    5 |         400000 |
+------+----------------+
2 rows in set (0.001 sec)

MariaDB [Assignments]> select * from staff where order by salary desc;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'order by salary desc' at line 1
MariaDB [Assignments]> select * from staff order by salary desc;
+----------+----------+--------+--------+------+
| Staff_Id | FName    | LName  | salary | DNum |
+----------+----------+--------+--------+------+
|    78899 | Jennifer | Mercy  | 430000 |    4 |
|    48866 | Dinith   | Wreck  | 400000 |    5 |
|    54433 | Ramya    | Naresh | 380000 |    5 |
|    35435 | Jerrish  | Sharan | 300000 |    5 |
|    45678 | Aila     | Shed   | 250000 |    4 |
|    54321 | Joy      | Dilan  | 250000 |    5 |
+----------+----------+--------+--------+------+
6 rows in set (0.001 sec)

MariaDB [Assignments]> select salary from staff order by salary desc;
+--------+
| salary |
+--------+
| 430000 |
| 400000 |
| 380000 |
| 300000 |
| 250000 |
| 250000 |
+--------+
6 rows in set (0.001 sec)

MariaDB [Assignments]> select salary from staff order by salary desc limit=3;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '=3' at line 1
MariaDB [Assignments]> select distinct salary from staff order by salary desc limit=3;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '=3' at line 1
MariaDB [Assignments]> select distinct salary from staff order by salary desc limit 3;
+--------+
| salary |
+--------+
| 430000 |
| 400000 |
| 380000 |
+--------+
3 rows in set (0.001 sec)

MariaDB [Assignments]> select salary from staff order by salary desc limit 3;
+--------+
| salary |
+--------+
| 430000 |
| 400000 |
| 380000 |
+--------+
3 rows in set (0.000 sec)

MariaDB [Assignments]> select salary as first_3_highest_salary from staff order by salary desc limit 3;
+------------------------+
| first_3_highest_salary |
+------------------------+
|                 430000 |
|                 400000 |
|                 380000 |
+------------------------+
3 rows in set (0.001 sec)

MariaDB [Assignments]> select Hours from Works_on order by Hours asc limit 5;
+-------+
| Hours |
+-------+
|   5.7 |
|    10 |
|    10 |
|    10 |
|    20 |
+-------+
5 rows in set (0.001 sec)

MariaDB [Assignments]> select count(*) as staff_count from staff;
+-------------+
| staff_count |
+-------------+
|           6 |
+-------------+
1 row in set (0.001 sec)

MariaDB [Assignments]> select fname,dname from staff join Department using(dnum);
+----------+----------------+
| fname    | dname          |
+----------+----------------+
| Jerrish  | Research       |
| Aila     | Administration |
| Dinith   | Research       |
| Joy      | Research       |
| Ramya    | Research       |
| Jennifer | Administration |
+----------+----------------+
6 rows in set (0.001 sec)

MariaDB [Assignments]> select fname,dname from staff join Department using(dnum) where dname='Administration';
+----------+----------------+
| fname    | dname          |
+----------+----------------+
| Aila     | Administration |
| Jennifer | Administration |
+----------+----------------+
2 rows in set (0.001 sec)

MariaDB [Assignments]> select * from staff dnum=5;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '=5' at line 1
MariaDB [Assignments]> select * from staff where dnum=5;
+----------+---------+--------+--------+------+
| Staff_Id | FName   | LName  | salary | DNum |
+----------+---------+--------+--------+------+
|    35435 | Jerrish | Sharan | 300000 |    5 |
|    48866 | Dinith  | Wreck  | 400000 |    5 |
|    54321 | Joy     | Dilan  | 250000 |    5 |
|    54433 | Ramya   | Naresh | 380000 |    5 |
+----------+---------+--------+--------+------+
4 rows in set (0.001 sec)