CREATE TABLE Notes (
    Id INT IDENTITY(1,1) PRIMARY KEY,   -- Auto increment by 1
    ClaimId INT NOT NULL,               -- Associated claim
    Message NVARCHAR(MAX) NOT NULL,     -- The note text
    UserName NVARCHAR(100) NOT NULL,    -- e.g. 'RP'
    Role NVARCHAR(100) NOT NULL,        -- e.g. 'Call Center Executive'
    TimeStamp DATETIME NOT NULL         -- When note was created
);