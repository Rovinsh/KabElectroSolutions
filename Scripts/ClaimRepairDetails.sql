CREATE TABLE ClaimRepairDetails
(
    RepairId            INT IDENTITY(1,1) PRIMARY KEY,

    ClaimId             INT NOT NULL,

    RepairedAt          NVARCHAR(200) NOT NULL,   
    Reason              NVARCHAR(200) NULL,

    Remarks             NVARCHAR(800) NULL,

    ClosureDate         DATE NOT NULL,

    RepairedByUserId    INT NOT NULL, 

    CreatedAt           DATETIME2 NOT NULL DEFAULT GETDATE(),
    UpdatedAt           DATETIME2 NULL
);
