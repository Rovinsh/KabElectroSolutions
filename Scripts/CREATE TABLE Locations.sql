-- Create Locations table
--CREATE TABLE Locations (
--    Id INT IDENTITY(1,1) PRIMARY KEY,
--    Name NVARCHAR(100) NOT NULL
--);

---- Create Cities table
--CREATE TABLE Cities (
--    Id INT IDENTITY(1,1) PRIMARY KEY,
--    Name NVARCHAR(100) NOT NULL,
--    LocationId INT NOT NULL,
--    FOREIGN KEY (LocationId) REFERENCES Locations(Id)
--);

---- Create Pincodes table
--CREATE TABLE Pincodes (
--    Id INT IDENTITY(1,1) PRIMARY KEY,
--    Pincode INT NOT NULL,
--    CityId INT NOT NULL,
--    FOREIGN KEY (CityId) REFERENCES Cities(Id)
--);

-- Insert into Locations
DECLARE @LocationId_Delhi INT;
INSERT INTO Locations (Name) VALUES ('Delhi');
SET @LocationId_Delhi = SCOPE_IDENTITY();

-- Assume inserted Location ID is 1
-- Insert into Cities
DECLARE @CityId INT;
INSERT INTO Cities (Name, LocationId) VALUES ('New Delhi', @LocationId_Delhi);
SET @CityId = SCOPE_IDENTITY();

-- Assume inserted City ID is 1
-- Insert into Pincodes
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(100000, @CityId),
(100003, @CityId),
(110001, @CityId),
(110002, @CityId),
(110003, @CityId),
(110004, @CityId),
(110005, @CityId),
(110008, @CityId),
(110009, @CityId),
(110010, @CityId),
(110011, @CityId),
(110012, @CityId),
(110013, @CityId),
(110014, @CityId),
(110015, @CityId),
(110016, @CityId),
(110017, @CityId),
(110018, @CityId),
(110019, @CityId),
(110021, @CityId),
(110022, @CityId),
(110023, @CityId),
(110024, @CityId),
(110025, @CityId),
(110026, @CityId),
(110027, @CityId),
(110028, @CityId),
(110029, @CityId),
(110030, @CityId),
(110031, @CityId),
(110032, @CityId),
(110033, @CityId),
(110035, @CityId),
(110036, @CityId),
(110037, @CityId),
(110038, @CityId),
(110040, @CityId),
(110041, @CityId),
(110042, @CityId),
(110043, @CityId),
(110044, @CityId),
(110045, @CityId),
(110046, @CityId),
(110047, @CityId),
(110048, @CityId),
(110049, @CityId),
(110051, @CityId),
(110052, @CityId),
(110053, @CityId),
(110054, @CityId),
(110055, @CityId),
(110056, @CityId),
(110057, @CityId),
(110058, @CityId),
(110059, @CityId),
(110060, @CityId),
(110061, @CityId),
(110062, @CityId),
(110063, @CityId),
(110064, @CityId),
(110065, @CityId),
(110066, @CityId),
(110067, @CityId),
(110068, @CityId),
(110070, @CityId),
(110071, @CityId),
(110072, @CityId),
(110073, @CityId),
(110074, @CityId),
(110075, @CityId),
(110076, @CityId),
(110077, @CityId),
(110078, @CityId),
(110081, @CityId),
(110082, @CityId),
(110083, @CityId),
(110084, @CityId),
(110085, @CityId),
(110087, @CityId),
(110088, @CityId),
(110089, @CityId),
(110091, @CityId),
(110093, @CityId),
(110094, @CityId),
(110096, @CityId),
(110097, @CityId);
-- Insert Location: Delhi
-- Insert Cities under Delhi
-- West Delhi
INSERT INTO Cities (Name, LocationId) VALUES ('West Delhi', @LocationId_Delhi);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (110039, @CityId);

-- South Delhi
INSERT INTO Cities (Name, LocationId) VALUES ('South Delhi', @LocationId_Delhi);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (110020, @CityId);

-- North Delhi
INSERT INTO Cities (Name, LocationId) VALUES ('North Delhi', @LocationId_Delhi);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(110006, @CityId),
(110007, @CityId),
(110086, @CityId);

-- East Delhi
INSERT INTO Cities (Name, LocationId) VALUES ('East Delhi', @LocationId_Delhi);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (110092, @CityId);

-- Ranibagh
INSERT INTO Cities (Name, LocationId) VALUES ('Ranibagh', @LocationId_Delhi);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (110034, @CityId);

-- NORTH EAST DELHI
INSERT INTO Cities (Name, LocationId) VALUES ('NORTH EAST DELHI', @LocationId_Delhi);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (110090, @CityId);

-- NORTH WEST DELHI
INSERT INTO Cities (Name, LocationId) VALUES ('NORTH WEST DELHI', @LocationId_Delhi);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (110099, @CityId);

-- CENTRAL DELHI
INSERT INTO Cities (Name, LocationId) VALUES ('CENTRAL DELHI', @LocationId_Delhi);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (110069, @CityId);

-- Delhi (with null pincodes)
INSERT INTO Cities (Name, LocationId) VALUES ('Delhi', @LocationId_Delhi);
-- No pincodes for this one

---------------------------------------------------------
-- Insert Location: Haryana
DECLARE @LocationId_Haryana INT;
INSERT INTO Locations (Name) VALUES ('Haryana');
SET @LocationId_Haryana = SCOPE_IDENTITY();

