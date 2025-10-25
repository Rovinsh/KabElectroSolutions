CREATE TABLE Warranties (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    SerialNumber BIGINT NOT NULL,
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
    CustomerName NVARCHAR(255),
    CustomerMobileNo NVARCHAR(20),
    CustomerEmail NVARCHAR(100),
    CustomerAddress NVARCHAR(MAX),
    CityId INT,
    StateId INT,
    PinCodeId INT,
    IsDisable BIT DEFAULT 1,

    -- Foreign Key Constraints
    CONSTRAINT FK_Warranties_WarrantyTypes FOREIGN KEY (WarrantyTypeId) REFERENCES WarrantyTypes(Id),
     CONSTRAINT FK_Warranties_locations FOREIGN KEY (StateId) REFERENCES locations(Id),
    CONSTRAINT FK_Warranties_Products FOREIGN KEY (ProductId) REFERENCES Plans(Id),
    CONSTRAINT FK_Warranties_Cities FOREIGN KEY (CityId) REFERENCES Cities(Id),
    CONSTRAINT FK_Warranties_Pincodes FOREIGN KEY (PinCodeId) REFERENCES Pincodes(Id)
);

 INSERT INTO Warranties (
    SerialNumber,
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
    CustomerName,
    CustomerMobileNo,
    CustomerEmail,
    CustomerAddress,
    CityId,
    StateId,
    PinCodeId,
    IsDisable
)
VALUES 
(
    1234567890,                     -- SerialNumber
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
    N'John Doe',                    -- CustomerName
    N'9123456789',                  -- CustomerMobileNo
    N'john.doe@example.com',        -- CustomerEmail
    N'123 Tech Street, Block A',    -- CustomerAddress
    1,                            -- CustomerCityId (FK)
    1,                            -- CustomerStateId (FK)
    1,                      -- CustomerPinCode
    1                               -- IsDisable
),
(
    1234567890,                     -- SerialNumber
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
    N'John Doe',                    -- CustomerName
    N'9123456789',                  -- CustomerMobileNo
    N'john.doe@example.com',        -- CustomerEmail
    N'123 Tech Street, Block A',    -- CustomerAddress
    1,                            -- CustomerCityId (FK)
    3,                            -- CustomerStateId (FK)
   1,                      -- CustomerPinCode
    1                               -- IsDisable
);


