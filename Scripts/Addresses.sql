CREATE TABLE Addresses (
    Id INT PRIMARY KEY IDENTITY(1,1),
    UserId INT,
    IsBusinessAddress BIT,
    AddressLine NVARCHAR(500),
    Location INT,
    Pincode INT,
    Latitude FLOAT NULL,
    Longitude FLOAT NULL,
    City NVARCHAR(100),
    State NVARCHAR(100),
    FOREIGN KEY (UserId) REFERENCES Users(Id)
);
