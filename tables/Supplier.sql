CREATE TABLE Supplier
(
    SupplierID INT IDENTITY(1,1) PRIMARY KEY,
    SupplierName NVARCHAR(100) NOT NULL,
    SupplierPhone CHAR(12) NOT NULL
);
