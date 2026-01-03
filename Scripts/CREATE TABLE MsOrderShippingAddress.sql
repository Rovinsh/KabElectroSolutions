CREATE TABLE MsOrderShippingAddress (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    OrderId INT NOT NULL UNIQUE,
    FullName NVARCHAR(150),
    Phone NVARCHAR(20),
    AddressLine NVARCHAR(255),
    City NVARCHAR(100),
    State NVARCHAR(100),
    Pincode NVARCHAR(20),
    Country NVARCHAR(50),

    CONSTRAINT FK_MsShipping_MsOrder FOREIGN KEY (OrderId) REFERENCES MsOrders(Id) ON DELETE CASCADE
);