MariaDB [Department]> create database college;

MariaDB [Department]> use college;

MariaDB [college]> create table Department
    -> (
    -> dept_id int not null,
    -> dept_name varchar(30) not null,
    -> building varchar(30) not null,
    -> primary key (dept_id)
    -> );

MariaDB [college]> describe Department;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_id   | int(11)     | NO   | PRI | NULL    |       |
| dept_name | varchar(30) | NO   |     | NULL    |       |
| building  | varchar(30) | NO   |     | NULL    |       |

MariaDB [college]> create table student
    -> (
    -> student_id int not null,
    -> student_name varchar(30) not null,
    -> age int not null,
    -> marks int not null,
    -> dept_id int not null,
    -> primary key (student_id),
    -> foreign key (dept_id) references Department(dept_id)
    -> );

MariaDB [college]> insert into department values(1,"Computer Science","Block A"),(2,"Mathematics","Block B"),(3,"Physics","Block C");

MariaDB [college]> select *from department;
+---------+------------------+----------+
| dept_id | dept_name        | building |
+---------+------------------+----------+
|       1 | Computer Science | Block A  |
|       2 | Mathematics      | Block B  |
|       3 | Physics          | Block C  |
+---------+------------------+----------+

MariaDB [college]> insert into student values(101,"Alice",20,85,1),(102,"Bob",22,78,1),(103,"Charlie",21,92,2),(104,"David",23,65,2),(105,"Eva",20,88,3);

MariaDB [college]> select * from student ;
+------------+--------------+-----+-------+---------+
| student_id | student_name | age | marks | dept_id |
+------------+--------------+-----+-------+---------+
|        101 | Alice        |  20 |    85 |       1 |
|        102 | Bob          |  22 |    78 |       1 |
|        103 | Charlie      |  21 |    92 |       2 |
|        104 | David        |  23 |    65 |       2 |
|        105 | Eva          |  20 |    88 |       3 |
+------------+--------------+-----+-------+---------+

MariaDB [college]> select * from student where student_name like 'A%';
+------------+--------------+-----+-------+---------+
| student_id | student_name | age | marks | dept_id |
+------------+--------------+-----+-------+---------+
|        101 | Alice        |  20 |    85 |       1 |
+------------+--------------+-----+-------+---------+

MariaDB [college]> select * from student where age>20 and marks>80;
+------------+--------------+-----+-------+---------+
| student_id | student_name | age | marks | dept_id |
+------------+--------------+-----+-------+---------+
|        103 | Charlie      |  21 |    92 |       2 |
+------------+--------------+-----+-------+---------+

MariaDB [college]> select * from student where dept_id=1;
+------------+--------------+-----+-------+---------+
| student_id | student_name | age | marks | dept_id |
+------------+--------------+-----+-------+---------+
|        101 | Alice        |  20 |    85 |       1 |
|        102 | Bob          |  22 |    78 |       1 |
+------------+--------------+-----+-------+---------+


MariaDB [college]> select * from student where dept_id=1 , dept_id =2;
+------------+--------------+-----+-------+---------+
| student_id | student_name | age | marks | dept_id |
+------------+--------------+-----+-------+---------+
|        101 | Alice        |  20 |    85 |       1 |
|        102 | Bob          |  22 |    78 |       1 |
|        103 | Charlie      |  21 |    92 |       2 |
|        104 | David        |  23 |    65 |       2 |
+------------+--------------+-----+-------+---------+

MariaDB [college]> SELECT * FROM Student WHERE dept_id IN ( SELECT dept_id FROM Department WHERE dept_name IN ('Computer Science', 'Mathematics') );
+------------+--------------+-----+-------+---------+
| student_id | student_name | age | marks | dept_id |
+------------+--------------+-----+-------+---------+
|        101 | Alice        |  20 |    85 |       1 |
|        102 | Bob          |  22 |    78 |       1 |
|        103 | Charlie      |  21 |    92 |       2 |
|        104 | David        |  23 |    65 |       2 |
+------------+--------------+-----+-------+---------+

MariaDB [college]> SELECT * FROM Student WHERE dept_id IN ( SELECT dept_id FROM Department WHERE dept_name = 'Computer Science' or dept_name = 'Mathematics' );
+------------+--------------+-----+-------+---------+
| student_id | student_name | age | marks | dept_id |
+------------+--------------+-----+-------+---------+
|        101 | Alice        |  20 |    85 |       1 |
|        102 | Bob          |  22 |    78 |       1 |
|        103 | Charlie      |  21 |    92 |       2 |
|        104 | David        |  23 |    65 |       2 |
+------------+--------------+-----+-------+---------+

MariaDB [college]> select * from student where marks between 70 and 90;
+------------+--------------+-----+-------+---------+
| student_id | student_name | age | marks | dept_id |
+------------+--------------+-----+-------+---------+
|        101 | Alice        |  20 |    85 |       1 |
|        102 | Bob          |  22 |    78 |       1 |
|        105 | Eva          |  20 |    88 |       3 |
+------------+--------------+-----+-------+---------+

