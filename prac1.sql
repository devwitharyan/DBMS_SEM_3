--Lab1.sql--
-- Practical 1


-- 1.1
create database Bank_System_118


-- 2.1
create table Bank_Master(Bank_Id int primary key,
Bank_Name varchar(40),
Bank_ShortName varchar(10))


-- 2.2
create table Branch_Master(Branch_Id int primary key,
Branch_Name varchar(30),
Branch_IFSC  varchar(11) unique,
Bank_ID int foreign key references Bank_Master(Bank_ID))


-- 2.3
create table Employee_Master(Emp_No int primary key,
Branch_IFSC varchar(11) foreign key references Branch_Master(Branch_IFSC),
Emp_FullName varchar(30), Emp_Designation varchar(25),
Emp_Manager_No bigint,
Emp_Salary float)


-- 2.4
create table Customer_Master (Cust_ID int primary key, Cust_FullName varchar(30),
Cust_DOB date, Cust_Address varchar(80),
Cust_MobileNo bigint, Cust_EmailID varchar(30),
Cust_City varchar(20))


-- 2.5 
create table Account_Master (Acc_No bigint primary key,
Cust_ID int foreign key references Customer_Master(Cust_ID),
Acc_Type varchar (7),
Branch_IFSC varchar(11) foreign key references Branch_Master (Branch_IFSC),
constraint ch check (Acc_Type in ('SB','CR')))


-- 2.6
create table Transaction_Master (Tran_Id int primary key, 
Tran_Acc_No bigint foreign key references Account_Master(Acc_No),
Tran_Date datetime, Tran_Type varchar(7),
Tran_Amount_Debit_Credit varchar(6),
Tran_Amount float,
constraint c1 check(Tran_Type in ('CH','CQ', 'OL', 'RG')),
constraint c2 check (Tran_Amount_Debit_Credit in ('D','C')))


-- 3.1
insert into Bank_Master(Bank_Id,Bank_Name,Bank_ShortName)
values (101,'State Bank of India','SBI'),
	   (102,'Bank of India','BOI'),
	   (103,'Bank of Baroda','BOB'),
	   (104,'Punjab National Bank','PNB'),
	   (105,'Central Bank of India','CBI')


-- 3.2
insert into Branch_Master(Branch_Id,Branch_Name,Branch_IFSC,Bank_Id)
values (201,'Green Chowk, Morbi', 'SBI101MB201', 101),
	   (202,'Lati Plot, Morbi', 'CBI105MB202', 105),
	   (203,'Ravapar Road, Morbi', 'BOI102MB203 ', 102),
	   (204,'Kalawad Road, Rajkot', 'PNB104RJ204 ', 104),
	   (205,'Nanavati Chowk, Rajkot', 'BOB103RJ205 ', 103),
	   (206,'Lal Darwaja, Ahemdabad', 'BOB103AM206 ', 103),
	   (207,'Zanjar Cinema Road, Wankaner', 'PNB104WK207 ', 104),
	   (208,'AksharDham Road, Ahemdabad', 'CBI105AM208 ', 105),
	   (209,'Maharana Pratap Circle, Morbi', 'PNB104MB209 ', 104),
	   (210,'Race Course Ring Road, Rajkot', 'SBI101RJ210 ', 101)


