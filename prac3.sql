--Lab-3--

--1--
DECLARE @NUMBER INT;
SET @NUMBER = 10 ;

IF(@NUMBER > 0)
	BEGIN
	PRINT CONCAT (@NUMBER, ' IS POSITIVE');
	END
ELSE
	BEGIN
	PRINT CONCAT (@NUMBER, ' IS NEGATIVE');
	END

--2--

DECLARE @NUM1 INT = 20;
DECLARE @NUM2 INT = 10;

IF (@NUM1 > @NUM2)
	BEGIN
	PRINT CONCAT (@NUM1, ' IS GREATER');
	END
ELSE
	BEGIN
	PRINT CONCAT (@NUM2, ' IS GREATER');
	END

--3--
DECLARE @NUM1 INT = 20;
DECLARE @NUM2 INT = 50;
DECLARE @NUM3 INT = 30;

IF (@NUM1 > @NUM2 AND @NUM1 > @NUM3)
	BEGIN
	PRINT CONCAT (@NUM1, ' IS GREATER');
	END
ELSE IF (@NUM2 > @NUM3)
	BEGIN
	PRINT CONCAT (@NUM2, ' IS GREATER');
	END
ELSE
	BEGIN
	PRINT CONCAT (@NUM3, ' IS GREATER');
	END


--4--

DECLARE @I INT = 1;

WHILE (@I <= 25)
	BEGIN
	PRINT @I;
	SET @I = @I + 1;
	END


--5--

DECLARE @I INT = 1;

WHILE (@I <= 100)
	BEGIN
	IF(@I%2 = 1)
	PRINT @I;
	SET @I  = @I + 1;
	END

--6--

DECLARE @I INT = 1;
DECLARE @SUM INT = 0;

WHILE (@I <= 100)
	BEGIN
	SET @SUM = @SUM + @I;
	SET @I = @I + 1;
	END
	PRINT @SUM;

--7--
DECLARE @NUM INT = 10;

IF (@NUM % 2 =0)
	BEGIN
	PRINT CONCAT (@NUM, ' IS EVEN');
	END
ELSE
	BEGIN
	PRINT CONCAT (@NUM, ' IS ODD');
	END

--8--

DECLARE @I INT = 25;

WHILE ( @I >= 1)
	BEGIN
	IF(@I % 2 = 1)
	PRINT @I;
	SET @I = @I - 1;
	END


--9--

DECLARE @MARKS INT = 36;

IF (@MARKS > 70)
	BEGIN
	PRINT ('1ST CLASS');
	END
ELSE IF (@MARKS <= 70 AND @MARKS >= 50)
	BEGIN
	PRINT ('2ST CLASS');
	END
ELSE IF (@MARKS >= 35 AND @MARKS <= 50)
	BEGIN
	PRINT ('3ST CLASS');
	END
ELSE
	BEGIN
	PRINT ('FAIL');
	END