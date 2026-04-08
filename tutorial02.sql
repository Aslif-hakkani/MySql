MariaDB [(none)]> create database office;


MariaDB [(none)]> use office;

MariaDB [office]> create table Department
    -> (
    -> DNum int not  null,
    -> DName varchar(50) not null,
    -> StartDate date,
    -> primary key (DNum) );


MariaDB [office]> describe Department;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| DNum      | int(11)     | NO   | PRI | NULL    |       |
| DName     | varchar(50) | NO   |     | NULL    |       |
| StartDate | date        | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+


MariaDB [office]> insert into department values (5,'Research','1988-05-22'),(4,'Administration','1995-01-01'),(1,'ELTU','1981-06-19');


MariaDB [office]> select * from department;
+------+----------------+------------+
| DNum | DName          | StartDate  |
+------+----------------+------------+
|    1 | ELTU           | 1981-06-19 |
|    4 | Administration | 1995-01-01 |
|    5 | Research       | 1988-05-22 |
+------+----------------+------------+


MariaDB [office]> create table staff
    -> (
    -> ssn int not null,
    -> fname varchar(50) not null,
    -> lname varchar(50) not null,
    -> salary int not null,
    -> dnum int not null,
    -> primary key(ssn),
    -> foreign key(dnum) references department (dnum)
    -> );


MariaDB [office]> insert into staff values (12345,'Jerrish','Sharan',30000,5);

MariaDB [office]> insert into staff values (33445,'Dinith','Wreck','40000',5),(99887,'Aila','Shed',25000,4),(87654,'Jennifer','Mercy',43000,4),(66884,'Ramya','Naresh',38000,5),(53453,'Joy','Dilan',25000,5);


MariaDB [office]> select * from staff;
+-------+----------+--------+--------+------+
| ssn   | fname    | lname  | salary | dnum |
+-------+----------+--------+--------+------+
| 12345 | Jerrish  | Sharan |  30000 |    5 |
| 33445 | Dinith   | Wreck  |  40000 |    5 |
| 53453 | Joy      | Dilan  |  25000 |    5 |
| 66884 | Ramya    | Naresh |  38000 |    5 |
| 87654 | Jennifer | Mercy  |  43000 |    4 |
| 99887 | Aila     | Shed   |  25000 |    4 |
+-------+----------+--------+--------+------+


MariaDB [office]> select * from department;
+------+----------------+------------+
| DNum | DName          | StartDate  |
+------+----------------+------------+
|    1 | ELTU           | 1981-06-19 |
|    4 | Administration | 1995-01-01 |
|    5 | Research       | 1988-05-22 |
+------+----------------+------------+


MariaDB [office]> select * from staff order by salary asc;
+-------+----------+--------+--------+------+
| ssn   | fname    | lname  | salary | dnum |
+-------+----------+--------+--------+------+
| 53453 | Joy      | Dilan  |  25000 |    5 |
| 99887 | Aila     | Shed   |  25000 |    4 |
| 12345 | Jerrish  | Sharan |  30000 |    5 |
| 66884 | Ramya    | Naresh |  38000 |    5 |
| 33445 | Dinith   | Wreck  |  40000 |    5 |
| 87654 | Jennifer | Mercy  |  43000 |    4 |
+-------+----------+--------+--------+------+


MariaDB [office]> select * from staff order by lname asc;
+-------+----------+--------+--------+------+
| ssn   | fname    | lname  | salary | dnum |
+-------+----------+--------+--------+------+
| 53453 | Joy      | Dilan  |  25000 |    5 |
| 87654 | Jennifer | Mercy  |  43000 |    4 |
| 66884 | Ramya    | Naresh |  38000 |    5 |
| 12345 | Jerrish  | Sharan |  30000 |    5 |
| 99887 | Aila     | Shed   |  25000 |    4 |
| 33445 | Dinith   | Wreck  |  40000 |    5 |
+-------+----------+--------+--------+------+


MariaDB [office]> select * from staff order by dnum and salary;
+-------+----------+--------+--------+------+
| ssn   | fname    | lname  | salary | dnum |
+-------+----------+--------+--------+------+
| 12345 | Jerrish  | Sharan |  30000 |    5 |
| 33445 | Dinith   | Wreck  |  40000 |    5 |
| 53453 | Joy      | Dilan  |  25000 |    5 |
| 66884 | Ramya    | Naresh |  38000 |    5 |
| 87654 | Jennifer | Mercy  |  43000 |    4 |
| 99887 | Aila     | Shed   |  25000 |    4 |
+-------+----------+--------+--------+------+


MariaDB [office]> select dnum, count(*) as number_of_staff from staff group by dnum;
+------+-----------------+
| dnum | number_of_staff |
+------+-----------------+
|    4 |               2 |
|    5 |               4 |
+------+-----------------+


MariaDB [office]> select dnum, sum(salary) as total_salary from staff group by dnum;
+------+--------------+
| dnum | total_salary |
+------+--------------+
|    4 |        68000 |
|    5 |       133000 |
+------+--------------+





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
8 rows in set (0.079 sec)

