SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MsReports](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateRange] [nvarchar](200) NULL,
	[FileName] [nvarchar](300) NULL,
	[CreatedDate] [date] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[TimeStamp] [nvarchar](100) NULL,
	[Status] [nvarchar](50) NOT NULL,
	[CreatedById] [int] NOT NULL,
	[CreatedByName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[MsReports] ADD  DEFAULT ((0)) FOR [CreatedById]
GO

ALTER TABLE [dbo].[MsReports] ADD  DEFAULT ('') FOR [CreatedByName]
GO

INSERT INTO MsReports
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
INSERT INTO MsReports
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