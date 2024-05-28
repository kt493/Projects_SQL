create table employee 
(empid int primary key auto_increment,
empname varchar(50) not null,
dateofjoining date not null,
department varchar(50) not null check (department in ('HR', 'OPS', 'FIN', 'QT', 'ADM')),
managername varchar(50) not null,
managerid int not null);

Delimiter //
create procedure emp_add 
(in EmpName varchar(50),
in DateOfJoining date,
in Department varchar(50),
in ManagerName varchar(50),
in ManagerID int)
begin
Insert into Employee(EmpName, DateOfJoining, Department, ManagerName, ManagerID)
Values(EmpName, DateOfJoining, Department, ManagerName, ManagerID);
end//
create procedure emp_del(in p_emp_id int)
begin
delete from employee where empid = p_emp_id;
end//
create procedure change_dept(in emp_id int, in new_department varchar(50))
begin
update employee set department = new_department where empid = emp_id;
end//
create procedure change_manager(in emp_id int, in new_manager_name varchar(50), in new_manager_id int)
begin
update employee 
set managername = new_manager_name, managerid = new_manager_id 
where empid = emp_id;
end//
Delimiter ;

call emp_add('Vinit Kumar', '2023/01/01', 'HR', 'Ananya Singh', 101);
call emp_del(49);
call change_dept(50, 'ADM');
call change_manager(51,'Arjun Gupta', 102);




insert into employee (empname, dateofjoining, department, managername, managerid) 
values ('Vihaan Patel','2021/06/14','ADM','Vishal Jain',105),
('Kabir Kumar','2021/05/28','ADM','Vishal Jain',105),
('Aarush Singh','2022/03/03','ADM','Vishal Jain',105),
('Diya Gupta','2019/08/20','ADM','Vishal Jain',105),
('Yash Sharma','2020/10/29','ADM','Vishal Jain',105),
('Kia Kumar','2018/08/16','ADM','Vishal Jain',105),
('Arush Jain','2021/03/02','ADM','Vishal Jain',105),
('Aaradhya Reddy','2017/07/21','FIN','Priya Sharma',103),
('Advik Verma','2022/04/09','FIN','Priya Sharma',103),
('Aradhana Jain','2017/06/15','FIN','Priya Sharma',103),
('Vedant Sharma','2020/12/18','FIN','Priya Sharma',103),
('Aarav Sharma','2019/05/12','HR','Ananya Singh',101),
('Shaurya Sharma','2020/11/07','HR','Ananya Singh',101),
('Reyansh Singh','2022/02/20','HR','Ananya Singh',101),
('Aahana Singh','2019/02/17','HR','Ananya Singh',101),
('Riya Patel','2020/02/28','OPS','Arjun Gupta',102),
('Virat Kumar','2018/11/15','OPS','Arjun Gupta',102),
('Neha Singh','2021/08/03','OPS','Arjun Gupta',102),
('Pooja Gupta','2019/10/30','OPS','Arjun Gupta',102),
('Ananya Das','2019/03/07','OPS','Arjun Gupta',102),
('Krish Agarwal','2020/01/22','OPS','Arjun Gupta',102),
('Pari Sharma','2018/10/11','OPS','Arjun Gupta',102),
('Zoya Kumar','2018/07/25','OPS','Arjun Gupta',102),
('Advika Patel','2021/04/11','OPS','Arjun Gupta',102),
('Aryan Das','2019/01/28','OPS','Arjun Gupta',102),
('Myra Agarwal','2020/09/15','OPS','Arjun Gupta',102),
('Avni Sharma','2018/12/02','OPS','Arjun Gupta',102),
('Dev Kumar','2021/07/19','OPS','Arjun Gupta',102),
('Anvi Jain','2017/05/05','OPS','Arjun Gupta',102),
('Ishaan Patel','2020/08/04','OPS','Arjun Gupta',102),
('Vivaan Sharma','2018/11/21','OPS','Arjun Gupta',102),
('Saanvi Kumar','2021/06/08','OPS','Arjun Gupta',102),
('Aadhya Jain','2017/04/25','OPS','Rajesh Kumar',104),
('Krishnav Das','2022/01/10','OPS','Rajesh Kumar',104),
('Anushka Agarwal','2019/09/01','OPS','Rajesh Kumar',104),
('Navya Kumar','2018/10/05','OPS','Rajesh Kumar',104),
('Arnav Jain','2021/05/22','OPS','Rajesh Kumar',104),
('Avishi Singh','2019/03/11','OPS','Rajesh Kumar',104),
('Shaurya Patel','2020/10/06','OPS','Rajesh Kumar',104),
('Anvi Sharma','2018/12/23','OPS','Rajesh Kumar',104),
('Vihaan Kumar','2021/07/10','OPS','Rajesh Kumar',104),
('Anaya Jain','2017/05/27','OPS','Rajesh Kumar',104),
('Prisha Das','2022/02/14','OPS','Rajesh Kumar',104),
('Rehan Agarwal','2019/07/07','OPS','Rajesh Kumar',104),
('Jiya Sharma','2020/09/24','OPS','Rajesh Kumar',104),
('Ishaan Kumar','2018/08/11','OPS','Rajesh Kumar',104),
('Kiara Jain','2021/03/28','OPS','Rajesh Kumar',104),
('Arjun Sharma','2020/12/18','QT','Rajesh Kumar',104),
('Aanya Singh','2018/09/05','QT','Rajesh Kumar',104),
('Navya Gupta','2019/07/12','QT','Rajesh Kumar',104);