MariaDB [(none)]> use office;
Database changed
MariaDB [office]> show tables;
+------------------+
| Tables_in_office |
+------------------+
| department       |
| staff            |
+------------------+
2 rows in set (0.001 sec)

MariaDB [office]> select * from depaerment;
ERROR 1146 (42S02): Table 'office.depaerment' doesn't exist
MariaDB [office]> select * from deparment;
ERROR 1146 (42S02): Table 'office.deparment' doesn't exist
MariaDB [office]> select * from department;
+------+----------------+------------+
| DNum | DName          | StartDate  |
+------+----------------+------------+
|    1 | ELTU           | 1981-06-19 |
|    4 | Administration | 1995-01-01 |
|    5 | Research       | 1988-05-22 |
+------+----------------+------------+
3 rows in set (0.049 sec)

MariaDB [office]> select * from staff;
+-------+----------+--------+--------+------+
| ssn   | fname    | lname  | salary | dnum |
+-------+----------+--------+--------+------+
| 12345 | Jerrish  | Sharan |  30000 |    5 |
| 33445 | Dinith   | Wreck  |  40000 |    5 |
| 53453 | Joy      | Dilan  |  25000 |    5 |
| 66884 | Ramya    | Naresh |  38000 |    5 |
| 87654 | Jennifer | Mercy  |  43000 |    4 |
| 99887 | Aila     | Shed   |  25000 |    4 |
+-------+----------+--------+--------+------+
6 rows in set (0.005 sec)

MariaDB [office]> select sum(salary) from staff;
+-------------+
| sum(salary) |
+-------------+
|      201000 |
+-------------+
1 row in set (0.001 sec)

MariaDB [office]> select dnum, sum(salary) as total_salary from staff group by dnum;
+------+--------------+
| dnum | total_salary |
+------+--------------+
|    4 |        68000 |
|    5 |       133000 |
+------+--------------+
2 rows in set (0.003 sec)

MariaDB [office]> select dnum, ave(salary) as total_salary from staff group by dnum;
ERROR 1305 (42000): FUNCTION office.ave does not exist
MariaDB [office]> select dnum, average(salary) as total_salary from staff group by dnum;
ERROR 1305 (42000): FUNCTION office.average does not exist
MariaDB [office]> select dnum, avg(salary) as total_salary from staff group by dnum;
+------+--------------+
| dnum | total_salary |
+------+--------------+
|    4 |   34000.0000 |
|    5 |   33250.0000 |
+------+--------------+
2 rows in set (0.001 sec)

MariaDB [office]> select concat(fname,' ',lname) as full_name from staff;
+----------------+
| full_name      |
+----------------+
| Jerrish Sharan |
| Dinith Wreck   |
| Joy Dilan      |
| Ramya Naresh   |
| Jennifer Mercy |
| Aila Shed      |
+----------------+
6 rows in set (0.001 sec)

MariaDB [office]> select concat(fname,' ',lname,'-->',salary) as nameAndSalary from staff;
+------------------------+
| nameAndSalary          |
+------------------------+
| Jerrish Sharan-->30000 |
| Dinith Wreck-->40000   |
| Joy Dilan-->25000      |
| Ramya Naresh-->38000   |
| Jennifer Mercy-->43000 |
| Aila Shed-->25000      |
+------------------------+
6 rows in set (0.001 sec)

MariaDB [office]> select * from staff where dnum=5;
+-------+---------+--------+--------+------+
| ssn   | fname   | lname  | salary | dnum |
+-------+---------+--------+--------+------+
| 12345 | Jerrish | Sharan |  30000 |    5 |
| 33445 | Dinith  | Wreck  |  40000 |    5 |
| 53453 | Joy     | Dilan  |  25000 |    5 |
| 66884 | Ramya   | Naresh |  38000 |    5 |
+-------+---------+--------+--------+------+
4 rows in set (0.001 sec)

MariaDB [office]> select * from staff where salary>35000;
+-------+----------+--------+--------+------+
| ssn   | fname    | lname  | salary | dnum |
+-------+----------+--------+--------+------+
| 33445 | Dinith   | Wreck  |  40000 |    5 |
| 66884 | Ramya    | Naresh |  38000 |    5 |
| 87654 | Jennifer | Mercy  |  43000 |    4 |
+-------+----------+--------+--------+------+
3 rows in set (0.001 sec)

MariaDB [office]> select * from staff where between 25000  and 40000;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'between 25000  and 40000' at line 1
 ariaDB [office]> select * from staff where salary between 25000  and 40000;
+-------+---------+--------+--------+------+
| ssn   | fname   | lname  | salary | dnum |
+-------+---------+--------+--------+------+
| 12345 | Jerrish | Sharan |  30000 |    5 |
| 33445 | Dinith  | Wreck  |  40000 |    5 |
| 53453 | Joy     | Dilan  |  25000 |    5 |
| 66884 | Ramya   | Naresh |  38000 |    5 |
| 99887 | Aila    | Shed   |  25000 |    4 |
+-------+---------+--------+--------+------+
5 rows in set (0.000 sec)

