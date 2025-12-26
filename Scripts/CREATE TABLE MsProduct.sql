CREATE TABLE MsProducts (
    Id INT IDENTITY(1,1) PRIMARY KEY,

    ProductName NVARCHAR(200) NOT NULL,
    SKU NVARCHAR(50) NOT NULL,
    CategoryId INT NOT NULL,
    BrandId INT NULL,
    DiscountPrice DECIMAL(10,2) NULL,

    StockQty INT NOT NULL DEFAULT 0,

    ShortDescription NVARCHAR(500) NULL,
    Description NVARCHAR(MAX) NULL,
    IsActive BIT NOT NULL DEFAULT 1,
     GstId INT NULL,
    BaseAmount DECIMAL(10,2) NOT NULL DEFAULT 0,
    GstPercentage DECIMAL(5,2) NOT NULL DEFAULT 0,
    GstAmount DECIMAL(10,2) NOT NULL DEFAULT 0,
    WithGstAmount DECIMAL(10,2) NOT NULL DEFAULT 0,
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

ALTER TABLE MsProducts
ADD 
    GstAmount AS (ROUND(BaseAmount * GstPercentage / 100.0, 2)) PERSISTED,
    WithGstAmount AS (ROUND(BaseAmount + (BaseAmount * GstPercentage / 100.0), 2)) PERSISTED;
	
	
	INSERT INTO MsProducts
(ProductName, SKU, CategoryId, BrandId, BaseAmount, GstId, GstPercentage, GstAmount, WithGstAmount, StockQty, IsActive, CreatedAt)
SELECT *
FROM
(
    SELECT 'iPhone 15',   'IPH15',  1, 1, 70000, 3, 18, 70000 * 18 / 100.0, 70000 + (70000 * 18 / 100.0), 10, 0, GETDATE()
    UNION ALL
    SELECT 'Samsung TV',  'SMTV55', 2, 2, 50000, 3, 18, 50000 * 18 / 100.0, 50000 + (50000 * 18 / 100.0), 5,  0, GETDATE()
    UNION ALL
    SELECT 'T-Shirt',     'TSH001', 3, 4, 1200,  1, 5,  1200  * 5  / 100.0, 1200  + (1200  * 5  / 100.0), 50, 0, GETDATE()
) AS Data(ProductName, SKU, CategoryId, BrandId, BaseAmount, GstId, GstPercentage, GstAmount, WithGstAmount, StockQty, IsActive, CreatedAt);
