--create database InsuranceDB;
--drop table login
--drop table UserDetails
--drop table Policy
--drop table PaymentDetails

---login Table

CREATE TABLE Login (
    
	 UserID INT  PRIMARY KEY,
    Username VARCHAR(255) NOT NULL unique,
    Password VARCHAR(255)not null ,
	
);

insert into Login(UserID,Username,password) values
(1,'lavanya@gmail.com','Lava@123'),
(2,'shifana@gmail.com','Shifana@123')

select * from Login;

---userdetails  table

CREATE TABLE UserDetails (
   UserID INT not null,
    FirstName VARCHAR(255) not null,
    LastName VARCHAR(255) not null,
    Email VARCHAR(255) not null ,
    Phone VARCHAR(20) not null,
    Address VARCHAR(255) not null,
	PolicyID Int not null,
	FOREIGN KEY (PolicyID) REFERENCES Policy(PolicyID),
	FOREIGN KEY (UserID) REFERENCES Login(UserID)
);
INSERT INTO UserDetails (UserID, FirstName, LastName, Email, Phone, Address, PolicyID)
VALUES 
    (1, 'Lavanya', 'Murugesan', 'lavanya@gmail.com', '1234567890', '123 Main St', 1),
    (1, 'Lavanya', 'Murugesan', 'lavanya@gmail.com', '1234567890', '123 Main St', 3),
    (2, 'Shifana', 'Rifath', 'shifana@gmail.com', '9876543210', '456 Elm St', 2),
    (2, 'Shifana', 'Rifath', 'shifana@gmail.com', '9876543210', '456 Elm St', 3);


select * from UserDetails;


---policy table

CREATE TABLE Policy (
    PolicyID INT PRIMARY KEY,
    PolicyNumber VARCHAR(50) NOT NULL unique,
    PolicyType VARCHAR(100) not null,
    InsuranceCompany VARCHAR(255) not null,
    StartDate DATE not null,
    EndDate DATE not null,
    PremiumAmount DECIMAL(10, 2) not null
)

INSERT INTO Policy (PolicyID, PolicyNumber, PolicyType, InsuranceCompany, StartDate, EndDate, PremiumAmount)
VALUES 
    (1, 'POL001', 'Life Insurance', 'Life Insurance Ltd', '2024-01-01', '2025-01-01', 1000.00),
    (2, 'POL002', 'Health Insurance', 'Health Care Insurance', '2024-02-01', '2025-02-01', 800.00),
    (3, 'POL003', 'Car Insurance', 'Car Insurance Ltd', '2024-03-01', '2025-03-01', 500.00),
	(4, 'POL004', 'Home Insurance', 'Home Insurance Co.', '2024-04-01', '2025-04-01', 1200.00),
    (5, 'POL005', 'Travel Insurance', 'Travel Insurance Ltd.', '2024-05-01', '2025-05-01', 600.00),
    (6, 'POL006', 'Pet Insurance', 'Pet Care Insurance', '2024-06-01', '2025-06-01', 400.00);


select * from Policy

---payment details

CREATE TABLE PaymentDetails (
    PaymentDetailId INT PRIMARY KEY IDENTITY,
    CardOwnerName NVARCHAR(100) NOT NULL,
    CardNumber NVARCHAR(16) NOT NULL UNIQUE,
    ExpirationDate NVARCHAR(5) NOT NULL,
    SecurityCode NVARCHAR(3) NOT NULL
);

select * from PaymentDetails;



