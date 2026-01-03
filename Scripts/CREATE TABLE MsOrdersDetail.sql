CREATE TABLE MsOrderDetails (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    OrderId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    Discount DECIMAL(10,2) DEFAULT 0,
    TotalAmount DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_MsOrderDetails_MsOrder FOREIGN KEY (OrderId) REFERENCES MsOrders(Id) ON DELETE CASCADE,
    CONSTRAINT FK_MsOrderDetails_MsProduct FOREIGN KEY (ProductId) REFERENCES MsProducts(Id)
);

ALTER TABLE MsOrderDetails
ADD
    CategoryId INT NULL,
    CategoryName NVARCHAR(150) NULL,
    BrandId INT NULL,
    BrandName NVARCHAR(150) NULL,
    ProductName NVARCHAR(255) NULL;
	
ALTER TABLE MsOrderDetails
ADD CONSTRAINT FK_MsOrderDetails_Category
FOREIGN KEY (CategoryId) REFERENCES MsCategories(Id);

ALTER TABLE MsOrderDetails
ADD CONSTRAINT FK_MsOrderDetails_Brand
FOREIGN KEY (BrandId) REFERENCES MsBrands(Id);

UPDATE MsOrderDetails
SET 
    CategoryId = 1,
    CategoryName = 'Electronics',
    BrandId = 1,
    BrandName = 'Apple',
    ProductName = 'iPhone 15'
WHERE Id = 1;