-- Insert Faridabad
INSERT INTO Cities (Name, LocationId) VALUES ('Faridabad', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(121001, @CityId),
(121002, @CityId),
(121003, @CityId),
(121004, @CityId),
(121005, @CityId),
(121006, @CityId),
(121007, @CityId),
(121008, @CityId),
(121009, @CityId),
(121010, @CityId),
(121012, @CityId),
(121013, @CityId),
(121014, @CityId),
(121015, @CityId),
(121101, @CityId),
(121104, @CityId),
(121105, @CityId),
(121106, @CityId),
(125133, @CityId);

-- City: Hathin
INSERT INTO Cities (Name, LocationId) VALUES ('Hathin', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(121103, @CityId);

-- City: Hassanpur
INSERT INTO Cities (Name, LocationId) VALUES ('Hassanpur', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(121107, @CityId);

-- City: Gurgaon
INSERT INTO Cities (Name, LocationId) VALUES ('Gurgaon', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(122001, @CityId),
(122002, @CityId),
(122003, @CityId),
(122004, @CityId),
(122005, @CityId),
(122006, @CityId),
(122007, @CityId),
(122008, @CityId),
(122009, @CityId),
(122010, @CityId),
(122011, @CityId),
(122012, @CityId),
(122013, @CityId),
(122015, @CityId),
(122016, @CityId),
(122017, @CityId),
(122018, @CityId),
(122021, @CityId),
(122022, @CityId),
(122050, @CityId),
(122051, @CityId),
(122052, @CityId),
(122098, @CityId),
(122101, @CityId),
(122102, @CityId),
(122105, @CityId),
(122108, @CityId),
(122109, @CityId),
(122211, @CityId),
(122413, @CityId),
(122414, @CityId),
(122502, @CityId),
(122504, @CityId),
(122505, @CityId),
(122506, @CityId),
(122508, @CityId),
(123507, @CityId),
(123508, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Sohna', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(122103, @CityId);

-- Insert Ferozepur Jhirka under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Ferozepur Jhirka', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(122104, @CityId);

-- Insert Dharuhera under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Dharuhera', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(122106, @CityId);

-- Insert Nuh under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Nuh', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(122107, @CityId);

-- Insert Narnaul under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Narnaul', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(123001, @CityId),
(123021, @CityId),
(123022, @CityId),
(123023, @CityId),
(123028, @CityId),
(123029, @CityId),
(123034, @CityId),
(123035, @CityId),
(123101, @CityId),
(123102, @CityId),
(123103, @CityId),
(123401, @CityId),
(123412, @CityId),
(123413, @CityId),
(123414, @CityId),
(123502, @CityId),
(123504, @CityId),
(123505, @CityId),
(123506, @CityId);

-- Insert Bhiwani under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Bhiwani', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(123020, @CityId),
(123024, @CityId),
(123025, @CityId),
(123026, @CityId),
(123301, @CityId),
(123307, @CityId),
(123308, @CityId),
(123309, @CityId),
(123310, @CityId),
(125021, @CityId),
(125022, @CityId),
(125023, @CityId),
(125024, @CityId),
(125025, @CityId),
(125026, @CityId),
(125027, @CityId),
(125028, @CityId),
(125029, @CityId),
(125030, @CityId),
(125031, @CityId),
(125036, @CityId),
(125037, @CityId),
(125041, @CityId),
(125043, @CityId),
(125045, @CityId),
(125046, @CityId),
(125061, @CityId),
(125063, @CityId),
(125064, @CityId),
(125065, @CityId),
(125066, @CityId),
(125067, @CityId),
(125071, @CityId),
(125072, @CityId),
(125074, @CityId),
(127021, @CityId),
(127022, @CityId),
(127025, @CityId),
(127026, @CityId),
(127027, @CityId),
(127028, @CityId),
(127029, @CityId),
(127030, @CityId),
(127031, @CityId),
(127032, @CityId),
(127035, @CityId),
(127040, @CityId),
(127041, @CityId),
(127042, @CityId),
(127043, @CityId),
(127045, @CityId),
(127046, @CityId),
(127111, @CityId),
(127114, @CityId),
(127201, @CityId),
(127306, @CityId),
(127307, @CityId),
(127308, @CityId),
(127309, @CityId),
(127310, @CityId),
(127311, @CityId),
(127312, @CityId);

-- Insert Loharu under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Loharu', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(123201, @CityId);

-- Insert Rewari under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Rewari', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(123106, @CityId),
(123110, @CityId),
(123302, @CityId),
(123303, @CityId),
(123304, @CityId),
(123305, @CityId),
(123411, @CityId);

-- Insert Charkhi Dadri under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Charkhi Dadri', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(123306, @CityId);

-- Insert Bawal under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Bawal', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(123501, @CityId);

-- Insert Pataudi under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Pataudi', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(123503, @CityId);

-- Insert Rohtak under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Rohtak', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(124001, @CityId),
(124002, @CityId),
(124003, @CityId),
(124004, @CityId),
(124005, @CityId),
(124006, @CityId),
(124007, @CityId),
(124008, @CityId),
(124010, @CityId),
(124021, @CityId),
(124022, @CityId),
(124023, @CityId),
(124024, @CityId),
(124025, @CityId),
(124026, @CityId),
(124027, @CityId),
(124028, @CityId),
(124029, @CityId),
(124030, @CityId),
(124031, @CityId),
(124101, @CityId),
(124102, @CityId),
(124105, @CityId),
(124107, @CityId),
(124108, @CityId),
(124109, @CityId),
(124110, @CityId),
(124111, @CityId),
(124112, @CityId),
(124114, @CityId),
(124116, @CityId),
(124117, @CityId),
(124118, @CityId),
(124119, @CityId),
(124120, @CityId),
(124121, @CityId),
(124122, @CityId),
(124123, @CityId),
(124124, @CityId),
(124125, @CityId),
(124126, @CityId),
(124127, @CityId),
(124128, @CityId),
(124129, @CityId),
(124130, @CityId),
(124131, @CityId),
(124132, @CityId),
(124133, @CityId),
(124134, @CityId),
(124135, @CityId),
(124136, @CityId),
(124137, @CityId),
(124138, @CityId),
(124139, @CityId),
(124140, @CityId),
(124141, @CityId),
(124202, @CityId),
(124203, @CityId),
(124204, @CityId),
(124205, @CityId),
(124303, @CityId),
(124307, @CityId),
(124308, @CityId),
(124309, @CityId),
(124311, @CityId),
(124312, @CityId),
(124314, @CityId),
(124315, @CityId),
(124316, @CityId),
(124317, @CityId),
(124318, @CityId),
(124320, @CityId),
(124321, @CityId),
(124322, @CityId),
(124323, @CityId),
(124324, @CityId),
(124325, @CityId),
(124401, @CityId),
(124404, @CityId),
(124405, @CityId),
(124406, @CityId),
(124407, @CityId),
(124410, @CityId),
(124411, @CityId),
(124412, @CityId),
(124413, @CityId),
(124416, @CityId),
(124417, @CityId),
(124418, @CityId),
(124419, @CityId),
(124420, @CityId),
(124421, @CityId),
(124422, @CityId),
(124423, @CityId),
(124424, @CityId),
(124425, @CityId),
(124426, @CityId),
(124427, @CityId),
(124428, @CityId),
(124501, @CityId),
(124502, @CityId),
(124503, @CityId),
(124504, @CityId),
(124505, @CityId),
(124506, @CityId),
(124508, @CityId),
(124509, @CityId),
(124510, @CityId),
(124511, @CityId),
(124513, @CityId),
(124514, @CityId),
(124515, @CityId),
(124516, @CityId),
(124517, @CityId),
(124518, @CityId),
(124519, @CityId),
(124520, @CityId),
(124521, @CityId),
(124522, @CityId),
(124523, @CityId),
(124524, @CityId),
(124525, @CityId),
(124526, @CityId),
(124527, @CityId),
(124528, @CityId),
(124530, @CityId),
(124531, @CityId),
(124533, @CityId),
(821112, @CityId);

-- Insert Jhajjar under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Jhajjar', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(124103, @CityId),
(124104, @CityId),
(124106, @CityId),
(124142, @CityId),
(124146, @CityId),
(124507, @CityId);

-- Insert Kalanaur under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Kalanaur', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(124113, @CityId);

-- Insert Beri under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Beri', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(124201, @CityId);

-- Insert Gohana under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Gohana', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(124301, @CityId);

-- Insert Sonepat under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Sonepat', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(124302, @CityId),
(124304, @CityId),
(124305, @CityId),
(124306, @CityId),
(124310, @CityId),
(124402, @CityId),
(124403, @CityId),
(124408, @CityId),
(124409, @CityId),
(124415, @CityId),
(124429, @CityId),
(124430, @CityId),
(124529, @CityId),
(124532, @CityId),
(131001, @CityId),
(131021, @CityId),
(131022, @CityId),
(131023, @CityId),
(131024, @CityId),
(131025, @CityId),
(131026, @CityId),
(131027, @CityId),
(131028, @CityId),
(131029, @CityId),
(131030, @CityId),
(131031, @CityId),
(131032, @CityId),
(131033, @CityId),
(131034, @CityId),
(131035, @CityId),
(131036, @CityId),
(131037, @CityId),
(131038, @CityId),
(131102, @CityId),
(131103, @CityId),
(131104, @CityId),
(131105, @CityId),
(131106, @CityId),
(131107, @CityId),
(131108, @CityId),
(131109, @CityId),
(131110, @CityId),
(131111, @CityId),
(131112, @CityId),
(131113, @CityId),
(131114, @CityId),
(131115, @CityId),
(131301, @CityId),
(131402, @CityId),
(131409, @CityId);


-- Insert Hissar under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Hissar', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(125001, @CityId),
(125002, @CityId),
(125003, @CityId),
(125004, @CityId),
(125005, @CityId),
(125011, @CityId),
(125012, @CityId),
(125034, @CityId),
(125035, @CityId),
(125038, @CityId),
(125042, @CityId),
(125044, @CityId),
(125047, @CityId),
(125048, @CityId),
(125049, @CityId),
(125068, @CityId),
(125069, @CityId),
(125070, @CityId),
(125073, @CityId),
(125079, @CityId),
(125080, @CityId),
(125081, @CityId),
(125082, @CityId),
(125083, @CityId),
(125084, @CityId),
(125086, @CityId),
(125088, @CityId),
(125105, @CityId),
(125107, @CityId),
(125108, @CityId),
(125109, @CityId),
(125201, @CityId),
(126006, @CityId),
(126007, @CityId),
(126008, @CityId),
(126009, @CityId),
(126011, @CityId),
(126013, @CityId),
(126014, @CityId),
(126015, @CityId),
(126025, @CityId),
(126027, @CityId),
(126120, @CityId);

-- Insert Bawani Khera under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Bawani Khera', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(125032, @CityId);

-- Insert Hansi under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Hansi', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(125033, @CityId);

-- Insert Narnaund under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Narnaund', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(125039, @CityId);

-- Insert Tosham under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Tosham', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(125040, @CityId);


-- Insert Fatehabad under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Fatehabad', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(125050, @CityId),
(125111, @CityId),
(125120, @CityId);

-- Insert Sirsa under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Sirsa', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(125051, @CityId),
(125052, @CityId),
(125053, @CityId),
(125054, @CityId),
(125055, @CityId),
(125056, @CityId),
(125057, @CityId),
(125058, @CityId),
(125060, @CityId),
(125062, @CityId),
(125075, @CityId),
(125077, @CityId),
(125078, @CityId),
(125101, @CityId),
(125103, @CityId),
(125106, @CityId),
(125110, @CityId),
(125202, @CityId),
(125203, @CityId);

-- Insert Rania under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Rania', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(125076, @CityId);

-- Insert Ladwa under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Ladwa', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(125087, @CityId),
(132132, @CityId);

-- Insert Ellenabad under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Ellenabad', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(125102, @CityId);

-- Insert Mandi Dabwali under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Mandi Dabwali', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(125104, @CityId);

-- Insert Safidon under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Safidon', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(125112, @CityId);

-- Insert Jakhal Mandi under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Jakhal Mandi', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(126001, @CityId);

-- Insert Barwala under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Barwala', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(126010, @CityId);

-- Insert Julana under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Julana', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(126101, @CityId);


-- Insert Jind under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Jind', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(126102, @CityId),
(126103, @CityId),
(126104, @CityId),
(126105, @CityId),
(126106, @CityId),
(126107, @CityId),
(126108, @CityId),
(126109, @CityId),
(126110, @CityId),
(126111, @CityId),
(126112, @CityId),
(126113, @CityId),
(126114, @CityId),
(126116, @CityId),
(126117, @CityId),
(126118, @CityId),
(126121, @CityId),
(126122, @CityId),
(126123, @CityId),
(126124, @CityId),
(126125, @CityId),
(126126, @CityId),
(126127, @CityId),
(126128, @CityId),
(126129, @CityId),
(126130, @CityId),
(126131, @CityId),
(126132, @CityId),
(126133, @CityId),
(126135, @CityId),
(126136, @CityId),
(126139, @CityId),
(126140, @CityId),
(126141, @CityId),
(126143, @CityId),
(126145, @CityId),
(126146, @CityId),
(126147, @CityId),
(126148, @CityId),
(126149, @CityId),
(126150, @CityId),
(126151, @CityId),
(126152, @CityId),
(126153, @CityId),
(126154, @CityId),
(132045, @CityId);

-- Insert Uchana under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Uchana', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(126115, @CityId);

-- Insert Tohana under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Tohana', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(126119, @CityId);

-- Insert Kaithal under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Kaithal', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(126134, @CityId),
(132020, @CityId),
(132021, @CityId),
(132026, @CityId),
(132027, @CityId),
(132029, @CityId),
(132032, @CityId),
(132042, @CityId),
(132043, @CityId),
(132120, @CityId),
(132121, @CityId),
(132123, @CityId),
(132138, @CityId),
(136020, @CityId),
(136021, @CityId),
(136026, @CityId),
(136027, @CityId),
(136033, @CityId),
(136034, @CityId),
(136042, @CityId),
(136043, @CityId),
(136044, @CityId),
(136117, @CityId);

-- Insert Ganaur under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Ganaur', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(131101, @CityId);


-- Insert Karnal under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Karnal', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(132001, @CityId),
(132002, @CityId),
(132007, @CityId),
(132022, @CityId),
(132023, @CityId),
(132024, @CityId),
(132025, @CityId),
(132036, @CityId),
(132037, @CityId),
(132038, @CityId),
(132040, @CityId),
(132041, @CityId),
(132046, @CityId),
(132054, @CityId),
(132104, @CityId),
(132105, @CityId),
(132106, @CityId),
(132108, @CityId),
(132111, @CityId),
(132112, @CityId),
(132113, @CityId),
(132114, @CityId),
(132115, @CityId),
(132116, @CityId),
(132124, @CityId),
(132125, @CityId),
(132139, @CityId),
(132140, @CityId),
(132141, @CityId),
(132142, @CityId),
(132143, @CityId),
(132144, @CityId),
(132145, @CityId),
(132146, @CityId),
(132147, @CityId),
(132148, @CityId),
(132149, @CityId),
(132150, @CityId),
(132151, @CityId),
(132152, @CityId),
(132153, @CityId),
(132154, @CityId),
(132157, @CityId);

-- Insert Kurukshetra under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Kurukshetra', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(132034, @CityId),
(132035, @CityId),
(132044, @CityId),
(132118, @CityId),
(132119, @CityId),
(132129, @CityId),
(132130, @CityId),
(132131, @CityId),
(132134, @CityId),
(132135, @CityId),
(132136, @CityId),
(132137, @CityId),
(136030, @CityId),
(136035, @CityId),
(136038, @CityId),
(136118, @CityId),
(136119, @CityId),
(136128, @CityId),
(136129, @CityId),
(136130, @CityId),
(136131, @CityId),
(136132, @CityId),
(136134, @CityId),
(136135, @CityId),
(136136, @CityId),
(136156, @CityId);

-- Insert Assandh under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Assandh', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(132039, @CityId);

-- Insert Panipat under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Panipat', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(132047, @CityId),
(132048, @CityId),
(132049, @CityId),
(132050, @CityId),
(132051, @CityId),
(132052, @CityId),
(132053, @CityId),
(132058, @CityId),
(132102, @CityId),
(132103, @CityId),
(132107, @CityId),
(132109, @CityId),
(132110, @CityId),
(132122, @CityId),
(132155, @CityId);

-- Insert Samalkha under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Samalkha', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (132101, @CityId);

-- Insert Nilokheri under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Nilokheri', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (132117, @CityId);

-- Insert Pehowa under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Pehowa', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (132128, @CityId);

-- Insert Radaur under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Radaur', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (132133, @CityId);

-- Insert Ambala under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Ambala', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(133001, @CityId), (133004, @CityId), (133005, @CityId), (133006, @CityId), (133008, @CityId), 
(133010, @CityId), (133021, @CityId), (133101, @CityId), (133102, @CityId), (133104, @CityId), 
(133105, @CityId), (133201, @CityId), (133202, @CityId), (133203, @CityId), (133204, @CityId), 
(133205, @CityId), (133206, @CityId), (133207, @CityId), (133208, @CityId), (133301, @CityId), 
(133302, @CityId), (134002, @CityId), (134003, @CityId), (134005, @CityId), (134007, @CityId), 
(134008, @CityId), (134011, @CityId), (134012, @CityId), (134101, @CityId), (134104, @CityId), 
(134107, @CityId), (134108, @CityId), (134109, @CityId), (134110, @CityId), (134112, @CityId), 
(134113, @CityId), (134201, @CityId), (134202, @CityId), (134205, @CityId), (134206, @CityId), 
(135021, @CityId), (135101, @CityId), (135104, @CityId), (135105, @CityId);

-- Insert Pinjore under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Pinjore', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (134102, @CityId);

-- Insert Naraingarh under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Naraingarh', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (134203, @CityId);

-- Insert Raipur Rani under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Raipur Rani', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (134204, @CityId);

-- Insert Jagadhri under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Jagadhri', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (135003, @CityId);

-- Insert Bilaspur under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Bilaspur', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (135102, @CityId);

-- Insert Chhachhrauli under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Chhachhrauli', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (135103, @CityId);

-- Insert Palwal under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Palwal', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (121102, @CityId);

-- Insert fardiabad, Gugaon, BALLABGARH under Haryana (no pincodes)
INSERT INTO Cities (Name, LocationId) VALUES ('fardiabad', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Gugaon', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('BALLABGARH', @LocationId_Haryana);

-- Insert Gurugram under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Gurugram', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (122503, @CityId);

-- Insert Panchkula under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Panchkula', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(113134, @CityId), (134001, @CityId), (134103, @CityId), (134105, @CityId), 
(134114, @CityId), (134116, @CityId), (134117, @CityId), (134118, @CityId);

-- Insert Hisar (alternate spelling) under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Hisar', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(125006, @CityId), (125007, @CityId), (125113, @CityId), (125121, @CityId);

-- Insert PANCKULA and Bahadurgarh under Haryana (no pincodes)
INSERT INTO Cities (Name, LocationId) VALUES ('PANCKULA', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Bahadurgarh', @LocationId_Haryana);

-- Insert Yamunanagar under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('Yamunanagar', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(133103, @CityId), (135001, @CityId), (135002, @CityId), (135004, @CityId), 
(135106, @CityId), (135133, @CityId);

-- Insert MAHENDRAGARH under Haryana
INSERT INTO Cities (Name, LocationId) VALUES ('MAHENDRAGARH', @LocationId_Haryana);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (123031, @CityId);


-- Insert cities under Haryana with no pincodes
INSERT INTO Cities (Name, LocationId) VALUES ('Faridabad', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Charkhi Dadri', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Gohana', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Gurugram', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Tohana', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Karnal', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Jagadhari', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Jind', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Palwal', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Kaithal', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Kurukshetra', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Sonipat', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Ambala', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Jhajjar', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Yamuna Nagar', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Fatehabad', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Narnaul', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Panipat', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Ballabhgarh', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Hansi', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Hisar', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Rewari', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Bahadurgarh', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Rohtak', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Naraingarh', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Cheeka', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Mandi Dabwali', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Sirsa', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Panchkula', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Pundri', @LocationId_Haryana);
INSERT INTO Cities (Name, LocationId) VALUES ('Pehowa', @LocationId_Haryana);

DECLARE @LocationId_UP INT;
INSERT INTO Locations (Name) VALUES ('Uttar Pradesh');
SET @LocationId_UP = SCOPE_IDENTITY();

-- Insert Ghaziabad under Uttar Pradesh
INSERT INTO Cities (Name, LocationId) VALUES ('Ghaziabad', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(201001, @CityId), (201002, @CityId), (201003, @CityId), (201004, @CityId), 
(201005, @CityId), (201006, @CityId), (201007, @CityId), (201008, @CityId), 
(201009, @CityId), (201010, @CityId), (201011, @CityId), (201012, @CityId), 
(201013, @CityId), (201014, @CityId), (201015, @CityId), (201016, @CityId), 
(201017, @CityId), (201018, @CityId), (201020, @CityId), (201021, @CityId), 
(201101, @CityId), (201103, @CityId), (201201, @CityId), (201205, @CityId), 
(201207, @CityId), (201302, @CityId), (201304, @CityId), (245102, @CityId), 
(245205, @CityId), (245207, @CityId), (245208, @CityId), (245301, @CityId);

-- Insert Loni under Uttar Pradesh
INSERT INTO Cities (Name, LocationId) VALUES ('Loni', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (201102, @CityId);

-- Insert Modinagar under Uttar Pradesh
INSERT INTO Cities (Name, LocationId) VALUES ('Modinagar', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (201204, @CityId);

-- Insert Gautam Buddha Nagar under Uttar Pradesh
INSERT INTO Cities (Name, LocationId) VALUES ('Gautam Buddha Nagar', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(201031, @CityId), (201203, @CityId), (201303, @CityId), (201305, @CityId),
(201306, @CityId), (201307, @CityId), (201308, @CityId), (201309, @CityId),
(201310, @CityId), (201311, @CityId), (201312, @CityId), (201313, @CityId),
(201314, @CityId), (201315, @CityId), (201316, @CityId), (201317, @CityId),
(201318, @CityId), (203209, @CityId), (203307, @CityId);

-- Insert Aligarh under Uttar Pradesh
INSERT INTO Cities (Name, LocationId) VALUES ('Aligarh', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(200201, @CityId), (202001, @CityId), (202002, @CityId), (202117, @CityId),
(202118, @CityId), (202119, @CityId), (202121, @CityId), (202122, @CityId),
(202125, @CityId), (202126, @CityId), (202128, @CityId), (202130, @CityId),
(202131, @CityId), (202133, @CityId), (202134, @CityId), (202135, @CityId),
(202136, @CityId), (202137, @CityId), (202139, @CityId), (202140, @CityId),
(202141, @CityId), (202142, @CityId), (202143, @CityId), (202145, @CityId),
(202146, @CityId), (202150, @CityId), (202151, @CityId), (202155, @CityId),
(202165, @CityId), (202170, @CityId), (202171, @CityId), (202281, @CityId),
(202282, @CityId), (202308, @CityId), (204103, @CityId), (204105, @CityId),
(204205, @CityId), (204206, @CityId), (204207, @CityId), (204208, @CityId),
(204209, @CityId), (204210, @CityId), (204211, @CityId), (204214, @CityId),
(204215, @CityId), (204216, @CityId), (205130, @CityId);

-- Insert Pilkhana
INSERT INTO Cities (Name, LocationId) VALUES ('Pilkhana', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (202120, @CityId);


-- Insert Gonda
INSERT INTO Cities (Name, LocationId) VALUES ('Gonda', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(202123, @CityId), (271001, @CityId), (271002, @CityId), (271003, @CityId),
(271122, @CityId), (271123, @CityId), (271125, @CityId), (271126, @CityId),
(271127, @CityId), (271129, @CityId), (271202, @CityId), (271203, @CityId),
(271204, @CityId), (271207, @CityId), (271209, @CityId), (271210, @CityId),
(271211, @CityId), (271212, @CityId), (271213, @CityId), (271301, @CityId),
(271302, @CityId), (271304, @CityId), (271305, @CityId), (271306, @CityId),
(271307, @CityId), (271309, @CityId), (271310, @CityId), (271311, @CityId),
(271312, @CityId), (271313, @CityId), (271314, @CityId), (271315, @CityId),
(271316, @CityId), (271317, @CityId), (271318, @CityId), (271319, @CityId),
(271320, @CityId), (271321, @CityId), (271401, @CityId), (271402, @CityId),
(271403, @CityId), (271404, @CityId), (271405, @CityId), (271407, @CityId),
(271408, @CityId), (271502, @CityId), (271503, @CityId), (271504, @CityId),
(271601, @CityId), (271602, @CityId), (271603, @CityId), (271605, @CityId),
(271607, @CityId), (271828, @CityId), (271861, @CityId);


-- Insert Iglas
INSERT INTO Cities (Name, LocationId) VALUES ('Iglas', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (202124, @CityId);

-- Insert Chandauli
INSERT INTO Cities (Name, LocationId) VALUES ('Chandauli', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(202127, @CityId), (202144, @CityId), (221009, @CityId), (221012, @CityId),
(224164, @CityId), (232102, @CityId), (232104, @CityId), (232105, @CityId),
(232117, @CityId), (242308, @CityId);


-- Insert Kauriaganj
INSERT INTO Cities (Name, LocationId) VALUES ('Kauriaganj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (202129, @CityId);


-- Insert Etah
INSERT INTO Cities (Name, LocationId) VALUES ('Etah', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(202132, @CityId), (207001, @CityId), (207002, @CityId), (207003, @CityId),
(207120, @CityId), (207126, @CityId), (207250, @CityId), (207302, @CityId),
(227805, @CityId), (242415, @CityId), (281104, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Khair', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (202138, @CityId);


INSERT INTO Cities (Name, LocationId) VALUES ('Atrauli', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (202280, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Bulandshahr', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(202389, @CityId), (202391, @CityId), (202392, @CityId), (202394, @CityId),
(202397, @CityId), (202398, @CityId), (203001, @CityId), (203002, @CityId),
(203121, @CityId), (203129, @CityId), (203131, @CityId), (203132, @CityId),
(203135, @CityId), (203145, @CityId), (203150, @CityId), (203155, @CityId),
(203202, @CityId), (203203, @CityId), (203205, @CityId), (203206, @CityId),
(203389, @CityId), (203390, @CityId), (203391, @CityId), (203392, @CityId),
(203393, @CityId), (203394, @CityId), (203395, @CityId), (203396, @CityId),
(203397, @CityId), (203398, @CityId), (203399, @CityId), (203401, @CityId),
(203402, @CityId), (203403, @CityId), (203405, @CityId), (203407, @CityId),
(203408, @CityId), (203409, @CityId), (203411, @CityId), (203412, @CityId),
(245402, @CityId), (245406, @CityId), (245407, @CityId), (245408, @CityId),
(245409, @CityId), (245412, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Anupshahr', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (202390, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Dibai', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (202393, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Shikarpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (202395, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Pahasu', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (202396, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Bahjoi', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (202410, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Bilari', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (202411, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Moradabad', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(202412, @CityId), (202415, @CityId), (202416, @CityId), (244001, @CityId), (244102, @CityId),
(244103, @CityId), (244104, @CityId), (244105, @CityId), (244231, @CityId), (244236, @CityId),
(244249, @CityId), (244251, @CityId), (244255, @CityId), (244302, @CityId), (244303, @CityId),
(244304, @CityId), (244401, @CityId), (244402, @CityId), (244410, @CityId), (244411, @CityId),
(244413, @CityId), (244415, @CityId), (244501, @CityId), (244502, @CityId), (244504, @CityId),
(244602, @CityId), (244711, @CityId), (244715, @CityId), (244926, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Kundarki', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (202413, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Narauli', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (202414, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Babrala', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (202521, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Gunnaur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (202522, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Badaun', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(202523, @CityId), (202524, @CityId), (202527, @CityId), (243601, @CityId), 
(243631, @CityId), (243632, @CityId), (243634, @CityId), (243636, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Saidpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (202525, @CityId), (245411, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Wazirganj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (202526, @CityId), (271124, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Chhibramau', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (202721, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Jewar', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (203133, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Jahangirpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (203141, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Dankaur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (203201, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Dadri', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (203207, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Hathras', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (204101, @CityId), (204102, @CityId), (224125, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Kanth', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (204104, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Hasayan', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (204212, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Mursan', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (204213, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Gola Bazar', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (205001, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Mainpuri', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(205119, @CityId), (205120, @CityId), (205121, @CityId), (205122, @CityId),
(205135, @CityId), (205142, @CityId), (205145, @CityId), (205147, @CityId),
(205231, @CityId), (205247, @CityId), (205261, @CityId), (205263, @CityId),
(205266, @CityId), (205267, @CityId), (205268, @CityId), (205302, @CityId),
(205303, @CityId), (205304, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Jasrana', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (205125, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Madhoganj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (205141, @CityId), (230403, @CityId), (241302, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Sirsaganj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (205151, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Bhogaon', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (205262, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Karhal', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (205264, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Kuraoli', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (205265, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Farukhabad', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(205301, @CityId), (207502, @CityId), (207503, @CityId), (207504, @CityId), 
(209601, @CityId), (209602, @CityId), (209621, @CityId), (209622, @CityId),
(209625, @CityId), (209721, @CityId), (209725, @CityId), (209726, @CityId),
(209727, @CityId), (209733, @CityId), (209734, @CityId), (209736, @CityId),
(209738, @CityId), (209739, @CityId), (209743, @CityId), (209770, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Etwah', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(206001, @CityId), (206003, @CityId), (206013, @CityId), (206120, @CityId),
(206121, @CityId), (206123, @CityId), (206125, @CityId), (206128, @CityId),
(206129, @CityId), (206130, @CityId), (206131, @CityId), (206241, @CityId),
(206244, @CityId), (206246, @CityId), (206247, @CityId), (206248, @CityId),
(206249, @CityId), (206250, @CityId), (206251, @CityId), (206252, @CityId),
(206253, @CityId), (207121, @CityId), (207122, @CityId), (207124, @CityId),
(207125, @CityId), (207242, @CityId), (207243, @CityId), (207244, @CityId),
(207246, @CityId), (207248, @CityId), (207249, @CityId), (207402, @CityId),
(207403, @CityId), (207404, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Etawah', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (206002, @CityId), (206245, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Auraiya', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (206122, @CityId), (206255, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Bakewar', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (206124, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Ekdil', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (206126, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Lakhna', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (206127, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Bharthana', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (206242, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Bidhuna', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (206243, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Jaswantnagar', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (206254, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Bewar', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (206301, @CityId), (210501, @CityId);

INSERT INTO Cities (Name, LocationId) VALUES ('Kishni', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (206302, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Kusmara', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (206303, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Mohammadabad', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (206451, @CityId), (233227, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Kasganj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (207123, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Amanpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (207241, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Sahawar', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (207245, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Aliganj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(207247, @CityId), (210001, @CityId), (243305, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Awagarh', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (207301, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Marehra', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (207401, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Nawabganj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(207501, @CityId), (209859, @CityId), (262406, @CityId), (271303, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Kanpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(208001, @CityId), (208002, @CityId), (208003, @CityId), (208004, @CityId),
(208005, @CityId), (208006, @CityId), (208007, @CityId), (208010, @CityId),
(208011, @CityId), (208012, @CityId), (208013, @CityId), (208014, @CityId),
(208015, @CityId), (208016, @CityId), (208017, @CityId), (208018, @CityId),
(208019, @CityId), (208020, @CityId), (208021, @CityId), (208022, @CityId),
(208023, @CityId), (208024, @CityId), (208025, @CityId), (208027, @CityId),
(208039, @CityId), (209115, @CityId), (209121, @CityId), (209125, @CityId),
(209202, @CityId), (209203, @CityId), (209204, @CityId), (209205, @CityId),
(209207, @CityId), (209208, @CityId), (209209, @CityId), (209217, @CityId),
(209301, @CityId), (209304, @CityId), (209305, @CityId), (209307, @CityId),
(209401, @CityId), (209402, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Akbarpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (209101, @CityId), (224122, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Pukhrayan', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (209111, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Amraudha', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (209112, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Bithoor', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (209201, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Ghatampur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (209206, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Rura', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (209303, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Rasulabad', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (209306, @CityId), (224172, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Jhinjhak', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (209320, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Gursahaiganj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (209722, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Faizabad', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(209723, @CityId), (224001, @CityId), (224116, @CityId), (224117, @CityId), (224118, @CityId),
(224119, @CityId), (224120, @CityId), (224121, @CityId), (224127, @CityId), (224129, @CityId),
(224132, @CityId), (224133, @CityId), (224135, @CityId), (224139, @CityId), (224141, @CityId),
(224143, @CityId), (224145, @CityId), (224147, @CityId), (224151, @CityId), (224152, @CityId),
(224153, @CityId), (224155, @CityId), (224157, @CityId), (224158, @CityId), (224159, @CityId),
(224161, @CityId), (224166, @CityId), (224167, @CityId), (224168, @CityId), (224171, @CityId),
(224175, @CityId), (224182, @CityId), (224183, @CityId), (224188, @CityId), (224189, @CityId),
(224195, @CityId), (224198, @CityId), (224201, @CityId), (224202, @CityId), (224203, @CityId),
(224205, @CityId), (224206, @CityId), (224207, @CityId), (224208, @CityId), (224209, @CityId),
(224210, @CityId), (224211, @CityId), (224212, @CityId), (224213, @CityId), (224214, @CityId),
(224215, @CityId), (224216, @CityId), (224217, @CityId), (224219, @CityId), (224220, @CityId),
(224221, @CityId), (224222, @CityId), (224223, @CityId), (224224, @CityId), (224225, @CityId),
(224228, @CityId), (224229, @CityId), (224234, @CityId), (224284, @CityId), (248691, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Kamalganj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (209724, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Saurikh', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (209728, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Sikanderpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (209729, @CityId), (224186, @CityId), (277303, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Talgram', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (209731, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Kannauj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(209732, @CityId), (209735, @CityId), (209747, @CityId), (229418, @CityId), (242404, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Unnao', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(209506, @CityId), (209801, @CityId), (209821, @CityId), (209827, @CityId), (209831, @CityId),
(209841, @CityId), (209860, @CityId), (209862, @CityId), (209864, @CityId), (209865, @CityId),
(209866, @CityId), (209867, @CityId), (209868, @CityId), (209869, @CityId), (209870, @CityId),
(209871, @CityId), (209881, @CityId), (229503, @CityId), (229504, @CityId),
(241502, @CityId), (241503, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Purwa', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (209825, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Mohan', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (209851, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Gangaghat', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (209861, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Banda', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(210101, @CityId), (210120, @CityId), (210122, @CityId), (210123, @CityId), (210125, @CityId),
(210126, @CityId), (210201, @CityId), (210202, @CityId), (210203, @CityId), (210204, @CityId),
(210206, @CityId), (210209, @CityId), (242402, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Baberu', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (210121, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Tindwari', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (210128, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Naraini', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (210129, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Rajapur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (210205, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Manikpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (210208, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Hamirpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(210301, @CityId), (210321, @CityId), (210341, @CityId), (210421, @CityId), (210422, @CityId),
(210423, @CityId), (210424, @CityId), (210428, @CityId), (210429, @CityId), (210430, @CityId),
(210431, @CityId), (210432, @CityId), (210433, @CityId), (210434, @CityId),
(210502, @CityId), (210504, @CityId), (210506, @CityId), (210507, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Kharela', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (210425, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Mahoba', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(210426, @CityId), (210427, @CityId), (229401, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Kurara', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (210505, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Prayagraj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(211001, @CityId), (211002, @CityId), (211003, @CityId), (211004, @CityId), (211005, @CityId),
(211006, @CityId), (211007, @CityId), (211008, @CityId), (211009, @CityId), (211010, @CityId),
(211011, @CityId), (211012, @CityId), (211013, @CityId), (211014, @CityId), (211015, @CityId),
(211016, @CityId), (211017, @CityId), (211018, @CityId), (211019, @CityId), (211021, @CityId),
(211022, @CityId), (211105, @CityId), (212105, @CityId), (212106, @CityId), (212107, @CityId),
(212111, @CityId), (212204, @CityId), (212205, @CityId), (212208, @CityId), (212212, @CityId),
(212213, @CityId), (212214, @CityId), (212215, @CityId), (212216, @CityId), (212301, @CityId),
(212302, @CityId), (212303, @CityId), (212304, @CityId), (212305, @CityId), (212306, @CityId),
(212307, @CityId), (212401, @CityId), (212403, @CityId), (212404, @CityId), (212405, @CityId),
(212410, @CityId), (212501, @CityId), (212502, @CityId), (212503, @CityId), (212507, @CityId),
(221504, @CityId), (221505, @CityId), (221507, @CityId), (221508, @CityId), (229411, @CityId),
(229412, @CityId), (229413, @CityId), (242222, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Bharatganj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (212104, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Shankargarh', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (212108, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Sikandra', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (212109, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Bharwari', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (212201, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Chail', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (212202, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Kaushambi', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(212203, @CityId), (212207, @CityId), (212218, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Karari', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (212206, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Sirathu', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (212217, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Phulpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(212402, @CityId), (221205, @CityId), (276304, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Fatehpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(212601, @CityId), (212620, @CityId), (212622, @CityId), (212631, @CityId), (212641, @CityId),
(212645, @CityId), (212650, @CityId), (212651, @CityId), (212652, @CityId), (212653, @CityId),
(212654, @CityId), (212656, @CityId), (212657, @CityId), (212658, @CityId), (212659, @CityId),
(212661, @CityId), (212663, @CityId), (212664, @CityId), (212665, @CityId), (213113, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Ghazipur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(212621, @CityId), (226010, @CityId), (229501, @CityId), (232325, @CityId), (232326, @CityId),
(232327, @CityId), (232328, @CityId), (232330, @CityId), (232331, @CityId), (232332, @CityId),
(232333, @CityId), (232334, @CityId), (232335, @CityId), (232336, @CityId), (232338, @CityId),
(232339, @CityId), (232340, @CityId), (232341, @CityId), (232342, @CityId), (233001, @CityId),
(233002, @CityId), (233201, @CityId), (233208, @CityId), (233221, @CityId), (233222, @CityId),
(233224, @CityId), (233225, @CityId), (233226, @CityId), (233228, @CityId), (233229, @CityId),
(233230, @CityId), (233231, @CityId), (233232, @CityId), (233233, @CityId), (233234, @CityId),
(233235, @CityId), (233236, @CityId), (233300, @CityId), (233301, @CityId), (233302, @CityId),
(233303, @CityId), (233304, @CityId), (233305, @CityId), (233306, @CityId), (233307, @CityId),
(233309, @CityId), (233310, @CityId), (233311, @CityId), (233312, @CityId), (233337, @CityId),
(236488, @CityId), (262328, @CityId), (275202, @CityId), (275203, @CityId), (275205, @CityId),
(275206, @CityId), (275208, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Bindki', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (212635, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Khaga', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (212655, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Harduaganj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (220325, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Varanasi', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(143251, @CityId), (221001, @CityId), (221002, @CityId), (221003, @CityId), (221004, @CityId),
(221005, @CityId), (221006, @CityId), (221007, @CityId), (221008, @CityId), (221010, @CityId),
(221011, @CityId), (221101, @CityId), (221102, @CityId), (221103, @CityId), (221104, @CityId),
(221105, @CityId), (221106, @CityId), (221107, @CityId), (221108, @CityId), (221109, @CityId),
(221110, @CityId), (221111, @CityId), (221112, @CityId), (221113, @CityId), (221115, @CityId),
(221116, @CityId), (221131, @CityId), (221201, @CityId), (221202, @CityId), (221206, @CityId),
(221207, @CityId), (221208, @CityId), (221209, @CityId), (221210, @CityId), (221211, @CityId),
(221301, @CityId), (221305, @CityId), (221307, @CityId), (221308, @CityId), (221309, @CityId),
(221310, @CityId), (221311, @CityId), (221312, @CityId), (221313, @CityId), (221314, @CityId),
(221402, @CityId), (221403, @CityId), (221405, @CityId), (221406, @CityId), (221407, @CityId),
(221408, @CityId), (232101, @CityId), (232106, @CityId), (232107, @CityId), (232108, @CityId),
(232109, @CityId), (232110, @CityId), (232111, @CityId), (232112, @CityId), (232113, @CityId),
(232114, @CityId), (232116, @CityId), (232118, @CityId), (232119, @CityId), (232120, @CityId),
(244225, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Baragaon', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(221204, @CityId), (222102, @CityId), (224126, @CityId), (284121, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Gangapur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (221302, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Gopiganj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (221303, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Gyanpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (221304, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Khamaria', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (221306, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Bhadohi', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (221401, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Suriyawan', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (221404, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Nai Bazar', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (221409, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Mirzapur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(212815, @CityId), (221501, @CityId), (231001, @CityId), (231002, @CityId), (231206, @CityId),
(231207, @CityId), (231209, @CityId), (231213, @CityId), (231214, @CityId), (231215, @CityId),
(231216, @CityId), (231217, @CityId), (231218, @CityId), (231220, @CityId), (231221, @CityId),
(231222, @CityId), (231223, @CityId), (231225, @CityId), (231302, @CityId), (231303, @CityId),
(231305, @CityId), (231306, @CityId), (231307, @CityId), (231309, @CityId), (231310, @CityId),
(231311, @CityId), (231312, @CityId), (231313, @CityId), (231314, @CityId), (231501, @CityId),
(232221, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Baraut', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (221502, @CityId), (250611, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Handia', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (221503, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Jhusi', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (221506, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Azamgarh', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(221601, @CityId), (223221, @CityId), (223222, @CityId), (223224, @CityId), (223225, @CityId),
(223226, @CityId), (223227, @CityId), (275102, @CityId), (275105, @CityId), (275302, @CityId),
(275303, @CityId), (275306, @CityId), (275307, @CityId), (275501, @CityId), (276001, @CityId),
(276121, @CityId), (276122, @CityId), (276123, @CityId), (276124, @CityId), (276125, @CityId),
(276126, @CityId), (276127, @CityId), (276128, @CityId), (276129, @CityId), (276131, @CityId),
(276135, @CityId), (276136, @CityId), (276137, @CityId), (276138, @CityId), (276139, @CityId),
(276140, @CityId), (276142, @CityId), (276143, @CityId), (276201, @CityId), (276203, @CityId),
(276205, @CityId), (276207, @CityId), (276208, @CityId), (276288, @CityId), (276301, @CityId),
(276302, @CityId), (276303, @CityId), (276402, @CityId), (276403, @CityId), (276406, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Chitrakoot', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(210207, @CityId), (221602, @CityId), (221603, @CityId), (276405, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Ballia', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(221701, @CityId), (221705, @CityId), (221706, @CityId), (221709, @CityId),
(221711, @CityId), (221713, @CityId), (221714, @CityId), (221715, @CityId),
(221716, @CityId), (221717, @CityId), (221718, @CityId), (221719, @CityId),
(221720, @CityId), (221721, @CityId), (221722, @CityId), (277001, @CityId),
(277107, @CityId), (277121, @CityId), (277122, @CityId), (277123, @CityId),
(277124, @CityId), (277127, @CityId), (277201, @CityId), (277203, @CityId),
(277204, @CityId), (277205, @CityId), (277206, @CityId), (277207, @CityId),
(277208, @CityId), (277210, @CityId), (277212, @CityId), (277213, @CityId),
(277214, @CityId), (277215, @CityId), (277218, @CityId), (277219, @CityId),
(277301, @CityId), (277302, @CityId), (277304, @CityId), (277305, @CityId),
(277306, @CityId), (277307, @CityId), (277401, @CityId), (277402, @CityId),
(277403, @CityId), (277404, @CityId), (277405, @CityId), (277501, @CityId),
(277502, @CityId), (277503, @CityId), (277504, @CityId), (277506, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Rasra', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (221712, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Jaunpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(222001, @CityId), (222002, @CityId), (222003, @CityId), (222101, @CityId),
(222103, @CityId), (222104, @CityId), (222105, @CityId), (222107, @CityId),
(222108, @CityId), (222109, @CityId), (222110, @CityId), (222111, @CityId),
(222112, @CityId), (222113, @CityId), (222125, @CityId), (222126, @CityId),
(222127, @CityId), (222128, @CityId), (222129, @CityId), (222131, @CityId),
(222132, @CityId), (222133, @CityId), (222135, @CityId), (222136, @CityId),
(222137, @CityId), (222138, @CityId), (222139, @CityId), (222141, @CityId),
(222142, @CityId), (222143, @CityId), (222144, @CityId), (222145, @CityId),
(222146, @CityId), (222148, @CityId), (222149, @CityId), (222162, @CityId),
(222170, @CityId), (222172, @CityId), (222175, @CityId), (222180, @CityId),
(222181, @CityId), (222201, @CityId), (222202, @CityId), (222204, @CityId),
(222226, @CityId), (223102, @CityId), (223103, @CityId), (223104, @CityId),
(223105, @CityId), (223106, @CityId), (223107, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Mariahu', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (222161, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Mirganj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (222165, @CityId), (243504, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Rampur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(222203, @CityId), (233223, @CityId), (244701, @CityId), (244901, @CityId),
(244923, @CityId), (244927, @CityId), (244928, @CityId), (274405, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Sultanpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(222301, @CityId), (222302, @CityId), (222303, @CityId), (222304, @CityId), (227304, @CityId), (227406, @CityId), (227407, @CityId), (227408, @CityId),
(227409, @CityId), (227411, @CityId), (227412, @CityId), (227801, @CityId), (227802, @CityId), (227806, @CityId), (227807, @CityId), (227809, @CityId),
(227811, @CityId), (227812, @CityId), (227814, @CityId), (227815, @CityId), (227816, @CityId), (227817, @CityId), (228001, @CityId), (228118, @CityId),
(228119, @CityId), (228120, @CityId), (228121, @CityId), (228124, @CityId), (228125, @CityId), (228132, @CityId), (228133, @CityId), (228141, @CityId),
(228142, @CityId), (228151, @CityId), (228155, @CityId), (228159, @CityId), (228161, @CityId), (228171, @CityId), (228172, @CityId), (228820, @CityId),
(262125, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Shahganj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (223101, @CityId), (224184, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Atraulia', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (223223, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Ayodhya', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (224123, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Deoria', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(224137, @CityId), (274001, @CityId), (274121, @CityId), (274132, @CityId), (274182, @CityId), (274201, @CityId), (274205, @CityId), (274206, @CityId),
(274207, @CityId), (274208, @CityId), (274301, @CityId), (274302, @CityId), (274303, @CityId), (274306, @CityId), (274401, @CityId), (274404, @CityId),
(274406, @CityId), (274407, @CityId), (274408, @CityId), (274409, @CityId), (274501, @CityId), (274502, @CityId), (274505, @CityId), (274508, @CityId),
(274601, @CityId), (274602, @CityId), (274603, @CityId), (274604, @CityId), (274701, @CityId), (274702, @CityId), (274703, @CityId), (274704, @CityId),
(274705, @CityId), (274805, @CityId), (274806, @CityId), (274807, @CityId), (274808, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Jalalpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (224149, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Ramnagar', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (224181, @CityId), (243303, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Tanda', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (224190, @CityId), (244925, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Bikapur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (224204, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Ambedkar Nagar', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(224146, @CityId), (224176, @CityId), (224218, @CityId), (224227, @CityId), (224230, @CityId), (224231, @CityId), (224232, @CityId), (224235, @CityId),
(224238, @CityId), (242473, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Banki', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (225001, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Barabanki', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(225002, @CityId), (225003, @CityId), (225119, @CityId), (225120, @CityId), (225121, @CityId), (225123, @CityId), (225124, @CityId), (225125, @CityId),
(225126, @CityId), (225201, @CityId), (225202, @CityId), (225203, @CityId), (225204, @CityId), (225205, @CityId), (225206, @CityId), (225207, @CityId),
(225208, @CityId), (225302, @CityId), (225303, @CityId), (225304, @CityId), (225305, @CityId), (225306, @CityId), (225401, @CityId), (225402, @CityId),
(225403, @CityId), (225404, @CityId), (225405, @CityId), (225406, @CityId), (225407, @CityId), (225409, @CityId), (225411, @CityId), (225412, @CityId),
(225413, @CityId), (225415, @CityId), (225416, @CityId), (227302, @CityId), (271841, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Satrikh', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (225122, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Dewa', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (225301, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Zaidpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (225414, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Lucknow', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(226001, @CityId), (226002, @CityId), (226003, @CityId), (226004, @CityId), (226005, @CityId), (226006, @CityId), (226007, @CityId), (226008, @CityId),
(226009, @CityId), (226011, @CityId), (226012, @CityId), (226013, @CityId), (226014, @CityId), (226015, @CityId), (226016, @CityId), (226017, @CityId),
(226018, @CityId), (226019, @CityId), (226020, @CityId), (226021, @CityId), (226022, @CityId), (226023, @CityId), (226024, @CityId), (226025, @CityId),
(226026, @CityId), (226027, @CityId), (226028, @CityId), (226029, @CityId), (226030, @CityId), (226031, @CityId), (226101, @CityId), (226102, @CityId),
(226103, @CityId), (226104, @CityId), (226106, @CityId), (226201, @CityId), (226202, @CityId), (226203, @CityId), (226301, @CityId), (226302, @CityId),
(226303, @CityId), (226401, @CityId), (226501, @CityId), (227101, @CityId), (227105, @CityId), (227106, @CityId), (227115, @CityId), (227116, @CityId),
(227125, @CityId), (227131, @CityId), (227132, @CityId), (227202, @CityId), (227205, @CityId), (227208, @CityId), (227305, @CityId), (227309, @CityId),
(714403, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Malihabad', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (227111, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Amethi', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (227120, @CityId), (227405, @CityId), (227413, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Haidergarh', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (227301, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Nagram', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (227308, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Hasanpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (227808, @CityId), (244241, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Musafirkhana', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (227813, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Dostpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (228131, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Kadipur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (228145, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Raibareilly', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(229001, @CityId), (229010, @CityId), (229121, @CityId), (229122, @CityId), (229123, @CityId), (229124, @CityId), (229125, @CityId), (229126, @CityId),
(229128, @CityId), (229129, @CityId), (229130, @CityId), (229201, @CityId), (229202, @CityId), (229204, @CityId), (229205, @CityId), (229207, @CityId),
(229208, @CityId), (229209, @CityId), (229211, @CityId), (229212, @CityId), (229215, @CityId), (229216, @CityId), (229302, @CityId), (229303, @CityId),
(229304, @CityId), (229306, @CityId), (229307, @CityId), (229308, @CityId), (229309, @CityId), (229310, @CityId), (229311, @CityId), (229402, @CityId),
(229403, @CityId), (229404, @CityId), (229405, @CityId), (230131, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Salon', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (229127, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Dalmau', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (229203, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Lalganj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(229206, @CityId), (230132, @CityId), (231211, @CityId), (276202, @CityId), (277216, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Bachhrawan', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (229301, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Jais', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (229305, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Pratapgarh', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(229406, @CityId), (229407, @CityId), (229408, @CityId), (229410, @CityId), (229414, @CityId), (229415, @CityId), (229416, @CityId), (229417, @CityId),
(229419, @CityId), (230001, @CityId), (230121, @CityId), (230122, @CityId), (230123, @CityId), (230124, @CityId), (230125, @CityId), (230126, @CityId),
(230127, @CityId), (230128, @CityId), (230129, @CityId), (230130, @CityId), (230133, @CityId), (230134, @CityId), (230136, @CityId), (230137, @CityId),
(230138, @CityId), (230139, @CityId), (230140, @CityId), (230141, @CityId), (230142, @CityId), (230143, @CityId), (230144, @CityId), (230145, @CityId),
(230201, @CityId), (230202, @CityId), (230204, @CityId), (230301, @CityId), (230302, @CityId), (230303, @CityId), (230304, @CityId), (230305, @CityId),
(230306, @CityId), (230401, @CityId), (230402, @CityId), (230404, @CityId), (230405, @CityId), (230406, @CityId), (230502, @CityId), (230503, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Bhagwant Nagar', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (229502, @CityId), (241303, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Pratapgarh City', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (230002, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Patti', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (230135, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Antu', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (230501, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Chopan', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (231205, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Dudhi', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (231208, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Ghorawal', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (231210, @CityId);

-- Sonbhadra
INSERT INTO Cities (Name, LocationId) VALUES ('Sonbhadra', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (231212, @CityId), (231224, @CityId);

-- Obra
INSERT INTO Cities (Name, LocationId) VALUES ('Obra', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (231219, @CityId);

-- Ahraura
INSERT INTO Cities (Name, LocationId) VALUES ('Ahraura', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (231301, @CityId);

-- Chunar
INSERT INTO Cities (Name, LocationId) VALUES ('Chunar', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (231304, @CityId);

-- Chakia
INSERT INTO Cities (Name, LocationId) VALUES ('Chakia', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (232103, @CityId);

-- Bisauli
INSERT INTO Cities (Name, LocationId) VALUES ('Bisauli', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (232115, @CityId);

-- Zamania
INSERT INTO Cities (Name, LocationId) VALUES ('Zamania', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (232329, @CityId);

-- Talbehat
INSERT INTO Cities (Name, LocationId) VALUES ('Talbehat', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (234126, @CityId);

-- Hardoi
INSERT INTO Cities (Name, LocationId) VALUES ('Hardoi', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(241001, @CityId), (241121, @CityId), (241122, @CityId), (241125, @CityId), (241126, @CityId), (241127, @CityId), (241201, @CityId), (241202, @CityId),
(241203, @CityId), (241401, @CityId), (241402, @CityId), (241405, @CityId), (241406, @CityId), (241407, @CityId), (285131, @CityId);

-- Pali
INSERT INTO Cities (Name, LocationId) VALUES ('Pali', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (241123, @CityId);

-- Shahabad
INSERT INTO Cities (Name, LocationId) VALUES ('Shahabad', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (241124, @CityId), (244922, @CityId);

-- Sandila
INSERT INTO Cities (Name, LocationId) VALUES ('Sandila', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (241204, @CityId);

-- Bilgram
INSERT INTO Cities (Name, LocationId) VALUES ('Bilgram', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (241301, @CityId);

-- Beniganj
INSERT INTO Cities (Name, LocationId) VALUES ('Beniganj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (241304, @CityId);

-- Gausganj
INSERT INTO Cities (Name, LocationId) VALUES ('Gausganj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (241305, @CityId);

-- Sandi
INSERT INTO Cities (Name, LocationId) VALUES ('Sandi', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (241403, @CityId);

-- Gopamau
INSERT INTO Cities (Name, LocationId) VALUES ('Gopamau', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (241404, @CityId);

-- Bangarmau
INSERT INTO Cities (Name, LocationId) VALUES ('Bangarmau', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (241501, @CityId);

-- Safipur
INSERT INTO Cities (Name, LocationId) VALUES ('Safipur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (241504, @CityId);
-- Shahjahanpur
INSERT INTO Cities (Name, LocationId) VALUES ('Shahjahanpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(242001, @CityId), (242042, @CityId), (242101, @CityId), (242102, @CityId), (242103, @CityId), 
(242127, @CityId), (242220, @CityId), (242221, @CityId), (242223, @CityId), (242225, @CityId),
(242226, @CityId), (242227, @CityId), (242228, @CityId), (242229, @CityId), (242230, @CityId),
(242231, @CityId), (242232, @CityId), (242234, @CityId), (242301, @CityId), (242302, @CityId),
(242303, @CityId), (242306, @CityId), (242307, @CityId), (242309, @CityId), (242310, @CityId),
(242311, @CityId), (242312, @CityId), (242313, @CityId), (242314, @CityId), (242401, @CityId),
(242406, @CityId), (242407, @CityId), (242408, @CityId), (242409, @CityId), (242410, @CityId),
(242411, @CityId), (242413, @CityId), (242416, @CityId), (242417, @CityId), (242418, @CityId),
(242419, @CityId), (242420, @CityId), (242421, @CityId);

-- Khudaganj
INSERT INTO Cities (Name, LocationId) VALUES ('Khudaganj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (242305, @CityId);

-- Rudrapur
INSERT INTO Cities (Name, LocationId) VALUES ('Rudrapur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (242315, @CityId), (274204, @CityId);

-- Khutar
INSERT INTO Cities (Name, LocationId) VALUES ('Khutar', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (242405, @CityId);

-- Bareilly
INSERT INTO Cities (Name, LocationId) VALUES ('Bareilly', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(234001, @CityId), (243001, @CityId), (243002, @CityId), (243003, @CityId), (243004, @CityId),
(243005, @CityId), (243006, @CityId), (243101, @CityId), (243122, @CityId), (243123, @CityId),
(243124, @CityId), (243125, @CityId), (243126, @CityId), (243127, @CityId), (243202, @CityId),
(243203, @CityId), (243204, @CityId), (243206, @CityId), (243208, @CityId), (243302, @CityId),
(243304, @CityId), (243401, @CityId), (243402, @CityId), (243403, @CityId), (243404, @CityId),
(243407, @CityId), (243408, @CityId), (243501, @CityId), (243502, @CityId), (243506, @CityId),
(243509, @CityId), (262407, @CityId), (262411, @CityId), (703871, @CityId), (704688, @CityId),
(704750, @CityId), (704827, @CityId), (704912, @CityId), (714211, @CityId);

-- Baheri
INSERT INTO Cities (Name, LocationId) VALUES ('Baheri', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (243201, @CityId);

-- Aonla
INSERT INTO Cities (Name, LocationId) VALUES ('Aonla', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (243301, @CityId);

-- Faridpur
INSERT INTO Cities (Name, LocationId) VALUES ('Faridpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (243503, @CityId);

-- Shahi
INSERT INTO Cities (Name, LocationId) VALUES ('Shahi', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (243505, @CityId);

-- Usawan
INSERT INTO Cities (Name, LocationId) VALUES ('Usawan', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (243621, @CityId);

-- Bilsi
INSERT INTO Cities (Name, LocationId) VALUES ('Bilsi', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (243633, @CityId);

-- Dataganj
INSERT INTO Cities (Name, LocationId) VALUES ('Dataganj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (243635, @CityId);

-- Kakrala
INSERT INTO Cities (Name, LocationId) VALUES ('Kakrala', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (243637, @CityId);

-- Sahaswan
INSERT INTO Cities (Name, LocationId) VALUES ('Sahaswan', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (243638, @CityId);

-- Ujhani
INSERT INTO Cities (Name, LocationId) VALUES ('Ujhani', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (243639, @CityId);

-- Usehat
INSERT INTO Cities (Name, LocationId) VALUES ('Usehat', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (243641, @CityId);

-- Milak
INSERT INTO Cities (Name, LocationId) VALUES ('Milak', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (243701, @CityId);

-- Amroha
INSERT INTO Cities (Name, LocationId) VALUES ('Amroha', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (244221, @CityId), (244223, @CityId), (244245, @CityId);

-- Joya
INSERT INTO Cities (Name, LocationId) VALUES ('Joya', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (244222, @CityId);

-- Gajraula
INSERT INTO Cities (Name, LocationId) VALUES ('Gajraula', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (244235, @CityId);

-- Ujhari
INSERT INTO Cities (Name, LocationId) VALUES ('Ujhari', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (244242, @CityId);

-- Sirsi
INSERT INTO Cities (Name, LocationId) VALUES ('Sirsi', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (244301, @CityId);

-- Thakurdwara
INSERT INTO Cities (Name, LocationId) VALUES ('Thakurdwara', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (244601, @CityId);

-- Bilaspur
INSERT INTO Cities (Name, LocationId) VALUES ('Bilaspur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (244921, @CityId);

-- Suar
INSERT INTO Cities (Name, LocationId) VALUES ('Suar', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (244924, @CityId);

-- Hapur
INSERT INTO Cities (Name, LocationId) VALUES ('Hapur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (245101, @CityId);

-- Babugarh
INSERT INTO Cities (Name, LocationId) VALUES ('Babugarh', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (245201, @CityId);

-- Meerut
INSERT INTO Cities (Name, LocationId) VALUES ('Meerut', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(245206, @CityId), (250001, @CityId), (250002, @CityId), (250003, @CityId), (250004, @CityId),
(250005, @CityId), (250013, @CityId), (250102, @CityId), (250103, @CityId), (250104, @CityId),
(250105, @CityId), (250106, @CityId), (250110, @CityId), (250205, @CityId), (250222, @CityId),
(250223, @CityId), (250341, @CityId), (250342, @CityId), (250344, @CityId), (250402, @CityId),
(250403, @CityId), (250406, @CityId), (250501, @CityId), (250502, @CityId), (250601, @CityId),
(250602, @CityId), (250612, @CityId), (250615, @CityId), (250619, @CityId), (250621, @CityId),
(250622, @CityId), (250623, @CityId), (250625, @CityId), (255006, @CityId);

-- Pilkhuwa
INSERT INTO Cities (Name, LocationId) VALUES ('Pilkhuwa', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (245304, @CityId);

-- Aurangabad
INSERT INTO Cities (Name, LocationId) VALUES ('Aurangabad', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(245401, @CityId), (261403, @CityId), (262728, @CityId), (431003, @CityId),
(431006, @CityId), (431007, @CityId), (431136, @CityId);

-- Bugrasi
INSERT INTO Cities (Name, LocationId) VALUES ('Bugrasi', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (245403, @CityId);

-- Khanpur
INSERT INTO Cities (Name, LocationId) VALUES ('Khanpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (245405, @CityId);

-- Bijnor
INSERT INTO Cities (Name, LocationId) VALUES ('Bijnor', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(246701, @CityId), (246729, @CityId), (246736, @CityId), (246737, @CityId), (246764, @CityId);

-- Mandawar
INSERT INTO Cities (Name, LocationId) VALUES ('Mandawar', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (246721, @CityId);

-- Afzalgarh
INSERT INTO Cities (Name, LocationId) VALUES ('Afzalgarh', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (246722, @CityId);

-- Bijnore
INSERT INTO Cities (Name, LocationId) VALUES ('Bijnore', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(246723, @CityId), (246724, @CityId), (246727, @CityId), (246732, @CityId),
(246733, @CityId), (246734, @CityId), (246735, @CityId), (246748, @CityId),
(246751, @CityId), (246762, @CityId), (246763, @CityId);

-- Chandpur
INSERT INTO Cities (Name, LocationId) VALUES ('Chandpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (246725, @CityId);

-- Haldaur
INSERT INTO Cities (Name, LocationId) VALUES ('Haldaur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (246726, @CityId);

-- Jhalu
INSERT INTO Cities (Name, LocationId) VALUES ('Jhalu', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (246728, @CityId);

-- Kiratpur
INSERT INTO Cities (Name, LocationId) VALUES ('Kiratpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (246731, @CityId);

-- Sahaspur
INSERT INTO Cities (Name, LocationId) VALUES ('Sahaspur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (246745, @CityId);

-- Seohara
INSERT INTO Cities (Name, LocationId) VALUES ('Seohara', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (246746, @CityId);
-- Sherkot
INSERT INTO Cities (Name, LocationId) VALUES ('Sherkot', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (246747, @CityId);

-- Sahanpur
INSERT INTO Cities (Name, LocationId) VALUES ('Sahanpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (246749, @CityId);

-- Dhampur
INSERT INTO Cities (Name, LocationId) VALUES ('Dhampur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (246761, @CityId);

-- Saharanpur
INSERT INTO Cities (Name, LocationId) VALUES ('Saharanpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(247001, @CityId), (247002, @CityId), (247111, @CityId), (247120, @CityId), (247121, @CityId),
(247122, @CityId), (247129, @CityId), (247231, @CityId), (247232, @CityId), (247343, @CityId),
(247451, @CityId), (247453, @CityId), (247551, @CityId), (247554, @CityId), (247656, @CityId),
(247661, @CityId), (247662, @CityId), (247663, @CityId), (247665, @CityId), (247668, @CityId),
(247669, @CityId), (247670, @CityId), (247671, @CityId), (247672, @CityId), (247673, @CityId),
(249402, @CityId), (249404, @CityId), (249405, @CityId), (249408, @CityId), (249409, @CityId),
(249410, @CityId);

-- Ambehta
INSERT INTO Cities (Name, LocationId) VALUES ('Ambehta', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (247340, @CityId);

-- Gangoh
INSERT INTO Cities (Name, LocationId) VALUES ('Gangoh', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (247341, @CityId);

-- Nakur
INSERT INTO Cities (Name, LocationId) VALUES ('Nakur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (247342, @CityId);

-- Nanauta
INSERT INTO Cities (Name, LocationId) VALUES ('Nanauta', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (247452, @CityId);

-- Ailum
INSERT INTO Cities (Name, LocationId) VALUES ('Ailum', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (247771, @CityId);

-- Jalalabad
INSERT INTO Cities (Name, LocationId) VALUES ('Jalalabad', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (247772, @CityId), (275207, @CityId);

-- Jhinjhana
INSERT INTO Cities (Name, LocationId) VALUES ('Jhinjhana', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (247773, @CityId);

-- Kairana
INSERT INTO Cities (Name, LocationId) VALUES ('Kairana', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (247774, @CityId);

-- Muzaffarnagar
INSERT INTO Cities (Name, LocationId) VALUES ('Muzaffarnagar', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(111022, @CityId), (247775, @CityId), (247776, @CityId), (251001, @CityId), (251002, @CityId),
(251003, @CityId), (251202, @CityId), (251203, @CityId), (251301, @CityId), (251305, @CityId),
(251306, @CityId), (251307, @CityId), (251308, @CityId), (251310, @CityId), (251311, @CityId),
(251314, @CityId), (251315, @CityId), (251316, @CityId), (251317, @CityId), (251320, @CityId),
(251327, @CityId);

-- Thana Bhawan
INSERT INTO Cities (Name, LocationId) VALUES ('Thana Bhawan', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (247777, @CityId);

-- Un
INSERT INTO Cities (Name, LocationId) VALUES ('Un', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (247778, @CityId);

-- Daurala
INSERT INTO Cities (Name, LocationId) VALUES ('Daurala', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (250221, @CityId);

-- Baghpat
INSERT INTO Cities (Name, LocationId) VALUES ('Baghpat', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(250345, @CityId), (250609, @CityId), (250626, @CityId);

-- Mawana
INSERT INTO Cities (Name, LocationId) VALUES ('Mawana', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (250401, @CityId);

-- Hastinapur
INSERT INTO Cities (Name, LocationId) VALUES ('Hastinapur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (250404, @CityId);

-- Aminagar Sarai
INSERT INTO Cities (Name, LocationId) VALUES ('Aminagar Sarai', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (250604, @CityId);

-- Chhaprauli
INSERT INTO Cities (Name, LocationId) VALUES ('Chhaprauli', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (250617, @CityId);

-- Khatauli
INSERT INTO Cities (Name, LocationId) VALUES ('Khatauli', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (251201, @CityId);

-- Budhana
INSERT INTO Cities (Name, LocationId) VALUES ('Budhana', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (251309, @CityId);
-- Shahpur
INSERT INTO Cities (Name, LocationId) VALUES ('Shahpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (251318, @CityId);

-- Sisauli
INSERT INTO Cities (Name, LocationId) VALUES ('Sisauli', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (251319, @CityId);

-- Sitapur
INSERT INTO Cities (Name, LocationId) VALUES ('Sitapur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(261001, @CityId), (261121, @CityId), (261125, @CityId), (261136, @CityId), (261145, @CityId),
(261151, @CityId), (261203, @CityId), (261205, @CityId), (261206, @CityId), (261207, @CityId),
(261208, @CityId), (261301, @CityId), (261302, @CityId), (261303, @CityId), (261401, @CityId),
(261402, @CityId), (261404, @CityId), (261405, @CityId), (261501, @CityId);

-- Khairabad
INSERT INTO Cities (Name, LocationId) VALUES ('Khairabad', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (261131, @CityId);

-- Laharpur
INSERT INTO Cities (Name, LocationId) VALUES ('Laharpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (261135, @CityId);

-- Maholi
INSERT INTO Cities (Name, LocationId) VALUES ('Maholi', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (261141, @CityId);

-- Biswan
INSERT INTO Cities (Name, LocationId) VALUES ('Biswan', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (261201, @CityId);

-- Jahangirabad
INSERT INTO Cities (Name, LocationId) VALUES ('Jahangirabad', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (261202, @CityId);

-- Mathura
INSERT INTO Cities (Name, LocationId) VALUES ('Mathura', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(209863, @CityId), (261204, @CityId), (281001, @CityId), (281002, @CityId), (281003, @CityId),
(281004, @CityId), (281005, @CityId), (281006, @CityId), (281112, @CityId), (281121, @CityId),
(281122, @CityId), (281123, @CityId), (281202, @CityId), (281203, @CityId), (281205, @CityId),
(281206, @CityId), (281302, @CityId), (281304, @CityId), (281307, @CityId), (281308, @CityId),
(281401, @CityId), (281402, @CityId), (281403, @CityId), (281406, @CityId), (281501, @CityId),
(281502, @CityId), (281503, @CityId);

-- Kheri
INSERT INTO Cities (Name, LocationId) VALUES ('Kheri', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(261502, @CityId), (261505, @CityId), (261506, @CityId), (261606, @CityId), (262702, @CityId),
(262721, @CityId), (262722, @CityId), (262723, @CityId), (262724, @CityId), (262725, @CityId),
(262726, @CityId), (262727, @CityId), (262801, @CityId), (262802, @CityId), (262901, @CityId),
(262902, @CityId), (262903, @CityId), (262904, @CityId), (262905, @CityId), (262906, @CityId),
(262907, @CityId), (262908, @CityId);

-- Pilibhit
INSERT INTO Cities (Name, LocationId) VALUES ('Pilibhit', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(242123, @CityId), (262001, @CityId), (262121, @CityId), (262123, @CityId), (262124, @CityId),
(262301, @CityId), (262302, @CityId), (262305, @CityId);

-- Bisalpur
INSERT INTO Cities (Name, LocationId) VALUES ('Bisalpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (262201, @CityId);

-- Bilsanda
INSERT INTO Cities (Name, LocationId) VALUES ('Bilsanda', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (262202, @CityId);

-- Barkhera
INSERT INTO Cities (Name, LocationId) VALUES ('Barkhera', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (262203, @CityId);

-- Mailani
INSERT INTO Cities (Name, LocationId) VALUES ('Mailani', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (262803, @CityId);

-- Mohammadi
INSERT INTO Cities (Name, LocationId) VALUES ('Mohammadi', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (262804, @CityId);

-- Sikandrabad
INSERT INTO Cities (Name, LocationId) VALUES ('Sikandrabad', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (262805, @CityId);

-- Balrampur
INSERT INTO Cities (Name, LocationId) VALUES ('Balrampur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(271201, @CityId), (271205, @CityId), (271215, @CityId), (271609, @CityId);

-- Pachperwa
INSERT INTO Cities (Name, LocationId) VALUES ('Pachperwa', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (271206, @CityId);

-- Tulsipur
INSERT INTO Cities (Name, LocationId) VALUES ('Tulsipur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (271208, @CityId);

-- Colonelganj
INSERT INTO Cities (Name, LocationId) VALUES ('Colonelganj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (271308, @CityId);

-- Utraula
INSERT INTO Cities (Name, LocationId) VALUES ('Utraula', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (271604, @CityId);

-- Bahraich
INSERT INTO Cities (Name, LocationId) VALUES ('Bahraich', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(271801, @CityId), (271802, @CityId), (271806, @CityId), (271821, @CityId), (271822, @CityId),
(271823, @CityId), (271824, @CityId), (271825, @CityId), (271826, @CityId), (271827, @CityId),
(271829, @CityId), (271830, @CityId), (271832, @CityId), (271833, @CityId), (271834, @CityId),
(271836, @CityId), (271851, @CityId), (271855, @CityId), (271864, @CityId), (271870, @CityId),
(271872, @CityId), (271875, @CityId), (271880, @CityId), (271881, @CityId), (271882, @CityId),
(271901, @CityId), (271902, @CityId), (271903, @CityId), (271905, @CityId);

-- Bhinga
INSERT INTO Cities (Name, LocationId) VALUES ('Bhinga', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (271831, @CityId);

-- Ikauna
INSERT INTO Cities (Name, LocationId) VALUES ('Ikauna', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (271845, @CityId);

-- Nanpara
INSERT INTO Cities (Name, LocationId) VALUES ('Nanpara', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (271865, @CityId);

-- Shrawasti
INSERT INTO Cities (Name, LocationId) VALUES ('Shrawasti', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(271803, @CityId), (271804, @CityId), (271805, @CityId), (271835, @CityId), (271840, @CityId), (271871, @CityId);

-- Jarwal
INSERT INTO Cities (Name, LocationId) VALUES ('Jarwal', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (271904, @CityId);

-- Basti
INSERT INTO Cities (Name, LocationId) VALUES ('Basti', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(272001, @CityId), (272002, @CityId), (272003, @CityId), (272120, @CityId), (272123, @CityId),
(272124, @CityId), (272125, @CityId), (272127, @CityId), (272128, @CityId), (272130, @CityId),
(272131, @CityId), (272141, @CityId), (272148, @CityId), (272150, @CityId), (272151, @CityId),
(272152, @CityId), (272155, @CityId), (272159, @CityId), (272161, @CityId), (272162, @CityId),
(272163, @CityId), (272165, @CityId), (272172, @CityId), (272177, @CityId), (272178, @CityId),
(272181, @CityId), (272182, @CityId), (272190, @CityId), (272191, @CityId), (272194, @CityId),
(272201, @CityId), (272202, @CityId), (272204, @CityId), (272205, @CityId), (272206, @CityId),
(272207, @CityId), (272208, @CityId), (272211, @CityId), (272212, @CityId), (272301, @CityId), (272302, @CityId);

-- Harraiya
INSERT INTO Cities (Name, LocationId) VALUES ('Harraiya', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (272135, @CityId);

-- Bansi
INSERT INTO Cities (Name, LocationId) VALUES ('Bansi', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (272153, @CityId), (284122, @CityId);

-- Hariharpur
INSERT INTO Cities (Name, LocationId) VALUES ('Hariharpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (272164, @CityId);

-- Mehdawal
INSERT INTO Cities (Name, LocationId) VALUES ('Mehdawal', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (272171, @CityId);

-- Maghar
INSERT INTO Cities (Name, LocationId) VALUES ('Maghar', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (272173, @CityId);

-- Khalilabad
INSERT INTO Cities (Name, LocationId) VALUES ('Khalilabad', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (272175, @CityId), (272271, @CityId);

-- Siddharthnagar
INSERT INTO Cities (Name, LocationId) VALUES ('Siddharthnagar', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(272189, @CityId), (272192, @CityId), (272193, @CityId), (272195, @CityId), (272203, @CityId);

-- Sahjanwa
INSERT INTO Cities (Name, LocationId) VALUES ('Sahjanwa', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (272209, @CityId);

-- Gorakhpur
INSERT INTO Cities (Name, LocationId) VALUES ('Gorakhpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(273001, @CityId), (273002, @CityId), (273003, @CityId), (273004, @CityId), (273005, @CityId),
(273006, @CityId), (273007, @CityId), (273008, @CityId), (273009, @CityId), (273010, @CityId),
(273011, @CityId), (273012, @CityId), (273013, @CityId), (273014, @CityId), (273015, @CityId),
(273016, @CityId), (273017, @CityId), (273151, @CityId), (273152, @CityId), (273153, @CityId),
(273155, @CityId), (273157, @CityId), (273158, @CityId), (273163, @CityId), (273164, @CityId),
(273165, @CityId), (273201, @CityId), (273202, @CityId), (273203, @CityId), (273209, @CityId),
(273211, @CityId), (273212, @CityId), (273213, @CityId), (273301, @CityId), (273302, @CityId),
(273303, @CityId), (273305, @CityId), (273306, @CityId), (273308, @CityId), (273401, @CityId),
(273404, @CityId), (273405, @CityId), (273406, @CityId), (273407, @CityId), (273408, @CityId),
(273409, @CityId), (273411, @CityId), (273412, @CityId), (273413, @CityId), (273414, @CityId);

-- Kushinagar
INSERT INTO Cities (Name, LocationId) VALUES ('Kushinagar', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(273149, @CityId), (274149, @CityId), (274307, @CityId), (274308, @CityId), (274309, @CityId),
(274402, @CityId), (274403, @CityId), (274801, @CityId), (274802, @CityId);

-- Mahrajganj
INSERT INTO Cities (Name, LocationId) VALUES ('Mahrajganj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (273161, @CityId), (276141, @CityId);

-- Nichlaul
INSERT INTO Cities (Name, LocationId) VALUES ('Nichlaul', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (273304, @CityId);

-- Barhalganj
INSERT INTO Cities (Name, LocationId) VALUES ('Barhalganj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (273402, @CityId);

-- Bansgaon
INSERT INTO Cities (Name, LocationId) VALUES ('Bansgaon', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (273403, @CityId);

-- Khadda
INSERT INTO Cities (Name, LocationId) VALUES ('Khadda', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (273415, @CityId);
-- Gauri Bazar
INSERT INTO Cities (Name, LocationId) VALUES ('Gauri Bazar', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (274202, @CityId);

-- Hata
INSERT INTO Cities (Name, LocationId) VALUES ('Hata', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (274203, @CityId);

-- Padrauna
INSERT INTO Cities (Name, LocationId) VALUES ('Padrauna', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (274304, @CityId);

-- Ramkola
INSERT INTO Cities (Name, LocationId) VALUES ('Ramkola', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (274305, @CityId);

-- Majhauli Raj
INSERT INTO Cities (Name, LocationId) VALUES ('Majhauli Raj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (274506, @CityId);

-- Salempur
INSERT INTO Cities (Name, LocationId) VALUES ('Salempur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (274509, @CityId);

-- Bahadurganj
INSERT INTO Cities (Name, LocationId) VALUES ('Bahadurganj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (275201, @CityId);

-- Sadat
INSERT INTO Cities (Name, LocationId) VALUES ('Sadat', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (275204, @CityId);

-- Amila
INSERT INTO Cities (Name, LocationId) VALUES ('Amila', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (275301, @CityId);

-- Ghosi
INSERT INTO Cities (Name, LocationId) VALUES ('Ghosi', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (275304, @CityId);

-- Kopaganj
INSERT INTO Cities (Name, LocationId) VALUES ('Kopaganj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (275305, @CityId);

-- Mehnagar
INSERT INTO Cities (Name, LocationId) VALUES ('Mehnagar', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (276204, @CityId);

-- Nizamabad
INSERT INTO Cities (Name, LocationId) VALUES ('Nizamabad', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (276206, @CityId);

-- Sarai Mir
INSERT INTO Cities (Name, LocationId) VALUES ('Sarai Mir', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (276305, @CityId);

-- Amilo
INSERT INTO Cities (Name, LocationId) VALUES ('Amilo', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (276401, @CityId);

-- Mubarakpur
INSERT INTO Cities (Name, LocationId) VALUES ('Mubarakpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (276404, @CityId);

-- Bansdih
INSERT INTO Cities (Name, LocationId) VALUES ('Bansdih', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (277202, @CityId);

-- Reoti
INSERT INTO Cities (Name, LocationId) VALUES ('Reoti', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (277209, @CityId);

-- Sahatwar
INSERT INTO Cities (Name, LocationId) VALUES ('Sahatwar', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (277211, @CityId);

-- Bajna
INSERT INTO Cities (Name, LocationId) VALUES ('Bajna', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (281201, @CityId);

-- Raya
INSERT INTO Cities (Name, LocationId) VALUES ('Raya', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (281204, @CityId);

-- Baldeo
INSERT INTO Cities (Name, LocationId) VALUES ('Baldeo', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (281301, @CityId);

-- Gokul
INSERT INTO Cities (Name, LocationId) VALUES ('Gokul', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (281303, @CityId);

-- Mahaban
INSERT INTO Cities (Name, LocationId) VALUES ('Mahaban', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (281305, @CityId);

-- Sadabad
INSERT INTO Cities (Name, LocationId) VALUES ('Sadabad', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (281306, @CityId);

-- Shergarh
INSERT INTO Cities (Name, LocationId) VALUES ('Shergarh', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (281404, @CityId);

-- Barsana
INSERT INTO Cities (Name, LocationId) VALUES ('Barsana', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (281405, @CityId);

-- Radhakund
INSERT INTO Cities (Name, LocationId) VALUES ('Radhakund', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (281504, @CityId);

-- Agra
INSERT INTO Cities (Name, LocationId) VALUES ('Agra', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(282001, @CityId), (282002, @CityId), (282003, @CityId), (282004, @CityId), (282006, @CityId),
(282007, @CityId), (282008, @CityId), (282009, @CityId), (282010, @CityId), (283101, @CityId),
(283102, @CityId), (283103, @CityId), (283105, @CityId), (283112, @CityId), (283113, @CityId),
(283114, @CityId), (283115, @CityId), (283119, @CityId), (283121, @CityId), (283122, @CityId),
(283124, @CityId), (283125, @CityId), (283126, @CityId), (283201, @CityId), (283202, @CityId),
(283203, @CityId);
-- Dayalbagh
INSERT INTO Cities (Name, LocationId) VALUES ('Dayalbagh', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (282005, @CityId);

-- Bah
INSERT INTO Cities (Name, LocationId) VALUES ('Bah', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (283104, @CityId);

-- Fatehpur Sikri
INSERT INTO Cities (Name, LocationId) VALUES ('Fatehpur Sikri', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (283110, @CityId);

-- Fatehabad
INSERT INTO Cities (Name, LocationId) VALUES ('Fatehabad', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (283111, @CityId);

-- Pinahat
INSERT INTO Cities (Name, LocationId) VALUES ('Pinahat', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (283123, @CityId);

-- Tundla
INSERT INTO Cities (Name, LocationId) VALUES ('Tundla', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (283204, @CityId);

-- Jhansi
INSERT INTO Cities (Name, LocationId) VALUES ('Jhansi', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(284001, @CityId), (284002, @CityId), (284003, @CityId), (284120, @CityId), (284127, @CityId),
(284128, @CityId), (284129, @CityId), (284135, @CityId), (284201, @CityId), (284206, @CityId),
(284301, @CityId), (284305, @CityId), (284306, @CityId), (284401, @CityId), (284419, @CityId);

-- Lalitpur
INSERT INTO Cities (Name, LocationId) VALUES ('Lalitpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(284123, @CityId), (284124, @CityId), (284125, @CityId), (284126, @CityId), (284136, @CityId),
(284402, @CityId), (284403, @CityId), (284404, @CityId), (284405, @CityId), (284406, @CityId),
(284407, @CityId), (284501, @CityId);

-- Gursarai
INSERT INTO Cities (Name, LocationId) VALUES ('Gursarai', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (284202, @CityId);

-- Garautha
INSERT INTO Cities (Name, LocationId) VALUES ('Garautha', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (284203, @CityId);

-- Mauranipur
INSERT INTO Cities (Name, LocationId) VALUES ('Mauranipur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (284204, @CityId);

-- Ranipur
INSERT INTO Cities (Name, LocationId) VALUES ('Ranipur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (284205, @CityId);

-- Erich
INSERT INTO Cities (Name, LocationId) VALUES ('Erich', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (284302, @CityId);

-- Moth
INSERT INTO Cities (Name, LocationId) VALUES ('Moth', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (284303, @CityId);

-- Samthar
INSERT INTO Cities (Name, LocationId) VALUES ('Samthar', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (284304, @CityId);

-- Jalaun
INSERT INTO Cities (Name, LocationId) VALUES ('Jalaun', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(285121, @CityId), (285122, @CityId), (285123, @CityId), (285124, @CityId), (285125, @CityId),
(285128, @CityId), (285130, @CityId), (285132, @CityId), (285133, @CityId), (285136, @CityId),
(285187, @CityId), (285201, @CityId), (285202, @CityId), (285203, @CityId), (285211, @CityId),
(285221, @CityId), (285222, @CityId), (285223, @CityId), (285224, @CityId), (285232, @CityId),
(285233, @CityId), (285242, @CityId), (285243, @CityId), (285251, @CityId), (285252, @CityId);

-- Madhogarh
INSERT INTO Cities (Name, LocationId) VALUES ('Madhogarh', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (285126, @CityId);

-- Rampura
INSERT INTO Cities (Name, LocationId) VALUES ('Rampura', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (285127, @CityId);

-- Umri
INSERT INTO Cities (Name, LocationId) VALUES ('Umri', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (285129, @CityId);

-- Kalpi
INSERT INTO Cities (Name, LocationId) VALUES ('Kalpi', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (285204, @CityId);

-- Konch
INSERT INTO Cities (Name, LocationId) VALUES ('Konch', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (285205, @CityId);

-- Nadigaon
INSERT INTO Cities (Name, LocationId) VALUES ('Nadigaon', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (285206, @CityId);

-- Babina
INSERT INTO Cities (Name, LocationId) VALUES ('Babina', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (285241, @CityId);

-- Noida
INSERT INTO Cities (Name, LocationId) VALUES ('Noida', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (201301, @CityId);

-- Vrindavan
INSERT INTO Cities (Name, LocationId) VALUES ('Vrindavan', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (281132, @CityId);

-- Firozabad
INSERT INTO Cities (Name, LocationId) VALUES ('Firozabad', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(283130, @CityId), (283135, @CityId), (283136, @CityId), (283141, @CityId), (283142, @CityId),
(283145, @CityId), (283151, @CityId), (283152, @CityId), (283205, @CityId), (283206, @CityId), (283207, @CityId);

-- Up
INSERT INTO Cities (Name, LocationId) VALUES ('Up', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (243720, @CityId);

-- Chandausi
INSERT INTO Cities (Name, LocationId) VALUES ('Chandausi', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (244412, @CityId);

-- Puranpur
INSERT INTO Cities (Name, LocationId) VALUES ('Puranpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (262122, @CityId);

-- Lakhimpur
INSERT INTO Cities (Name, LocationId) VALUES ('Lakhimpur', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (262701, @CityId), (787034, @CityId);

-- Achhnera
INSERT INTO Cities (Name, LocationId) VALUES ('Achhnera', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();

-- Robertsganj
INSERT INTO Cities (Name, LocationId) VALUES ('Robertsganj', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (231226, @CityId);

-- Ghaziabag
INSERT INTO Cities (Name, LocationId) VALUES ('Ghaziabag', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();

-- Shikobad
INSERT INTO Cities (Name, LocationId) VALUES ('Shikobad', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();

-- Budaun
INSERT INTO Cities (Name, LocationId) VALUES ('Budaun', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES 
(202421, @CityId), (242021, @CityId), (243630, @CityId), (243722, @CityId), (243723, @CityId),
(243724, @CityId), (243725, @CityId), (243726, @CityId), (243727, @CityId), (243751, @CityId);

-- Orai
INSERT INTO Cities (Name, LocationId) VALUES ('Orai', @LocationId_UP);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES (285001, @CityId);
-- Dhampur
INSERT INTO Cities (Name, LocationId) VALUES ('Dhampur', @LocationId_UP);

-- Meerut
INSERT INTO Cities (Name, LocationId) VALUES ('Meerut', @LocationId_UP);

-- Etawah
INSERT INTO Cities (Name, LocationId) VALUES ('Etawah', @LocationId_UP);

-- Greater Noida
INSERT INTO Cities (Name, LocationId) VALUES ('Greater Noida', @LocationId_UP);

-- Sitapur
INSERT INTO Cities (Name, LocationId) VALUES ('Sitapur', @LocationId_UP);

-- Gorakhpur
INSERT INTO Cities (Name, LocationId) VALUES ('Gorakhpur', @LocationId_UP);

-- Robertsganj
INSERT INTO Cities (Name, LocationId) VALUES ('Robertsganj', @LocationId_UP);

-- Aligarh
INSERT INTO Cities (Name, LocationId) VALUES ('Aligarh', @LocationId_UP);

-- Mau
INSERT INTO Cities (Name, LocationId) VALUES ('Mau', @LocationId_UP);

-- Unnao
INSERT INTO Cities (Name, LocationId) VALUES ('Unnao', @LocationId_UP);

-- Agra
INSERT INTO Cities (Name, LocationId) VALUES ('Agra', @LocationId_UP);

-- Deoband
INSERT INTO Cities (Name, LocationId) VALUES ('Deoband', @LocationId_UP);

-- Baraut
INSERT INTO Cities (Name, LocationId) VALUES ('Baraut', @LocationId_UP);

-- Sambhal
INSERT INTO Cities (Name, LocationId) VALUES ('Sambhal', @LocationId_UP);

-- Naugarh
INSERT INTO Cities (Name, LocationId) VALUES ('Naugarh', @LocationId_UP);

-- Deoria
INSERT INTO Cities (Name, LocationId) VALUES ('Deoria', @LocationId_UP);

-- Mauranipur
INSERT INTO Cities (Name, LocationId) VALUES ('Mauranipur', @LocationId_UP);

-- Varanasi
INSERT INTO Cities (Name, LocationId) VALUES ('Varanasi', @LocationId_UP);

-- Raebareli
INSERT INTO Cities (Name, LocationId) VALUES ('Raebareli', @LocationId_UP);

-- Akbarpur
INSERT INTO Cities (Name, LocationId) VALUES ('Akbarpur', @LocationId_UP);

-- Badaun
INSERT INTO Cities (Name, LocationId) VALUES ('Badaun', @LocationId_UP);

-- Ghaziabad
INSERT INTO Cities (Name, LocationId) VALUES ('Ghaziabad', @LocationId_UP);

-- Nanpara
INSERT INTO Cities (Name, LocationId) VALUES ('Nanpara', @LocationId_UP);

-- Ballia
INSERT INTO Cities (Name, LocationId) VALUES ('Ballia', @LocationId_UP);

-- Bareilly
INSERT INTO Cities (Name, LocationId) VALUES ('Bareilly', @LocationId_UP);

-- Firozabad
INSERT INTO Cities (Name, LocationId) VALUES ('Firozabad', @LocationId_UP);

-- Lucknow
INSERT INTO Cities (Name, LocationId) VALUES ('Lucknow', @LocationId_UP);

-- Babrala
INSERT INTO Cities (Name, LocationId) VALUES ('Babrala', @LocationId_UP);

-- Najibabad
INSERT INTO Cities (Name, LocationId) VALUES ('Najibabad', @LocationId_UP);

-- Fatehpur
INSERT INTO Cities (Name, LocationId) VALUES ('Fatehpur', @LocationId_UP);

-- Bulandshahr
INSERT INTO Cities (Name, LocationId) VALUES ('Bulandshahr', @LocationId_UP);

-- Mirzapur
INSERT INTO Cities (Name, LocationId) VALUES ('Mirzapur', @LocationId_UP);

-- Lalitpur
INSERT INTO Cities (Name, LocationId) VALUES ('Lalitpur', @LocationId_UP);

-- Orai
INSERT INTO Cities (Name, LocationId) VALUES ('Orai', @LocationId_UP);

-- Hapur
INSERT INTO Cities (Name, LocationId) VALUES ('Hapur', @LocationId_UP);

-- Shikohabad
INSERT INTO Cities (Name, LocationId) VALUES ('Shikohabad', @LocationId_UP);

-- Banda
INSERT INTO Cities (Name, LocationId) VALUES ('Banda', @LocationId_UP);

-- Muzaffarnagar
INSERT INTO Cities (Name, LocationId) VALUES ('Muzaffarnagar', @LocationId_UP);

-- Baghpat
INSERT INTO Cities (Name, LocationId) VALUES ('Baghpat', @LocationId_UP);

-- Barabanki
INSERT INTO Cities (Name, LocationId) VALUES ('Barabanki', @LocationId_UP);

-- Prayagraj
INSERT INTO Cities (Name, LocationId) VALUES ('Prayagraj', @LocationId_UP);

-- Farrukhabad
INSERT INTO Cities (Name, LocationId) VALUES ('Farrukhabad', @LocationId_UP);

-- Shamli
INSERT INTO Cities (Name, LocationId) VALUES ('Shamli', @LocationId_UP);

-- Balrampur
INSERT INTO Cities (Name, LocationId) VALUES ('Balrampur', @LocationId_UP);

-- Basti
INSERT INTO Cities (Name, LocationId) VALUES ('Basti', @LocationId_UP);

-- Mahoba
INSERT INTO Cities (Name, LocationId) VALUES ('Mahoba', @LocationId_UP);

-- Chandausi
INSERT INTO Cities (Name, LocationId) VALUES ('Chandausi', @LocationId_UP);

-- Kanpur
INSERT INTO Cities (Name, LocationId) VALUES ('Kanpur', @LocationId_UP);

-- Mahrajganj
INSERT INTO Cities (Name, LocationId) VALUES ('Mahrajganj', @LocationId_UP);

-- Ghazipur
INSERT INTO Cities (Name, LocationId) VALUES ('Ghazipur', @LocationId_UP);

-- Bijnor
INSERT INTO Cities (Name, LocationId) VALUES ('Bijnor', @LocationId_UP);

-- Shahjahanpur
INSERT INTO Cities (Name, LocationId) VALUES ('Shahjahanpur', @LocationId_UP);

-- Mughalsarai
INSERT INTO Cities (Name, LocationId) VALUES ('Mughalsarai', @LocationId_UP);

-- Moradabad
INSERT INTO Cities (Name, LocationId) VALUES ('Moradabad', @LocationId_UP);

-- Modinagar
INSERT INTO Cities (Name, LocationId) VALUES ('Modinagar', @LocationId_UP);

-- Pilibhit
INSERT INTO Cities (Name, LocationId) VALUES ('Pilibhit', @LocationId_UP);

-- Kosikalan
INSERT INTO Cities (Name, LocationId) VALUES ('Kosikalan', @LocationId_UP);

-- Mainpuri
INSERT INTO Cities (Name, LocationId) VALUES ('Mainpuri', @LocationId_UP);

-- Gajraula
INSERT INTO Cities (Name, LocationId) VALUES ('Gajraula', @LocationId_UP);

-- Kasganj
INSERT INTO Cities (Name, LocationId) VALUES ('Kasganj', @LocationId_UP);

-- Palia kalan
INSERT INTO Cities (Name, LocationId) VALUES ('Palia kalan', @LocationId_UP);

-- Auraiya
INSERT INTO Cities (Name, LocationId) VALUES ('Auraiya', @LocationId_UP);

-- Rampur
INSERT INTO Cities (Name, LocationId) VALUES ('Rampur', @LocationId_UP);

-- Azamgarh
INSERT INTO Cities (Name, LocationId) VALUES ('Azamgarh', @LocationId_UP);

-- Kushinagar
INSERT INTO Cities (Name, LocationId) VALUES ('Kushinagar', @LocationId_UP);

-- Pratapgarh
INSERT INTO Cities (Name, LocationId) VALUES ('Pratapgarh', @LocationId_UP);

-- Hardoi
INSERT INTO Cities (Name, LocationId) VALUES ('Hardoi', @LocationId_UP);

-- Bahraich
INSERT INTO Cities (Name, LocationId) VALUES ('Bahraich', @LocationId_UP);

-- Gonda
INSERT INTO Cities (Name, LocationId) VALUES ('Gonda', @LocationId_UP);

-- Saharanpur
INSERT INTO Cities (Name, LocationId) VALUES ('Saharanpur', @LocationId_UP);

-- Jhansi
INSERT INTO Cities (Name, LocationId) VALUES ('Jhansi', @LocationId_UP);

-- Faizabad
INSERT INTO Cities (Name, LocationId) VALUES ('Faizabad', @LocationId_UP);

-- Sultanpur
INSERT INTO Cities (Name, LocationId) VALUES ('Sultanpur', @LocationId_UP);

-- Mathura
INSERT INTO Cities (Name, LocationId) VALUES ('Mathura', @LocationId_UP);

-- Bisauli
INSERT INTO Cities (Name, LocationId) VALUES ('Bisauli', @LocationId_UP);

-- Lakhimpur
INSERT INTO Cities (Name, LocationId) VALUES ('Lakhimpur', @LocationId_UP);

-- Amroha
INSERT INTO Cities (Name, LocationId) VALUES ('Amroha', @LocationId_UP);
