CREATE TABLE Prescription
(
    PrescriptionID INT IDENTITY(1,1) PRIMARY KEY,
    DoctorID INT NOT NULL,
    CustomerID INT NOT NULL,
    PrescriptionDate DATE NOT NULL,

    CONSTRAINT FK_Prescription_Doctor
        FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),

    CONSTRAINT FK_Prescription_Customer
        FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);