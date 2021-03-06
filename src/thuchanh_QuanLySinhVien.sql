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

-- hi???n th??? danh s??ch t???t c??? h???c vi??n
select *
from student;
-- hi???n th??? c??c h???c vi??n ??ang theo h???c
select *
from student where status = true;
select student_name,status from student where status=true;
-- hi???n th??? danh s??ch c??c m??n h???c c?? th???i gian h???c < 10h
select * from subject where credit < 10;
-- hi???n th??? danh s??ch h???c vi??n l???p A1
select s.student_id,s.student_name, c.class_name
FROM student s join manager_student.class c on c.class_id = s.class_id
where c.class_name = 'A1';
-- hi???n th??? ??i???m m??n CF c???a c??c h???c vi??n
select s.student_name,s2.sub_name,m.mark
from student s join manager_student.mark m on s.student_id = m.student_id join manager_student.subject s2 on m.sub_id = s2.sub_id
where sub_name='CF';
-- hi???n th??? t???t c??? c??c h???c vi??n c?? t??n v???t ?????u b???ng k?? t??? 'h'
select student_name from student where student_name like 'h%';
-- Hi???n th??? c??c th??ng tin l???p h???c c?? th???i gian b???t ?????u v??o th??ng 12
select * from class where month(startDate) = 12;
-- Hi???n th??? t???t c??? c??c th??ng tin m??n h???c c?? credit trong kho???ng t??? 3-5.
select * from subject where credit >= 3 and credit <=5;
-- Thay ?????i m?? l???p(ClassID) c???a sinh vi??n c?? t??n ???Hung??? l?? 2.
update student s set s.class_id = 2 where s.student_name = 'Hung';
select c.class_id,s.student_name from class c join student s on c.class_id = s.class_id;
-- Hi???n th??? c??c th??ng tin: StudentName, SubName, Mark. D??? li???u s???p x???p theo ??i???m thi (mark) gi???m d???n. n???u tr??ng s???p theo t??n t??ng d???n.
select s.student_name, s2.sub_name, m.mark
from student s join mark m on s.student_id = m.student_id join subject s2 on m.sub_id = s2.sub_id group by mark
ORDER BY mark desc;

