C:\xampp\mysql\bin>mysql -u root -h localhost
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> show databases
    -> ;
+--------------------+
| Database           |
+--------------------+
| customers          |
| information_schema |
| lms                |
| mysql              |
| performance_schema |
| phpmyadmin         |
| pscompany          |
| student            |
| student_marks      |
| students           |
| test               |
| users              |
| world              |
+--------------------+
13 rows in set (0.048 sec)

MariaDB [(none)]> use information_schema;
Database changed

MariaDB [information_schema]> use pscompany;
Database changed
MariaDB [pscompany]> show tables;
+---------------------+
| Tables_in_pscompany |
+---------------------+
| country             |
| products            |
| products_suppliers  |
| suppliers           |
+---------------------+
4 rows in set (0.001 sec)

MariaDB [pscompany]> create table staff (
    -> SSN int not null,
    -> FName varchar(30) not null,
    -> LName varchar(30) not null,
    -> salary int not null,
    -> DNum int not null );
Query OK, 0 rows affected (0.129 sec)

MariaDB [pscompany]> describe staff;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| SSN    | int(11)     | NO   |     | NULL    |       |
| FName  | varchar(30) | NO   |     | NULL    |       |
| LName  | varchar(30) | NO   |     | NULL    |       |
| salary | int(11)     | NO   |     | NULL    |       |
| DNum   | int(11)     | NO   |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
5 rows in set (0.066 sec)

MariaDB [pscompany]> insert into staff (SSN,FName,LName,salary,DNum) values ("12345","jerrish","sharan","30000","5"),("33445","Dinth","wreek","40000","5"),("99887","Aila","shed","25000","4");
Query OK, 3 rows affected (0.140 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [pscompany]> select *from staff;
+-------+---------+--------+--------+------+
| SSN   | FName   | LName  | salary | DNum |
+-------+---------+--------+--------+------+
| 12345 | jerrish | sharan |  30000 |    5 |
| 33445 | Dinth   | wreek  |  40000 |    5 |
| 99887 | Aila    | shed   |  25000 |    4 |
+-------+---------+--------+--------+------+
3 rows in set (0.000 sec)

MariaDB [pscompany]> create table Department (
    -> DNum int not null,
    -> DName varchar(30) not null,
    -> startDate Date not null );
Query OK, 0 rows affected (0.220 sec)

MariaDB [pscompany]> describe Department;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| DNum      | int(11)     | NO   |     | NULL    |       |
| DName     | varchar(30) | NO   |     | NULL    |       |
| startDate | date        | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.013 sec)

MariaDB [pscompany]> insert into Department (DNum,DName,startDate) values ("5","research","1999-05-22");
Query OK, 1 row affected (0.044 sec)

