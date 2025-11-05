CREATE TABLE ServicePartner (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    ServicePartner NVARCHAR(255) NOT NULL,
    Pan NVARCHAR(100),
    Gst NVARCHAR(100),
    Phone NVARCHAR(20),
    Email NVARCHAR(100),
    Address NVARCHAR(MAX),
    CityId INT,
    StateId INT,
    PinCodeId INT,
    extraInfo NVARCHAR(MAX),
	IsDisable BIT DEFAULT 1,
    -- Foreign Key Constraints
    CONSTRAINT FK_ServicePartners_Locations FOREIGN KEY (StateId) REFERENCES Locations(Id),
    CONSTRAINT FK_ServicePartners_Cities FOREIGN KEY (CityId) REFERENCES Cities(Id),
    CONSTRAINT FK_ServicePartners_Pincodes FOREIGN KEY (PinCodeId) REFERENCES Pincodes(Id)
);


INSERT INTO ServicePartner
(
    ServicePartner,
    Pan,
    Gst,
    Phone,
    Email,
    Address,
    CityId,
    StateId,
    PinCodeId,
    ExtraInfo,
    IsDisable
)
VALUES
(
    'ABC Electricals Pvt. Ltd',
    'ABCDE1234F',
    '07ABCDE1234F1Z5',
    '9876543210',
    'contact@abcelectricals.com',
    '123, Industrial Area, Delhi',
    1,   -- CityId (Delhi)
    1,   -- StateId (Delhi)
    1,   -- PinCodeId (110001)
    'Authorized service partner for north region.',
   1    -- ✅ Active (not disabled)
),
(
    'Shree Power Solutions',
    'PQRST5678L',
    '27PQRST5678L1Z2',
    '9123456780',
    'support@shreepower.com',
    'Flat 205, Andheri West, Mumbai',
    2,   -- CityId (Mumbai)
    2,   -- StateId (Maharashtra)
    2,   -- PinCodeId (400058)
    'Specializes in inverter and battery servicing.',
    1    -- ✅ Active (not disabled)
);