MariaDB [college]> select * from student order by marks desc;
+------------+--------------+-----+-------+---------+
| student_id | student_name | age | marks | dept_id |
+------------+--------------+-----+-------+---------+
|        103 | Charlie      |  21 |    92 |       2 |
|        105 | Eva          |  20 |    88 |       3 |
|        101 | Alice        |  20 |    85 |       1 |
|        102 | Bob          |  22 |    78 |       1 |
|        104 | David        |  23 |    65 |       2 |
+------------+--------------+-----+-------+---------+


MariaDB [college]> select * from student order by marks asc;
+------------+--------------+-----+-------+---------+
| student_id | student_name | age | marks | dept_id |
+------------+--------------+-----+-------+---------+
|        104 | David        |  23 |    65 |       2 |
|        102 | Bob          |  22 |    78 |       1 |
|        101 | Alice        |  20 |    85 |       1 |
|        105 | Eva          |  20 |    88 |       3 |
|        103 | Charlie      |  21 |    92 |       2 |
+------------+--------------+-----+-------+---------+


MariaDB [college]> select dept_id,AVG(marks) as avg_marks from student group by dept_id;
+---------+-----------+
| dept_id | avg_marks |
+---------+-----------+
|       1 |   81.5000 |
|       2 |   78.5000 |
|       3 |   88.0000 |
+---------+-----------+


MariaDB [college]> select dept_id, avg(marks) as avg_marks from student;
+---------+-----------+
| dept_id | avg_marks |
+---------+-----------+
|       1 |   81.6000 |
+---------+-----------+


MariaDB [college]> select dept_id, avg(marks) as avg_marks from student group by dept_id;
+---------+-----------+
| dept_id | avg_marks |
+---------+-----------+
|       1 |   81.5000 |
|       2 |   78.5000 |
|       3 |   88.0000 |
+---------+-----------+


MariaDB [college]> select marks, min(marks) as min_marks from student;
+-------+-----------+
| marks | min_marks |
+-------+-----------+
|    85 |        65 |
+-------+-----------+


MariaDB [college]> select min(marks) as min_marks from student;
+-----------+
| min_marks |
+-----------+
|        65 |
+-----------+


MariaDB [college]> select max(marks) as max_marks from student;
+-----------+
| max_marks |
+-----------+
|        92 |
+-----------+


MariaDB [college]> select dept_id,count(*) as student_count from student group by dept_id;
+---------+---------------+
| dept_id | student_count |
+---------+---------------+
|       1 |             2 |
|       2 |             2 |
|       3 |             1 |
+---------+---------------+


MariaDB [college]> select dept_id,count(*) as student_count from student group by dept_id order by student_count desc;
+---------+---------------+
| dept_id | student_count |
+---------+---------------+
|       1 |             2 |
|       2 |             2 |
|       3 |             1 |
+---------+---------------+


MariaDB [college]> select dept_id, min(marks) as minimum_marks from student;
+---------+---------------+
| dept_id | minimum_marks |
+---------+---------------+
|       1 |            65 |
+---------+---------------+


MariaDB [college]> select dept_id, min(marks) as minimum_marks from student group by dept_id;
+---------+---------------+
| dept_id | minimum_marks |
+---------+---------------+
|       1 |            78 |
|       2 |            65 |
|       3 |            88 |
+---------+---------------+


MariaDB [college]> select dept_id, max(marks) as maximum_marks from student group by dept_id;
+---------+---------------+
| dept_id | maximum_marks |
+---------+---------------+
|       1 |            85 |
|       2 |            92 |
|       3 |            88 |
+---------+---------------+


MariaDB [college]> alter table student
    -> add email varchar(50) not null;


MariaDB [college]> describe student;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| student_id   | int(11)     | NO   | PRI | NULL    |       |
| student_name | varchar(30) | NO   |     | NULL    |       |
| age          | int(11)     | NO   |     | NULL    |       |
| marks        | int(11)     | NO   |     | NULL    |       |
| dept_id      | int(11)     | NO   | MUL | NULL    |       |
| email        | varchar(50) | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+


MariaDB [college]> alter table student
    -> modify student_name varchar(100) not null;


MariaDB [college]> describe student;
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| student_id   | int(11)      | NO   | PRI | NULL    |       |
| student_name | varchar(100) | NO   |     | NULL    |       |
| age          | int(11)      | NO   |     | NULL    |       |
| marks        | int(11)      | NO   |     | NULL    |       |
| dept_id      | int(11)      | NO   | MUL | NULL    |       |
| email        | varchar(50)  | NO   |     | NULL    |       |
+--------------+--------------+------+-----+---------+-------+


MariaDB [college]> alter table student
    -> change marks total_marks int not null;


MariaDB [college]> describe student;
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| student_id   | int(11)      | NO   | PRI | NULL    |       |
| student_name | varchar(100) | NO   |     | NULL    |       |
| age          | int(11)      | NO   |     | NULL    |       |
| total_marks  | int(11)      | NO   |     | NULL    |       |
| dept_id      | int(11)      | NO   | MUL | NULL    |       |
| email        | varchar(50)  | NO   |     | NULL    |       |
+--------------+--------------+------+-----+---------+-------+