MariaDB [office]> select * from staff where fname like'j%';
+-------+----------+--------+--------+------+
| ssn   | fname    | lname  | salary | dnum |
+-------+----------+--------+--------+------+
| 12345 | Jerrish  | Sharan |  30000 |    5 |
| 53453 | Joy      | Dilan  |  25000 |    5 |
| 87654 | Jennifer | Mercy  |  43000 |    4 |
+-------+----------+--------+--------+------+
3 rows in set (0.001 sec)

MariaDB [office]> select * from staff where lname like'h%';
Empty set (0.001 sec)

MariaDB [office]> select * from staff where salary =25000;
+-------+-------+-------+--------+------+
| ssn   | fname | lname | salary | dnum |
+-------+-------+-------+--------+------+
| 53453 | Joy   | Dilan |  25000 |    5 |
| 99887 | Aila  | Shed  |  25000 |    4 |
+-------+-------+-------+--------+------+
2 rows in set (0.001 sec)

MariaDB [office]> select * from staff where salary =! 25000;
Empty set (0.001 sec)

MariaDB [office]> select * from staff where salary != 25000;
+-------+----------+--------+--------+------+
| ssn   | fname    | lname  | salary | dnum |
+-------+----------+--------+--------+------+
| 12345 | Jerrish  | Sharan |  30000 |    5 |
| 33445 | Dinith   | Wreck  |  40000 |    5 |
| 66884 | Ramya    | Naresh |  38000 |    5 |
| 87654 | Jennifer | Mercy  |  43000 |    4 |
+-------+----------+--------+--------+------+
4 rows in set (0.000 sec)

MariaDB [office]> select * from staff order by fname asc;
+-------+----------+--------+--------+------+
| ssn   | fname    | lname  | salary | dnum |
+-------+----------+--------+--------+------+
| 99887 | Aila     | Shed   |  25000 |    4 |
| 33445 | Dinith   | Wreck  |  40000 |    5 |
| 87654 | Jennifer | Mercy  |  43000 |    4 |
| 12345 | Jerrish  | Sharan |  30000 |    5 |
| 53453 | Joy      | Dilan  |  25000 |    5 |
| 66884 | Ramya    | Naresh |  38000 |    5 |
+-------+----------+--------+--------+------+
6 rows in set (0.001 sec)

MariaDB [office]> select max(salary) as maximum_salary from staff;
+----------------+
| maximum_salary |
+----------------+
|          43000 |
+----------------+
1 row in set (0.001 sec)

MariaDB [office]> select min(salary) as minimum_salary from staff;
+----------------+
| minimum_salary |
+----------------+
|          25000 |
+----------------+
1 row in set (0.001 sec)

MariaDB [office]> select count(*) from staff salary>25000;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '>25000' at line 1
MariaDB [office]> select count(*) from staff;
+----------+
| count(*) |
+----------+
|        6 |
+----------+
1 row in set (0.001 sec)

MariaDB [office]> select count(*) from staff salary > 25000;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '> 25000' at line 1
MariaDB [office]> select count(*) from staff where salary > 25000;
+----------+
| count(*) |
+----------+
|        4 |
+----------+
1 row in set (0.001 sec)

MariaDB [office]> select count(*) from staff where salary > (select avg(salary) from staff);
+----------+
| count(*) |
+----------+
|        3 |
+----------+
1 row in set (0.002 sec)

MariaDB [office]> select count(*) as salary_is_greater_than_average_salary from staff where salary > (select avg(salary) from staff);
+---------------------------------------+
| salary_is_greater_than_average_salary |
+---------------------------------------+
|                                     3 |
+---------------------------------------+
1 row in set (0.001 sec)

MariaDB [office]> select dnum from staff where fname>2;
Empty set, 6 warnings (0.001 sec)

MariaDB [office]> select dnum, count(*) from staff group by dnum;
+------+----------+
| dnum | count(*) |
+------+----------+
|    4 |        2 |
|    5 |        4 |
+------+----------+
2 rows in set (0.001 sec)

MariaDB [office]> select dnum count(*) from staff;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'count(*) from staff' at line 1
MariaDB [office]> select dnum,count(*) from staff;
+------+----------+
| dnum | count(*) |
+------+----------+
|    4 |        6 |
+------+----------+
1 row in set (0.001 sec)

MariaDB [office]> select count(*) from staff;
+----------+
| count(*) |
+----------+
|        6 |
+----------+
1 row in set (0.001 sec)

MariaDB [office]> select dnum from staff where (select count(*) from staff)>2;
+------+
| dnum |
+------+
|    4 |
|    4 |
|    5 |
|    5 |
|    5 |
|    5 |
+------+
6 rows in set (0.001 sec)

MariaDB [office]> select dnum from staff group by dnum having count(*)>2;
+------+
| dnum |
+------+
|    5 |
+------+
1 row in set (0.001 sec)

MariaDB [office]> select dnum from staff group by dnum having sum(salary)>70000;
+------+
| dnum |
+------+
|    5 |
+------+
1 row in set (0.001 sec)

MariaDB [office]>