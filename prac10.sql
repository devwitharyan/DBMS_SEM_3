--1--

DECLARE Dynamic_cur_emp CURSOR DYNAMIC
FOR
SELECT ID FROM tech_company

OPEN Dynamic_cur_emp

DECLARE @id INT

FETCH NEXT FROM Dynamic_cur_emp INTO @id
WHILE @@FETCH_STATUS = 0
BEGIN
    IF @id = 103
    BEGIN
        UPDATE tech_company 
        SET Salary = 355500
        WHERE CURRENT OF Dynamic_cur_emp
    END
    FETCH NEXT FROM Dynamic_cur_emp INTO @id
END

SELECT * FROM tech_company

CLOSE Dynamic_cur_emp
DEALLOCATE Dynamic_cur_emp

--2--


DECLARE Dynamic_cur_emp CURSOR DYNAMIC
FOR
SELECT ID, CEO_Name, Salary, Company_Name FROM tech_company

OPEN Dynamic_cur_emp

DECLARE @id INT, @ceo_name VARCHAR(50), @salary INT, @company_name VARCHAR(50)

FETCH NEXT FROM Dynamic_cur_emp INTO @id, @ceo_name, @salary, @company_name

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'ID: ' + CAST(@id AS VARCHAR(10)) + ', CEO_Name: ' + @ceo_name + ', Salary: ' + CAST(@salary AS VARCHAR(10)) + ', Company_Name: ' + @company_name
    
    WAITFOR DELAY '00:00:05'

    FETCH NEXT FROM Dynamic_cur_emp INTO @id, @ceo_name, @salary, @company_name
END

CLOSE Dynamic_cur_emp
DEALLOCATE Dynamic_cur_emp