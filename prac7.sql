create database Aryan_Vala_118




CREATE TABLE DDL_LOG(
	LogId int identity(1,1) primary key,
	Event_Text xml,
	Event_Date datetime
)
--prac7--
--1--
--Create a DDL Trigger for CREATE event and display message of successful event. (A)--
CREATE TRIGGER ddl_1 
ON DATABASE 
FOR CREATE_TABLE
AS
BEGIN
 PRINT 'Succesfully created'
END
--2--
--Create a DDL Trigger for ALTER event and display message of successful event. (A)--
CREATE TRIGGER ddl_2 
ON DATABASE 
FOR ALTER_TABLE
AS
BEGIN
 PRINT 'Succesfully created'
END

--3--
--Create a DDL Trigger for DROP event and display message of successful event. (A)--
CREATE TRIGGER ddl_3 
ON DATABASE 
FOR DROP_TABLE
AS
BEGIN
 PRINT 'DROPED SUCCESS'
END

--4--

CREATE TRIGGER DDL_Log_Trigger
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
	INSERT INTO DDL_LOG(Event_Text, Event_Date)
	VALUES(EVENTDATA(), GETDATE())
END

select * from DDL_LOG

delete from DDL_LOG where LogId = 2
