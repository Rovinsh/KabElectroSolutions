CREATE TABLE WarrantyStatuses (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    [Name] NVARCHAR(100) NOT NULL
);

INSERT INTO WarrantyStatuses (Name) VALUES ('Activated');
INSERT INTO WarrantyStatuses (Name) VALUES ('Rejected');
INSERT INTO WarrantyStatuses (Name) VALUES ('On Hold');
INSERT INTO WarrantyStatuses (Name) VALUES ('Partial Activated');
INSERT INTO WarrantyStatuses (Name) VALUES ('Expired');
INSERT INTO WarrantyStatuses (Name) VALUES ('Resolved');
INSERT INTO WarrantyStatuses (Name) VALUES ('Active');
INSERT INTO WarrantyStatuses (Name) VALUES ('Inactive');
INSERT INTO WarrantyStatuses (Name) VALUES ('Cancel');
INSERT INTO WarrantyStatuses (Name) VALUES ('Delete');
INSERT INTO WarrantyStatuses (Name) VALUES ('Primary Done');
INSERT INTO WarrantyStatuses (Name) VALUES ('Pending');
INSERT INTO WarrantyStatuses (Name) VALUES ('Tertiary Done');
INSERT INTO WarrantyStatuses (Name) VALUES ('Secondary Done');
INSERT INTO WarrantyStatuses (Name) VALUES ('Verification Done');
INSERT INTO WarrantyStatuses (Name) VALUES ('Surveyor Assignment');