MariaDB [college]> update student
    -> set total_marks=82 where student_id=102;


MariaDB [college]> select * from student;
+------------+--------------+-----+-------------+---------+-------+
| student_id | student_name | age | total_marks | dept_id | email |
+------------+--------------+-----+-------------+---------+-------+
|        101 | Alice        |  20 |          85 |       1 |       |
|        102 | Bob          |  22 |          82 |       1 |       |
|        103 | Charlie      |  21 |          92 |       2 |       |
|        104 | David        |  23 |          65 |       2 |       |
|        105 | Eva          |  20 |          88 |       3 |       |
+------------+--------------+-----+-------------+---------+-------+


MariaDB [college]> update student
    -> set total_marks = total_marks + 5 where dept_id =1;


MariaDB [college]> select * from student;
+------------+--------------+-----+-------------+---------+-------+
| student_id | student_name | age | total_marks | dept_id | email |
+------------+--------------+-----+-------------+---------+-------+
|        101 | Alice        |  20 |          90 |       1 |       |
|        102 | Bob          |  22 |          87 |       1 |       |
|        103 | Charlie      |  21 |          92 |       2 |       |
|        104 | David        |  23 |          65 |       2 |       |
|        105 | Eva          |  20 |          88 |       3 |       |
+------------+--------------+-----+-------------+---------+-------+


MariaDB [college]> update student
    -> set total_marks = total_marks + 5 where dept_id = (select dept_id from department where dept_name = 'computer science' );


MariaDB [college]> select * from student;
+------------+--------------+-----+-------------+---------+-------+
| student_id | student_name | age | total_marks | dept_id | email |
+------------+--------------+-----+-------------+---------+-------+
|        101 | Alice        |  20 |          95 |       1 |       |
|        102 | Bob          |  22 |          92 |       1 |       |
|        103 | Charlie      |  21 |          92 |       2 |       |
|        104 | David        |  23 |          65 |       2 |       |
|        105 | Eva          |  20 |          88 |       3 |       |
+------------+--------------+-----+-------------+---------+-------+


MariaDB [college]> update student
    -> set total_marks = total_marks - 5 where dept_id = (select dept_id from department where dept_name = 'computer science' );


MariaDB [college]> select * from student;
+------------+--------------+-----+-------------+---------+-------+
| student_id | student_name | age | total_marks | dept_id | email |
+------------+--------------+-----+-------------+---------+-------+
|        101 | Alice        |  20 |          90 |       1 |       |
|        102 | Bob          |  22 |          87 |       1 |       |
|        103 | Charlie      |  21 |          92 |       2 |       |
|        104 | David        |  23 |          65 |       2 |       |
|        105 | Eva          |  20 |          88 |       3 |       |
+------------+--------------+-----+-------------+---------+-------+


MariaDB [college]> update Department
    -> set building = 'Block D' where dept_name = 'Mathematics';


MariaDB [college]> select * from Department;
+---------+------------------+----------+
| dept_id | dept_name        | building |
+---------+------------------+----------+
|       1 | Computer Science | Block A  |
|       2 | Mathematics      | Block D  |
|       3 | Physics          | Block C  |
+---------+------------------+----------+


MariaDB [college]> select student_name from student where dept_id =(select dept_id from department where dept_name = 'computer science') or age >20;
+--------------+
| student_name |
+--------------+
| Alice        |
| Bob          |
| Charlie      |
| David        |
+--------------+


MariaDB [college]> select student_name from student where dept_id =(select dept_id from department where dept_name = 'computer science') or age >22;
+--------------+
| student_name |
+--------------+
| Alice        |
| Bob          |
| David        |
+--------------+


MariaDB [college]> select dept_name as name  from department union select student_name from student;
+------------------+
| name             |
+------------------+
| Computer Science |
| Mathematics      |
| Physics          |
| Alice            |
| Bob              |
| Charlie          |
| David            |
| Eva              |
+------------------+


MariaDB [college]> select concat(s.student_name, '--->' ,d.dept_name) as result from student s join department d on s.dept_id = d.dept_id;
+---------------------------+
| result                    |
+---------------------------+
| Alice--->Computer Science |
| Bob--->Computer Science   |
| Charlie--->Mathematics    |
| David--->Mathematics      |
| Eva--->Physics            |
+---------------------------+


MariaDB [college]> select s.student_name, d.dept_name from student s join department  d on s.dept_id = d.dept_id;
+--------------+------------------+
| student_name | dept_name        |
+--------------+------------------+
| Alice        | Computer Science |
| Bob          | Computer Science |
| Charlie      | Mathematics      |
| David        | Mathematics      |
| Eva          | Physics          |
+--------------+------------------+


MariaDB [college]> select student_name from student where total_marks>85
    -> union
    -> select student_name from student where dept_id = ( select dept_id from department where dept_name = 'physics' );
+--------------+
| student_name |
+--------------+
| Alice        |
| Bob          |
| Charlie      |
| Eva          |
+--------------+

