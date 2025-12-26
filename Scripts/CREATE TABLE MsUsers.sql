CREATE TABLE MsUsers ( 
    Id INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    Phone NVARCHAR(20),
    Email NVARCHAR(100),
    BusinessPhone NVARCHAR(20),
    BusinessEmail NVARCHAR(100),
    BusinessName NVARCHAR(150),
    BusinessRole INT,
    BusinessGst NVARCHAR(50),
    BusinessPan NVARCHAR(50),
    BusinessRoleName NVARCHAR(100),
    IsActiveBusiness BIT,
	PasswordHash NVARCHAR(256)
);
ALTER TABLE MsUsers
ADD IsPartner BIT DEFAULT 0;
ALTER TABLE MsUsers
ADD PartnerId INT NULL;