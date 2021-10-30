create database Manager_Student;
use Manager_Student;
create table class(
                      class_id int primary key auto_increment,
                      class_name varchar(10) not null ,
                      startDate date,
                      status bit not null
);

create table student(
                        student_id int primary key auto_increment,
                        student_name varchar(14) not null ,
                        address varchar(20) not null ,
                        phone varchar(10),
                        status bit not null ,
                        class_id int not null,
                        foreign key (class_id) references class(class_id)
);

create table subject(
                        sub_id int primary key auto_increment,
                        sub_name varchar(14) not null ,
                        credit int not null ,
                        status bit not null
);

create table mark(
                     mark_id int primary key auto_increment,
                     sub_id int not null ,
                     student_id int not null ,
                     mark int not null ,
                     exam_time int not null,
                     foreign key (sub_id) references subject(sub_id),
                     foreign key (student_id) references student (student_id)
);
insert into Manager_Student.class (class_id, class_name, startDate, status) value (null,'A1','2008-12-20',1);
insert into Manager_Student.class (class_id, class_name, startDate, status) value (null,'A2','2008-12-20',1);
insert into Manager_Student.class (class_id, class_name, startDate, status) value (null,'B3',current_date,0);
UPDATE manager_student.class t SET t.class_id = 1 WHERE t.class_id = 3;

insert into Manager_Student.student (student_id, student_name, address, phone, status, class_id) VALUE (null,'Hung','Ha noi','0912113113',1,1);
insert into Manager_Student.student (student_id, student_name, address, phone, status, class_id) VALUE (null,'Hoa','Hai phong',null,1,1);
insert into Manager_Student.student (student_id, student_name, address, phone, status, class_id) VALUE (null,'Thai','HCM','0123113113',0,2);

insert into Manager_Student.subject (sub_id, sub_name, credit, status) VALUE (null,'CF',5,1);
insert into Manager_Student.subject (sub_id, sub_name, credit, status) VALUE (null,'C',6,1);
insert into Manager_Student.subject (sub_id, sub_name, credit, status) VALUE (null,'HDJ',5,1);
insert into Manager_Student.subject (sub_id, sub_name, credit, status) VALUE (null,'RDBMS',10,1);

insert into Manager_Student.mark (mark_id, sub_id, student_id, mark, exam_time) value (null,1,1,8,1);
insert into Manager_Student.mark (mark_id, sub_id, student_id, mark, exam_time) value (null,1,2,10,2);
insert into Manager_Student.mark (mark_id, sub_id, student_id, mark, exam_time) value (null,2,1,12,1);

-- hiện thị danh sách tất cả học viên
select *
from student;
-- hiện thị các học viên đang theo học
select *
from student where status = true;
select student_name,status from student where status=true;
-- hiện thị danh sách các môn học có thời gian học < 10h
select * from subject where credit < 10;
-- hiện thị danh sách học viên lớp A1
select s.student_id,s.student_name, c.class_name
FROM student s join manager_student.class c on c.class_id = s.class_id
where c.class_name = 'A1';
-- hiện thị điểm môn CF của các học viên
select s.student_name,s2.sub_name,m.mark
from student s join manager_student.mark m on s.student_id = m.student_id join manager_student.subject s2 on m.sub_id = s2.sub_id
where sub_name='CF';