-- 3.3
insert into Employee_Master(Emp_No,Branch_IFSC,Emp_FullName,Emp_Designation,Emp_Manager_No,Emp_Salary)
values (301, 'SBI101MB201', 'Shashikant Das', 'Bank Manager', 9876543210, 250000),
	   (302, 'BOI102MB203', 'Dinesh Khara', 'Bank Manager', 8765432109, 45000),
	   (303, 'BOB103AM206', 'Nirav Modi', 'Loan Officer', 7654321098, 36500),
	   (304, 'CBI105AM208', 'Lalit Modi', 'Loan Officer', 6543210987, 70000),
	   (305, 'PNB104MB209', 'P.V. Sindhu', 'Credit Analyst', 5432109876, 65300),
	   (306, 'SBI101RJ210', 'Shikha Sharma', 'Credit Analyst', 4321098765, 56700),
	   (307, 'CBI105AM208', 'Archana Bhargav', 'Audit Officer', 3210987654, 60000),
	   (308, 'BOB103AM206', 'Arundhati Bhatt', 'Audit Officer', 2109876543, 55000),
	   (309, 'SBI101RJ210', 'kalpana Moria', 'Finance Manager', 1098765432, 62500),
	   (310, 'CBI105AM208', 'Atul Goel', 'Finance Manager', 9876543201, 54000)

-- 3.4
insert into Customer_Master(Cust_Id,Cust_FullName,Cust_DOB,Cust_Address,Cust_MobileNo,Cust_EmailID,Cust_City)
values (401,'C N Kanani','1985-08-20','Milap Nagar,University Road',2134567890,'cnk@gmail.com','Gandhinagar'),
	   (402,'A N Siddhpura','1987-10-15','Royal Park,Ravapar road',1243567890,'ans@gmail.com','Ahemdabad'),
	   (403,'V K Makwana','1987-07-04','150 Feet Ring Road',1234567890,'vkm@gmail.com','Ahemdabad'),
	   (404,'H K Vyas','1990-12-10','Madhapar Circle',1234567809,'hkv@gmail.com','Rajkot'),
	   (405,'K B Bhalodia','1996-03-25','Nanavati Chowk',1234568790,'kbb@gmail.com','Rajkot'),
	   (406,'N H Patel','1990-06-13','Ayodhya Chwok',1234567980,'nhp@gmail.com','Baroda'),
	   (407,'T D Solanki','1996-10-25','Bhaktinagar Circle',9314567820,'tds@gmail.com','Baroda'),
	   (408,'N H Ahuja','1994-09-15','Seth Nagar Road',1234567089,'nha@gmail.com','Jamnagar'),
	   (409,'B K Chattrala','1995-07-02','Trikon Baug',1234568710,'bkc@gmail.com','Jamnagar'),
	   (410,'A B Pandya','2000-08-20','Sanala Road',1432567890,'abp@gmail.com','Morbi')
	   

-- 3.5 
insert into  Account_Master(Acc_No,Cust_Id,Acc_Type,Branch_IFSC)
values (501,401,'SB','CBI105AM208'),
	   (502,402,'SB','CBI105AM208'),
	   (503,403,'SB','BOB103AM206'),
	   (504,404,'CR','BOB103RJ205'),
	   (505,405,'SB','SBI101RJ210'),
	   (506,406,'CR','BOB103AM206'),
	   (507,407,'CR','BOB103AM206'),
	   (508,408,'SB','PNB104RJ204'),
	   (509,409,'CR','SBI101RJ210'),
	   (510,410,'SB','SBI101MB201')
	   

-- 3.6
insert into Transaction_Master(Tran_Id,Tran_Acc_No,Tran_Date,Tran_Type,Tran_Amount_Debit_Credit,Tran_Amount)
values (601,501,'2022-11-22 00:00:00.000','CH','C',500000),
	   (602,503,'2018-10-15 00:00:00.000','CQ','D',25020),
	   (603,506,'2017-12-01 00:00:00.000','OL','C',200000),
	   (604,510,'2021-03-03 00:00:00.000','RG','D',25000),
	   (605,504,'2021-11-10 00:00:00.000','CH','C',65000),
	   (606,502,'2022-05-15 00:00:00.000','CQ','C',24571),
	   (607,509,'2020-01-26 00:00:00.000','OL','C',69704),
	   (608,507,'2009-07-04 00:00:00.000','RG','D',30000),
	   (609,508,'2015-10-16 00:00:00.000','CH','D',70050),
	   (610,505,'2022-08-20 00:00:00.000','CQ','C',26320)