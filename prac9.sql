--. Write T - SQL block to perform Static cursor--

create table tech_company (ID int, CEO_Name varchar(50), Salary int, Company_Name varchar(50));

insert into tech_company values(101, 'BabaBeechare', 25000, 'Bhaichara ltd'),
								(102, 'Mukesh Ambani', 90000, 'Jio ltd'),
								(103, 'Nita Ambani', 100000, 'Mukesh ltd'),
								(104, 'Anant Ambani', 25800, 'Nita ltd'),
								(105, 'Tata Birla Ambani', 69600, 'Adani ltd');

select * from tech_company

--1--

DECLARE @id INT, @name VARCHAR(50), @salary INT;
DECLARE cur_emp CURSOR
STATIC
FOR SELECT ID, CEO_Name, Salary FROM tech_company;
OPEN cur_emp
	IF @@CURSOR_ROWS > 0
	BEGIN
		FETCH NEXT FROM cur_emp INTO @id, @name, @salary;
		WHILE @@FETCH_STATUS = 0
		BEGIN
			PRINT CONCAT ('ID: ', @ID,'Name:', @name, 'Salary:', @salary);
			FETCH NEXT FROM cur_emp INTO @id, @name, @salary;
		END
	END
CLOSE cur_emp
DEALLOCATE cur_emp

--2--



DECLARE @FirstID INT,
        @FirstCEO_Name VARCHAR(50),
        @FirstSalary INT,
        @FirstCompany_Name VARCHAR(50);

DECLARE @LastID INT,
        @LastCEO_Name VARCHAR(50),
        @LastSalary INT,
        @LastCompany_Name VARCHAR(50);

DECLARE company_cursor CURSOR STATIC FOR
SELECT ID, CEO_Name, Salary, Company_Name
FROM tech_company
ORDER BY ID; 

OPEN company_cursor;

FETCH FIRST FROM company_cursor INTO @FirstID, @FirstCEO_Name, @FirstSalary, @FirstCompany_Name;


    PRINT 'First Row:';
    PRINT 'ID: ' + CAST(@FirstID AS NVARCHAR) +
          ', CEO_Name: ' + @FirstCEO_Name +
          ', Salary: ' + CAST(@FirstSalary AS NVARCHAR) +
          ', Company_Name: ' + @FirstCompany_Name;
FETCH LAST FROM company_cursor INTO @LastID, @LastCEO_Name, @LastSalary, @LastCompany_Name;
    PRINT 'Last Row:';
    PRINT 'ID: ' + CAST(@LastID AS NVARCHAR) +
          ', CEO_Name: ' + @LastCEO_Name +
          ', Salary: ' + CAST(@LastSalary AS NVARCHAR) +
          ', Company_Name: ' + @LastCompany_Name;

CLOSE company_cursor;
DEALLOCATE company_cursor;



--3--
'NOT POSSIBLE'



DECLARE @ID INT;
DECLARE @CEO_Name VARCHAR(50);
DECLARE @Salary INT;
DECLARE @Company_Name VARCHAR(50);

DECLARE tech_cursor  CURSOR 
STATIC FOR
SELECT ID, CEO_Name, Salary, Company_Name
FROM tech_company;

OPEN tech_cursor;

FETCH NEXT FROM tech_cursor INTO @ID, @CEO_Name, @Salary, @Company_Name;

WHILE @@FETCH_STATUS = 0
BEGIN
   
        UPDATE tech_company
        SET Salary = Salary + 5000  
        WHERE CURRENT of tech_cursor

    FETCH NEXT FROM tech_cursor INTO @ID, @CEO_Name, @Salary, @Company_Name;
END

CLOSE tech_cursor;

DEALLOCATE tech_cursor;

--this is where the static cursor updates--

DECLARE @ID INT;
DECLARE @CEO_Name VARCHAR(50);
DECLARE @Salary INT;
DECLARE @Company_Name VARCHAR(50);

DECLARE tech_cursor  CURSOR STATIC FOR
SELECT ID, CEO_Name, Salary, Company_Name
FROM tech_company;

OPEN tech_cursor;

FETCH NEXT FROM tech_cursor INTO @ID, @CEO_Name, @Salary, @Company_Name;

WHILE @@FETCH_STATUS = 0
BEGIN
    IF @CEO_Name = 'Mukesh Ambani'
    BEGIN
        UPDATE tech_company
        SET Salary = Salary + 5000  
        WHERE ID = @ID;
    END

    FETCH NEXT FROM tech_cursor INTO @ID, @CEO_Name, @Salary, @Company_Name;
END

CLOSE tech_cursor;

DEALLOCATE tech_cursor;


--asdasd--
select * from tech_company
