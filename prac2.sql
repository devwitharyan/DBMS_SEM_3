--1. Display Employee number, name and branch name. (A)--

select Emp_No, Emp_FullName, Branch_Name 
from
Employee_Master empM inner join Branch_Master brM on empM.Branch_IFSC = brM.Branch_IFSC


--2. Display Account number, customer id, name and branch IFSC code using join.--


select Account_Master.Acc_No, Account_Master.Cust_ID, Customer_Master.Cust_FullName, Account_Master.Branch_IFSC 
from 
Account_Master inner join Customer_Master 
on Account_Master.Cust_ID = Customer_Master.Cust_ID


--3.Display Transaction ID, amount, account number, account type whose transaction type is Online. (A)

select Transaction_Master.Tran_Id, Transaction_Master.Tran_Amount, Account_Master.Acc_No, Account_Master.Acc_Type
from
Transaction_Master inner join Account_Master on Transaction_Master.Tran_Acc_No = Account_Master.Acc_No where Transaction_Master.Tran_Type = 'OL'


--4.Display Account number, type, transaction account number and amount using left outer join. (A)


select Account_Master.Acc_No, Account_Master.Acc_Type, Transaction_Master.Tran_Acc_No, Transaction_Master.Tran_Amount
from 
Account_Master left outer join Transaction_Master on Account_Master.Acc_No = Transaction_Master.Tran_Acc_No

--5. Display Account number, type, transaction account number and amount using right outer join. (A)

select Account_Master.Acc_No, Account_Master.Acc_Type, Transaction_Master.Tran_Acc_No, Transaction_Master.Tran_Amount
from 
Account_Master right outer join Transaction_Master on Account_Master.Acc_No = Transaction_Master.Tran_Acc_No

--6. Display customer name, mobile number who has highest transaction amount. (A)

select Cust_FullName, Cust_MobileNo
from Customer_Master where Cust_ID = 
	(select Cust_ID from Account_Master where Acc_No = 
		(select Tran_Acc_No from Transaction_Master where Tran_Amount =  
			(select Tran_Amount from Transaction_Master where Tran_Amount =  
				(select MAX(Tran_Amount) from Transaction_Master)
			)
		)
	)



--7. Display Branch name, IFSC and Bank ID who has lowest paying amount employee. (A)

select Branch_Name, Branch_IFSC, Bank_ID 
from Branch_Master 
where Branch_IFSC = 
	(select Branch_IFSC from Employee_Master where Emp_Salary =
		(select MIN(Emp_Salary) from Employee_Master)
	)


--8. Display the count of total designation of an employees. (A)


select Emp_Designation, COUNT(*) as Total_Designation from Employee_Master group by Emp_Designation


--9. Display the count of how many customers have saving account. (A)

select Acc_Type, COUNT(*) as Total_Acc_Type from Account_Master where Acc_Type = 'SB' group by Acc_Type


--10.  Display details of branch master branch name wise in descending order. (A)

select * from Branch_Master order by Branch_Name DESC

---temp--
select * from Account_Master
select * from Bank_Master
select * from Branch_Master
select * from Customer_Master
select * from Employee_Master
select * from Transaction_Master
---temp--