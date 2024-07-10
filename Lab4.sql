﻿--1. Create a simple view Bank_View which contains only Bank_ID and Bank_Name (A)--
SELECT a.Acc_No, a.Cust_ID, b.Branch_Name, c.Bank_Name
FROM Account_Master a
INNER JOIN Branch_Master b ON a.Branch_IFSC = b.Branch_IFSC
INNER JOIN Bank_Master c ON b.Bank_ID = c.Bank_ID;

SELECT * FROM Acc_Details_View;

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

-- 6. Create Synonym T_Master for Transaction_Master. (A)

---13. Drop the Employee_Master table sequence and try to insert data using sequence.
DROP SEQUENCE Emp_No_Sequence;

INSERT INTO Employee_Master (Emp_No, Emp_Name)
VALUES (Emp_No_Sequence.NEXTVALUE, 'Jane Doe');