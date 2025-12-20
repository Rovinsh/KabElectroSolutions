CREATE TABLE ClaimClosedWithOrWithoutRepairDetails
(
    Id INT IDENTITY(1,1) PRIMARY KEY,

    ClaimId INT NOT NULL,

    ClaimType NVARCHAR(100) NOT NULL,

    Remarks NVARCHAR(100) NOT NULL,
    JobSheetFileName NVARCHAR(255) NOT NULL,
    JobSheetImage VARBINARY(MAX) NOT NULL,

    AdditionalFileName NVARCHAR(255) NULL,
    AdditionalImage VARBINARY(MAX) NULL,
    CustomerSatisfactionFileName NVARCHAR(255) NOT NULL,
    CustomerSatisfactionImage VARBINARY(MAX) NOT NULL,
    CreatedBy INT NULL,
    CreatedOn DATETIME2 NOT NULL DEFAULT GETDATE()
);