MariaDB [pscompany]> insert into Department (DNum,DName,startDate) values ("4","Administration","1995-01-01") , ("1","ELTU","1991-05-19");
Query OK, 2 rows affected (0.067 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [pscompany]> select * from Department;
+------+----------------+------------+
| DNum | DName          | startDate  |
+------+----------------+------------+
|    5 | research       | 1999-05-22 |
|    4 | Administration | 1995-01-01 |
|    1 | ELTU           | 1991-05-19 |
+------+----------------+------------+
3 rows in set (0.001 sec)

MariaDB [pscompany]> select * from staff order by salary ASC;
+-------+---------+--------+--------+------+
| SSN   | FName   | LName  | salary | DNum |
+-------+---------+--------+--------+------+
| 99887 | Aila    | shed   |  25000 |    4 |
| 12345 | jerrish | sharan |  30000 |    5 |
| 33445 | Dinth   | wreek  |  40000 |    5 |
+-------+---------+--------+--------+------+
3 rows in set (0.000 sec)

MariaDB [pscompany]> select * from staff order by LName DESC;
+-------+---------+--------+--------+------+
| SSN   | FName   | LName  | salary | DNum |
+-------+---------+--------+--------+------+
| 33445 | Dinth   | wreek  |  40000 |    5 |
| 99887 | Aila    | shed   |  25000 |    4 |
| 12345 | jerrish | sharan |  30000 |    5 |
+-------+---------+--------+--------+------+
3 rows in set (0.001 sec)

MariaDB [pscompany]> select DNum, Count(*) AS staffCount From staff GROUP BY DNum;
+------+------------+
| DNum | staffCount |
+------+------------+
|    4 |          1 |
|    5 |          2 |
+------+------------+
2 rows in set (0.001 sec)

MariaDB [pscompany]> select DNum, sum(salary) AS TotalSalary From staff GROUP BY DNum;
+------+-------------+
| DNum | TotalSalary |
+------+-------------+
|    4 |       25000 |
|    5 |       70000 |
+------+-------------+
2 rows in set (0.001 sec)

MariaDB [pscompany]> select DNum, Avg(salary) AS AverageSalary from staff GROUP BY DNum;
+------+---------------+
| DNum | AverageSalary |
+------+---------------+
|    4 |    25000.0000 |
|    5 |    35000.0000 |
+------+---------------+
2 rows in set (0.001 sec)

MariaDB [pscompany]> select distinct DNum from staff;
+------+
| DNum |
+------+
|    5 |
|    4 |
+------+
2 rows in set (0.001 sec)

MariaDB [pscompany]> select distinct salary from staff;
+--------+
| salary |
+--------+
|  30000 |
|  40000 |
|  25000 |
+--------+
3 rows in set (0.001 sec)

MariaDB [pscompany]> select * from staff where FName like 'j%';
+-------+---------+--------+--------+------+
| SSN   | FName   | LName  | salary | DNum |
+-------+---------+--------+--------+------+
| 12345 | jerrish | sharan |  30000 |    5 |
+-------+---------+--------+--------+------+
1 row in set (0.001 sec)

MariaDB [pscompany]> select * from staff where salary between 25000 and 40000 ;
+-------+---------+--------+--------+------+
| SSN   | FName   | LName  | salary | DNum |
+-------+---------+--------+--------+------+
| 12345 | jerrish | sharan |  30000 |    5 |
| 33445 | Dinth   | wreek  |  40000 |    5 |
| 99887 | Aila    | shed   |  25000 |    4 |
+-------+---------+--------+--------+------+
3 rows in set (0.001 sec)

MariaDB [pscompany]> select * from staff where salary >35000;
+-------+-------+-------+--------+------+
| SSN   | FName | LName | salary | DNum |
+-------+-------+-------+--------+------+
| 33445 | Dinth | wreek |  40000 |    5 |
+-------+-------+-------+--------+------+
1 row in set (0.001 sec)

MariaDB [pscompany]> select * from staff where DNum =5 ;
+-------+---------+--------+--------+------+
| SSN   | FName   | LName  | salary | DNum |
+-------+---------+--------+--------+------+
| 12345 | jerrish | sharan |  30000 |    5 |
| 33445 | Dinth   | wreek  |  40000 |    5 |
+-------+---------+--------+--------+------+
2 rows in set (0.000 sec)

MariaDB [pscompany]> select * from staff where FName like 'j%';
+-------+---------+--------+--------+------+
| SSN   | FName   | LName  | salary | DNum |
+-------+---------+--------+--------+------+
| 12345 | jerrish | sharan |  30000 |    5 |
+-------+---------+--------+--------+------+
1 row in set (0.001 sec)

MariaDB [pscompany]> select FName,LName from staff;
+---------+--------+
| FName   | LName  |
+---------+--------+
| jerrish | sharan |
| Dinth   | wreek  |
| Aila    | shed   |
+---------+--------+
3 rows in set (0.001 sec)

MariaDB [pscompany]> select concat(FName,' ',LName) as FullName from staff;
+----------------+
| FullName       |
+----------------+
| jerrish sharan |
| Dinth wreek    |
| Aila shed      |
+----------------+
3 rows in set (0.001 sec)

MariaDB [pscompany]> select concat(FName,' ',LName,'-') as staff_datails from staff;
+-----------------+
| staff_datails   |
+-----------------+
| jerrish sharan- |
| Dinth wreek-    |
| Aila shed-      |
+-----------------+
3 rows in set (0.000 sec)

MariaDB [pscompany]> select concat(FName,' ',LName,'-',salary) as staff_datails from staff;
+----------------------+
| staff_datails        |
+----------------------+
| jerrish sharan-30000 |
| Dinth wreek-40000    |
| Aila shed-25000      |
+----------------------+
3 rows in set (0.000 sec)

MariaDB [pscompany]> select * from staff where LName like '%k';
+-------+-------+-------+--------+------+
| SSN   | FName | LName | salary | DNum |
+-------+-------+-------+--------+------+
| 33445 | Dinth | wreek |  40000 |    5 |
+-------+-------+-------+--------+------+
1 row in set (0.001 sec)

MariaDB [pscompany]> select * from staff where DNum in (4,5);
+-------+---------+--------+--------+------+
| SSN   | FName   | LName  | salary | DNum |
+-------+---------+--------+--------+------+
| 12345 | jerrish | sharan |  30000 |    5 |
| 33445 | Dinth   | wreek  |  40000 |    5 |
| 99887 | Aila    | shed   |  25000 |    4 |
+-------+---------+--------+--------+------+
3 rows in set (0.000 sec)

MariaDB [pscompany]> select * from staff order by FName ASC;
+-------+---------+--------+--------+------+
| SSN   | FName   | LName  | salary | DNum |
+-------+---------+--------+--------+------+
| 99887 | Aila    | shed   |  25000 |    4 |
| 33445 | Dinth   | wreek  |  40000 |    5 |
| 12345 | jerrish | sharan |  30000 |    5 |
+-------+---------+--------+--------+------+
3 rows in set (0.000 sec)

MariaDB [pscompany]> select MAX(salary) AS MaximumSalary from staff;
+---------------+
| MaximumSalary |
+---------------+
|         40000 |
+---------------+
1 row in set (0.001 sec)

MariaDB [pscompany]> select MIN(salary) AS MinimumSalary from staff;
+---------------+
| MinimumSalary |
+---------------+
|         25000 |
+---------------+
1 row in set (0.000 sec)

MariaDB [pscompany]> select count(*) from staff where salary >(select AVG(salary) from staff);
+----------+
| count(*) |
+----------+
|        1 |
+----------+
1 row in set (0.001 sec)

MariaDB [pscompany]> select DNum from staff GROUP BY DNum HAVING SUM(salary)>60000;
+------+
| DNum |
+------+
|    5 |
+------+
1 row in set (0.001 sec)

MariaDB [pscompany]> select * from staff where salary not in (25000);
+-------+---------+--------+--------+------+
| SSN   | FName   | LName  | salary | DNum |
+-------+---------+--------+--------+------+
| 12345 | jerrish | sharan |  30000 |    5 |
| 33445 | Dinth   | wreek  |  40000 |    5 |
+-------+---------+--------+--------+------+
2 rows in set (0.001 sec)

MariaDB [pscompany]> select MAX(salary) from staff where salary < (select max(salary) from staff);
+-------------+
| MAX(salary) |
+-------------+
|       30000 |
+-------------+
1 row in set (0.001 sec)

MariaDB [pscompany]> select max(salary) as second_highest_salary from staff where salary<(select max(salary) from staff);
+-----------------------+
| second_highest_salary |
+-----------------------+
|                 30000 |
+-----------------------+
1 row in set (0.001 sec)

MariaDB [pscompany]> select count(*) as staff_count from staff where salary>(select avg(salary) from staff);
+-------------+
| staff_count |
+-------------+
|           1 |
+-------------+
1 row in set (0.001 sec)

MariaDB [pscompany]> select DNum from staff group by Dnum having count(*)>2;
Empty set (0.001 sec)

MariaDB [pscompany]> select DNum from staff group by Dnum having count(*)>=2;
+------+
| DNum |
+------+
|    5 |
+------+
1 row in set (0.000 sec)

MariaDB [pscompany]> select DNum from staff GROUP BY DNum HAVING SUM(salary)>=70000;
+------+
| DNum |
+------+
|    5 |
+------+
1 row in set (0.000 sec)
MariaDB [pscompany]> select * from staff where salary in(select salary from staff group by salary having count(*)>1);
Empty set (0.001 sec)

MariaDB [pscompany]> insert into staff (SSN,FName,LName,salary,DNum) values ("53453","joy","Dilan","25000","5");
Query OK, 1 row affected (0.044 sec)

MariaDB [pscompany]> select * from staff where salary in(select salary from staff group by salary having count(*)>1);
+-------+-------+-------+--------+------+
| SSN   | FName | LName | salary | DNum |
+-------+-------+-------+--------+------+
| 99887 | Aila  | shed  |  25000 |    4 |
| 53453 | joy   | Dilan |  25000 |    5 |
+-------+-------+-------+--------+------+
2 rows in set (0.001 sec)

MariaDB [pscompany]>