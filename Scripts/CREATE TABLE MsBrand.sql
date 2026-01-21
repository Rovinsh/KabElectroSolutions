CREATE TABLE MsBrands (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    CategoryId INT NOT NULL,
    BrandName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500) NULL,
    IsDisable BIT NOT NULL DEFAULT 1,
    CONSTRAINT FK_MsBrands_MsCategories FOREIGN KEY (CategoryId) REFERENCES MsCategories(Id),
    CONSTRAINT UQ_MsBrands_MsCategory_BrandName UNIQUE (CategoryId, BrandName)
);

 INSERT INTO MsBrands (BrandName, CategoryId, Description, IsDisable)
VALUES
  ('LG', 1, 'LG', 1),
  ('Samsung', 1, 'Samsung', 1),
  ('Whirlpool', 1, 'Whirlpool', 1),
  ('Samsung', 2,'Samsung', 1),
   ('LG', 3, 'LG',1);
