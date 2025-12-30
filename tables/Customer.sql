CREATE TABLE Customer
(
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    NationalCode CHAR(10) NOT NULL UNIQUE,
    CustomerName NVARCHAR(50) NOT NULL,
    CustomerFamily NVARCHAR(50) NOT NULL,
    CustomerPhone CHAR(12) NOT NULL,
);

ALTER TABLE Customer
ADD IsActive BIT DEFAULT 1;

SELECT * FROM Customer