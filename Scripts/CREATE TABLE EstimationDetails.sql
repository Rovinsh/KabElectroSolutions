-- Main estimation table
CREATE TABLE EstimationDetails
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    ClaimId INT NOT NULL, -- mandatory
    ClaimType NVARCHAR(100) NOT NULL,
    Observation NVARCHAR(200) NOT NULL,
    Symptom NVARCHAR(200) NOT NULL,
    Type NVARCHAR(100) NOT NULL,
    Material NVARCHAR(100) NOT NULL,
    HSNCode NVARCHAR(50) NOT NULL,
    Price DECIMAL(18,2) NOT NULL,
    TaxPercent DECIMAL(5,2) NOT NULL,
    Remarks NVARCHAR(MAX) NULL,
    CreatedAt DATETIME2 DEFAULT GETDATE()
);

-- Images table
CREATE TABLE EstimationImages
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    EstimationId INT NOT NULL,
    ClaimId INT NOT NULL, -- for easy query by claim
    Image VARBINARY(MAX) NOT NULL,
    FileName NVARCHAR(255) NOT NULL,
    CreatedAt DATETIME2 DEFAULT GETDATE(),
    CONSTRAINT FK_EstimationImages_EstimationDetails FOREIGN KEY (EstimationId)
        REFERENCES EstimationDetails(Id) ON DELETE CASCADE
);
