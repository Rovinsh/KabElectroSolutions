--CREATE TABLE [Status] (
--    Id INT IDENTITY(1,1) PRIMARY KEY,         -- Auto-increment identity
--    Name NVARCHAR(100) NOT NULL,
--    Active BIT NOT NULL DEFAULT 1
--);

--CREATE TABLE SubStatus (
--    SubStatusId INT IDENTITY(1,1) PRIMARY KEY,
--    Name NVARCHAR(100) NOT NULL,   
--    StatusId INT NOT NULL,
--	Active BIT NOT NULL DEFAULT 1,
--    FOREIGN KEY (StatusId) REFERENCES [Status](Id)
--);
--GO

--- Status 1: Claim Registered
--GO
--INSERT INTO Status (Name) VALUES ('Claim Registered');
--DECLARE @NewStatusId INT;
--SET @NewStatusId = SCOPE_IDENTITY();
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Call Initiated', @NewStatusId);

-- Status 2: Claim Allocated
--GO
--INSERT INTO Status (Name) VALUES ('Claim Allocated');
--DECLARE @NewStatusId INT;
--SET @NewStatusId = SCOPE_IDENTITY();
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Service Centre Assigned', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Call Accepted By Service Center', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Call Rejected By Service Center', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Technician Assigned', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Claim Verified', @NewStatusId);

-- Status 6: Customer Appointment
--GO
--INSERT INTO Status (Name) VALUES ('Customer Appointment');
--DECLARE @NewStatusId INT;
--SET @NewStatusId = SCOPE_IDENTITY();
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Appointment Taken', @NewStatusId);

---- Status 8: Customer Visit
--GO
--INSERT INTO Status (Name) VALUES ('Customer Visit');
--DECLARE @NewStatusId INT;
--SET @NewStatusId = SCOPE_IDENTITY();
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Visit Done', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Insurance Pending Estimation', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Query Raised ST', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Query Raised SC', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Visit Pending', @NewStatusId);

-- Status 10: Cost Estimation
--GO
--INSERT INTO Status (Name) VALUES ('Cost Estimation');
--DECLARE @NewStatusId INT;
--SET @NewStatusId = SCOPE_IDENTITY();
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Estimation Shared', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Estimate Accepted', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Estimate Rejected', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Re Estimate', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Estimation Payment', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Skip Estpayment', @NewStatusId);

---- Status 16: Repair
--GO
--INSERT INTO Status (Name) VALUES ('Repair');
--DECLARE @NewStatusId INT;
--SET @NewStatusId = SCOPE_IDENTITY();
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Beyond Economic Repair', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Repair at Home', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Repair at SVC', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Product Picked', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Product Dropped', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Repair Completed', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('NPS Captured', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Technican Repair at Home', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Technican Repair at Service Centre', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Call Closed Without Repair', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('BER Completed', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Device Delivered', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Device Received', @NewStatusId);

-- Status 22: Invoice
--GO
--INSERT INTO Status (Name) VALUES ('Invoice');
--DECLARE @NewStatusId INT;
--SET @NewStatusId = SCOPE_IDENTITY();
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Invoice Claimed', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Invoice Accepted', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Invoice Rejected', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Invoice Accepted By Insurance', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Invoice Accepted By Service', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Invoice Accepted By Finance', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Invoice Rejected By Finance', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Invoice Rejected By Insurance', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Invoice Rejected By Service', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Document Received from SVC', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Documents Rejected By Service', @NewStatusId);
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Invoice & Docs Rejected By Service', @NewStatusId);


-- Status 26: Payment
--GO
--INSERT INTO Status (Name) VALUES ('Payment');
-- No substatus

-- Status 27: Call Closed
--GO
--INSERT INTO Status (Name) VALUES ('Call Closed');
-- No substatus

-- Status 29: Call Aborted
--GO
--INSERT INTO Status (Name) VALUES ('Call Aborted');
--DECLARE @NewStatusId INT;
--SET @NewStatusId = SCOPE_IDENTITY();
--INSERT INTO SubStatus (Name, StatusId) VALUES ('Call Aborted', @NewStatusId);
-- No substatus



select * from [Status]
select * from SubStatus