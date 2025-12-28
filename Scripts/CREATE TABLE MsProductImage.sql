CREATE TABLE MsProductImage
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    ProductId INT NOT NULL, -- for easy query by claim
    Image VARBINARY(MAX) NOT NULL,
    FileName NVARCHAR(255) NOT NULL,
    CreatedAt DATETIME2 DEFAULT GETDATE(),
    CONSTRAINT FK_MsProductImage_MsProducts FOREIGN KEY (ProductId)
        REFERENCES MsProducts(Id) ON DELETE CASCADE
);