CREATE TABLE MsGst (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    GstValue NVARCHAR(50) NOT NULL,
    Description NVARCHAR(255) NULL,
    IsDisable BIT NOT NULL DEFAULT 0
);
INSERT INTO MsGst (GstValue, Description, IsDisable)
VALUES
('0%',  'No GST applied', 0),
('5%',  'Low GST slab', 0),
('12%', 'Medium GST slab', 0),
('18%', 'Standard GST slab', 0),
('28%', 'Luxury GST slab', 0);
ALTER TABLE MsGst
ADD CONSTRAINT UQ_MsGst_GstValue UNIQUE (GstValue);