CREATE TABLE InvoiceDetails
(
    Id INT IDENTITY(1,1) PRIMARY KEY,

    -- Relation
    ClaimId INT NOT NULL,

    -- Invoice info
    InvoiceDate DATE NOT NULL,
    InvoiceNumber NVARCHAR(50) NOT NULL,

    BillAmountBeforeTax DECIMAL(18,2) NOT NULL,
    TaxAmount DECIMAL(18,2) NOT NULL,
    TotalBillAmount DECIMAL(18,2) NOT NULL,

    -- Dropdown remarks
    Remarks NVARCHAR(100) NULL,

    -- REQUIRED Invoice Image
    InvoiceFileName NVARCHAR(255) NOT NULL,
    InvoiceImage VARBINARY(MAX) NOT NULL,

    -- Status
    IsRejected BIT NOT NULL DEFAULT 0,

    -- Audit
    CreatedBy INT NULL,
    CreatedOn DATETIME2 NOT NULL DEFAULT GETDATE()
);
