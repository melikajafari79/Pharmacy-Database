CREATE TABLE PrescriptionDrug
(
    PrescriptionID INT NOT NULL,
    DrugID INT NOT NULL,
    Quantity INT NOT NULL,

    CONSTRAINT PK_PrescriptionDrug
        PRIMARY KEY (PrescriptionID, DrugID),

    CONSTRAINT FK_PD_Prescription
        FOREIGN KEY (PrescriptionID) REFERENCES Prescription(PrescriptionID),

    CONSTRAINT FK_PD_Drug
        FOREIGN KEY (DrugID) REFERENCES Drug(DrugID)
);