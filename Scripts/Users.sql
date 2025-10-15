CREATE TABLE Users ( 
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Firstname NVARCHAR(100),
    Lastname NVARCHAR(100),
    Image NVARCHAR(MAX) NULL,
    Phone NVARCHAR(20),
    Email NVARCHAR(100),
    Empid NVARCHAR(50) NULL,
    Manager NVARCHAR(100) NULL,
    Authtoken NVARCHAR(100),
    ExecutiveId NVARCHAR(50),
    ChannelName NVARCHAR(100),
    Business INT,
    BusinessPhone NVARCHAR(20),
    BusinessEmail NVARCHAR(100),
    Businessname NVARCHAR(150),
    Businessrole INT,
    BusinessGst NVARCHAR(50),
    BusinessPan NVARCHAR(50),
    BusinessroleName NVARCHAR(100),
    IsActiveBusiness BIT,
	PasswordHash NVARCHAR(256)
);

ALTER TABLE users
ADD BusinessAddressId INT NULL;
ALTER TABLE users
ADD AddressId INT NULL;