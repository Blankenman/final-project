use dreamhomedb;

CREATE TABLE IF NOT EXISTS Branch(
BranchNo VARCHAR(4) NOT NULL,
street VARCHAR(60) NULL,
city VARCHAR(40) NULL,
postcode VARCHAR(20) NULL,
PRIMARY KEY(BranchNo));

CREATE TABLE IF NOT EXISTs Staff(
staffNo VARCHAR(4) NOT NULL,
Fname VARCHAR(20) NULL,
Lname VARCHAR(20) NULL,
positions VARCHAR(20) NULL,
sex VARCHAR(1) NULL,
DOB DATE NULL,
salary INT NOT NULL,
branchNo VARCHAR(4) NULL,

PRIMARY KEY(staffNo),
CONSTRAINT MIN_sal CHECK (Salary>=4000));

CREATE TABLE IF NOT EXISTS privateowner(
ownerNo VARCHAR(4) NOT NULL,
fName VARCHAR(20) NULL,
lName VARCHAR(40) NULL,
address VARCHAR(40) NULL,
telNo VARCHAR(20) NULL,
eMail VARCHAR(255) NULL,
passwords VARCHAR(20) NULL,
PRIMARY KEY(ownerNo));

CREATE TABLE IF NOT EXISTS PropertyForRent(
PropertyNo VARCHAR(4) NOT NULL,
street VARCHAR(40) NULL,
city VARCHAR(20) NULL,
postcode VARCHAR(20) NULL,
PropertyType VARCHAR(10) NULL,
rooms INT NOT NULL,
rent INT NOT NULL,
ownerNo VARCHAR(4) NULL,
staffNo VARCHAR(4),
branchNo VARCHAR(4) NULL,

PRIMARY KEY(PropertyNo),
CONSTRAINT Rent_min CHECK (rent>=200)
#FOREIGN KEY (ownerNo) REFERENCES privateowner(ownerNo) ON UPDATE CASCADE ON DELETE CASCADE,
#FOREIGN KEY (staffNo) REFERENCES staff (staffNo) ON UPDATE CASCADE ON DELETE CASCADE,
#FOREIGN KEY (branchNo) REFERENCES branch (branchNo) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS clients(
ClientNo VARCHAR(4) NOT NULL,
Fname VARCHAR(20) NULL,
Lname VARCHAR(20) NULL,
telNO VARCHAR(30) NULL,
prefType VARCHAR(10) NULL,
maxRent INT NULL,
eMail VARCHAR(255),
PRIMARY KEY(clientNo),
CONSTRAINT MaxRent_chk CHECK (maxRent >= 100))
;

CREATE TABLE IF NOT EXISTS viewing(
clientNo VARCHAR(4) NOT NULL,
propertNo VARCHAR(4) NULL,
viewDate VARCHAR(15) NULL,
comments VARCHAR(30) NULL);

CREATE TABLE IF NOT EXISTS Registration(
clientNo VARCHAR(4) NOT NULL,
branchNo VARCHAR(4) NOT NULL,
staffNo VARCHAR(4) NOT NULL,
dateJoined DATE NULL,
PRIMARY KEY(clientNo),
FOREIGN KEY branch_num(branchNo) REFERENCES branch (branchNo) ON UPDATE CASCADE ON DELETE CASCADE);

CREATE VIEW myview 
AS SELECT * FROM clients 
WHERE clientNo = ('CR76')
WITH CHECK OPTION;

CREATE VIEW sales_numbers
AS SELECT t.fName, t.ownerNo, s.rent
from privateowner t, propertyforrent s
where t.ownerNo = 'CR76'
WITH CHECK OPTION;

INSERT INTO branch
VALUES 
('B005', '22 Deer Rd', 'London', 'SW1 4EH'),
('B007', '16 Argyll St', 'Aberdeen', 'AB2 3SU'),
('B003', '163 Main St', 'Glasgow', 'G11 9QX'),
('B004', '32 Manse Rd', 'Bristol', 'Bs99 1NZ'),
('B002', '56 Clover Dr', 'London', 'NW10 6EU');

INSERT INTO staff
VALUES
('SL21', 'John', 'White', 'Manager', 'M', '1945-10-01', '30000', 'B005'),
('SL37', 'Ann', 'Beech', 'Assistant', 'F', '1960-11-10', '12000', 'B003'),
('SL14', 'David', 'Ford', 'Supervisor', 'M', '1958-03-24', '18000', 'B003'),
('SL09', 'Mary', 'Howe', 'Assistant', 'F', '1970-02-19', '9000', 'B007'),
('SL05', 'Susan', 'Brand', 'Manager', 'F', '1940-06-03', '24000', 'B003'),
('SL41', 'Julie', 'Lee', 'Assistant', 'F', '1965-06-13', '9000', 'B005');

INSERT INTO propertyforrent
VALUES 
('PA14', '16 Hollhead', 'Aberdeen', 'AB7 SSU', 'House', '6', '650', 'CO46', 'SA9', 'B007'),
('PL94', '6 Argyll St', 'London', 'NW2', 'Flat', '4', '400', 'CO87', 'SL41', 'B005'),
('PG4', '6 Lawrence St', 'Glassgow', 'G11 9QX', 'Flat', '3', '350', 'CO40', '', 'B003'),
('PG36', '2 Manor Rd', 'Glasgow', 'G32 4QX', 'Flat', '3', '375', 'CO93', 'SG37', 'B003'),
('PG21', '18 Dale Rd', 'Glasgow', 'G12', 'House', '5', '600', 'CO87', 'SG37', 'B003'),
('PG16', '5 Novar Dr', 'Glasgow', 'G12 9AX', 'Flat', '4', '450', 'CO93', 'SG14', 'B003')
;

INSERT INTO clients
VALUES 
('CR76', 'John', 'Kay', '0207-774-5632', 'Flat', 425, 'John.kay@gmail.com'),
('CR56', 'Aline', 'Stewart', '0141-848-1825', 'Flat', 350, 'astewart@hotmail.com'),
('CR74', 'Mike', 'Ritchie', '0147-539-2178', 'House', 750, 'mritchie01@yahoo.co.uk'),
('CR62', 'Mary', 'Tregear', '0122-419-6720', 'Flat', 600, 'maryt@hotmail.co.uk');

INSERT INTO privateowner
VALUES 
('CO46', 'Joe', 'Keogh', '2 Fergus Dr, Aberdeen AB2 75X', '910-915-6333', 'jkeogh@lhh.com', '12222222'),
('CO87', 'Carol', 'Farrel', '6 Achray St, Glasgow G32 9DX', '0141-357-7419', 'cfarrel@gamil.com', '1333333'),
('CO40', 'Tina', 'Murphy', '63 Well St, Glasgow G42', '0141-943-1728', 'tinam@hotmail.com', '14444444'),
('CO93', 'Tony', 'Shaw', '12 Park Pl, Glasgow G4 0QR', '0141-225-7025', 'tony.shaw@ark.com', '1555555');

INSERT INTO Viewing
VALUES
('CR56','PA14','2013-05-24','too small'),
('CR76','PG4','2013-04-15','too remote'),
('CR56','PG4','2013-05-13',''),
('CR56','PA14','2013-05-13','no dining room'),
('CR56','PG36','2013-04-13','');

INSERT INTO registration
VALUES
('CR76','B005','SL41','2013-01-02'),
('CR56','B003','SG37','2012-04-11'),
('CR74','B003','SG37','2011-11-11'),
('CR62','B007','SA9','2012-03-12');

Select * FROM clients;
Select * FROM myview;
select * from propertyforrent;
select * from sales_numbers;
drop table privateowner;
