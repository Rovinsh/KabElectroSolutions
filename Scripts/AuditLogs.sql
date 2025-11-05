CREATE TABLE AuditLogs (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    EntityName NVARCHAR(100) NOT NULL,      -- e.g. 'Claim'
    EntityRecordId INT NOT NULL,            -- Generic record reference

    Status NVARCHAR(100) NOT NULL,
    PerformerName NVARCHAR(150) NOT NULL,
    Designation NVARCHAR(150) NULL,
    Timestamp DATETIME NOT NULL DEFAULT GETDATE(),
    Remarks NVARCHAR(500) NULL
);
