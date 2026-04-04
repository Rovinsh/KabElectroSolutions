CREATE TABLE ServiceCenters (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    SVCName NVARCHAR(255) NOT NULL,
    City NVARCHAR(100),
    State NVARCHAR(100),
    Address NVARCHAR(500),
    Pincode NVARCHAR(10),
    GSTNumber NVARCHAR(50),
    PanNumber NVARCHAR(20),
    SBPContactPerson NVARCHAR(255),
    MobileNumber NVARCHAR(50),
	Email NVARCHAR(100)
);

--Drop table ServiceCenters
--Drop table ServiceCenters_Staging
CREATE TABLE ServiceCenters_Staging (
    SVCName NVARCHAR(255),
    City NVARCHAR(100),
    State NVARCHAR(100),
    Address NVARCHAR(500),
    Pincode NVARCHAR(20),
    GSTNumber NVARCHAR(50),
    PanNumber NVARCHAR(50),
    SBPContactPerson NVARCHAR(100),
    MobileNumber NVARCHAR(50),
	Email NVARCHAR(100)
);

BULK INSERT ServiceCenters_Staging
FROM 'E:\ServiceCenters.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
	 FIELDQUOTE = '"',
    ROWTERMINATOR = '\n',
    TABLOCK
);

INSERT INTO ServiceCenters (
    SVCName, City, State, Address, Pincode,
    GSTNumber, PanNumber, SBPContactPerson, MobileNumber,Email
)
SELECT
    SVCName, City, State, Address, Pincode,
    GSTNumber, PanNumber, SBPContactPerson, MobileNumber,Email
FROM ServiceCenters_Staging;