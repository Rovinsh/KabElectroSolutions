CREATE TABLE MsAddresses (
    Id INT PRIMARY KEY IDENTITY(1,1),
    UserId INT,
    IsBusinessAddress BIT,
    AddressLine NVARCHAR(500),
    StateId INT,
    CityId INT,
    PincodeId INT,
    Pincode INT,
    Latitude FLOAT NULL,
    Longitude FLOAT NULL,
    City NVARCHAR(100),
    State NVARCHAR(100),
    FOREIGN KEY (UserId) REFERENCES MsUsers(Id)
);
