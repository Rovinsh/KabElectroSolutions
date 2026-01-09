CREATE TABLE MsWishlists
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL,
    ProductId INT NOT NULL,
    CreatedAt DATETIME2 NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_MsWishlists_User
        FOREIGN KEY (UserId) REFERENCES MsUsers(Id),

    CONSTRAINT FK_MsWishlists_Product
        FOREIGN KEY (ProductId) REFERENCES MsProducts(Id),

    CONSTRAINT UQ_MsWishlists_User_Product
        UNIQUE (UserId, ProductId)
);