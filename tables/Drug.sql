CREATE TABLE Drug
(
    DrugID INT IDENTITY(1,1) PRIMARY KEY,
    DrugName NVARCHAR(100) NOT NULL,
    DrugType NVARCHAR(50) NOT NULL,
    ExpireDate DATE NOT NULL,
    SupplierID INT NOT NULL,

    CONSTRAINT FK_Drug_Supplier
        FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);
