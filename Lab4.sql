--1. Create a simple view Bank_View which contains only Bank_ID and Bank_Name (A)--create view or alter Bank_view as select Bank_id,Bank_name from Bank_Master;select * from Bank_view--2. Create a simple view Customer_View which contains Cust_FullName, Cust_MobileNo , Cust_EmailID (A)--Create view Customer_View as select Cust_FullName, Cust_MobileNo , Cust_EmailID from Customer_Masterselect * from Customer_View--3. Create a complex view that contains Acc_No, Cust_ID, Branch_Name, Bank_Name (A)--CREATE VIEW Acc_Details_View AS
SELECT a.Acc_No, a.Cust_ID, b.Branch_Name, c.Bank_Name
FROM Account_Master a
INNER JOIN Branch_Master b ON a.Branch_IFSC = b.Branch_IFSC
INNER JOIN Bank_Master c ON b.Bank_ID = c.Bank_ID;

SELECT * FROM Acc_Details_View;
select * from Acc_Details_view--4. Create a simple view with Check Option Cust_View which contains Cust_FullName, Cust_City (A)create view Cust_View as select Cust_FullName, Cust_City from Customer_Master with check optionselect * from Cust_View/*5. Create a sequence on the following table’s listed columns
Bank_Master → Bank_ID, Branch_Master → Branch_ID, Employee_Master → Emp_No*/
-- Bank_Master
CREATE SEQUENCE Bank_ID_Sequence
START WITH 110
INCREMENT BY 1
MINVALUE 110
MAXVALUE 120
CYCLE
CACHE 5;

SELECT NEXT VALUE FOR Bank_ID_Sequence;

-- Branch_Master
CREATE SEQUENCE Branch_ID_Sequence
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 999999999
NOCYCLE
CACHE 20;

SELECT NEXT VALUE FOR Branch_ID_Sequence;

-- Employee_Master
CREATE SEQUENCE Emp_No_Sequence
START WITH 100
INCREMENT BY 1
MINVALUE 100
MAXVALUE 120
CYCLE
CACHE 10;

SELECT NEXT VALUE FOR Emp_No_Sequence;


select next value for Bank_Master_id_2

-- 6. Create Synonym T_Master for Transaction_Master. (A)create Synonym T_master for Transaction_master select * from T_master--7. Create a simple view Tr_View which contains Tran_ID, Tras_Acc_No those whose Tran_Type is Online. (B)create view Tr_view as select Tran_ID, Tran_Acc_No from Transaction_Master where Tran_Type = 'OL'select * from Tr_view--8. Create whole view of the Custome_Master table with check option for customer city = ‘Rajkot’ and insert data using view. (B)create view cust_view1 as select * from Customer_Master where cust_city = 'Rajkot' with check optioninsert into cust_view1 --9. Create a one Table and create sequence for which contain start from 101 increment by 5 and maximum value is 120,--minimum value is 100 and restart cycle after reach on maximum value.create table new_table(	n1 int,)create sequence seq_new as int start with 101increment by 5 maxvalue 120minvalue 100cycleinsert into new_table values (next value for seq_new )select * from new_table--10. Insert one value into the Employee_Master table fetch next id from using sequence. insert into Employee_Master(Emp_No,Branch_IFSC,Emp_FullName,Emp_Designation,Emp_Manager_No,Emp_Salary)values(311,'CBI105AM208','Aakash Sidhpuraa','Bank head',7874766784,400000)select * from Employee_Master--11. Alter Tr_View that also contains Tran_Amount column. (C)alter  view Tr_view as select Tran_Amount from Transaction_Masterselect * from Tr_view--12. Drop the Customer_View. (C)DROP VIEW Customer_View;

---13. Drop the Employee_Master table sequence and try to insert data using sequence.
DROP SEQUENCE Emp_No_Sequence;

INSERT INTO Employee_Master (Emp_No, Emp_Name)
VALUES (Emp_No_Sequence.NEXTVALUE, 'Jane Doe');
