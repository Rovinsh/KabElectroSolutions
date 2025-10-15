CREATE TABLE Warranties (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    IsZappEnable BIT DEFAULT 0,
    Status INT,
    SerialNumber BIGINT,
    RegionId INT,
    DisplayName NVARCHAR(255),
    PolicyId INT,
    RmId INT,
    ActivationCode NVARCHAR(50),
    Price DECIMAL(10, 2),
    ExtraInfo NVARCHAR(MAX),
    Duration INT,
    ProductExtraImage NVARCHAR(MAX),
    DiscrepancyReason NVARCHAR(MAX),
    StoreAssignedAt DATETIME,
    Active BIT DEFAULT 1,
    Verified BIT DEFAULT 1,
    DistributorAssignedAt DATETIME,
    WarrantyInvoiceNo NVARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    ProductId INT,
    Discrepants NVARCHAR(MAX), 
    PurchaseDate DATE,
    EndorsementNo NVARCHAR(100),
    Seller NVARCHAR(255),
    CouponCode NVARCHAR(100),
    CancellationAt DATETIME,
    CancellationDoneBy NVARCHAR(255),
    ScratchCode NVARCHAR(100),
    KitCoverage NVARCHAR(255),
    OemId INT,
    BrandWarrantyDuration INT,
    CancellationReason NVARCHAR(MAX),
    Type INT NOT NULL,
    Insured NVARCHAR(MAX), 
    CancellationRole NVARCHAR(100),
    CONSTRAINT FK_Warranties_WarrantyTypes FOREIGN KEY (Type) REFERENCES WarrantyTypes(Id)
);
 INSERT INTO Warranties (
    IsZappEnable,
    Status,
    SerialNumber,
    RegionId,
    DisplayName,
    PolicyId,
    RmId,
    ActivationCode,
    Price,
    ExtraInfo,
    Duration,
    ProductExtraImage,
    DiscrepancyReason,
    StoreAssignedAt,
    Active,
    Verified,
    DistributorAssignedAt,
    WarrantyInvoiceNo,
    StartDate,
    EndDate,
    ProductId,
    Discrepants,
    PurchaseDate,
    EndorsementNo,
    Seller,
    CouponCode,
    CancellationAt,
    CancellationDoneBy,
    ScratchCode,
    KitCoverage,
    OemId,
    BrandWarrantyDuration,
    CancellationReason,
    Type,
    Insured,
    CancellationRole
)
VALUES (
    0, -- IsZappEnable
    1, -- Status
    14614511, -- SerialNumber
    NULL, -- RegionId
    N'DEVICE SECURE GOLD', -- DisplayName
    NULL, -- PolicyId
    NULL, -- RmId
    N'CHS2187026', -- ActivationCode
    2499.00, -- Price
    NULL, -- ExtraInfo
    12, -- Duration
    N'{}', -- ProductExtraImage as JSON string
    NULL, -- DiscrepancyReason
    NULL, -- StoreAssignedAt
    1, -- Active
    1, -- Verified
    NULL, -- DistributorAssignedAt
    N'SLA219369900871/222864', -- WarrantyInvoiceNo
    '2025-04-18', -- StartDate
    '2026-04-17', -- EndDate
    NULL, -- ProductId
    N'[]', -- Discrepants as JSON array string
    '2025-04-18', -- PurchaseDate
    NULL, -- EndorsementNo
    NULL, -- Seller
    NULL, -- CouponCode
    NULL, -- CancellationAt
    NULL, -- CancellationDoneBy
    NULL, -- ScratchCode
    NULL, -- KitCoverage
    NULL, -- OemId
    NULL, -- BrandWarrantyDuration
    NULL, -- CancellationReason
    21, -- Type (foreign key from WarrantyTypes)
    N'{}', -- Insured as JSON string
    NULL  -- CancellationRole
);
