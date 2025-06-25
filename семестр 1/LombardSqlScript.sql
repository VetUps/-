CREATE SCHEMA IF NOT EXISTS lombard;

USE lombard;

CREATE TABLE IF NOT EXISTS borrowers(
IdBorrower INT PRIMARY KEY AUTO_INCREMENT,
surname VARCHAR(45) NOT NULL,
borrowerName VARCHAR(45),
patronymic VARCHAR(45),
address VARCHAR(45),
birthDate DATETIME,
phoneNumber VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS goods(
IdGood INT PRIMARY KEY AUTO_INCREMENT,
minPrice DECIMAL NOT NULL,
maxPrice DECIMAL,
goodCondition ENUM("Подходит для продажи", "Не подходит для продажи") NOT NULL,
status ENUM("Собственность ломбарда", "Не собственность ломбарда") NOT NULL
);

CREATE TABLE IF NOT EXISTS employee(
IdEmployee INT PRIMARY KEY AUTO_INCREMENT,
surname VARCHAR(45) NOT NULL,
employeeName VARCHAR(45),
patronymic VARCHAR(45),
address VARCHAR(45),
birthDate DATETIME,
phoneNumber VARCHAR(45) NOT NULL,
commissionFees DECIMAL NOT NULL
);

CREATE TABLE IF NOT EXISTS cheque(
IdGood INT,
IdEmployee INT,
salePrice DECIMAL NOT NULL,
saleDate DATETIME,
PRIMARY KEY(IdGood, IdEmployee),
CONSTRAINT chequeIdGood FOREIGN KEY (IdGood) REFERENCES goods(IdGood),
CONSTRAINT chequeIdEmployee FOREIGN KEY (IdEmployee) REFERENCES employee(IdEmployee)
);

CREATE TABLE IF NOT EXISTS pledgeTicket(
IdBorrower INT,
IdGood INT,
IdEmployee INT,
dateOfLoan DATETIME,
dateOfLoanEnd DATETIME NOT NULL,
PRIMARY KEY(IdGood, IdEmployee, IdBorrower),
CONSTRAINT ticketIdBorrower FOREIGN KEY (IdBorrower) REFERENCES borrowers(IdBorrower),
CONSTRAINT ticketIdGood FOREIGN KEY (IdGood) REFERENCES goods(IdGood),
CONSTRAINT ticketIdEmployee FOREIGN KEY (IdEmployee) REFERENCES employee(IdEmployee)
);