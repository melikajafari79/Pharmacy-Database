CREATE TABLE Payment
(
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    PrescriptionID INT NOT NULL,
    Amount INT NOT NULL,

    CONSTRAINT FK_Payment_Customer
        FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),

    CONSTRAINT FK_Payment_Prescription
        FOREIGN KEY (PrescriptionID) REFERENCES Prescription(PrescriptionID)
);