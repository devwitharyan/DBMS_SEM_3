--Perform queries for SAVEPOINT, ROLLBACK and COMMIT commands on Customer_Master table.

create table Customer_Master2 (
	 Cust_Id int ,
	 Cust_FullName varchar(30),
	 Cust_DOB date,
	 Cust_Address varchar(80),
)

	begin tran Customer_Master2
	
	insert into Customer_Master2(Cust_Id,Cust_FullName,Cust_DOB,Cust_Address)
	  values(401, 'C N Kanani', '1985-08-20' ,'MilapNagar,UniversityRoad'),
			(402 ,'A N Siddhpura', '1987-10-15' ,'RoyalPark,Ravaparroad'),
			(403 ,'V K Makwana' ,'1987-07-04' ,'150 Feet RingRoad'),
			(404, 'H K Vyas', '1990-12-10' ,'Madhapar Circle' )

	SAVE TRAN INSERTINTO

	select * from Customer_Master2
	UPDATE Customer_Master2 SET Cust_FullName='S P Prasad' where Cust_Id = 401

	SAVE TRAN updt1

	select * from Customer_Master2
	delete from Customer_Master2 where Cust_Id = 404

	save tran del1

	select * from Customer_Master2
	rollback tran updt1;

	select * from Customer_Master2
	commit;
	select * from Customer_Master2

--Perform queries for SAVEPOINT, ROLLBACK and COMMIT commands on Transaction_Master table. 


create table Transaction_Master2(
	Tran_Id int ,
	Tran_Acc_No bigint ,
	Tran_Date datetime,
	Tran_Type varchar(7) ,
	Tran_Amount_Debit_Credit varchar(6), 
	Tran_Amount FLOAT
)
	begin tran Transaction_Master2

	insert into Transaction_Master2(Tran_Id,Tran_Acc_No,Tran_Date,Tran_Type,Tran_Amount_Debit_Credit,Tran_Amount)
	values(601, 501, '2022-11-22 00:00:00.000', 'CH', 'C', 500000),
			(602, 503, '2018-10-15 00:00:00.000', 'CQ', 'D', 25020),
			(603, 506, '2017-12-01 00:00:00.000', 'OL', 'C', 200000),
			(604, 510, '2021-03-03 00:00:00.000', 'RG', 'D', 25000),
			(605, 504, '2021-11-10 00:00:00.000', 'CH', 'C', 65000),
			(606, 502, '2022-05-15 00:00:00.000', 'CQ', 'C', 24571),
			(607, 509, '2020-01-26 00:00:00.000', 'OL', 'C', 69704),
			(608, 507, '2009-07-04 00:00:00.000', 'RG', 'D', 30000),
			(609, 508, '2015-10-16 00:00:00.000', 'CH', 'D', 70050),
			(610, 505, '2022-08-20 00:00:00.000', 'CQ', 'C', 26320)

		save tran insertinto

		select * from Transaction_Master2
		update Transaction_Master2 set Tran_Amount = 99 where Tran_Id = 601
		
		save tran upd1

		select * from Transaction_Master2
		delete from Transaction_Master2 where Tran_Id = 610

		save tran del1
		select * from Transaction_Master2

		rollback tran upd1;
		select * from Transaction_Master2

		commit;
		select * from Transaction_Master2