CREATE TABLE MsProducts (
    Id INT IDENTITY(1,1) PRIMARY KEY,

    ProductName NVARCHAR(200) NOT NULL,
    SKU NVARCHAR(50) NOT NULL UNIQUE,

    CategoryId INT NOT NULL,
    BrandId INT NULL,

    BaseAmount DECIMAL(10,2) NOT NULL DEFAULT 0,
    DiscountPrice DECIMAL(10,2) NOT NULL DEFAULT 0,

    GstId INT NULL,
    GstPercentage DECIMAL(5,2) NOT NULL DEFAULT 0,

    StockQty INT NOT NULL DEFAULT 0,

    ShortDescription NVARCHAR(500) NULL,
    Description NVARCHAR(MAX) NULL,

    IsActive BIT NOT NULL DEFAULT 1,

    CreatedAt DATETIME2 NOT NULL DEFAULT GETDATE(),
    UpdatedAt DATETIME2 NULL
);

ALTER TABLE MsProducts
ADD CONSTRAINT UQ_Products_SKU UNIQUE (SKU);

ALTER TABLE MsProducts
ADD CONSTRAINT FK_MsProducts_Category FOREIGN KEY (CategoryId) REFERENCES MsCategories(Id);

ALTER TABLE MsProducts
ADD CONSTRAINT FK_MsProducts_Brand FOREIGN KEY (BrandId) REFERENCES MsBrands(Id);

ALTER TABLE MsProducts
ADD CONSTRAINT FK_MsProducts_Gst FOREIGN KEY (GstId) REFERENCES MsGst(Id);

INSERT INTO MsProducts
(ProductName, SKU, CategoryId, BrandId, BaseAmount, DiscountPrice,
 GstId, GstPercentage, StockQty, IsActive)
VALUES
('iPhone 15', 'IPH15', 1, 1, 70000, 0, 3, 18, 10, 1),
('Samsung TV', 'SMTV55', 2, 2, 50000, 0, 3, 18, 5, 1),
('T-Shirt', 'TSH001', 3, 4, 1200, 100, 1, 5, 50, 1);
