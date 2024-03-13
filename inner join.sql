
-------------------------------------------------------------------
CREATE TABLE products
(
prod_id varchar(10) PRIMARY KEY NOT NULL,
vend_id char(10),
prod_name char(255) NOT NULL,
prod_price float  NOT NULL,
prod_desc text
)

select * from products
INSERT INTO Products(prod_id, vend_id, prod_name, prod_price, prod_desc)
VALUES('BR01', 'BRS01', '8 inch teddy bear', 5.99, '8 inch teddy bear, comes with cap and jacket'),
('BR02', NULL, '12 inch teddy bear', 8.99, '12 inch teddy bear, comes with cap and jacket'),
('BR03', 'BRS01', '18 inch teddy bear', 11.99, '18 inch teddy bear, comes with cap and jacket'),
('BNBG01', 'DLL01', 'Fish bean bag toy', 3.49, 'Fish bean bag toy, complete with bean bag worms with which to feed it'),
('BNBG02', 'DLL01', 'Bird bean bag toy', 3.49, 'Bird bean bag toy, eggs are not included'),
('BNBG03', NULL, 'Rabbit bean bag toy', 3.49, 'Rabbit bean bag toy, comes with bean bag carrots'),
('RGAN01', 'DLL01', 'Raggedy Ann', 4.99, '18 inch Raggedy Ann doll'),
('RYL01', 'FNG01', 'King doll', 9.49, '12 inch king doll with royal garments and crown'),
('RYL02', 'FNG01', 'Queen doll', 9.49, '12 inch queen doll with royal garments and crown')

CREATE TABLE vendors 
(
vend_id char(10) PRIMARY KEY  NOT NULL,
vend_name char(50) NOT NULL,
vend_address char(50) ,
vend_city char(50),
vend_state char(5),
vend_zip char(10),
vend_country char(50)
)
select * from vendors
insert into Vendors values
('BRS01','Bears R Us','123 Main Street','Bear Town','MI','44444', 'USA'),
('BRE02','Bear Emporium','500 Park Street','Anytown','OH','44333', 'USA'),
('DLL01','Doll House Inc.','555 High Street','Dollsville','CA','99999', 'USA'),
('FRB01','Furball Inc.','1000 5th Avenue','New York','NY','11111', 'USA'),
('FNG01','Fun and Games','42 Galaxy Road','London', NULL,'N16 6PS', 'England'),
('JTS01','Jouets et ours','1 Rue Amusement','Paris', NULL,'45678', 'France')

-------------------
---1 .Write SQL query to retrieve the product ID, product name, and vendor name from the "Products" table and "Vendors" table, sorted in ascending order by product ID ?
select * from vendors
select * from products
select * from products as P inner join vendors as V on p.vend_id=v.vend_id order by prod_id asc
select p.prod_id , p.prod_name ,v.vend_name from products as P inner join vendors as V on p.vend_id=v.vend_id order by p.prod_id asc

----2 .-Write SQL query to retrieve the product ID, product name, vendor name, and vendor country for products sold by vendors in the USA, sorted by product ID ?
select p.prod_id	,p.prod_name, v.vend_name,v.vend_country from products as p inner join vendors as v on p.vend_id=v.vend_id 
where vend_country ='USA' order by p.prod_id 

----3.Write SQL query to retrieve the product ID, product name, vendor name, and product price from the "Products" table, joined with the "Vendors" table, where the product price is less than 5, and the results are sorted by the product ID
select * from vendors
select * from products

select p.prod_id , p.prod_name ,p.prod_price,v.vend_name from products as p inner join vendors as V on p.vend_id=v.vend_id where prod_price <5 order by p.prod_id


----4.Write SQL query to retrieve the product ID, vendor ID, and vendor city for all products, sorted by the vendor ID?
select p.prod_id ,v.vend_id ,v.vend_city from products as p inner join vendors as v on p.vend_id=v.vend_id order by v.vend_id

---5.Write SQL query to retrieve vendor name and calculates the total amount of products sold by each vendor as “total_amount”. Sorts the results in ascending order based on the total amount?
select v.vend_name ,sum(p.prod_price) as total_amount from vendors as v inner join products as p on v.vend_id=p.vend_id  group by 
v.vend_name order by total_amount 


---.6) Write SQL query to retrieve vendor name and calculate total amount including 5% GST for each vendor's products as “total_amount_GST_5”? Can you provide the result in ascending order based on the total amount?
select v.vend_name ,sum(p.prod_price +(p.prod_price*(0.05))) as total_amount_GST_5 from vendors as v inner join products as p on v.vend_id=p.vend_id 
group by v.vend_name order by total_amount_GST_5

---7.Write SQL query to retrieve the product ID, vendor ID, product name, vendor name, and product price from the "Products" table, joined
-----with the "vendors" table, where the vendor ID ends with '01' and the product price is greater than 4
select * from vendors
select * from products
select   p.prod_id ,p.vend_id , p.prod_name,p.prod_price,v.vend_name  from products as p inner join vendors as v on p.vend_id=v.vend_id where v.vend_id like '%01'and p.prod_price >4

select  p.prod_id , v.vend_name, p.prod_name, v.vend_id,sum(p.prod_price) as total_price from products as p inner join vendors as v on p.vend_id=v.vend_id 
where v.vend_id like '%01' group by  p.prod_id,v.vend_name, p.prod_name, v.vend_id having sum(p.prod_price) >8




------
CREATE TABLE employees
(
emp_no INT PRIMARY KEY NOT NULL,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL,
salary INT,
birth_date DATE NOT NULL,
gender varchar(2) NOT NULL,
joining_date DATE NOT NULL,
department VARCHAR(20)
)






