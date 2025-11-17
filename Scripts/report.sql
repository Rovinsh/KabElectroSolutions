CREATE TABLE Reports (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    DateRange NVARCHAR(200) NULL,
    FileName NVARCHAR(300) NULL,
    CreatedDate DATE NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    TimeStamp NVARCHAR(100) NULL,
    Status NVARCHAR(50) NOT NULL
);

INSERT INTO Reports
(
    FileName,
    DateRange,
    TimeStamp,
    Status,
    CreatedDate,
    StartDate,
    EndDate
)
VALUES
(
    'crm_report_2025-11-01_2025-11-15.csv',
    '2025-11-01 - 2025-11-15',
    '2025-11-16 10:17:06',
    'Uploaded',
    '2025-11-16',     -- CreatedDate
    '2025-11-01',     -- StartDate
    '2025-11-15'      -- EndDate
);
INSERT INTO Reports
(
    FileName,
    DateRange,
    TimeStamp,
    Status,
    CreatedDate,
    StartDate,
    EndDate
)
VALUES
(
    'crm_report_2025-10-08_2025-11-06.csv',
    '2025-10-08 - 2025-11-06',
    '2025-11-06 21:25:45',
    'Uploaded',
    '2025-11-06',     -- CreatedDate
    '2025-10-08',     -- StartDate
    '2025-11-06'      -- EndDate
);