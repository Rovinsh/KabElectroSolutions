CREATE TABLE Categories (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    CatName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500) NULL,
    IsDisable BIT NOT NULL DEFAULT 1,
    CONSTRAINT UQ_Categories_CatName UNIQUE (CatName)
);
INSERT INTO Categories (CatName, Description, IsDisable)
VALUES 
   ('Air Conditioner', 'Air Conditioner', 1),
  ('Washing Machine', 'Washing Machine', 1),
  ('Refrigerator','Refrigerator', 1);