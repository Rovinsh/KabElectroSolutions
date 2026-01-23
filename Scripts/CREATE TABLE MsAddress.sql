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
ALTER TABLE MsAddresses
ADD 
    FullName VARCHAR(225) NULL,
    Phone VARCHAR(20) NULL,
    IsDefault BIT NOT NULL DEFAULT (0);