INSERT INTO employees VALUES (1001, 'James', 'Bond', 45300, '1998-01-19', 'M', '2020-11-29', 'Marketing'),
(1002, 'Robert', 'Lee', 69410, '1998-09-02', 'M', '2019-12-26', 'IT'),
(1003, 'Mary', 'Wood', 39518, '1997-11-07', 'F', '2019-09-12', 'Business Development'),
(1004, 'John', 'Cole', 36264, '1999-02-01', 'M', '2021-04-14', 'HR'),
(1005, 'Jennifer', 'Gill', 48941, '1996-06-05', 'F', '2019-06-28', 'Marketing'),
(1006, 'Michael', 'Watts', 23800, '1999-04-16', 'M', '2022-06-09', 'HR'),
(1007, 'David', 'Mills', 39400, '1998-04-26', 'M', '2021-10-17', 'IT'),
(1008, 'William', 'Hill', 26392, '1999-10-21', 'M', '2019-09-30', 'Business Development'),
(1009, 'Linda', 'Potter', 55231, '1998-01-24', 'F', '2021-08-07', 'Finance'),
(1010, 'Richard', 'Martin', 25600, '1996-08-07', 'M', '2021-03-23', 'IT'),
(1011, 'Susan', 'Hall', 54152, '1999-12-27', 'F', '2020-08-07', 'Finance'),
(1012, 'Joseph', 'Turner', 60556, '1997-05-13', 'M', '2019-09-02', 'Marketing'),
(1013, 'Mary', 'Gill', 58246, '1999-01-21', 'F', '2021-04-30', 'Business Development'),
(1014, 'Thomas', 'Ryan', 23676, '1996-10-12', 'M', '2022-03-02', 'IT'),
(1015, 'Charles', 'Williams', 57226, '2000-01-29', 'M', '2019-11-05', NULL),
(1016, 'Jessica', 'Clark', NULL, '2000-01-25', 'F', '2020-01-24', 'IT'),
(1017, 'Nancy', 'Parker', 66900, '1996-10-24', 'F', '2022-01-09', 'Finance'),
(1018, 'Betty', 'Barker', 35288, '1998-11-13', 'F', '2019-12-26', 'HR'),
(1019, 'Christopher', 'Gibson', 59341, '1998-04-23', 'M', '2019-05-02', 'Marketing'),
(1020, 'Daniel', 'Elliott', 44012, '1999-01-21', 'M', '2023-01-08', 'IT'),
(1021, 'David', 'Mills', NULL, '1998-01-24', 'M', '2019-12-26', 'IT'),
(1022, 'Sarah', 'Harrison', 44692, '1996-03-20', 'F', '2020-05-03', 'Finance'),
(1023, 'Matthew', 'Hill', 41365, '1998-05-16', 'M', '2019-05-23', 'IT'),
(1024, 'Anthony', 'Miller', 56794, '1996-06-30', 'M', '2019-02-28', 'Business Development'),
(1025, 'Mark', 'Wood', 65120, '1998-10-29', 'M', '2020-07-30', 'Business Development'),
(1026, 'Elizabeth', 'Walker', 47030, '1998-08-11', 'F', '2021-06-18', NULL),
(1027, 'Barbara', 'Anderson', NULL, '1999-12-27', 'F', '2021-03-14', 'HR'),
(1028, 'Jessica', 'Clark', 63836, '1998-01-24', 'F', '2021-05-23', 'IT'),
(1029, 'Nancy', 'Cole', 63669, '2000-01-26', 'F', '2019-12-26', 'Finance'),
(1030, 'Joe', 'Brooks', 44000, '1999-08-05', 'M', '2021-03-09', 'Business Development')

select * from employees

--1-Write a query to display all the records of the employee whose joining_date is after 20 March 2022.
select *from employees where joining_date >'20 March 2022'
--2-Write a query to display emp_no, first_name, last_name, department of the employee whose department is ‘Finance'
select emp_no ,first_name ,last_name , department from employees where department = 'finance'
--3-Write a query to display emp_no, salary, department of the employee whose salary is below 35000
select emp_no,salary , department from employees where salary <35000
--4-Write a query to display all the records of the employee whose birth_date is after or equal to 24 January 1998
select * from employees where birth_date >='24 january 1998'

--5-Write a query to display emp_no, first_name, department of the employee whose department is other than ‘IT’
select emp_no,first_name , department from employees where department = 'it'
--6-Write a query to display all the records of the employee whose emp_no is 1010 or below 1010
select * from employees where emp_no <='1010'
--7-Write a query to display unique first_name of the employee whose gender is Male
select first_name , gender from employees where gender= 'm'
or 
select first_name from employees where gender= 'm'

--8-Write a query to display emp_no, first_name , salary and add 10000 to the salary of the employee whose salary is below 25000 anddisplay final salary as column name ‘final_salary’.
select emp_no, first_name , salary,(salary+10000) as final_salary from employees where salary <25000
--9-Write a query to display emp_no and full name of the employee with the column name as ‘full_name’ and the emp_no should be more than 1015
select emp_no , first_name +''+last_name as full_NAme from employees where emp_no >1015
--or
select emp_no , concat(first_name,'   ', last_name) as full_name from employees where emp_no >1015
select emp_no ,sum(salary)as total_salary,first_name ,last_name , department from employees where emp_no>1015 and department= 'it'
group by emp_no , first_name,last_name, department HAVING SUM(salary)>1250

select first_name  from employees
select UPPER(first_name) as first_name from employees
select lower(first_name) as first_name from employees
select first_name +' '+last_name as fullname from employees
select * from employees where first_name='james'
select *from employees where first_name like 'j%'



