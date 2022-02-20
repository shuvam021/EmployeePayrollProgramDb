--UC: 1 Create DATABASE
DROP DATABASE Employee;
CREATE DATABASE Employee;
USE Employee;

-- UC: 2 Create TABLE
CREATE TABLE payroll(
	Id int IDENTITY(1,1) PRIMARY KEY,
	Name varchar(200),
	Salary float,
	StartDate DATE
);

DROP TABLE payroll;

-- UC: 3 Insert records into table/[C]reate
INSERT INTO payroll VALUES('John', 150000, '02-14-2022');
INSERT INTO payroll (Name, Salary, StartDate)
	VALUES('Jane', 125000, '02-14-2022'),
			('Jack', 70000, '02-14-2022'),
			('Jill', 90000, '02-14-2022');

-- UC: 4 Read from table/[R]etrieve
SELECT * from payroll;
SELECT * from payroll WHERE Name='John' OR Name='Jack';
SELECT * from payroll WHERE Name='JOHN';
SELECT * from payroll WHERE Name='john';

SELECT * from payroll WHERE StartDate BETWEEN CAST('2022-02-14' as date) and GETDATE();

-- UC: 5 update table/[U]pdate
ALTER TABLE payroll ADD Gender Char(1);

UPDATE payroll SET Gender='M';
UPDATE payroll SET Gender='F' WHERE Id=2 or Id=4;

-- UC: 6 remove records from table/[D]estroy
DELETE FROM payroll WHERE Id=5;

-- UC: 7 Aggregate Function
-- SUM()
SELECT SUM(Salary) FROM payroll;
SELECT SUM(Salary) as TotalSalary FROM payroll;
SELECT SUM(Salary) as TotalSalary FROM payroll GROUP BY Gender;
SELECT SUM(Salary) as TotalSalary,Gender FROM payroll GROUP BY Gender;
SELECT SUM(Salary) as TotalSalary FROM payroll WHERE Gender='F';

-- AVG()
SELECT AVG(Salary) as AvgSalary,Gender FROM payroll GROUP BY Gender;

-- MAX()
SELECT MAX(Salary) as MaxSalary,Gender FROM payroll GROUP BY Gender;

-- Count()
SELECT COUNT(Name) as NumOfEmp,Gender FROM payroll GROUP BY Gender;

-- UC8 Create address, department, phone, columns
ALTER TABLE payroll add Phone bigint;
ALTER TABLE payroll add Department varchar(200) not null DEFAULT 'HR';
ALTER TABLE payroll add Address varchar(200) DEFAULT 'Banglore';

UPDATE payroll SET Phone=7894561230, Department='Something', Address='Somewhere';
UPDATE payroll set Address='Delhi' WHERE Id = 2;
UPDATE payroll set Department='IT' WHERE Id IN(1,2);

-- UC9: Ability to extend employee_payroll table to have Basic Pay, Deductions, Taxable Pay, Income Tax, Net Pay
ALTER TABLE payroll add BasicPay bigint, Deductions bigint, TaxablePay bigint, IncomeTax bigint, NetPay bigint;

SELECT * from payroll;
