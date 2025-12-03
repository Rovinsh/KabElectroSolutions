CREATE TABLE ClaimImages (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    ClaimId INT NOT NULL,
    ImageType NVARCHAR(50) NOT NULL,   -- e.g. Estimation, SerialNumber, Others
    ImageData VARBINARY(MAX) NOT NULL,
    Remarks NVARCHAR(500) NULL,
    CreatedAt DATETIME2 NOT NULL DEFAULT GETDATE(),
    CreatedBy NVARCHAR(100) NOT NULL
);