CREATE TABLE Warranties (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    SerialNumber BIGINT NOT NULL,
    WarrantyType NVARCHAR(255),
    WarrantyTypeId INT,
    WarrantyDisplayName NVARCHAR(255),
    WarrantyCode NVARCHAR(100),
    WarrantyPrice DECIMAL(10, 2) NOT NULL,
    WarrantyDuration INT NOT NULL,
    WarrantyStartDate DATE,
    WarrantyEndDate DATE,
    WarrantyInvoiceNo NVARCHAR(100),
    WarrantyPurchaseDate DATE,
    WarrantySeller NVARCHAR(255),
    WarrantyCouponCode NVARCHAR(100),
    WarrantyScratchCode NVARCHAR(100),
    WarrantyExtraInfo NVARCHAR(MAX),
    WarrantyDescription NVARCHAR(MAX),
    WarrantyCreatedBy NVARCHAR(255),
    ProductId INT,
    ProductName NVARCHAR(255),
    CustomerName NVARCHAR(255),
    CustomerMobileNo NVARCHAR(20),
    CustomerEmail NVARCHAR(100),
    CustomerAddress NVARCHAR(MAX),
    CustomerCityId INT,
    CustomerCityName NVARCHAR(100),
    CustomerStateId INT,
    CustomerStateName NVARCHAR(100),
    CustomerPinCode NVARCHAR(10),
    IsDisable BIT DEFAULT 1,

    -- Foreign Key Constraints
    CONSTRAINT FK_Warranties_WarrantyTypes FOREIGN KEY (WarrantyTypeId) REFERENCES WarrantyTypes(Id),
    CONSTRAINT FK_Warranties_Products FOREIGN KEY (ProductId) REFERENCES Plans(Id),
    CONSTRAINT FK_Warranties_Cities FOREIGN KEY (CustomerCityId) REFERENCES Cities(Id)
);

 INSERT INTO Warranties (
    SerialNumber,
    WarrantyType,
    WarrantyTypeId,
    WarrantyDisplayName,
    WarrantyCode,
    WarrantyPrice,
    WarrantyDuration,
    WarrantyStartDate,
    WarrantyEndDate,
    WarrantyInvoiceNo,
    WarrantyPurchaseDate,
    WarrantySeller,
    WarrantyCouponCode,
    WarrantyScratchCode,
    WarrantyExtraInfo,
    WarrantyDescription,
    WarrantyCreatedBy,
    ProductId,
    ProductName,
    CustomerName,
    CustomerMobileNo,
    CustomerEmail,
    CustomerAddress,
    CustomerCityId,
    CustomerCityName,
    CustomerStateId,
    CustomerStateName,
    CustomerPinCode,
    IsDisable
)
VALUES 
(
    1234567890,                     -- SerialNumber
    N'Extended Warranty',           -- WarrantyType
    1,                              -- WarrantyTypeId (FK)
    N'Device Secure Gold',          -- WarrantyDisplayName
    N'WRTY10001',                   -- WarrantyCode
    1999.99,                        -- WarrantyPrice
    12,                             -- WarrantyDuration (months)
    '2025-01-01',                   -- WarrantyStartDate
    '2026-01-01',                   -- WarrantyEndDate
    N'INV10001',                    -- WarrantyInvoiceNo
    '2024-12-15',                   -- WarrantyPurchaseDate
    N'ABC Electronics',             -- WarrantySeller
    N'DIWALI100',                   -- WarrantyCouponCode
    N'SC10001',                     -- WarrantyScratchCode
    N'{}',                          -- WarrantyExtraInfo (JSON)
    N'1 year coverage against damage', -- WarrantyDescription
    N'AdminUser',                   -- WarrantyCreatedBy
   1,                            -- ProductId (FK)
    N'Samsung Galaxy S21',         -- ProductName
    N'John Doe',                    -- CustomerName
    N'9123456789',                  -- CustomerMobileNo
    N'john.doe@example.com',        -- CustomerEmail
    N'123 Tech Street, Block A',    -- CustomerAddress
    201,                            -- CustomerCityId (FK)
    N'Tech City',                   -- CustomerCityName
    301,                            -- CustomerStateId (FK)
    N'Tech State',                  -- CustomerStateName
    N'560001',                      -- CustomerPinCode
    1                               -- IsDisable
),
(
    9876543210,
    N'Standard Warranty',
    2,
    N'Device Secure Silver',
    N'WRTY10002',
    999.50,
    6,
    '2025-05-01',
    '2025-11-01',
    N'INV10002',
    '2025-04-20',
    N'Mobile World',
    NULL,
    NULL,
    N'{ "notes": "Includes screen damage" }',
    N'6 months basic coverage',
    N'SupportUser',
    2,
    N'Xiaomi Redmi Note 12',
    N'Jane Smith',
    N'9123456789',
    N'john.doe@example.com',
    N'456 Main Road, Apt 5B',
    202,
    N'Mobile City',
    302,
    N'Mobile State',
    N'600002',
    1
);
