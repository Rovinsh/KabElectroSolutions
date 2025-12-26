CREATE TABLE MsCategories (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    CatName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500) NULL,
    IsDisable BIT NOT NULL DEFAULT 1,
    CONSTRAINT UQ_MsCategories_CatName UNIQUE (CatName)
);
INSERT INTO MsCategories (CatName, Description, IsDisable)
VALUES 
   ('Air Conditioner', 'Air Conditioner', 1),
  ('Washing Machine', 'Washing Machine', 1),
  ('Refrigerator','Refrigerator', 1);