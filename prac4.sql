
--1--
--Create a simple view Bank_View which contains only Bank_ID and Bank_Name (A)--

create view Bank_View 
as
select Bank_Id, Bank_Name from Bank_Master

--2--

--Create a simple view Customer_View which contains Cust_FullName, Cust_MobileNo,Cust_EmailID--

CREATE VIEW Customer_View
AS
SELECT Cust_FullName, Cust_MobileNo, Cust_EmailID FROM Customer_Master

--3--
--Create a complex view that contains Acc_No, Cust_ID, Branch_Name, Bank_Name--
CREATE VIEW COMPLEX_VIEW
AS
SELECT Acc_No, Cust_ID, Branch_Name, Bank_Name
FROM
Account_Master AM INNER JOIN Branch_Master BM ON AM.Branch_IFSC = BM.Branch_IFSC
INNER JOIN Bank_Master BM2 ON BM.Bank_ID = BM2.Bank_Id

SELECT * FROM COMPLEX_VIEW



--4--
--Create a simple view with Check Option Cust_View which contains Cust_FullName,Cust_City--


CREATE VIEW Cust_View
AS
SELECT Cust_FullName, Cust_City FROM Customer_Master
WHERE Cust_City = 'Rajkot' WITH CHECK OPTION


SELECT * FROM Cust_View

--5--
--	Create a sequence on the following table’s listed columns
--Bank_Master → Bank_ID, Branch_Master → Branch_ID, Employee_Master → Emp_No --
--5.1--
CREATE SEQUENCE BM_SEQ
AS INT
START WITH 101
INCREMENT BY 1
MAXVALUE 105
MINVALUE 101
CYCLE

SELECT NEXT VALUE FOR BM_SEQ
--5.2--
CREATE SEQUENCE BRANCH_MASTER_SEQ
AS INT
START WITH 201
INCREMENT BY 1
MAXVALUE 210
MINVALUE 201
CYCLE

SELECT NEXT VALUE FOR BRANCH_MASTER_SEQ

--5.3--
CREATE SEQUENCE EMP_MASTER_SEQ
AS INT
START WITH 301
INCREMENT BY 1
MAXVALUE 310
MINVALUE 301
CYCLE

SELECT NEXT VALUE FOR EMP_MASTER_SEQ


--6--
--Create Synonym T_Master for Transaction_Master.--

CREATE SYNONYM T_MASTER FOR Transaction_Master


--7--
--Create a simple view Tr_View which contains Tran_ID, Tras_Acc_No those whose Tran_Type is Online.

CREATE VIEW Tr_View
AS
SELECT Tran_Id, Tran_Acc_No FROM Transaction_Master
WHERE Tran_Type = 'OL' WITH CHECK OPTION

SELECT * FROM Tr_View

--8--

--Create whole view of the Custome_Master table with check option for customer city = ‘Rajkot’ and insert data using view

CREATE VIEW Cust_Mas
AS 
SELECT * FROM Customer_Master
WHERE Cust_City = 'Rajkot'

SELECT * FROM Cust_Mas

INSERT INTO Cust_Mas(Cust_ID,Cust_FullName,Cust_DOB,Cust_Address,Cust_MobileNo,Cust_EmailID,Cust_City)
VALUES(411, 'M D Ambani', '1957-04-19', 'Antilla Mumbai', 9922558865, 'mda@jio.com', 'Mumbai');


--9--
--Create a one Table and create sequence for which contain start from 101 increment by 5 and maximum value is 120, minimum value is 100 and restart cycle after reach on maximum value.

CREATE TABLE stq_table(
		EN_NO BIGINT,
		ROLL_NO INT
);

CREATE SEQUENCE stq_seq
AS INT
START WITH 101
INCREMENT BY 1
MAXVALUE 150
MINVALUE 101
CYCLE


INSERT INTO stq_table
VALUES
(NEXT VALUE FOR stq_seq, 201)

SELECT * FROM stq_table





SELECT * FROM Customer_Master
SELECT * FROM Transaction_Master
SELECT * FROM Account_Master
select * from Branch_Master
SELECT * FROM Bank_Master
SELECT * FROM Employee_Master