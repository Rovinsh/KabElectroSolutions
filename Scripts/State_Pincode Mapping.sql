DECLARE @LocationId_AndhraPradesh INT;
INSERT INTO Locations (Name) VALUES ('Andhra Pradesh');
SET @LocationId_AndhraPradesh = SCOPE_IDENTITY();


DECLARE @CityId_Ananthapur INT;
INSERT INTO Cities (Name, LocationId) VALUES ('ANANTHAPUR', @LocationId_AndhraPradesh);
SET @CityId_Ananthapur = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(515001, @CityId_Ananthapur),
(515631, @CityId_Ananthapur),
(515581, @CityId_Ananthapur),
(515571, @CityId_Ananthapur),
(515311, @CityId_Ananthapur),
(515281, @CityId_Ananthapur),
(515241, @CityId_Ananthapur),
(515871, @CityId_Ananthapur),
(515842, @CityId_Ananthapur),
(515803, @CityId_Ananthapur),
(515775, @CityId_Ananthapur),
(515405, @CityId_Ananthapur),
(515865, @CityId_Ananthapur),
(515455, @CityId_Ananthapur),
(515611, @CityId_Ananthapur),
(515867, @CityId_Ananthapur),
(515812, @CityId_Ananthapur),
(515832, @CityId_Ananthapur),
(515870, @CityId_Ananthapur),
(515101, @CityId_Ananthapur),
(515231, @CityId_Ananthapur),
(515271, @CityId_Ananthapur),
(515164, @CityId_Ananthapur),
(515212, @CityId_Ananthapur),
(515303, @CityId_Ananthapur),
(515556, @CityId_Ananthapur),
(515661, @CityId_Ananthapur),
(515672, @CityId_Ananthapur),
(515521, @CityId_Ananthapur),
(515591, @CityId_Ananthapur),
(515641, @CityId_Ananthapur),
(515531, @CityId_Ananthapur),
(515541, @CityId_Ananthapur),
(515511, @CityId_Ananthapur),
(515551, @CityId_Ananthapur),
(515154, @CityId_Ananthapur),
(515501, @CityId_Ananthapur),
(515341, @CityId_Ananthapur),
(515286, @CityId_Ananthapur),
(515144, @CityId_Ananthapur),
(515133, @CityId_Ananthapur),
(515159, @CityId_Ananthapur),
(515651, @CityId_Ananthapur),
(515445, @CityId_Ananthapur),
(515002, @CityId_Ananthapur),
(515561, @CityId_Ananthapur),
(515763, @CityId_Ananthapur),
(515701, @CityId_Ananthapur),
(515408, @CityId_Ananthapur),
(515415, @CityId_Ananthapur),
(515751, @CityId_Ananthapur),
(515741, @CityId_Ananthapur),
(515291, @CityId_Ananthapur),
(515261, @CityId_Ananthapur),
(515124, @CityId_Ananthapur),
(515110, @CityId_Ananthapur),
(515305, @CityId_Ananthapur),
(515123, @CityId_Ananthapur),
(515122, @CityId_Ananthapur),
(515621, @CityId_Ananthapur),
(515321, @CityId_Ananthapur),
(515134, @CityId_Ananthapur),
(515211, @CityId_Ananthapur),
(515601, @CityId_Ananthapur),
(515331, @CityId_Ananthapur),
(515301, @CityId_Ananthapur),
(515731, @CityId_Ananthapur),
(515004, @CityId_Ananthapur),
(515722, @CityId_Ananthapur),
(515761, @CityId_Ananthapur),
(515765, @CityId_Ananthapur),
(515721, @CityId_Ananthapur),
(515711, @CityId_Ananthapur),
(515766, @CityId_Ananthapur),
(515425, @CityId_Ananthapur),
(515787, @CityId_Ananthapur),
(515414, @CityId_Ananthapur),
(515767, @CityId_Ananthapur),
(515435, @CityId_Ananthapur),
(515411, @CityId_Ananthapur),
(515005, @CityId_Ananthapur),
(515465, @CityId_Ananthapur),
(515822, @CityId_Ananthapur),
(515402, @CityId_Ananthapur),
(515401, @CityId_Ananthapur),
(515863, @CityId_Ananthapur),
(515774, @CityId_Ananthapur),
(515801, @CityId_Ananthapur),
(515671, @CityId_Ananthapur),
(515201, @CityId_Ananthapur),
(515872, @CityId_Ananthapur),
(515413, @CityId_Ananthapur),
(515003, @CityId_Ananthapur);

DECLARE @CityId_Bapatla INT;
INSERT INTO Cities (Name, LocationId) VALUES ('Bapatla', @LocationId_AndhraPradesh);
SET @CityId_Bapatla = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(522102, @CityId_Bapatla)


DECLARE @CityId_Chittoor INT;
INSERT INTO Cities (Name, LocationId) VALUES ('CHITTOOR', @LocationId_AndhraPradesh);
SET @CityId_Chittoor = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(517583, @CityId_Chittoor),
(517408, @CityId_Chittoor),
(517501, @CityId_Chittoor),
(517001, @CityId_Chittoor),
(517425, @CityId_Chittoor),
(517131, @CityId_Chittoor),
(517507, @CityId_Chittoor),
(517129, @CityId_Chittoor),
(517194, @CityId_Chittoor),
(517305, @CityId_Chittoor),
(517152, @CityId_Chittoor),
(517297, @CityId_Chittoor),
(517213, @CityId_Chittoor),
(517236, @CityId_Chittoor),
(517234, @CityId_Chittoor),
(517505, @CityId_Chittoor),
(517415, @CityId_Chittoor),
(517416, @CityId_Chittoor),
(517004, @CityId_Chittoor),
(517002, @CityId_Chittoor),
(517125, @CityId_Chittoor),
(517643, @CityId_Chittoor),
(517589, @CityId_Chittoor),
(517590, @CityId_Chittoor),
(517591, @CityId_Chittoor),
(517620, @CityId_Chittoor),
(517130, @CityId_Chittoor),
(517128, @CityId_Chittoor),
(517432, @CityId_Chittoor),
(517640, @CityId_Chittoor),
(517586, @CityId_Chittoor),
(517642, @CityId_Chittoor),
(517587, @CityId_Chittoor),
(517588, @CityId_Chittoor),
(517571, @CityId_Chittoor),
(517641, @CityId_Chittoor),
(517541, @CityId_Chittoor),
(517584, @CityId_Chittoor),
(517619, @CityId_Chittoor),
(517561, @CityId_Chittoor),
(517569, @CityId_Chittoor),
(517193, @CityId_Chittoor),
(517277, @CityId_Chittoor),
(517581, @CityId_Chittoor),
(517113, @CityId_Chittoor),
(517235, @CityId_Chittoor),
(517172, @CityId_Chittoor),
(517237, @CityId_Chittoor),
(517102, @CityId_Chittoor),
(517112, @CityId_Chittoor),
(517214, @CityId_Chittoor),
(517192, @CityId_Chittoor),
(517291, @CityId_Chittoor),
(517299, @CityId_Chittoor),
(517536, @CityId_Chittoor),
(517645, @CityId_Chittoor),
(517526, @CityId_Chittoor),
(517582, @CityId_Chittoor),
(517520, @CityId_Chittoor),
(517502, @CityId_Chittoor),
(517503, @CityId_Chittoor),
(517592, @CityId_Chittoor),
(517644, @CityId_Chittoor),
(517504, @CityId_Chittoor),
(517247, @CityId_Chittoor),
(517423, @CityId_Chittoor),
(517401, @CityId_Chittoor),
(517352, @CityId_Chittoor),
(517414, @CityId_Chittoor),
(517123, @CityId_Chittoor),
(517418, @CityId_Chittoor),
(517424, @CityId_Chittoor),
(517551, @CityId_Chittoor),
(517390, @CityId_Chittoor),
(517280, @CityId_Chittoor),
(517391, @CityId_Chittoor),
(517167, @CityId_Chittoor),
(517429, @CityId_Chittoor),
(517127, @CityId_Chittoor),
(517132, @CityId_Chittoor),
(517126, @CityId_Chittoor),
(517124, @CityId_Chittoor),
(517422, @CityId_Chittoor),
(517370, @CityId_Chittoor),
(517351, @CityId_Chittoor),
(517419, @CityId_Chittoor),
(517403, @CityId_Chittoor),
(517421, @CityId_Chittoor),
(517599, @CityId_Chittoor),
(517319, @CityId_Chittoor),
(517257, @CityId_Chittoor),
(517417, @CityId_Chittoor),
(517426, @CityId_Chittoor),
(517350, @CityId_Chittoor),
(517325, @CityId_Chittoor),
(517506, @CityId_Chittoor),
(517101, @CityId_Chittoor),
(517646, @CityId_Chittoor);

DECLARE @CityId_EASTGODAVARI INT;
INSERT INTO Cities (Name, LocationId) VALUES ('EAST GODAVARI', @LocationId_AndhraPradesh);
SET @CityId_EASTGODAVARI = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(533001, @CityId_EASTGODAVARI),
(533002, @CityId_EASTGODAVARI),
(533003, @CityId_EASTGODAVARI),
(533004, @CityId_EASTGODAVARI),
(533005, @CityId_EASTGODAVARI),
(533006, @CityId_EASTGODAVARI),
(533016, @CityId_EASTGODAVARI),
(533101, @CityId_EASTGODAVARI),
(533102, @CityId_EASTGODAVARI),
(533103, @CityId_EASTGODAVARI),
(533104, @CityId_EASTGODAVARI),
(533105, @CityId_EASTGODAVARI),
(533106, @CityId_EASTGODAVARI),
(533107, @CityId_EASTGODAVARI),
(533124, @CityId_EASTGODAVARI),
(533125, @CityId_EASTGODAVARI),
(533126, @CityId_EASTGODAVARI),
(533201, @CityId_EASTGODAVARI),
(533210, @CityId_EASTGODAVARI),
(533211, @CityId_EASTGODAVARI),
(533212, @CityId_EASTGODAVARI),
(533213, @CityId_EASTGODAVARI),
(533214, @CityId_EASTGODAVARI),
(533215, @CityId_EASTGODAVARI),
(533216, @CityId_EASTGODAVARI),
(533217, @CityId_EASTGODAVARI),
(533218, @CityId_EASTGODAVARI),
(533220, @CityId_EASTGODAVARI),
(533221, @CityId_EASTGODAVARI),
(533222, @CityId_EASTGODAVARI),
(533223, @CityId_EASTGODAVARI),
(533228, @CityId_EASTGODAVARI),
(533229, @CityId_EASTGODAVARI),
(533232, @CityId_EASTGODAVARI),
(533233, @CityId_EASTGODAVARI),
(533234, @CityId_EASTGODAVARI),
(533235, @CityId_EASTGODAVARI),
(533236, @CityId_EASTGODAVARI),
(533237, @CityId_EASTGODAVARI),
(533238, @CityId_EASTGODAVARI),
(533239, @CityId_EASTGODAVARI),
(533240, @CityId_EASTGODAVARI),
(533241, @CityId_EASTGODAVARI),
(533242, @CityId_EASTGODAVARI),
(533244, @CityId_EASTGODAVARI),
(533247, @CityId_EASTGODAVARI),
(533248, @CityId_EASTGODAVARI),
(533249, @CityId_EASTGODAVARI),
(533250, @CityId_EASTGODAVARI),
(533251, @CityId_EASTGODAVARI),
(533252, @CityId_EASTGODAVARI),
(533253, @CityId_EASTGODAVARI),
(533254, @CityId_EASTGODAVARI),
(533255, @CityId_EASTGODAVARI),
(533256, @CityId_EASTGODAVARI),
(533260, @CityId_EASTGODAVARI),
(533261, @CityId_EASTGODAVARI),
(533262, @CityId_EASTGODAVARI),
(533263, @CityId_EASTGODAVARI),
(533264, @CityId_EASTGODAVARI),
(533274, @CityId_EASTGODAVARI),
(533284, @CityId_EASTGODAVARI),
(533285, @CityId_EASTGODAVARI),
(533286, @CityId_EASTGODAVARI),
(533287, @CityId_EASTGODAVARI),
(533288, @CityId_EASTGODAVARI),
(533289, @CityId_EASTGODAVARI),
(533290, @CityId_EASTGODAVARI),
(533291, @CityId_EASTGODAVARI),
(533292, @CityId_EASTGODAVARI),
(533293, @CityId_EASTGODAVARI),
(533294, @CityId_EASTGODAVARI),
(533295, @CityId_EASTGODAVARI),
(533296, @CityId_EASTGODAVARI),
(533297, @CityId_EASTGODAVARI),
(533305, @CityId_EASTGODAVARI),
(533306, @CityId_EASTGODAVARI),
(533307, @CityId_EASTGODAVARI),
(533308, @CityId_EASTGODAVARI),
(533309, @CityId_EASTGODAVARI),
(533340, @CityId_EASTGODAVARI),
(533341, @CityId_EASTGODAVARI),
(533342, @CityId_EASTGODAVARI),
(533343, @CityId_EASTGODAVARI),
(533344, @CityId_EASTGODAVARI),
(533345, @CityId_EASTGODAVARI),
(533346, @CityId_EASTGODAVARI),
(533347, @CityId_EASTGODAVARI),
(533348, @CityId_EASTGODAVARI),
(533349, @CityId_EASTGODAVARI),
(533350, @CityId_EASTGODAVARI),
(533351, @CityId_EASTGODAVARI),
(533352, @CityId_EASTGODAVARI),
(533401, @CityId_EASTGODAVARI),
(533406, @CityId_EASTGODAVARI),
(533407, @CityId_EASTGODAVARI),
(533408, @CityId_EASTGODAVARI),
(533428, @CityId_EASTGODAVARI),
(533429, @CityId_EASTGODAVARI),
(533430, @CityId_EASTGODAVARI),
(533431, @CityId_EASTGODAVARI),
(533432, @CityId_EASTGODAVARI),
(533433, @CityId_EASTGODAVARI),
(533434, @CityId_EASTGODAVARI),
(533435, @CityId_EASTGODAVARI),
(533436, @CityId_EASTGODAVARI),
(533437, @CityId_EASTGODAVARI),
(533440, @CityId_EASTGODAVARI),
(533444, @CityId_EASTGODAVARI),
(533445, @CityId_EASTGODAVARI),
(533446, @CityId_EASTGODAVARI),
(533447, @CityId_EASTGODAVARI),
(533448, @CityId_EASTGODAVARI),
(533449, @CityId_EASTGODAVARI),
(533450, @CityId_EASTGODAVARI),
(533461, @CityId_EASTGODAVARI),
(533462, @CityId_EASTGODAVARI),
(533463, @CityId_EASTGODAVARI),
(533464, @CityId_EASTGODAVARI),
(533468, @CityId_EASTGODAVARI),
(533483, @CityId_EASTGODAVARI),
(533577, @CityId_EASTGODAVARI);


DECLARE @CityIdGUNTUR INT;
INSERT INTO Cities (Name, LocationId) VALUES ('GUNTUR', @LocationId_AndhraPradesh);
SET @CityIdGUNTUR = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(522001, @CityIdGUNTUR),
(522002, @CityIdGUNTUR),
(522003, @CityIdGUNTUR),
(522004, @CityIdGUNTUR),
(522005, @CityIdGUNTUR),
(522006, @CityIdGUNTUR),
(522007, @CityIdGUNTUR),
(522009, @CityIdGUNTUR),
(522015, @CityIdGUNTUR),
(522016, @CityIdGUNTUR),
(522017, @CityIdGUNTUR),
(522018, @CityIdGUNTUR),
(522019, @CityIdGUNTUR),
(522020, @CityIdGUNTUR),
(522034, @CityIdGUNTUR),
(522101, @CityIdGUNTUR),
(522112, @CityIdGUNTUR),
(522113, @CityIdGUNTUR),
(522201, @CityIdGUNTUR),
(522202, @CityIdGUNTUR),
(522211, @CityIdGUNTUR),
(522212, @CityIdGUNTUR),
(522213, @CityIdGUNTUR),
(522236, @CityIdGUNTUR),
(522237, @CityIdGUNTUR),
(522261, @CityIdGUNTUR),
(522301, @CityIdGUNTUR),
(522302, @CityIdGUNTUR),
(522303, @CityIdGUNTUR),
(522304, @CityIdGUNTUR),
(522305, @CityIdGUNTUR),
(522306, @CityIdGUNTUR),
(522307, @CityIdGUNTUR),
(522308, @CityIdGUNTUR),
(522313, @CityIdGUNTUR),
(522330, @CityIdGUNTUR),
(522436, @CityIdGUNTUR),
(522501, @CityIdGUNTUR),
(522502, @CityIdGUNTUR),
(522503, @CityIdGUNTUR),
(522508, @CityIdGUNTUR),
(522509, @CityIdGUNTUR),
(522510, @CityIdGUNTUR);

DECLARE @CityIdHINDUPUR INT;
INSERT INTO Cities (Name, LocationId) VALUES ('HINDUPUR', @LocationId_AndhraPradesh);
SET @CityIdHINDUPUR = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(515202, @CityIdHINDUPUR);

DECLARE @CityIdKADAPA INT;
INSERT INTO Cities (Name, LocationId) VALUES ('KADAPA', @LocationId_AndhraPradesh);
SET @CityIdKADAPA = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(516002, @CityIdKADAPA),
(516004, @CityIdKADAPA),
(516001, @CityIdKADAPA),
(516004, @CityIdKADAPA),
(516360, @CityIdKADAPA),
(516004, @CityIdKADAPA),
(516129, @CityIdKADAPA),
(516237, @CityIdKADAPA),
(516130, @CityIdKADAPA),
(516151, @CityIdKADAPA),
(516329, @CityIdKADAPA),
(516293, @CityIdKADAPA),
(516321, @CityIdKADAPA),
(516213, @CityIdKADAPA),
(516193, @CityIdKADAPA),
(516003, @CityIdKADAPA),
(516269, @CityIdKADAPA),
(516215, @CityIdKADAPA),
(516505, @CityIdKADAPA),
(516268, @CityIdKADAPA),
(516105, @CityIdKADAPA),
(516501, @CityIdKADAPA),
(516128, @CityIdKADAPA),
(516101, @CityIdKADAPA),
(516247, @CityIdKADAPA),
(516126, @CityIdKADAPA),
(516152, @CityIdKADAPA),
(516150, @CityIdKADAPA),
(516401, @CityIdKADAPA),
(516349, @CityIdKADAPA),
(516104, @CityIdKADAPA),
(516108, @CityIdKADAPA),
(516350, @CityIdKADAPA),
(516474, @CityIdKADAPA),
(516127, @CityIdKADAPA),
(516107, @CityIdKADAPA),
(516454, @CityIdKADAPA),
(516110, @CityIdKADAPA),
(516203, @CityIdKADAPA),
(516356, @CityIdKADAPA),
(516310, @CityIdKADAPA),
(516431, @CityIdKADAPA),
(516175, @CityIdKADAPA),
(516361, @CityIdKADAPA),
(516434, @CityIdKADAPA),
(516362, @CityIdKADAPA),
(516359, @CityIdKADAPA),
(516380, @CityIdKADAPA),
(516172, @CityIdKADAPA),
(516257, @CityIdKADAPA),
(516270, @CityIdKADAPA),
(516504, @CityIdKADAPA),
(516433, @CityIdKADAPA),
(516355, @CityIdKADAPA),
(516228, @CityIdKADAPA),
(516227, @CityIdKADAPA),
(516259, @CityIdKADAPA),
(516502, @CityIdKADAPA),
(516162, @CityIdKADAPA),
(516173, @CityIdKADAPA),
(516411, @CityIdKADAPA),
(516432, @CityIdKADAPA),
(516312, @CityIdKADAPA),
(516309, @CityIdKADAPA),
(516421, @CityIdKADAPA),
(516484, @CityIdKADAPA),
(516289, @CityIdKADAPA),
(516444, @CityIdKADAPA),
(516464, @CityIdKADAPA),
(516396, @CityIdKADAPA),
(516218, @CityIdKADAPA),
(516339, @CityIdKADAPA),
(516216, @CityIdKADAPA),
(516391, @CityIdKADAPA),
(516214, @CityIdKADAPA),
(516267, @CityIdKADAPA),
(516233, @CityIdKADAPA),
(516217, @CityIdKADAPA),
(516503, @CityIdKADAPA),
(516163, @CityIdKADAPA),
(516115, @CityIdKADAPA),
(516390, @CityIdKADAPA),
(516005, @CityIdKADAPA),
(516439, @CityIdKADAPA),
(516311, @CityIdKADAPA),
(516330, @CityIdKADAPA);

DECLARE @CityIdKakinada INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('KAKINADA', @LocationId_AndhraPradesh);

SET @CityIdKakinada = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(533007, @CityIdKakinada);
DECLARE @CityIdKovvur INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('KOVVUR', @LocationId_AndhraPradesh);

SET @CityIdKovvur = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(534340, @CityIdKovvur);

DECLARE @CityIdKrishna INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('KRISHNA', @LocationId_AndhraPradesh);

SET @CityIdKrishna = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(521456, @CityIdKrishna),
(521456, @CityIdKrishna),
(521312, @CityIdKrishna),
(521311, @CityIdKrishna),
(521286, @CityIdKrishna),
(521263, @CityIdKrishna),
(521261, @CityIdKrishna),
(521260, @CityIdKrishna),
(521256, @CityIdKrishna),
(521250, @CityIdKrishna),
(521247, @CityIdKrishna),
(521246, @CityIdKrishna),
(521245, @CityIdKrishna),
(521241, @CityIdKrishna),
(521230, @CityIdKrishna),
(521229, @CityIdKrishna),
(521228, @CityIdKrishna),
(521225, @CityIdKrishna),
(521212, @CityIdKrishna),
(521211, @CityIdKrishna),
(521202, @CityIdKrishna),
(521201, @CityIdKrishna),
(521181, @CityIdKrishna),
(521180, @CityIdKrishna),
(521165, @CityIdKrishna),
(521164, @CityIdKrishna),
(521163, @CityIdKrishna),
(521153, @CityIdKrishna),
(521151, @CityIdKrishna),
(521139, @CityIdKrishna),
(521138, @CityIdKrishna),
(521137, @CityIdKrishna),
(521134, @CityIdKrishna),
(521111, @CityIdKrishna),
(521110, @CityIdKrishna),
(521109, @CityIdKrishna),
(521108, @CityIdKrishna),
(521107, @CityIdKrishna),
(521104, @CityIdKrishna),
(521102, @CityIdKrishna),
(521101, @CityIdKrishna),
(521001, @CityIdKrishna),
(520015, @CityIdKrishna),
(520013, @CityIdKrishna),
(520012, @CityIdKrishna),
(520011, @CityIdKrishna),
(520010, @CityIdKrishna),
(520008, @CityIdKrishna),
(520007, @CityIdKrishna),
(520004, @CityIdKrishna),
(520004, @CityIdKrishna),
(520003, @CityIdKrishna),
(520002, @CityIdKrishna),
(520001, @CityIdKrishna),
(509132, @CityIdKrishna),
(521235, @CityIdKrishna),
(521185, @CityIdKrishna),
(521330, @CityIdKrishna),
(521324, @CityIdKrishna),
(521366, @CityIdKrishna),
(521122, @CityIdKrishna),
(521133, @CityIdKrishna),
(521136, @CityIdKrishna),
(521150, @CityIdKrishna),
(521132, @CityIdKrishna),
(521105, @CityIdKrishna),
(521328, @CityIdKrishna),
(521106, @CityIdKrishna),
(521207, @CityIdKrishna),
(521213, @CityIdKrishna),
(521214, @CityIdKrishna),
(521215, @CityIdKrishna),
(521403, @CityIdKrishna),
(521401, @CityIdKrishna),
(521149, @CityIdKrishna),
(521131, @CityIdKrishna),
(521125, @CityIdKrishna),
(521135, @CityIdKrishna),
(521120, @CityIdKrishna),
(521156, @CityIdKrishna),
(521002, @CityIdKrishna),
(521332, @CityIdKrishna),
(521356, @CityIdKrishna),
(521158, @CityIdKrishna),
(521157, @CityIdKrishna),
(521162, @CityIdKrishna),
(521331, @CityIdKrishna),
(521369, @CityIdKrishna),
(521130, @CityIdKrishna),
(521184, @CityIdKrishna),
(521190, @CityIdKrishna),
(521402, @CityIdKrishna),
(521175, @CityIdKrishna),
(521126, @CityIdKrishna),
(521226, @CityIdKrishna),
(521227, @CityIdKrishna),
(521457, @CityIdKrishna),
(521183, @CityIdKrishna),
(521321, @CityIdKrishna),
(521333, @CityIdKrishna),
(521344, @CityIdKrishna),
(521343, @CityIdKrishna),
(521345, @CityIdKrishna),
(521323, @CityIdKrishna),
(521325, @CityIdKrishna),
(521178, @CityIdKrishna),
(521340, @CityIdKrishna),
(521182, @CityIdKrishna),
(521329, @CityIdKrishna),
(521390, @CityIdKrishna),
(521326, @CityIdKrishna),
(521327, @CityIdKrishna),
(521322, @CityIdKrishna),
(521148, @CityIdKrishna),
(521170, @CityIdKrishna),
(521121, @CityIdKrishna),
(521231, @CityIdKrishna),
(521301, @CityIdKrishna);

DECLARE @CityIdKurnool INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('KURNOOL', @LocationId_AndhraPradesh);

SET @CityIdKurnool = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(518002, @CityIdKurnool),
(518004, @CityIdKurnool),
(518301, @CityIdKurnool),
(518501, @CityIdKurnool),
(518360, @CityIdKurnool),
(518501, @CityIdKurnool),
(518006, @CityIdKurnool);

DECLARE @CityIdMachilipatnam INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('MACHILIPATNAM', @LocationId_AndhraPradesh);

SET @CityIdMachilipatnam = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(521003, @CityIdMachilipatnam);

DECLARE @CityIdMadanapalle INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('MADANAPALLE', @LocationId_AndhraPradesh);

SET @CityIdMadanapalle = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(517326, @CityIdMadanapalle);
DECLARE @CityIdNellore INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('NELLORE', @LocationId_AndhraPradesh);

SET @CityIdNellore = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(524002, @CityIdNellore);
DECLARE @CityIdPrakasam INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('PRAKASAM', @LocationId_AndhraPradesh);

SET @CityIdPrakasam = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(523201, @CityIdPrakasam),
(523201, @CityIdPrakasam),
(506003, @CityIdPrakasam);
DECLARE @CityIdSrikakulam INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('SRIKAKULAM', @LocationId_AndhraPradesh);

SET @CityIdSrikakulam = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(532409, @CityIdSrikakulam),
(532001, @CityIdSrikakulam),
(532148, @CityIdSrikakulam),
(532455, @CityIdSrikakulam),
(532457, @CityIdSrikakulam),
(532458, @CityIdSrikakulam),
(532123, @CityIdSrikakulam),
(532122, @CityIdSrikakulam),
(532264, @CityIdSrikakulam),
(532263, @CityIdSrikakulam),
(532220, @CityIdSrikakulam),
(532243, @CityIdSrikakulam),
(532312, @CityIdSrikakulam),
(532290, @CityIdSrikakulam),
(532222, @CityIdSrikakulam),
(532322, @CityIdSrikakulam),
(532195, @CityIdSrikakulam),
(532242, @CityIdSrikakulam),
(532292, @CityIdSrikakulam),
(532215, @CityIdSrikakulam),
(532211, @CityIdSrikakulam),
(532221, @CityIdSrikakulam),
(532218, @CityIdSrikakulam),
(532216, @CityIdSrikakulam),
(532212, @CityIdSrikakulam),
(532284, @CityIdSrikakulam),
(532203, @CityIdSrikakulam),
(532404, @CityIdSrikakulam),
(532219, @CityIdSrikakulam),
(532291, @CityIdSrikakulam),
(532440, @CityIdSrikakulam),
(532443, @CityIdSrikakulam),
(532461, @CityIdSrikakulam),
(532460, @CityIdSrikakulam),
(532456, @CityIdSrikakulam),
(532445, @CityIdSrikakulam),
(532484, @CityIdSrikakulam),
(532459, @CityIdSrikakulam),
(532214, @CityIdSrikakulam),
(532427, @CityIdSrikakulam),
(532432, @CityIdSrikakulam),
(532462, @CityIdSrikakulam),
(532428, @CityIdSrikakulam),
(532421, @CityIdSrikakulam),
(532190, @CityIdSrikakulam),
(532213, @CityIdSrikakulam),
(532429, @CityIdSrikakulam),
(532430, @CityIdSrikakulam),
(532426, @CityIdSrikakulam),
(532425, @CityIdSrikakulam),
(532186, @CityIdSrikakulam),
(532408, @CityIdSrikakulam),
(532005, @CityIdSrikakulam),
(532407, @CityIdSrikakulam),
(532403, @CityIdSrikakulam),
(532168, @CityIdSrikakulam),
(532127, @CityIdSrikakulam),
(532402, @CityIdSrikakulam),
(532474, @CityIdSrikakulam),
(532401, @CityIdSrikakulam),
(532406, @CityIdSrikakulam),
(532410, @CityIdSrikakulam),
(532405, @CityIdSrikakulam),
(532185, @CityIdSrikakulam),
(532201, @CityIdSrikakulam);
DECLARE @CityIdVisakhapatnam INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('VISAKHAPATNAM', @LocationId_AndhraPradesh);

SET @CityIdVisakhapatnam = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(535145, @CityIdVisakhapatnam),
(535145, @CityIdVisakhapatnam),
(531219, @CityIdVisakhapatnam),
(531173, @CityIdVisakhapatnam),
(531163, @CityIdVisakhapatnam),
(531162, @CityIdVisakhapatnam),
(531162, @CityIdVisakhapatnam),
(531151, @CityIdVisakhapatnam),
(531149, @CityIdVisakhapatnam),
(531149, @CityIdVisakhapatnam),
(531133, @CityIdVisakhapatnam),
(531127, @CityIdVisakhapatnam),
(531126, @CityIdVisakhapatnam),
(531118, @CityIdVisakhapatnam),
(531117, @CityIdVisakhapatnam),
(531116, @CityIdVisakhapatnam),
(531115, @CityIdVisakhapatnam),
(531114, @CityIdVisakhapatnam),
(531113, @CityIdVisakhapatnam),
(531111, @CityIdVisakhapatnam),
(531105, @CityIdVisakhapatnam),
(531087, @CityIdVisakhapatnam),
(531085, @CityIdVisakhapatnam),
(531084, @CityIdVisakhapatnam),
(531083, @CityIdVisakhapatnam),
(531082, @CityIdVisakhapatnam),
(531081, @CityIdVisakhapatnam),
(531077, @CityIdVisakhapatnam),
(531075, @CityIdVisakhapatnam),
(531061, @CityIdVisakhapatnam),
(531060, @CityIdVisakhapatnam),
(531055, @CityIdVisakhapatnam),
(531055, @CityIdVisakhapatnam),
(531040, @CityIdVisakhapatnam),
(531036, @CityIdVisakhapatnam),
(531035, @CityIdVisakhapatnam),
(531034, @CityIdVisakhapatnam),
(531033, @CityIdVisakhapatnam),
(531032, @CityIdVisakhapatnam),
(531031, @CityIdVisakhapatnam),
(531030, @CityIdVisakhapatnam),
(531029, @CityIdVisakhapatnam),
(531028, @CityIdVisakhapatnam),
(531027, @CityIdVisakhapatnam),
(531026, @CityIdVisakhapatnam),
(531025, @CityIdVisakhapatnam),
(531024, @CityIdVisakhapatnam),
(531023, @CityIdVisakhapatnam),
(531023, @CityIdVisakhapatnam),
(531022, @CityIdVisakhapatnam),
(531021, @CityIdVisakhapatnam),
(531020, @CityIdVisakhapatnam),
(531019, @CityIdVisakhapatnam),
(531019, @CityIdVisakhapatnam),
(531011, @CityIdVisakhapatnam),
(531002, @CityIdVisakhapatnam),
(531002, @CityIdVisakhapatnam),
(531001, @CityIdVisakhapatnam),
(531001, @CityIdVisakhapatnam),
(530053, @CityIdVisakhapatnam),
(530052, @CityIdVisakhapatnam),
(530052, @CityIdVisakhapatnam),
(530051, @CityIdVisakhapatnam),
(530049, @CityIdVisakhapatnam),
(530048, @CityIdVisakhapatnam),
(530047, @CityIdVisakhapatnam),
(530046, @CityIdVisakhapatnam),
(530045, @CityIdVisakhapatnam),
(530044, @CityIdVisakhapatnam),
(530043, @CityIdVisakhapatnam),
(530041, @CityIdVisakhapatnam),
(530040, @CityIdVisakhapatnam),
(530035, @CityIdVisakhapatnam),
(530032, @CityIdVisakhapatnam),
(530031, @CityIdVisakhapatnam),
(530029, @CityIdVisakhapatnam),
(530028, @CityIdVisakhapatnam),
(530027, @CityIdVisakhapatnam),
(530026, @CityIdVisakhapatnam),
(530024, @CityIdVisakhapatnam),
(530022, @CityIdVisakhapatnam),
(530020, @CityIdVisakhapatnam),
(530018, @CityIdVisakhapatnam),
(530017, @CityIdVisakhapatnam),
(530016, @CityIdVisakhapatnam),
(530015, @CityIdVisakhapatnam),
(530014, @CityIdVisakhapatnam),
(530013, @CityIdVisakhapatnam),
(530012, @CityIdVisakhapatnam),
(530011, @CityIdVisakhapatnam),
(530009, @CityIdVisakhapatnam),
(530008, @CityIdVisakhapatnam),
(530007, @CityIdVisakhapatnam),
(530005, @CityIdVisakhapatnam),
(530004, @CityIdVisakhapatnam),
(530003, @CityIdVisakhapatnam),
(530002, @CityIdVisakhapatnam),
(530001, @CityIdVisakhapatnam);
DECLARE @CityIdVizianagaram INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('VIZIANAGARAM', @LocationId_AndhraPradesh);

SET @CityIdVizianagaram = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(535501, @CityIdVizianagaram),
(535501, @CityIdVizianagaram),
(535216, @CityIdVizianagaram),
(535579, @CityIdVizianagaram),
(535579, @CityIdVizianagaram),
(535558, @CityIdVizianagaram),
(535125, @CityIdVizianagaram),
(535128, @CityIdVizianagaram),
(535557, @CityIdVizianagaram);

DECLARE @CityIdWarangal INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('WARANGAL', @LocationId_AndhraPradesh);

SET @CityIdWarangal = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId)
VALUES (534198, @CityIdWarangal);

DECLARE @CityIdWestGodavari INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('WEST GODAVARI', @LocationId_AndhraPradesh);

SET @CityIdWestGodavari = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId)
VALUES
(534001, @CityIdWestGodavari),
(534002, @CityIdWestGodavari),
(534003, @CityIdWestGodavari),
(534004, @CityIdWestGodavari),
(534005, @CityIdWestGodavari),
(534006, @CityIdWestGodavari),
(534007, @CityIdWestGodavari),
(534101, @CityIdWestGodavari),
(534102, @CityIdWestGodavari),
(534111, @CityIdWestGodavari),
(534112, @CityIdWestGodavari),
(534122, @CityIdWestGodavari),
(534123, @CityIdWestGodavari),
(534124, @CityIdWestGodavari),
(534126, @CityIdWestGodavari),
(534134, @CityIdWestGodavari),
(534145, @CityIdWestGodavari),
(534146, @CityIdWestGodavari),
(534156, @CityIdWestGodavari),
(534165, @CityIdWestGodavari),
(534166, @CityIdWestGodavari),
(534176, @CityIdWestGodavari),
(534186, @CityIdWestGodavari),
(534195, @CityIdWestGodavari),
(534196, @CityIdWestGodavari),
(534197, @CityIdWestGodavari),
(534199, @CityIdWestGodavari),
(534201, @CityIdWestGodavari),
(534202, @CityIdWestGodavari),
(534204, @CityIdWestGodavari),
(534206, @CityIdWestGodavari),
(534207, @CityIdWestGodavari),
(534208, @CityIdWestGodavari),
(534209, @CityIdWestGodavari),
(534210, @CityIdWestGodavari),
(534211, @CityIdWestGodavari),
(534215, @CityIdWestGodavari),
(534216, @CityIdWestGodavari),
(534217, @CityIdWestGodavari),
(534218, @CityIdWestGodavari),
(534222, @CityIdWestGodavari),
(534225, @CityIdWestGodavari),
(534227, @CityIdWestGodavari),
(534230, @CityIdWestGodavari),
(534235, @CityIdWestGodavari),
(534236, @CityIdWestGodavari),
(534237, @CityIdWestGodavari),
(534238, @CityIdWestGodavari),
(534239, @CityIdWestGodavari),
(534240, @CityIdWestGodavari),
(534243, @CityIdWestGodavari),
(534244, @CityIdWestGodavari),
(534245, @CityIdWestGodavari),
(534247, @CityIdWestGodavari),
(534250, @CityIdWestGodavari),
(534260, @CityIdWestGodavari),
(534266, @CityIdWestGodavari),
(534267, @CityIdWestGodavari),
(534268, @CityIdWestGodavari),
(534269, @CityIdWestGodavari),
(534275, @CityIdWestGodavari),
(534280, @CityIdWestGodavari),
(534281, @CityIdWestGodavari),
(534301, @CityIdWestGodavari),
(534302, @CityIdWestGodavari),
(534305, @CityIdWestGodavari),
(534311, @CityIdWestGodavari),
(534312, @CityIdWestGodavari),
(534313, @CityIdWestGodavari),
(534315, @CityIdWestGodavari),
(534316, @CityIdWestGodavari),
(534318, @CityIdWestGodavari),
(534320, @CityIdWestGodavari),
(534324, @CityIdWestGodavari),
(534326, @CityIdWestGodavari),
(534327, @CityIdWestGodavari),
(534328, @CityIdWestGodavari),
(534329, @CityIdWestGodavari),
(534330, @CityIdWestGodavari),
(534331, @CityIdWestGodavari),
(534338, @CityIdWestGodavari),
(534341, @CityIdWestGodavari),
(534342, @CityIdWestGodavari),
(534350, @CityIdWestGodavari),
(534401, @CityIdWestGodavari),
(534406, @CityIdWestGodavari),
(534411, @CityIdWestGodavari),
(534416, @CityIdWestGodavari),
(534425, @CityIdWestGodavari),
(534426, @CityIdWestGodavari),
(534427, @CityIdWestGodavari),
(534432, @CityIdWestGodavari),
(534435, @CityIdWestGodavari),
(534437, @CityIdWestGodavari),
(534442, @CityIdWestGodavari),
(534444, @CityIdWestGodavari),
(534447, @CityIdWestGodavari),
(534448, @CityIdWestGodavari),
(534449, @CityIdWestGodavari),
(534450, @CityIdWestGodavari),
(534451, @CityIdWestGodavari),
(534452, @CityIdWestGodavari),
(534455, @CityIdWestGodavari),
(534456, @CityIdWestGodavari),
(534460, @CityIdWestGodavari),
(534461, @CityIdWestGodavari),
(534462, @CityIdWestGodavari),
(534467, @CityIdWestGodavari),
(534475, @CityIdWestGodavari);
--END OF ANDRA
DECLARE @LocationId_ArunachalPradesh INT;

INSERT INTO Locations (Name)
VALUES ('Arunachal Pradesh');

SET @LocationId_ArunachalPradesh = SCOPE_IDENTITY();
DECLARE @CityIdLowerSubansiri INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('LOWER SUBANSIRI', @LocationId_ArunachalPradesh);

SET @CityIdLowerSubansiri = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId)
VALUES
(791113, @CityIdLowerSubansiri);DECLARE @CityIdPapumPare INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('PAPUM PARE', @LocationId_ArunachalPradesh);

SET @CityIdPapumPare = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId)
VALUES
(791111, @CityIdPapumPare);
--END OF Arunachal Pradesh
DECLARE @LocationIdAssam INT;

INSERT INTO Locations (Name)
VALUES ('Assam');

SET @LocationIdAssam = SCOPE_IDENTITY();
DECLARE @CityIdNagaon INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('NAGAON', @LocationIdAssam);

SET @CityIdNagaon = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId)
VALUES
(782002, @CityIdNagaon),
(782003, @CityIdNagaon),
(782435, @CityIdNagaon),
(782440, @CityIdNagaon);
DECLARE @CityIdKamrup INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('KAMRUP', @LocationIdAssam);

SET @CityIdKamrup = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId)
VALUES
(781011, @CityIdKamrup),
(781017, @CityIdKamrup),
(781034, @CityIdKamrup);
DECLARE @CityIdKamrupMetropolitan INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('KAMRUP METROPOLITAN', @LocationIdAssam);

SET @CityIdKamrupMetropolitan = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId)
VALUES
(781003, @CityIdKamrupMetropolitan),
(781006, @CityIdKamrupMetropolitan),
(781008, @CityIdKamrupMetropolitan),
(781014, @CityIdKamrupMetropolitan),
(781016, @CityIdKamrupMetropolitan),
(781020, @CityIdKamrupMetropolitan),
(781021, @CityIdKamrupMetropolitan),
(781027, @CityIdKamrupMetropolitan),
(781028, @CityIdKamrupMetropolitan),
(781029, @CityIdKamrupMetropolitan),
(781035, @CityIdKamrupMetropolitan);
DECLARE @CityIdBaksa INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('BAKSA', @LocationIdAssam);

SET @CityIdBaksa = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId)
VALUES
(781315, @CityIdBaksa);
DECLARE @CityIdJorhat INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('JORHAT', @LocationIdAssam);

SET @CityIdJorhat = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId)
VALUES
(785001, @CityIdJorhat);
DECLARE @CityIdBongaigaon INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('BONGAIGAON', @LocationIdAssam);

SET @CityIdBongaigaon = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId)
VALUES
(783392, @CityIdBongaigaon);
DECLARE @CityIdBarpeta INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('BARPETA', @LocationIdAssam);

SET @CityIdBarpeta = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId)
VALUES
(781307, @CityIdBarpeta),
(781319, @CityIdBarpeta),
(781352, @CityIdBarpeta);
DECLARE @CityIdSonitpur INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('SONITPUR', @LocationIdAssam);

SET @CityIdSonitpur = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId)
VALUES
(784001, @CityIdSonitpur),
(784101, @CityIdSonitpur),
(784104, @CityIdSonitpur);
DECLARE @CityIdNalbari INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('NALBARI', @LocationIdAssam);

SET @CityIdNalbari = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId)
VALUES
(781335, @CityIdNalbari),
(781339, @CityIdNalbari);
DECLARE @CityIdDibrugarh INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('DIBRUGARH', @LocationIdAssam);

SET @CityIdDibrugarh = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId)
VALUES
(786001, @CityIdDibrugarh),
(786602, @CityIdDibrugarh);
DECLARE @CityIdTinsukia INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('TINSUKIA', @LocationIdAssam);

SET @CityIdTinsukia = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId)
VALUES
(786125, @CityIdTinsukia),
(786171, @CityIdTinsukia),
(786183, @CityIdTinsukia);
DECLARE @CityIdSibsagar INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('SIBSAGAR', @LocationIdAssam);

SET @CityIdSibsagar = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId)
VALUES
(785640, @CityIdSibsagar),
(785664, @CityIdSibsagar),
(785686, @CityIdSibsagar);
DECLARE @CityIdDarrang INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('DARRANG', @LocationIdAssam);

SET @CityIdDarrang = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId)
VALUES
(784125, @CityIdDarrang);
DECLARE @CityIdDhemaji INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('DHEMAJI', @LocationIdAssam);

SET @CityIdDhemaji = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId)
VALUES
(787060, @CityIdDhemaji);
DECLARE @CityIdCachar INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('CACHAR', @LocationIdAssam);

SET @CityIdCachar = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId)
VALUES
(788005, @CityIdCachar);
DECLARE @CityIdLakhimpur INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('LAKHIMPUR', @LocationIdAssam);

SET @CityIdLakhimpur = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId)
VALUES
(787001, @CityIdLakhimpur);
--End of Assam
/* ===============================
   STATE : BIHAR
   =============================== */

DECLARE @LocationIdBihar INT;

INSERT INTO Locations (Name)
VALUES ('Bihar');

SET @LocationIdBihar = SCOPE_IDENTITY();


/* ===============================
   CITY : PATNA
   =============================== */
DECLARE @CityIdPatna INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('PATNA', @LocationIdBihar);

SET @CityIdPatna = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId)
VALUES
(804454,@CityIdPatna),(804453,@CityIdPatna),(804452,@CityIdPatna),(804451,@CityIdPatna),
(803301,@CityIdPatna),(803221,@CityIdPatna),(803214,@CityIdPatna),(803213,@CityIdPatna),
(803212,@CityIdPatna),(803211,@CityIdPatna),(803203,@CityIdPatna),(803202,@CityIdPatna),
(803201,@CityIdPatna),(801507,@CityIdPatna),(801506,@CityIdPatna),(801503,@CityIdPatna),
(801501,@CityIdPatna),(801113,@CityIdPatna),(801112,@CityIdPatna),(801111,@CityIdPatna),
(801110,@CityIdPatna),(801109,@CityIdPatna),(801108,@CityIdPatna),(801106,@CityIdPatna),
(801105,@CityIdPatna),(801104,@CityIdPatna),(801103,@CityIdPatna),(801102,@CityIdPatna),
(800001,@CityIdPatna),(800002,@CityIdPatna),(800003,@CityIdPatna),(800004,@CityIdPatna),
(800005,@CityIdPatna),(800006,@CityIdPatna),(800007,@CityIdPatna),(800008,@CityIdPatna),
(800009,@CityIdPatna),(800010,@CityIdPatna),(800011,@CityIdPatna),(800012,@CityIdPatna),
(800013,@CityIdPatna),(800014,@CityIdPatna),(800015,@CityIdPatna),(800016,@CityIdPatna),
(800017,@CityIdPatna),(800018,@CityIdPatna),(800019,@CityIdPatna),(800020,@CityIdPatna),
(800021,@CityIdPatna),(800022,@CityIdPatna),(800023,@CityIdPatna),(800024,@CityIdPatna),
(800025,@CityIdPatna),(800026,@CityIdPatna),(800027,@CityIdPatna),(800028,@CityIdPatna),
(800029,@CityIdPatna);


/* ===============================
   CITY : NALANDA
   =============================== */
DECLARE @CityIdNalanda INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('NALANDA', @LocationIdBihar);

SET @CityIdNalanda = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId)
VALUES
(803107,@CityIdNalanda),(803106,@CityIdNalanda),(803303,@CityIdNalanda),(803302,@CityIdNalanda),
(803301,@CityIdNalanda),(803215,@CityIdNalanda),(803101,@CityIdNalanda),(803216,@CityIdNalanda),
(801304,@CityIdNalanda),(801307,@CityIdNalanda),(803108,@CityIdNalanda),(803110,@CityIdNalanda),
(801301,@CityIdNalanda),(801306,@CityIdNalanda),(803115,@CityIdNalanda),(801302,@CityIdNalanda),
(803117,@CityIdNalanda),(801305,@CityIdNalanda),(801303,@CityIdNalanda),(803113,@CityIdNalanda),
(803114,@CityIdNalanda),(803120,@CityIdNalanda),(803119,@CityIdNalanda),(803116,@CityIdNalanda),
(803121,@CityIdNalanda),(803111,@CityIdNalanda),(803118,@CityIdNalanda);


/* ===============================
   CITY : GAYA
   =============================== */
DECLARE @CityIdGaya INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('GAYA', @LocationIdBihar);

SET @CityIdGaya = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId)
VALUES
(823001,@CityIdGaya),(823002,@CityIdGaya),(823003,@CityIdGaya),(823004,@CityIdGaya),
(823005,@CityIdGaya),(823311,@CityIdGaya),(824201,@CityIdGaya),(824205,@CityIdGaya),
(824206,@CityIdGaya),(824207,@CityIdGaya),(824209,@CityIdGaya),(824210,@CityIdGaya),
(824217,@CityIdGaya),(824231,@CityIdGaya),(824232,@CityIdGaya),(824233,@CityIdGaya),
(824234,@CityIdGaya),(824235,@CityIdGaya),(824236,@CityIdGaya),(824237,@CityIdGaya),
(804402,@CityIdGaya),(804403,@CityIdGaya),(804405,@CityIdGaya),(804406,@CityIdGaya),
(804417,@CityIdGaya),(804418,@CityIdGaya),(804420,@CityIdGaya),(804422,@CityIdGaya),
(804423,@CityIdGaya),(804424,@CityIdGaya),(804425,@CityIdGaya),(804426,@CityIdGaya),
(804429,@CityIdGaya),(804432,@CityIdGaya),(804434,@CityIdGaya),(804435,@CityIdGaya);


/* ===============================
   CITY : MUZAFFARPUR
   =============================== */
DECLARE @CityIdMuzaffarpur INT;

INSERT INTO Cities (Name, LocationId)
VALUES ('MUZAFFARPUR', @LocationIdBihar);

SET @CityIdMuzaffarpur = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId)
VALUES
(842001,@CityIdMuzaffarpur),(842002,@CityIdMuzaffarpur),(842003,@CityIdMuzaffarpur),
(842004,@CityIdMuzaffarpur),(842005,@CityIdMuzaffarpur),(843101,@CityIdMuzaffarpur),
(843102,@CityIdMuzaffarpur),(843103,@CityIdMuzaffarpur),(843104,@CityIdMuzaffarpur),
(843105,@CityIdMuzaffarpur),(843106,@CityIdMuzaffarpur),(843107,@CityIdMuzaffarpur),
(843108,@CityIdMuzaffarpur),(843109,@CityIdMuzaffarpur),(843110,@CityIdMuzaffarpur),
(843111,@CityIdMuzaffarpur),(843112,@CityIdMuzaffarpur),(843113,@CityIdMuzaffarpur),
(843114,@CityIdMuzaffarpur),(843115,@CityIdMuzaffarpur),(843117,@CityIdMuzaffarpur),
(843118,@CityIdMuzaffarpur),(843119,@CityIdMuzaffarpur),(843120,@CityIdMuzaffarpur),
(843121,@CityIdMuzaffarpur),(843122,@CityIdMuzaffarpur),(843123,@CityIdMuzaffarpur),
(843124,@CityIdMuzaffarpur),(843125,@CityIdMuzaffarpur),(843126,@CityIdMuzaffarpur),
(843127,@CityIdMuzaffarpur),(843128,@CityIdMuzaffarpur),(843129,@CityIdMuzaffarpur),
(843130,@CityIdMuzaffarpur),(843146,@CityIdMuzaffarpur),(843351,@CityIdMuzaffarpur);

/* ===============================
   CITY : BEGUSARAI
   =============================== */
DECLARE @CityId_Begusarai INT;
INSERT INTO Cities (Name, LocationId) VALUES ('BEGUSARAI',@LocationIdBihar);
SET @CityId_Begusarai = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(811106, @CityId_Begusarai),
(848201, @CityId_Begusarai),
(848202, @CityId_Begusarai),
(848204, @CityId_Begusarai),
(851101, @CityId_Begusarai),
(851111, @CityId_Begusarai),
(851112, @CityId_Begusarai),
(851113, @CityId_Begusarai),
(851114, @CityId_Begusarai),
(851115, @CityId_Begusarai),
(851116, @CityId_Begusarai),
(851117, @CityId_Begusarai),
(851118, @CityId_Begusarai),
(851120, @CityId_Begusarai),
(851126, @CityId_Begusarai),
(851127, @CityId_Begusarai),
(851128, @CityId_Begusarai),
(851129, @CityId_Begusarai),
(851130, @CityId_Begusarai),
(851131, @CityId_Begusarai),
(851132, @CityId_Begusarai),
(851133, @CityId_Begusarai),
(851134, @CityId_Begusarai),
(851135, @CityId_Begusarai),
(851210, @CityId_Begusarai),
(851211, @CityId_Begusarai),
(851217, @CityId_Begusarai),
(851218, @CityId_Begusarai);


/* ===============================
   CITY : BHAGALPUR
   =============================== */
DECLARE @CityId_Bhagalpur INT;
INSERT INTO Cities (Name, LocationId) VALUES ('BHAGALPUR',@LocationIdBihar);
SET @CityId_Bhagalpur = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(812001, @CityId_Bhagalpur),
(812002, @CityId_Bhagalpur),
(812003, @CityId_Bhagalpur),
(812004, @CityId_Bhagalpur),
(812005, @CityId_Bhagalpur),
(812006, @CityId_Bhagalpur),
(812007, @CityId_Bhagalpur),
(813104, @CityId_Bhagalpur),
(813105, @CityId_Bhagalpur),
(813108, @CityId_Bhagalpur),
(813113, @CityId_Bhagalpur),
(813201, @CityId_Bhagalpur),
(813203, @CityId_Bhagalpur),
(813204, @CityId_Bhagalpur),
(813205, @CityId_Bhagalpur),
(813206, @CityId_Bhagalpur),
(813209, @CityId_Bhagalpur),
(813210, @CityId_Bhagalpur),
(813212, @CityId_Bhagalpur),
(813213, @CityId_Bhagalpur),
(813214, @CityId_Bhagalpur),
(813221, @CityId_Bhagalpur),
(813222, @CityId_Bhagalpur),
(853201, @CityId_Bhagalpur),
(853202, @CityId_Bhagalpur),
(853203, @CityId_Bhagalpur),
(853204, @CityId_Bhagalpur),
(853205, @CityId_Bhagalpur);
/* ===============================
   CITY : BANKA
   =============================== */
DECLARE @CityId_Banka INT;
INSERT INTO Cities (Name, LocationId) VALUES ('BANKA',@LocationIdBihar);
SET @CityId_Banka = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(813101, @CityId_Banka),
(813102, @CityId_Banka),
(813103, @CityId_Banka),
(813106, @CityId_Banka),
(813107, @CityId_Banka),
(813109, @CityId_Banka),
(813110, @CityId_Banka),
(813202, @CityId_Banka),
(813207, @CityId_Banka),
(813211, @CityId_Banka),
(814131, @CityId_Banka);

/* ===============================
   CITY : BHOJPUR
   =============================== */
DECLARE @CityId_Bhojpur INT;
INSERT INTO Cities (Name, LocationId) VALUES ('BHOJPUR',@LocationIdBihar);
SET @CityId_Bhojpur = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(802103, @CityId_Bhojpur),
(802115, @CityId_Bhojpur),
(802118, @CityId_Bhojpur),
(802133, @CityId_Bhojpur),
(802136, @CityId_Bhojpur),
(802152, @CityId_Bhojpur),
(802154, @CityId_Bhojpur),
(802155, @CityId_Bhojpur),
(802156, @CityId_Bhojpur),
(802157, @CityId_Bhojpur),
(802158, @CityId_Bhojpur),
(802159, @CityId_Bhojpur),
(802160, @CityId_Bhojpur),
(802161, @CityId_Bhojpur),
(802162, @CityId_Bhojpur),
(802163, @CityId_Bhojpur),
(802164, @CityId_Bhojpur),
(802165, @CityId_Bhojpur),
(802166, @CityId_Bhojpur),
(802183, @CityId_Bhojpur),
(802201, @CityId_Bhojpur),
(802202, @CityId_Bhojpur),
(802203, @CityId_Bhojpur),
(802204, @CityId_Bhojpur),
(802205, @CityId_Bhojpur),
(802206, @CityId_Bhojpur),
(802207, @CityId_Bhojpur),
(802208, @CityId_Bhojpur),
(802209, @CityId_Bhojpur),
(802210, @CityId_Bhojpur),
(802222, @CityId_Bhojpur),
(802223, @CityId_Bhojpur),
(802301, @CityId_Bhojpur),
(802302, @CityId_Bhojpur),
(802311, @CityId_Bhojpur),
(802312, @CityId_Bhojpur),
(802313, @CityId_Bhojpur),
(802314, @CityId_Bhojpur),
(802316, @CityId_Bhojpur),
(802351, @CityId_Bhojpur),
(802352, @CityId_Bhojpur);


/* ===============================
   CITY : BUXAR
   =============================== */
DECLARE @CityId_Buxar INT;
INSERT INTO Cities (Name, LocationId) VALUES ('BUXAR',@LocationIdBihar);
SET @CityId_Buxar = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(802101, @CityId_Buxar),
(802102, @CityId_Buxar),
(802112, @CityId_Buxar),
(802113, @CityId_Buxar),
(802114, @CityId_Buxar),
(802116, @CityId_Buxar),
(802117, @CityId_Buxar),
(802119, @CityId_Buxar),
(802120, @CityId_Buxar),
(802122, @CityId_Buxar),
(802123, @CityId_Buxar),
(802125, @CityId_Buxar),
(802126, @CityId_Buxar),
(802127, @CityId_Buxar),
(802128, @CityId_Buxar),
(802129, @CityId_Buxar),
(802130, @CityId_Buxar),
(802131, @CityId_Buxar),
(802134, @CityId_Buxar),
(802135, @CityId_Buxar);
/* ===============================
   CITY : ROHTAS
   =============================== */
DECLARE @CityId_Rohtas INT;
INSERT INTO Cities (Name, LocationId) VALUES ('ROHTAS',@LocationIdBihar);
SET @CityId_Rohtas = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(802132, @CityId_Rohtas),
(802211, @CityId_Rohtas),
(802212, @CityId_Rohtas),
(802213, @CityId_Rohtas),
(802214, @CityId_Rohtas),
(802215, @CityId_Rohtas),
(802216, @CityId_Rohtas),
(802217, @CityId_Rohtas),
(802218, @CityId_Rohtas),
(802219, @CityId_Rohtas),
(802220, @CityId_Rohtas),
(802221, @CityId_Rohtas),
(802226, @CityId_Rohtas),
(821101, @CityId_Rohtas),
(821102, @CityId_Rohtas),
(821103, @CityId_Rohtas),
(821104, @CityId_Rohtas),
(821105, @CityId_Rohtas),
(821106, @CityId_Rohtas),
(821107, @CityId_Rohtas),
(821108, @CityId_Rohtas),
(821111, @CityId_Rohtas),
(821112, @CityId_Rohtas),
(821113, @CityId_Rohtas),
(821301, @CityId_Rohtas),
(821302, @CityId_Rohtas),
(821303, @CityId_Rohtas),
(821304, @CityId_Rohtas),
(821305, @CityId_Rohtas),
(821306, @CityId_Rohtas),
(821307, @CityId_Rohtas),
(821308, @CityId_Rohtas),
(821309, @CityId_Rohtas),
(821310, @CityId_Rohtas),
(821311, @CityId_Rohtas),
(821312, @CityId_Rohtas);

/* ===============================
   CITY : ARARIA
   =============================== */
DECLARE @CityId_Araria INT;
INSERT INTO Cities (Name, LocationId) VALUES ('ARARIA',@LocationIdBihar);
SET @CityId_Araria = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(854311, @CityId_Araria),
(854312, @CityId_Araria),
(854316, @CityId_Araria),
(854318, @CityId_Araria),
(854328, @CityId_Araria),
(854329, @CityId_Araria),
(854331, @CityId_Araria),
(854332, @CityId_Araria),
(854333, @CityId_Araria),
(854334, @CityId_Araria),
(854335, @CityId_Araria),
(854336, @CityId_Araria);
/* ===============================
   CITY : ARWAL
   =============================== */
DECLARE @CityId_Arwal INT;
INSERT INTO Cities (Name, LocationId) VALUES ('ARWAL',@LocationIdBihar);
SET @CityId_Arwal = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(804402, @CityId_Arwal),
(804419, @CityId_Arwal);


/* ===============================
   CITY : AURANGABAD
   =============================== */
DECLARE @CityId_Aurangabad INT;
INSERT INTO Cities (Name, LocationId) VALUES ('AURANGABAD',@LocationIdBihar);
SET @CityId_Aurangabad = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(804401, @CityId_Aurangabad),
(824101, @CityId_Aurangabad), -- duplicate removed
(824113, @CityId_Aurangabad),
(824115, @CityId_Aurangabad),
(824121, @CityId_Aurangabad),
(824122, @CityId_Aurangabad),
(824123, @CityId_Aurangabad),
(824143, @CityId_Aurangabad),
(824211, @CityId_Aurangabad),
(824220, @CityId_Aurangabad),
(824221, @CityId_Aurangabad),
(824302, @CityId_Aurangabad),
(824303, @CityId_Aurangabad);
/* ===============================
   CITY : JAMUI
   =============================== */
DECLARE @CityId_Jamui INT;
INSERT INTO Cities (Name, LocationId) VALUES ('JAMUI',@LocationIdBihar);
SET @CityId_Jamui = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(801505, @CityId_Jamui),
(811301, @CityId_Jamui),
(811303, @CityId_Jamui),
(811305, @CityId_Jamui),
(811307, @CityId_Jamui),
(811308, @CityId_Jamui),
(811312, @CityId_Jamui),
(811313, @CityId_Jamui),
(811314, @CityId_Jamui),
(811315, @CityId_Jamui),
(811316, @CityId_Jamui),
(811317, @CityId_Jamui);


/* ===============================
   CITY : JEHANABAD
   =============================== */
DECLARE @CityId_Jehanabad INT;
INSERT INTO Cities (Name, LocationId) VALUES ('JEHANABAD',@LocationIdBihar);
SET @CityId_Jehanabad = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(804407, @CityId_Jehanabad),
(804408, @CityId_Jehanabad),
(804427, @CityId_Jehanabad),
(804428, @CityId_Jehanabad);
/* ===============================
   CITY : NAWADA
   =============================== */
DECLARE @CityId_Nawada INT;
INSERT INTO Cities (Name, LocationId) VALUES ('NAWADA',@LocationIdBihar);
SET @CityId_Nawada = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(803109, @CityId_Nawada),
(805101, @CityId_Nawada),
(805102, @CityId_Nawada),
(805103, @CityId_Nawada),
(805104, @CityId_Nawada),
(805105, @CityId_Nawada),
(805106, @CityId_Nawada),
(805107, @CityId_Nawada),
(805108, @CityId_Nawada),
(805109, @CityId_Nawada),
(805110, @CityId_Nawada),
(805111, @CityId_Nawada),
(805112, @CityId_Nawada),
(805121, @CityId_Nawada),
(805122, @CityId_Nawada),
(805123, @CityId_Nawada),
(805124, @CityId_Nawada),
(805125, @CityId_Nawada),
(805126, @CityId_Nawada),
(805127, @CityId_Nawada),
(805128, @CityId_Nawada),
(805129, @CityId_Nawada),
(805130, @CityId_Nawada),
(805132, @CityId_Nawada),
(805133, @CityId_Nawada),
(805135, @CityId_Nawada),
(805141, @CityId_Nawada),
(805236, @CityId_Nawada);
/* ===============================
   CITY : KISHANGANJ
   =============================== */
DECLARE @CityId_Kishanganj INT;
INSERT INTO Cities (Name, LocationId) VALUES ('KISHANGANJ',@LocationIdBihar);
SET @CityId_Kishanganj = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(855101, @CityId_Kishanganj),
(855106, @CityId_Kishanganj),
(855107, @CityId_Kishanganj),
(855108, @CityId_Kishanganj),
(855115, @CityId_Kishanganj),
(855116, @CityId_Kishanganj),
(855117, @CityId_Kishanganj);


/* ===============================
   CITY : LAKHISARAI
   =============================== */
DECLARE @CityId_Lakhisarai INT;
INSERT INTO Cities (Name, LocationId) VALUES ('LAKHISARAI',@LocationIdBihar);
SET @CityId_Lakhisarai = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(811107, @CityId_Lakhisarai),
(811112, @CityId_Lakhisarai),
(811302, @CityId_Lakhisarai),
(811309, @CityId_Lakhisarai),
(811310, @CityId_Lakhisarai),
(811311, @CityId_Lakhisarai);


/* ===============================
   CITY : MADHEPURA
   =============================== */
DECLARE @CityId_Madhepura INT;
INSERT INTO Cities (Name, LocationId) VALUES ('MADHEPURA',@LocationIdBihar);
SET @CityId_Madhepura = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(852101, @CityId_Madhepura),
(852112, @CityId_Madhepura),
(852113, @CityId_Madhepura),
(852114, @CityId_Madhepura),
(852115, @CityId_Madhepura),
(852116, @CityId_Madhepura),
(852121, @CityId_Madhepura),
(852122, @CityId_Madhepura),
(852128, @CityId_Madhepura),
(852132, @CityId_Madhepura),
(852213, @CityId_Madhepura),
(852219, @CityId_Madhepura),
(852220, @CityId_Madhepura);
/* ===============================
   CITY : MADHUBANI
   =============================== */
DECLARE @CityId_Madhubani INT;
INSERT INTO Cities (Name, LocationId) VALUES ('MADHUBANI',@LocationIdBihar);
SET @CityId_Madhubani = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(847102, @CityId_Madhubani),
(847108, @CityId_Madhubani),
(847109, @CityId_Madhubani),
(847211, @CityId_Madhubani),
(847212, @CityId_Madhubani),
(847213, @CityId_Madhubani),
(847214, @CityId_Madhubani),
(847215, @CityId_Madhubani),
(847222, @CityId_Madhubani),
(847223, @CityId_Madhubani),
(847224, @CityId_Madhubani),
(847225, @CityId_Madhubani),
(847226, @CityId_Madhubani),
(847227, @CityId_Madhubani),
(847228, @CityId_Madhubani),
(847229, @CityId_Madhubani),
(847230, @CityId_Madhubani),
(847231, @CityId_Madhubani),
(847232, @CityId_Madhubani),
(847234, @CityId_Madhubani),
(847235, @CityId_Madhubani),
(847236, @CityId_Madhubani),
(847238, @CityId_Madhubani),
(847239, @CityId_Madhubani),
(847240, @CityId_Madhubani),
(847305, @CityId_Madhubani),
(847308, @CityId_Madhubani),
(847401, @CityId_Madhubani),
(847402, @CityId_Madhubani),
(847403, @CityId_Madhubani),
(847404, @CityId_Madhubani),
(847408, @CityId_Madhubani),
(847409, @CityId_Madhubani),
(847410, @CityId_Madhubani),
(847411, @CityId_Madhubani),
(847421, @CityId_Madhubani),
(847424, @CityId_Madhubani);


/* ===============================
   CITY : MUNGER
   =============================== */
DECLARE @CityId_Munger INT;
INSERT INTO Cities (Name, LocationId) VALUES ('MUNGER',@LocationIdBihar);
SET @CityId_Munger = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(811201, @CityId_Munger),
(811202, @CityId_Munger),
(811211, @CityId_Munger),
(811212, @CityId_Munger),
(811213, @CityId_Munger),
(811214, @CityId_Munger);
/* ===============================
   CITY : SHEIKHPURA
   =============================== */
DECLARE @CityId_Sheikhpura INT;
INSERT INTO Cities (Name, LocationId) VALUES ('SHEIKHPURA',@LocationIdBihar);
SET @CityId_Sheikhpura = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(811102, @CityId_Sheikhpura),
(811103, @CityId_Sheikhpura),
(811105, @CityId_Sheikhpura),
(811304, @CityId_Sheikhpura);


/* ===============================
   CITY : SHEOHAR
   =============================== */
DECLARE @CityId_Sheohar INT;
INSERT INTO Cities (Name, LocationId) VALUES ('SHEOHAR',@LocationIdBihar);
SET @CityId_Sheohar = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(843329, @CityId_Sheohar);


/* ===============================
   CITY : SITAMARHI
   =============================== */
DECLARE @CityId_Sitamarhi INT;
INSERT INTO Cities (Name, LocationId) VALUES ('SITAMARHI',@LocationIdBihar);
SET @CityId_Sitamarhi = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(843301, @CityId_Sitamarhi),
(843302, @CityId_Sitamarhi),
(843311, @CityId_Sitamarhi),
(843313, @CityId_Sitamarhi),
(843314, @CityId_Sitamarhi),
(843315, @CityId_Sitamarhi),
(843316, @CityId_Sitamarhi),
(843317, @CityId_Sitamarhi),
(843318, @CityId_Sitamarhi),
(843319, @CityId_Sitamarhi),
(843320, @CityId_Sitamarhi),
(843322, @CityId_Sitamarhi),
(843323, @CityId_Sitamarhi),
(843324, @CityId_Sitamarhi),
(843325, @CityId_Sitamarhi),
(843326, @CityId_Sitamarhi),
(843327, @CityId_Sitamarhi),
(843328, @CityId_Sitamarhi),
(843330, @CityId_Sitamarhi),
(843331, @CityId_Sitamarhi),
(843332, @CityId_Sitamarhi),
(843333, @CityId_Sitamarhi),
(843334, @CityId_Sitamarhi);
/* ===============================
   CITY : DARBHANGA
   =============================== */
DECLARE @CityId_Darbhanga INT;
INSERT INTO Cities (Name, LocationId) VALUES ('DARBHANGA',@LocationIdBihar);
SET @CityId_Darbhanga = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(845426, @CityId_Darbhanga),
(846001, @CityId_Darbhanga),
(846002, @CityId_Darbhanga),
(846003, @CityId_Darbhanga),
(846004, @CityId_Darbhanga),
(846005, @CityId_Darbhanga),
(846006, @CityId_Darbhanga),
(846007, @CityId_Darbhanga),
(846008, @CityId_Darbhanga),
(846009, @CityId_Darbhanga),
(847101, @CityId_Darbhanga),
(847103, @CityId_Darbhanga),
(847104, @CityId_Darbhanga),
(847105, @CityId_Darbhanga),
(847106, @CityId_Darbhanga),
(847115, @CityId_Darbhanga),
(847121, @CityId_Darbhanga),
(847122, @CityId_Darbhanga),
(847123, @CityId_Darbhanga),
(847201, @CityId_Darbhanga),
(847203, @CityId_Darbhanga),
(847204, @CityId_Darbhanga),
(847233, @CityId_Darbhanga),
(847302, @CityId_Darbhanga),
(847303, @CityId_Darbhanga),
(847304, @CityId_Darbhanga),
(847306, @CityId_Darbhanga),
(847307, @CityId_Darbhanga),
(847337, @CityId_Darbhanga),
(847405, @CityId_Darbhanga),
(847407, @CityId_Darbhanga),
(847422, @CityId_Darbhanga),
(847423, @CityId_Darbhanga),
(847427, @CityId_Darbhanga),
(847428, @CityId_Darbhanga),
(847429, @CityId_Darbhanga);
/* ===============================
   CITY : SAHARSA
   =============================== */
DECLARE @CityId_Saharsa INT;
INSERT INTO Cities (Name, LocationId) VALUES ('SAHARSA',@LocationIdBihar);
SET @CityId_Saharsa = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(852106, @CityId_Saharsa),
(852107, @CityId_Saharsa),
(852123, @CityId_Saharsa),
(852124, @CityId_Saharsa),
(852126, @CityId_Saharsa),
(852127, @CityId_Saharsa),
(852129, @CityId_Saharsa),
(852201, @CityId_Saharsa),
(852202, @CityId_Saharsa),
(852212, @CityId_Saharsa),
(852216, @CityId_Saharsa),
(852217, @CityId_Saharsa),
(852221, @CityId_Saharsa);


/* ===============================
   CITY : SAMASTIPUR
   =============================== */
DECLARE @CityId_Samastipur INT;
INSERT INTO Cities (Name, LocationId) VALUES ('SAMASTIPUR',@LocationIdBihar);
SET @CityId_Samastipur = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(841225, @CityId_Samastipur),
(847301, @CityId_Samastipur),
(848101, @CityId_Samastipur),
(848102, @CityId_Samastipur),
(848113, @CityId_Samastipur),
(848114, @CityId_Samastipur),
(848115, @CityId_Samastipur),
(848117, @CityId_Samastipur),
(848121, @CityId_Samastipur),
(848122, @CityId_Samastipur),
(848125, @CityId_Samastipur),
(848127, @CityId_Samastipur),
(848129, @CityId_Samastipur),
(848130, @CityId_Samastipur),
(848131, @CityId_Samastipur),
(848132, @CityId_Samastipur),
(848133, @CityId_Samastipur),
(848134, @CityId_Samastipur),
(848160, @CityId_Samastipur),
(848205, @CityId_Samastipur),
(848206, @CityId_Samastipur),
(848207, @CityId_Samastipur),
(848208, @CityId_Samastipur),
(848209, @CityId_Samastipur),
(848210, @CityId_Samastipur),
(848211, @CityId_Samastipur),
(848213, @CityId_Samastipur),
(848216, @CityId_Samastipur),
(848236, @CityId_Samastipur),
(848301, @CityId_Samastipur),
(848302, @CityId_Samastipur),
(848501, @CityId_Samastipur),
(848502, @CityId_Samastipur),
(848503, @CityId_Samastipur),
(848504, @CityId_Samastipur),
(848505, @CityId_Samastipur),
(848506, @CityId_Samastipur);


/* ===============================
   CITY : SARAN
   =============================== */
DECLARE @CityId_Saran INT;
INSERT INTO Cities (Name, LocationId) VALUES ('SARAN',@LocationIdBihar);
SET @CityId_Saran = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(841101, @CityId_Saran),
(841201, @CityId_Saran),
(841202, @CityId_Saran),
(841204, @CityId_Saran),
(841205, @CityId_Saran),
(841206, @CityId_Saran),
(841207, @CityId_Saran),
(841208, @CityId_Saran),
(841209, @CityId_Saran),
(841211, @CityId_Saran),
(841212, @CityId_Saran),
(841213, @CityId_Saran),
(841214, @CityId_Saran),
(841215, @CityId_Saran),
(841216, @CityId_Saran),
(841217, @CityId_Saran),
(841218, @CityId_Saran),
(841219, @CityId_Saran),
(841220, @CityId_Saran),
(841221, @CityId_Saran),
(841222, @CityId_Saran),
(841223, @CityId_Saran),
(841224, @CityId_Saran),
(841301, @CityId_Saran),
(841302, @CityId_Saran),
(841305, @CityId_Saran),
(841311, @CityId_Saran),
(841312, @CityId_Saran),
(841313, @CityId_Saran),
(841316, @CityId_Saran),
(841401, @CityId_Saran),
(841402, @CityId_Saran),
(841403, @CityId_Saran),
(841410, @CityId_Saran),
(841411, @CityId_Saran),
(841412, @CityId_Saran),
(841414, @CityId_Saran),
(841415, @CityId_Saran),
(841417, @CityId_Saran),
(841418, @CityId_Saran),
(841419, @CityId_Saran),
(841421, @CityId_Saran),
(841422, @CityId_Saran),
(841424, @CityId_Saran),
(841442, @CityId_Saran),
(841443, @CityId_Saran),
(841460, @CityId_Saran);
/* ===============================
   CITY : SIWAN
   =============================== */
DECLARE @CityId_Siwan INT;
INSERT INTO Cities (Name, LocationId) VALUES ('SIWAN',@LocationIdBihar);
SET @CityId_Siwan = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(841203, @CityId_Siwan),
(841210, @CityId_Siwan),
(841226, @CityId_Siwan),
(841227, @CityId_Siwan),
(841231, @CityId_Siwan),
(841232, @CityId_Siwan),
(841233, @CityId_Siwan),
(841234, @CityId_Siwan),
(841235, @CityId_Siwan),
(841236, @CityId_Siwan),
(841237, @CityId_Siwan),
(841238, @CityId_Siwan),
(841239, @CityId_Siwan),
(841240, @CityId_Siwan),
(841241, @CityId_Siwan),
(841242, @CityId_Siwan),
(841243, @CityId_Siwan),
(841244, @CityId_Siwan),
(841286, @CityId_Siwan),
(841287, @CityId_Siwan),
(841404, @CityId_Siwan),
(841406, @CityId_Siwan),
(841408, @CityId_Siwan),
(841416, @CityId_Siwan),
(841423, @CityId_Siwan),
(841434, @CityId_Siwan),
(841435, @CityId_Siwan),
(841439, @CityId_Siwan),
(841446, @CityId_Siwan),
(841502, @CityId_Siwan),
(841504, @CityId_Siwan),
(841506, @CityId_Siwan),
(841507, @CityId_Siwan),
(841509, @CityId_Siwan);


/* ===============================
   CITY : SUPAUL
   =============================== */
DECLARE @CityId_Supaul INT;
INSERT INTO Cities (Name, LocationId) VALUES ('SUPAUL',@LocationIdBihar);
SET @CityId_Supaul = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(847451, @CityId_Supaul),
(847452, @CityId_Supaul),
(852105, @CityId_Supaul),
(852108, @CityId_Supaul),
(852109, @CityId_Supaul),
(852110, @CityId_Supaul),
(852111, @CityId_Supaul),
(852125, @CityId_Supaul),
(852130, @CityId_Supaul),
(852131, @CityId_Supaul),
(852137, @CityId_Supaul),
(852138, @CityId_Supaul),
(852139, @CityId_Supaul),
(852214, @CityId_Supaul),
(852215, @CityId_Supaul),
(852218, @CityId_Supaul),
(854338, @CityId_Supaul),
(854339, @CityId_Supaul),
(854340, @CityId_Supaul);


/* ===============================
   CITY : VAISHALI
   =============================== */
DECLARE @CityId_Vaishali INT;
INSERT INTO Cities (Name, LocationId) VALUES ('VAISHALI',@LocationIdBihar);
SET @CityId_Vaishali = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(843110, @CityId_Vaishali),
(843114, @CityId_Vaishali),
(843143, @CityId_Vaishali),
(844101, @CityId_Vaishali),
(844102, @CityId_Vaishali),
(844103, @CityId_Vaishali),
(844111, @CityId_Vaishali),
(844113, @CityId_Vaishali),
(844114, @CityId_Vaishali),
(844115, @CityId_Vaishali),
(844116, @CityId_Vaishali),
(844117, @CityId_Vaishali),
(844118, @CityId_Vaishali),
(844119, @CityId_Vaishali),
(844121, @CityId_Vaishali),
(844122, @CityId_Vaishali),
(844123, @CityId_Vaishali),
(844124, @CityId_Vaishali),
(844125, @CityId_Vaishali),
(844126, @CityId_Vaishali),
(844128, @CityId_Vaishali),
(844501, @CityId_Vaishali),
(844502, @CityId_Vaishali),
(844503, @CityId_Vaishali),
(844504, @CityId_Vaishali),
(844505, @CityId_Vaishali),
(844506, @CityId_Vaishali),
(844507, @CityId_Vaishali),
(844508, @CityId_Vaishali),
(844509, @CityId_Vaishali);
/* ===============================
   CITY : WEST CHAMPARAN
   =============================== */
DECLARE @CityId_WestChamparan INT;
INSERT INTO Cities (Name, LocationId)
VALUES ('WEST CHAMPARAN',@LocationIdBihar);

SET @CityId_WestChamparan = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(845101, @CityId_WestChamparan),
(845103, @CityId_WestChamparan),
(845104, @CityId_WestChamparan),
(845105, @CityId_WestChamparan),
(845106, @CityId_WestChamparan),
(845107, @CityId_WestChamparan),
(845306, @CityId_WestChamparan),
(845307, @CityId_WestChamparan),
(845438, @CityId_WestChamparan),
(845449, @CityId_WestChamparan),
(845450, @CityId_WestChamparan),
(845451, @CityId_WestChamparan),
(845452, @CityId_WestChamparan),
(845453, @CityId_WestChamparan),
(845454, @CityId_WestChamparan),
(845455, @CityId_WestChamparan),
(845459, @CityId_WestChamparan);
/* ===============================
   CITY : EAST CHAMPARAN
   =============================== */
DECLARE @CityId_EastChamparan INT;
INSERT INTO Cities (Name, LocationId)
VALUES ('EAST CHAMPARAN',@LocationIdBihar);

SET @CityId_EastChamparan = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(845301, @CityId_EastChamparan),
(845302, @CityId_EastChamparan),
(845303, @CityId_EastChamparan),
(845304, @CityId_EastChamparan),
(845305, @CityId_EastChamparan),
(845315, @CityId_EastChamparan),
(845401, @CityId_EastChamparan),
(845406, @CityId_EastChamparan),
(845411, @CityId_EastChamparan),
(845412, @CityId_EastChamparan),
(845413, @CityId_EastChamparan),
(845414, @CityId_EastChamparan),
(845415, @CityId_EastChamparan),
(845416, @CityId_EastChamparan),
(845417, @CityId_EastChamparan),
(845418, @CityId_EastChamparan),
(845419, @CityId_EastChamparan),
(845420, @CityId_EastChamparan),
(845422, @CityId_EastChamparan),
(845423, @CityId_EastChamparan),
(845424, @CityId_EastChamparan),
(845425, @CityId_EastChamparan),
(845427, @CityId_EastChamparan),
(845428, @CityId_EastChamparan),
(845429, @CityId_EastChamparan),
(845430, @CityId_EastChamparan),
(845431, @CityId_EastChamparan),
(845432, @CityId_EastChamparan),
(845433, @CityId_EastChamparan),
(845434, @CityId_EastChamparan),
(845435, @CityId_EastChamparan),
(845436, @CityId_EastChamparan),
(845437, @CityId_EastChamparan),
(845440, @CityId_EastChamparan),
(845456, @CityId_EastChamparan),
(845457, @CityId_EastChamparan),
(845458, @CityId_EastChamparan);

DECLARE @CityId_Gopalganj INT;
INSERT INTO Cities (Name, LocationId) VALUES ('GOPALGANJ',@LocationIdBihar);
SET @CityId_Gopalganj = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(841405, @CityId_Gopalganj),
(841407, @CityId_Gopalganj),
(841409, @CityId_Gopalganj),
(841413, @CityId_Gopalganj),
(841420, @CityId_Gopalganj),
(841425, @CityId_Gopalganj),
(841426, @CityId_Gopalganj),
(841427, @CityId_Gopalganj),
(841428, @CityId_Gopalganj),
(841436, @CityId_Gopalganj),
(841437, @CityId_Gopalganj),
(841438, @CityId_Gopalganj),
(841440, @CityId_Gopalganj),
(841441, @CityId_Gopalganj),
(841501, @CityId_Gopalganj),
(841503, @CityId_Gopalganj),
(841505, @CityId_Gopalganj),
(841508, @CityId_Gopalganj);

-- ===============================
-- LOCATION : Bihar
-- ===============================
--DECLARE@LocationIdBihar INT;
--IF NOT EXISTS (SELECT 1 FROM Locations WHERE Name = 'Bihar')
--BEGIN
--    INSERT INTO Locations (Name) VALUES ('Bihar');
--    SET@LocationIdBihar = SCOPE_IDENTITY();
--END
--ELSE
--BEGIN
--    SELECT@LocationIdBihar = Id FROM Locations WHERE Name = 'Bihar';
--END

-- ===============================
-- CITY : KATIHAR
-- ===============================
DECLARE @CityId_Katihar INT;
INSERT INTO Cities (Name, LocationId) VALUES ('KATIHAR',@LocationIdBihar);
SET @CityId_Katihar = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(854101, @CityId_Katihar),
(854103, @CityId_Katihar),
(854104, @CityId_Katihar),
(854105, @CityId_Katihar),
(854106, @CityId_Katihar),
(854107, @CityId_Katihar),
(854108, @CityId_Katihar),
(854109, @CityId_Katihar),
(854112, @CityId_Katihar),
(854113, @CityId_Katihar),
(854114, @CityId_Katihar),
(854115, @CityId_Katihar),
(854116, @CityId_Katihar),
(854117, @CityId_Katihar),
(854317, @CityId_Katihar),
(855102, @CityId_Katihar),
(855105, @CityId_Katihar),
(855113, @CityId_Katihar),
(855114, @CityId_Katihar);
DECLARE @CityId_Purnia INT;
INSERT INTO Cities (Name, LocationId) VALUES ('PURNIA',@LocationIdBihar);
SET @CityId_Purnia = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(800030, @CityId_Purnia),
(854102, @CityId_Purnia),
(854201, @CityId_Purnia),
(854202, @CityId_Purnia),
(854203, @CityId_Purnia),
(854204, @CityId_Purnia),
(854205, @CityId_Purnia),
(854301, @CityId_Purnia),
(854302, @CityId_Purnia),
(854303, @CityId_Purnia),
(854304, @CityId_Purnia),
(854305, @CityId_Purnia),
(854306, @CityId_Purnia),
(854315, @CityId_Purnia),
(854325, @CityId_Purnia),
(854326, @CityId_Purnia),
(854327, @CityId_Purnia),
(854330, @CityId_Purnia),
(854337, @CityId_Purnia);
DECLARE @CityId_KaimurBhabua INT;
INSERT INTO Cities (Name, LocationId) VALUES ('KAIMUR BHABUA',@LocationIdBihar);
SET @CityId_KaimurBhabua = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(821109, @CityId_KaimurBhabua),
(821110, @CityId_KaimurBhabua);
--End of Bihar
-- ===============================
-- LOCATION : Chattisgarh
-- ===============================
DECLARE @LocationId_Chattisgarh INT;
IF NOT EXISTS (SELECT 1 FROM Locations WHERE Name = 'Chattisgarh')
BEGIN
    INSERT INTO Locations (Name) VALUES ('Chattisgarh');
    SET @LocationId_Chattisgarh = SCOPE_IDENTITY();
END
ELSE
BEGIN
    SELECT @LocationId_Chattisgarh = Id FROM Locations WHERE Name = 'Chattisgarh';
END

-- ===============================
-- CITY : BALOD
-- ===============================
DECLARE @CityId_Balod INT;
INSERT INTO Cities (Name, LocationId) VALUES ('BALOD', @LocationId_Chattisgarh);
SET @CityId_Balod = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(491226, @CityId_Balod);

-- ===============================
-- CITY : BALOD BAZER
-- ===============================
DECLARE @CityId_BalodBazer INT;
INSERT INTO Cities (Name, LocationId) VALUES ('BALOD BAZER', @LocationId_Chattisgarh);
SET @CityId_BalodBazer = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(493338, @CityId_BalodBazer),
(493195, @CityId_BalodBazer);

-- ===============================
-- CITY : BALRAMPUR
-- ===============================
DECLARE @CityId_Balrampur INT;
INSERT INTO Cities (Name, LocationId) VALUES ('BALRAMPUR', @LocationId_Chattisgarh);
SET @CityId_Balrampur = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(497225, @CityId_Balrampur),
(497224, @CityId_Balrampur),
(497223, @CityId_Balrampur),
(497220, @CityId_Balrampur),
(497119, @CityId_Balrampur),
(497118, @CityId_Balrampur);

-- ===============================
-- CITY : BILASPUR (CT)
-- ===============================
DECLARE @CityId_BilaspurCT INT;
INSERT INTO Cities (Name, LocationId) VALUES ('Bilaspur (CT)', @LocationId_Chattisgarh);
SET @CityId_BilaspurCT = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(495223, @CityId_BilaspurCT);

-- ===============================
-- CITY : BILASPURCGH
-- ===============================
DECLARE @CityId_BilaspurCgh INT;
INSERT INTO Cities (Name, LocationId) VALUES ('BILASPURCGH', @LocationId_Chattisgarh);
SET @CityId_BilaspurCgh = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(495555, @CityId_BilaspurCgh),
(495551, @CityId_BilaspurCgh),
(495550, @CityId_BilaspurCgh),
(495442, @CityId_BilaspurCgh),
(495330, @CityId_BilaspurCgh),
(495224, @CityId_BilaspurCgh),
(495222, @CityId_BilaspurCgh),
(495220, @CityId_BilaspurCgh),
(495119, @CityId_BilaspurCgh),
(495118, @CityId_BilaspurCgh),
(495117, @CityId_BilaspurCgh),
(495116, @CityId_BilaspurCgh),
(495113, @CityId_BilaspurCgh),
(495112, @CityId_BilaspurCgh),
(495009, @CityId_BilaspurCgh),
(495006, @CityId_BilaspurCgh),
(495004, @CityId_BilaspurCgh),
(495003, @CityId_BilaspurCgh),
(495001, @CityId_BilaspurCgh);

-- ===============================
-- CITY : DURG
-- ===============================
DECLARE @CityId_Durg INT;
INSERT INTO Cities (Name, LocationId) VALUES ('DURG', @LocationId_Chattisgarh);
SET @CityId_Durg = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(490020, @CityId_Durg),
(490001, @CityId_Durg),
(490006, @CityId_Durg),
(490042, @CityId_Durg);

-- ===============================
-- CITY : Jagdalpur
-- ===============================
DECLARE @CityId_Jagdalpur INT;
INSERT INTO Cities (Name, LocationId) VALUES ('Jagdalpur', @LocationId_Chattisgarh);
SET @CityId_Jagdalpur = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(494001, @CityId_Jagdalpur);

-- ===============================
-- CITY : JANJGIRCHAMPA
-- ===============================
DECLARE @CityId_JanjgirChampa INT;
INSERT INTO Cities (Name, LocationId) VALUES ('JANJGIRCHAMPA', @LocationId_Chattisgarh);
SET @CityId_JanjgirChampa = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(495695, @CityId_JanjgirChampa),
(495692, @CityId_JanjgirChampa),
(495691, @CityId_JanjgirChampa),
(495690, @CityId_JanjgirChampa),
(495689, @CityId_JanjgirChampa),
(495688, @CityId_JanjgirChampa),
(495687, @CityId_JanjgirChampa),
(495686, @CityId_JanjgirChampa),
(495671, @CityId_JanjgirChampa),
(495668, @CityId_JanjgirChampa),
(495663, @CityId_JanjgirChampa),
(495661, @CityId_JanjgirChampa),
(495660, @CityId_JanjgirChampa),
(495559, @CityId_JanjgirChampa),
(495557, @CityId_JanjgirChampa),
(495556, @CityId_JanjgirChampa),
(495554, @CityId_JanjgirChampa),
(495553, @CityId_JanjgirChampa),
(495552, @CityId_JanjgirChampa);

-- ===============================
-- CITY : JASPUR
-- ===============================
DECLARE @CityId_Jaspur INT;
INSERT INTO Cities (Name, LocationId) VALUES ('JASPUR', @LocationId_Chattisgarh);
SET @CityId_Jaspur = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(496338, @CityId_Jaspur),
(496336, @CityId_Jaspur),
(496334, @CityId_Jaspur),
(496331, @CityId_Jaspur),
(496330, @CityId_Jaspur),
(496245, @CityId_Jaspur),
(496242, @CityId_Jaspur),
(496227, @CityId_Jaspur),
(496225, @CityId_Jaspur),
(496224, @CityId_Jaspur),
(496223, @CityId_Jaspur),
(496220, @CityId_Jaspur),
(496118, @CityId_Jaspur);

-- ===============================
-- CITY : KAWARDHA
-- ===============================
DECLARE @CityId_Kawardha INT;
INSERT INTO Cities (Name, LocationId) VALUES ('KAWARDHA', @LocationId_Chattisgarh);
SET @CityId_Kawardha = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(491995, @CityId_Kawardha);

-- ===============================
-- CITY : KORBA
-- ===============================
DECLARE @CityId_Korba INT;
INSERT INTO Cities (Name, LocationId) VALUES ('KORBA', @LocationId_Chattisgarh);
SET @CityId_Korba = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(495684, @CityId_Korba),
(495683, @CityId_Korba),
(495682, @CityId_Korba),
(495678, @CityId_Korba),
(495677, @CityId_Korba),
(495674, @CityId_Korba),
(495455, @CityId_Korba),
(495454, @CityId_Korba),
(495452, @CityId_Korba),
(495450, @CityId_Korba),
(495449, @CityId_Korba),
(495448, @CityId_Korba),
(495447, @CityId_Korba),
(495446, @CityId_Korba),
(495445, @CityId_Korba);

-- ===============================
-- CITY : KORIYA
-- ===============================
DECLARE @CityId_Koriya INT;
INSERT INTO Cities (Name, LocationId) VALUES ('KORIYA', @LocationId_Chattisgarh);
SET @CityId_Koriya = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(497442, @CityId_Koriya),
(497339, @CityId_Koriya),
(497333, @CityId_Koriya),
(497331, @CityId_Koriya);

-- ===============================
-- CITY : MAHASAMUND
-- ===============================
DECLARE @CityId_Mahasamund INT;
INSERT INTO Cities (Name, LocationId) VALUES ('MAHASAMUND', @LocationId_Chattisgarh);
SET @CityId_Mahasamund = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(493558, @CityId_Mahasamund);

-- ===============================
-- CITY : MUNGELI
-- ===============================
DECLARE @CityId_Mungeli INT;
INSERT INTO Cities (Name, LocationId) VALUES ('MUNGELI', @LocationId_Chattisgarh);
SET @CityId_Mungeli = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(495335, @CityId_Mungeli),
(495334, @CityId_Mungeli),
(495115, @CityId_Mungeli);

-- ===============================
-- CITY : RAIGARH
-- ===============================
DECLARE @CityId_Raigarh INT;
INSERT INTO Cities (Name, LocationId) VALUES ('RAIGARH', @LocationId_Chattisgarh);
SET @CityId_Raigarh = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(496445, @CityId_Raigarh),
(496116, @CityId_Raigarh),
(496001, @CityId_Raigarh);

-- ===============================
-- CITY : RAIPUR
-- ===============================
DECLARE @CityId_Raipur INT;
INSERT INTO Cities (Name, LocationId) VALUES ('RAIPUR', @LocationId_Chattisgarh);
SET @CityId_Raipur = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(492001, @CityId_Raipur),
(492007, @CityId_Raipur),
(492010, @CityId_Raipur),
(492012, @CityId_Raipur),
(492099, @CityId_Raipur);

-- ===============================
-- CITY : RAJNANDGAON
-- ===============================
DECLARE @CityId_Rajnandgaon INT;
INSERT INTO Cities (Name, LocationId) VALUES ('RAJNANDGAON', @LocationId_Chattisgarh);
SET @CityId_Rajnandgaon = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(491661, @CityId_Rajnandgaon);

-- ===============================
-- CITY : SURAJPUR
-- ===============================
DECLARE @CityId_Surajpur INT;
INSERT INTO Cities (Name, LocationId) VALUES ('SURAJPUR', @LocationId_Chattisgarh);
SET @CityId_Surajpur = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(497235, @CityId_Surajpur),
(497231, @CityId_Surajpur),
(497229, @CityId_Surajpur),
(497226, @CityId_Surajpur);

-- ===============================
-- CITY : SURGUJA
-- ===============================
DECLARE @CityId_Surguja INT;
INSERT INTO Cities (Name, LocationId) VALUES ('SURGUJA', @LocationId_Chattisgarh);
SET @CityId_Surguja = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(497117, @CityId_Surguja),
(497116, @CityId_Surguja),
(497114, @CityId_Surguja),
(497111, @CityId_Surguja),
(497101, @CityId_Surguja),
(497001, @CityId_Surguja);

--End of Chattisgarh
-- ===============================
-- LOCATION : Daman and Diu
-- ===============================
DECLARE @LocationId_DamanAndDiu INT;
IF NOT EXISTS (SELECT 1 FROM Locations WHERE Name = 'Daman and Diu')
BEGIN
    INSERT INTO Locations (Name) VALUES ('Daman and Diu');
    SET @LocationId_DamanAndDiu = SCOPE_IDENTITY();
END
ELSE
BEGIN
    SELECT @LocationId_DamanAndDiu = Id FROM Locations WHERE Name = 'Daman and Diu';
END

-- ===============================
-- CITY : DAMAN
-- ===============================
DECLARE @CityId_Daman INT;
INSERT INTO Cities (Name, LocationId) VALUES ('DAMAN', @LocationId_DamanAndDiu);
SET @CityId_Daman = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(396210, @CityId_Daman);

-- ===============================
-- CITY : BASTI
-- ===============================
DECLARE @CityId_Basti INT;
INSERT INTO Cities (Name, LocationId) VALUES ('BASTI', @LocationId_DamanAndDiu);
SET @CityId_Basti = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(272129, @CityId_Basti);

-- End of DamanAndDiu
-- ===============================
-- LOCATION : Goa
-- ===============================
DECLARE @LocationId_Goa INT;
IF NOT EXISTS (SELECT 1 FROM Locations WHERE Name = 'Goa')
BEGIN
    INSERT INTO Locations (Name) VALUES ('Goa');
    SET @LocationId_Goa = SCOPE_IDENTITY();
END
ELSE
BEGIN
    SELECT @LocationId_Goa = Id FROM Locations WHERE Name = 'Goa';
END

-- ===============================
-- CITY : NORTH GOA
-- ===============================
DECLARE @CityId_NorthGoa INT;
INSERT INTO Cities (Name, LocationId) VALUES ('NORTH GOA', @LocationId_Goa);
SET @CityId_NorthGoa = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(403005, @CityId_NorthGoa),
(403001, @CityId_NorthGoa),
(403508, @CityId_NorthGoa),
(403512, @CityId_NorthGoa),
(403516, @CityId_NorthGoa),
(403402, @CityId_NorthGoa),
(403507, @CityId_NorthGoa),
(403506, @CityId_NorthGoa),
(403202, @CityId_NorthGoa),
(403503, @CityId_NorthGoa),
(403510, @CityId_NorthGoa),
(403517, @CityId_NorthGoa),
(403501, @CityId_NorthGoa),
(403513, @CityId_NorthGoa),
(403505, @CityId_NorthGoa);

-- ===============================
-- CITY : SOUTH GOA
-- ===============================
DECLARE @CityId_SouthGoa INT;
INSERT INTO Cities (Name, LocationId) VALUES ('SOUTH GOA', @LocationId_Goa);
SET @CityId_SouthGoa = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(403703, @CityId_SouthGoa),
(403601, @CityId_SouthGoa),
(403716, @CityId_SouthGoa),
(403726, @CityId_SouthGoa),
(403802, @CityId_SouthGoa),
(403709, @CityId_SouthGoa),
(403707, @CityId_SouthGoa),
(403706, @CityId_SouthGoa),
(403711, @CityId_SouthGoa),
(403401, @CityId_SouthGoa),
(403702, @CityId_SouthGoa);
-- End of Goa
-- ===============================
-- STATE : GUJARAT
-- ===============================

DECLARE @LocationId_Gujarat INT;
INSERT INTO Locations (Name) VALUES ('Gujarat');
SET @LocationId_Gujarat = SCOPE_IDENTITY();

DECLARE @CityId INT;

-- Ahmedabad
INSERT INTO Cities (Name, LocationId) VALUES ('AHMEDABAD', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES
(387810, @CityId),
(382835, @CityId),
(382481, @CityId),
(382480, @CityId),
(382475, @CityId),
(382470, @CityId),
(382465, @CityId),
(382463, @CityId),
(382460, @CityId),
(382455, @CityId),
(382449, @CityId),
(382445, @CityId),
(382443, @CityId),
(382440, @CityId),
(382435, @CityId),
(382433, @CityId),
(382430, @CityId),
(382427, @CityId),
(382425, @CityId),
(382424, @CityId),
(382418, @CityId),
(382415, @CityId),
(382405, @CityId),
(382350, @CityId),
(382345, @CityId),
(382340, @CityId),
(382330, @CityId),
(382315, @CityId),
(382265, @CityId),
(382260, @CityId),
(382250, @CityId),
(382240, @CityId),
(382230, @CityId),
(382225, @CityId),
(382220, @CityId),
(382213, @CityId),
(382210, @CityId),
(382150, @CityId),
(382145, @CityId),
(382140, @CityId),
(382130, @CityId),
(382120, @CityId),
(382115, @CityId),
(382110, @CityId),
(380063, @CityId),
(380061, @CityId),
(380060, @CityId),
(380059, @CityId),
(380058, @CityId),
(380055, @CityId),
(380054, @CityId),
(380052, @CityId),
(380051, @CityId),
(380050, @CityId),
(380028, @CityId),
(380027, @CityId),
(380026, @CityId),
(380025, @CityId),
(380024, @CityId),
(380023, @CityId),
(380022, @CityId),
(380021, @CityId),
(380019, @CityId),
(380018, @CityId),
(380016, @CityId),
(380015, @CityId),
(380014, @CityId),
(380012, @CityId),
(380009, @CityId),
(380008, @CityId),
(380007, @CityId),
(380006, @CityId),
(380005, @CityId),
(380004, @CityId),
(380002, @CityId),
(380001, @CityId),
(380049, @CityId),
(380053, @CityId),
(382400, @CityId),
(382468, @CityId),
(382830, @CityId),
(380020, @CityId),
(380029, @CityId),
(380030, @CityId),
(380041, @CityId),
(380045, @CityId),
(380056, @CityId),
(380057, @CityId),
(380062, @CityId),
(380123, @CityId),
(380151, @CityId),
(380152, @CityId),
(380202, @CityId),
(380210, @CityId),
(380215, @CityId),
(380316, @CityId),
(380330, @CityId),
(380017, @CityId),
(380010, @CityId),
(380011, @CityId),
(380003, @CityId);

-- Amreli
INSERT INTO Cities (Name, LocationId) VALUES ('AMRELI', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES
(365540, @CityId),
(365601, @CityId),
(364515, @CityId),
(364521, @CityId),
(364522, @CityId),
(364525, @CityId),
(364530, @CityId),
(365220, @CityId),
(365410, @CityId),
(365421, @CityId),
(365430, @CityId),
(365435, @CityId),
(365440, @CityId),
(365450, @CityId),
(365455, @CityId),
(365456, @CityId),
(365460, @CityId),
(365480, @CityId),
(365535, @CityId),
(365541, @CityId),
(365550, @CityId),
(365555, @CityId),
(365560, @CityId),
(365610, @CityId),
(365620, @CityId),
(365630, @CityId),
(365635, @CityId),
(365640, @CityId),
(365645, @CityId),
(365650, @CityId),
(365730, @CityId),
(364470, @CityId),
(365545, @CityId),
(365565, @CityId),
(396209, @CityId),
(396211, @CityId),
(396217, @CityId),
(396223, @CityId);

-- ANAND
DECLARE @CityId_Anand INT;
INSERT INTO Cities (Name, LocationId) VALUES ('ANAND', @LocationId_Gujarat);
SET @CityId_Anand = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(388001, @CityId_Anand),
(387310, @CityId_Anand),
(388110, @CityId_Anand),
(388120, @CityId_Anand),
(388121, @CityId_Anand),
(388130, @CityId_Anand),
(388150, @CityId_Anand),
(388205, @CityId_Anand),
(388210, @CityId_Anand),
(388215, @CityId_Anand),
(388220, @CityId_Anand),
(388305, @CityId_Anand),
(388306, @CityId_Anand),
(388307, @CityId_Anand),
(388310, @CityId_Anand),
(388315, @CityId_Anand),
(388320, @CityId_Anand),
(388325, @CityId_Anand),
(388330, @CityId_Anand),
(388335, @CityId_Anand),
(388340, @CityId_Anand),
(388345, @CityId_Anand),
(388350, @CityId_Anand),
(388355, @CityId_Anand),
(388360, @CityId_Anand),
(388365, @CityId_Anand),
(388370, @CityId_Anand),
(388510, @CityId_Anand),
(388520, @CityId_Anand),
(388530, @CityId_Anand),
(388540, @CityId_Anand),
(388543, @CityId_Anand),
(388545, @CityId_Anand),
(388560, @CityId_Anand),
(388275, @CityId_Anand),
(387140, @CityId_Anand),
(387250, @CityId_Anand),
(387331, @CityId_Anand),
(387385, @CityId_Anand);

DECLARE @CityId_Aravalli INT;
INSERT INTO Cities (Name, LocationId) VALUES ('ARAVALLI', @LocationId_Gujarat);
SET @CityId_Aravalli = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(383240, @CityId_Aravalli),
(383245, @CityId_Aravalli),
(383246, @CityId_Aravalli),
(383250, @CityId_Aravalli),
(383251, @CityId_Aravalli),
(383307, @CityId_Aravalli),
(383310, @CityId_Aravalli),
(383315, @CityId_Aravalli),
(383316, @CityId_Aravalli),
(383317, @CityId_Aravalli),
(383320, @CityId_Aravalli),
(383325, @CityId_Aravalli),
(383330, @CityId_Aravalli),
(383335, @CityId_Aravalli),
(383340, @CityId_Aravalli),
(383345, @CityId_Aravalli),
(383350, @CityId_Aravalli),
(383355, @CityId_Aravalli),
(383450, @CityId_Aravalli);
/* ===============================
   CITY: BANASKANTHA
   =============================== */
--DECLARE @CityId INT;
INSERT INTO Cities (Name, LocationId) VALUES ('BANASKANTHA', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(385001, @CityId),
(385010, @CityId),
(385110, @CityId),
(385120, @CityId),
(385130, @CityId),
(385135, @CityId),
(385210, @CityId),
(385310, @CityId),
(385320, @CityId),
(385330, @CityId),
(385410, @CityId),
(385421, @CityId),
(385505, @CityId),
(385506, @CityId),
(385510, @CityId),
(385515, @CityId),
(385520, @CityId),
(385530, @CityId),
(385535, @CityId),
(385545, @CityId),
(385550, @CityId),
(385555, @CityId),
(385560, @CityId),
(385565, @CityId),
(385566, @CityId),
(385570, @CityId),
(385575, @CityId),
(385309, @CityId);

/* ===============================
   CITY: BHARUCH
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BHARUCH', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(393002, @CityId),
(393001, @CityId),
(392015, @CityId),
(392001, @CityId),
(385540, @CityId),
(391810, @CityId),
(392011, @CityId),
(392012, @CityId),
(392020, @CityId),
(392025, @CityId),
(392030, @CityId),
(392035, @CityId),
(392040, @CityId),
(392110, @CityId),
(392130, @CityId),
(392135, @CityId),
(392140, @CityId),
(392150, @CityId),
(392155, @CityId),
(392160, @CityId),
(392165, @CityId),
(392170, @CityId),
(392180, @CityId),
(392210, @CityId),
(392215, @CityId),
(392220, @CityId),
(392230, @CityId),
(392240, @CityId),
(393010, @CityId),
(393017, @CityId),
(393020, @CityId),
(393030, @CityId),
(393105, @CityId),
(393110, @CityId),
(393115, @CityId),
(393120, @CityId),
(393125, @CityId),
(393130, @CityId),
(393135, @CityId),
(394115, @CityId),
(394116, @CityId),
(394810, @CityId),
(393003, @CityId),
(394444, @CityId),
(392002, @CityId),
(392161, @CityId),
(392162, @CityId);

/* ===============================
   CITY: BHAVNAGAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BHAVNAGAR', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(364001, @CityId),
(364002, @CityId),
(364003, @CityId),
(364004, @CityId),
(364005, @CityId),
(364006, @CityId),
(364050, @CityId),
(364060, @CityId),
(364070, @CityId),
(364081, @CityId),
(364110, @CityId),
(364120, @CityId),
(364130, @CityId),
(364135, @CityId),
(364140, @CityId),
(364145, @CityId),
(364150, @CityId),
(364210, @CityId),
(364230, @CityId),
(364240, @CityId),
(364250, @CityId),
(364260, @CityId),
(364265, @CityId),
(364270, @CityId),
(364275, @CityId),
(364280, @CityId),
(364290, @CityId),
(364295, @CityId),
(364310, @CityId),
(364313, @CityId),
(364320, @CityId),
(364330, @CityId),
(364505, @CityId),
(364510, @CityId),
(364710, @CityId),
(364720, @CityId),
(364730, @CityId),
(364740, @CityId),
(364750, @CityId),
(364760, @CityId),
(364765, @CityId),
(364490, @CityId),
(364055, @CityId),
(364061, @CityId);

/* ===============================
   CITY: BHUJ
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BHUJ', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(370002, @CityId),
(370429, @CityId);

/* ===============================
   CITY: BOTAB
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BOTAB', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(382450, @CityId),
(382255, @CityId),
(382245, @CityId);

/* ===============================
   CITY: CHHOTAUDEPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('CHHOTAUDEPUR', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(391170, @CityId);

/* ===============================
   CITY: DAHOD
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('DAHOD', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(389130, @CityId),
(389140, @CityId),
(389146, @CityId),
(389151, @CityId),
(389152, @CityId),
(389154, @CityId),
(389155, @CityId),
(389160, @CityId),
(389170, @CityId),
(389172, @CityId),
(389175, @CityId),
(389180, @CityId),
(389190, @CityId),
(389240, @CityId),
(389380, @CityId),
(389382, @CityId),
(389351, @CityId);

/* ===============================
   CITY: DANGS
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('DANGS', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(394710, @CityId),
(394715, @CityId),
(394716, @CityId),
(394720, @CityId),
(394730, @CityId);

/* ===============================
   CITY: DEVBHOOMI DWERKA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('DEVBHOOMI DWERKA', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(361350, @CityId),
(360510, @CityId),
(360515, @CityId),
(361010, @CityId),
(361305, @CityId),
(361306, @CityId),
(361310, @CityId),
(361315, @CityId),
(361325, @CityId),
(361345, @CityId),
(361347, @CityId);

/* ===============================
   CITY: GANDHI NAGAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('GANDHI NAGAR', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(382855, @CityId),
(382845, @CityId),
(382810, @CityId),
(382740, @CityId),
(382735, @CityId),
(382729, @CityId),
(382725, @CityId),
(382721, @CityId),
(382705, @CityId),
(382650, @CityId),
(382640, @CityId),
(382630, @CityId),
(382620, @CityId),
(382610, @CityId),
(382428, @CityId),
(382426, @CityId),
(382423, @CityId),
(382422, @CityId),
(382421, @CityId),
(382410, @CityId),
(382355, @CityId),
(382346, @CityId),
(382325, @CityId),
(382321, @CityId),
(382320, @CityId),
(382308, @CityId),
(382305, @CityId),
(382276, @CityId),
(382170, @CityId),
(382165, @CityId),
(382045, @CityId),
(382042, @CityId),
(382041, @CityId),
(382030, @CityId),
(382028, @CityId),
(382024, @CityId),
(382021, @CityId),
(382016, @CityId),
(382010, @CityId),
(382007, @CityId),
(382006, @CityId),
(382004, @CityId),
(382011, @CityId),
(382001, @CityId),
(382002, @CityId),
(382003, @CityId),
(382005, @CityId),
(382008, @CityId),
(382009, @CityId),
(382012, @CityId),
(382013, @CityId),
(382014, @CityId),
(382015, @CityId),
(382727, @CityId),
(382730, @CityId),
(382732, @CityId),
(382820, @CityId),
(382825, @CityId),
(382840, @CityId),
(382860, @CityId),
(382865, @CityId),
(383341, @CityId),
(382017, @CityId),
(382018, @CityId),
(382019, @CityId),
(382020, @CityId),
(382022, @CityId),
(382023, @CityId),
(382025, @CityId),
(382026, @CityId),
(382027, @CityId),
(382029, @CityId),
(382043, @CityId),
(382044, @CityId),
(382051, @CityId),
(382121, @CityId),
(382155, @CityId),
(382211, @CityId),
(382310, @CityId),
(382324, @CityId),
(382333, @CityId),
(382352, @CityId),
(382404, @CityId),
(382420, @CityId),
(382442, @CityId),
(382625, @CityId),
(382655, @CityId),
(382710, @CityId),
(382712, @CityId),
(382716, @CityId),
(382722, @CityId),
(382201, @CityId),
(382870, @CityId);

/* ===============================
   CITY: GIR SOMNATH
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('GIR SOMNATH', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(362150, @CityId),
(362015, @CityId),
(362135, @CityId),
(362140, @CityId),
(362265, @CityId),
(362268, @CityId),
(362269, @CityId),
(362275, @CityId),
(362510, @CityId),
(362530, @CityId),
(362550, @CityId),
(362560, @CityId),
(362565, @CityId),
(362710, @CityId),
(362715, @CityId),
(362720, @CityId);

/* ===============================
   CITY: JAMNAGAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('JAMNAGAR', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(361140, @CityId),
(361170, @CityId),
(360530, @CityId),
(361008, @CityId),
(361005, @CityId),
(361001, @CityId),
(360520, @CityId),
(360531, @CityId),
(360540, @CityId),
(361002, @CityId),
(361003, @CityId),
(361004, @CityId),
(361006, @CityId),
(361007, @CityId),
(361009, @CityId),
(361011, @CityId),
(361012, @CityId),
(361013, @CityId),
(361110, @CityId),
(361120, @CityId),
(361130, @CityId),
(361141, @CityId),
(361142, @CityId),
(361150, @CityId),
(361160, @CityId),
(361162, @CityId),
(361210, @CityId),
(361220, @CityId),
(361230, @CityId),
(361240, @CityId),
(361250, @CityId),
(361280, @CityId),
(361320, @CityId),
(361330, @CityId),
(361335, @CityId),
(363655, @CityId);

/* ===============================
   CITY: JUNAGADH
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('JUNAGADH', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(362640, @CityId),
(362630, @CityId),
(362625, @CityId),
(362610, @CityId),
(362315, @CityId),
(362310, @CityId),
(362263, @CityId),
(362260, @CityId),
(362255, @CityId),
(362250, @CityId),
(362245, @CityId),
(362240, @CityId),
(362235, @CityId),
(362229, @CityId),
(362227, @CityId),
(362226, @CityId),
(362225, @CityId),
(362222, @CityId),
(362220, @CityId),
(362215, @CityId),
(362205, @CityId),
(362130, @CityId),
(362120, @CityId),
(362110, @CityId),
(362037, @CityId),
(362030, @CityId),
(362020, @CityId),
(362011, @CityId),
(362004, @CityId),
(362002, @CityId),
(362001, @CityId),
(362266, @CityId),
(362003, @CityId),
(362267, @CityId),
(362276, @CityId),
(362725, @CityId),
(362730, @CityId),
(364485, @CityId);

/* ===============================
   CITY: KACHCHH
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KACHCHH', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(370210, @CityId),
(370205, @CityId),
(370201, @CityId),
(370165, @CityId),
(370160, @CityId),
(370155, @CityId),
(370150, @CityId),
(370145, @CityId),
(370140, @CityId),
(370135, @CityId),
(370110, @CityId),
(370001, @CityId),
(370421, @CityId),
(370203, @CityId),
(370015, @CityId),
(370020, @CityId),
(370030, @CityId),
(370040, @CityId),
(370105, @CityId),
(370115, @CityId),
(370130, @CityId),
(370240, @CityId),
(370405, @CityId),
(370410, @CityId),
(370415, @CityId),
(370425, @CityId),
(370427, @CityId),
(370430, @CityId),
(370435, @CityId),
(370445, @CityId),
(370450, @CityId),
(370455, @CityId),
(370460, @CityId),
(370465, @CityId),
(370475, @CityId),
(370485, @CityId),
(370490, @CityId),
(370510, @CityId),
(370601, @CityId),
(370605, @CityId),
(370610, @CityId),
(370615, @CityId),
(370620, @CityId),
(370625, @CityId),
(370627, @CityId),
(370630, @CityId),
(370640, @CityId),
(370641, @CityId),
(370645, @CityId),
(370650, @CityId),
(370655, @CityId),
(370660, @CityId),
(370665, @CityId),
(370670, @CityId),
(370675, @CityId),
(317110, @CityId);
/* ===============================
   STATE: GUJARAT
   =============================== */
-- Assuming @LocationId_Gujarat is already declared
-- If running standalone, uncomment the following lines:
--DECLARE @LocationId_Gujarat INT;
--INSERT INTO Locations (Name) VALUES ('Gujarat');
--SET @LocationId_Gujarat = SCOPE_IDENTITY();

/* ===============================
   CITY: KHEDA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KHEDA', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(387570, @CityId),
(387002, @CityId),
(387335, @CityId),
(387001, @CityId),
(387003, @CityId),
(387110, @CityId),
(387115, @CityId),
(387120, @CityId),
(387130, @CityId),
(387210, @CityId),
(387220, @CityId),
(387230, @CityId),
(387240, @CityId),
(387305, @CityId),
(387315, @CityId),
(387320, @CityId),
(387325, @CityId),
(387330, @CityId),
(387340, @CityId),
(387345, @CityId),
(387350, @CityId),
(387355, @CityId),
(387360, @CityId),
(387365, @CityId),
(387370, @CityId),
(387375, @CityId),
(387380, @CityId),
(387411, @CityId),
(387430, @CityId),
(387510, @CityId),
(387520, @CityId),
(387530, @CityId),
(387540, @CityId),
(387550, @CityId),
(387560, @CityId),
(387610, @CityId),
(387620, @CityId),
(387630, @CityId),
(387635, @CityId),
(387640, @CityId),
(387650, @CityId),
(387710, @CityId),
(388140, @CityId),
(388160, @CityId),
(388170, @CityId),
(388180, @CityId),
(388225, @CityId),
(388230, @CityId),
(388410, @CityId),
(388421, @CityId),
(388430, @CityId),
(388440, @CityId),
(388450, @CityId),
(388460, @CityId),
(388465, @CityId),
(388470, @CityId),
(388480, @CityId),
(388550, @CityId),
(388570, @CityId),
(388580, @CityId),
(388590, @CityId),
(388610, @CityId),
(388620, @CityId),
(388625, @CityId),
(388630, @CityId),
(388640, @CityId),
(370511, @CityId),
(371775, @CityId); -- This seems like Kutch pincodes mistakenly listed; adjust if needed

/* ===============================
   CITY: MAHESANA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('MAHESANA', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(382728, @CityId),
(382715, @CityId),
(384002, @CityId),
(384001, @CityId),
(382815, @CityId),
(384003, @CityId),
(384012, @CityId),
(384120, @CityId),
(384130, @CityId),
(384135, @CityId),
(384140, @CityId),
(384160, @CityId),
(384170, @CityId),
(384205, @CityId),
(384305, @CityId),
(384310, @CityId),
(384315, @CityId),
(384320, @CityId),
(384325, @CityId),
(384330, @CityId),
(384335, @CityId),
(384340, @CityId),
(384345, @CityId),
(384355, @CityId),
(384360, @CityId),
(384410, @CityId),
(384412, @CityId),
(384415, @CityId),
(384421, @CityId),
(384430, @CityId),
(384435, @CityId),
(384440, @CityId),
(384441, @CityId),
(384445, @CityId),
(384450, @CityId),
(384455, @CityId),
(384460, @CityId),
(384465, @CityId),
(384470, @CityId),
(384515, @CityId),
(384520, @CityId),
(384530, @CityId),
(384540, @CityId),
(384550, @CityId),
(384560, @CityId),
(384565, @CityId),
(384570, @CityId),
(382850, @CityId),
(384212, @CityId),
(384215, @CityId),
(384210, @CityId); -- Case-normalized duplicate of Mehsana

/* ===============================
   CITY: MAHISAGAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('MAHISAGAR', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(389230, @CityId),
(388235, @CityId),
(388239, @CityId),
(388245, @CityId),
(388250, @CityId),
(388255, @CityId),
(388260, @CityId),
(388265, @CityId),
(388270, @CityId),
(389220, @CityId),
(389232, @CityId),
(389235, @CityId),
(389250, @CityId),
(389260, @CityId),
(389265, @CityId);

/* ===============================
   CITY: MORBI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('MORBI', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(363621, @CityId),
(363623, @CityId),
(363630, @CityId),
(363635, @CityId),
(363641, @CityId),
(363642, @CityId),
(363643, @CityId),
(363650, @CityId),
(363660, @CityId),
(363670, @CityId);

/* ===============================
   CITY: NARMADA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('NARMADA', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(393025, @CityId),
(393040, @CityId),
(393041, @CityId),
(393050, @CityId),
(393140, @CityId),
(393145, @CityId),
(393150, @CityId),
(393151, @CityId),
(393155, @CityId),
(391111, @CityId),
(391151, @CityId),
(391431, @CityId);
/* ===============================
   STATE: GUJARAT
   =============================== */
-- Assuming @LocationId_Gujarat is already declared

/* ===============================
   CITY: NAVSARI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('NAVSARI', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(396521,@CityId),(396040,@CityId),(396060,@CityId),(396110,@CityId),(396310,@CityId),
(396321,@CityId),(396325,@CityId),(396350,@CityId),(396360,@CityId),(396370,@CityId),
(396380,@CityId),(396403,@CityId),(396406,@CityId),(396409,@CityId),(396412,@CityId),
(396415,@CityId),(396418,@CityId),(396421,@CityId),(396424,@CityId),(396427,@CityId),
(396430,@CityId),(396433,@CityId),(396436,@CityId),(396439,@CityId),(396440,@CityId),
(396445,@CityId),(396450,@CityId),(396460,@CityId),(396463,@CityId),(396466,@CityId),
(396469,@CityId),(396472,@CityId),(396475,@CityId),(396530,@CityId),(396540,@CityId),
(396560,@CityId),(396570,@CityId),(396580,@CityId),(396590,@CityId),(396425,@CityId),
(400000,@CityId),(396006,@CityId),(396031,@CityId),(396108,@CityId),(396175,@CityId),
(396201,@CityId),(396236,@CityId);

/* ===============================
   CITY: PANCH MAHALS
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('PANCH MAHALS', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(389330,@CityId),(389001,@CityId),(388710,@CityId),(388713,@CityId),(389002,@CityId),
(389110,@CityId),(389115,@CityId),(389120,@CityId),(389210,@CityId),(389310,@CityId),
(389320,@CityId),(389340,@CityId),(389341,@CityId),(389350,@CityId),(389360,@CityId),
(389365,@CityId),(389370,@CityId),(389390,@CityId),(388888,@CityId);

/* ===============================
   CITY: PATAN
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('PATAN', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(384265,@CityId),(384110,@CityId),(384151,@CityId),(384220,@CityId),(384221,@CityId),
(384225,@CityId),(384229,@CityId),(384230,@CityId),(384240,@CityId),(384241,@CityId),
(384245,@CityId),(384246,@CityId),(384255,@CityId),(384260,@CityId),(384266,@CityId),
(384272,@CityId),(384275,@CityId),(384285,@CityId),(384290,@CityId),(385340,@CityId),
(385350,@CityId),(385360,@CityId),(385002,@CityId);

/* ===============================
   CITY: PORBANDAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('PORBANDAR', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(362650,@CityId),(362620,@CityId),(362230,@CityId),(360545,@CityId),(360550,@CityId),
(360560,@CityId),(360570,@CityId),(360575,@CityId),(360576,@CityId),(360577,@CityId),
(360578,@CityId),(360579,@CityId),(360590,@CityId);

/* ===============================
   CITY: RAJKOT
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('RAJKOT', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(395016,@CityId),(360490,@CityId),(360001,@CityId),(360006,@CityId),(360004,@CityId),
(360005,@CityId),(360002,@CityId),(360003,@CityId),(360007,@CityId),(360020,@CityId),
(360021,@CityId),(360022,@CityId),(360023,@CityId),(360024,@CityId),(360025,@CityId),
(360026,@CityId),(360030,@CityId),(360035,@CityId),(360040,@CityId),(360045,@CityId),
(360050,@CityId),(360055,@CityId),(360060,@CityId),(360070,@CityId),(360110,@CityId),
(360311,@CityId),(360320,@CityId),(360325,@CityId),(360330,@CityId),(360360,@CityId),
(360370,@CityId),(360375,@CityId),(360380,@CityId),(360405,@CityId),(360410,@CityId),
(360421,@CityId),(360430,@CityId),(360440,@CityId),(360450,@CityId),(360452,@CityId),
(360460,@CityId),(360465,@CityId),(360470,@CityId),(360480,@CityId),(360485,@CityId),
(364465,@CityId),(370230,@CityId),(360081,@CityId),(361336,@CityId),(388122,@CityId),
(388131,@CityId),(388132,@CityId),(388308,@CityId),(388336,@CityId),(393004,@CityId),
(393005,@CityId),(393006,@CityId),(393016,@CityId),(394218,@CityId),(394241,@CityId),
(364071,@CityId),(388544,@CityId),(389156,@CityId),(389157,@CityId),(389158,@CityId),
(395018,@CityId),(395221,@CityId),(360008,@CityId),(360009,@CityId),(360080,@CityId),
(364241,@CityId),(364254,@CityId),(384011,@CityId),(384206,@CityId),(385007,@CityId),
(391230,@CityId),(387420,@CityId),(391347,@CityId),(391351,@CityId),(391352,@CityId),
(391353,@CityId),(391354,@CityId),(391380,@CityId),(391411,@CityId),(391447,@CityId),
(391461,@CityId),(396101,@CityId),(396107,@CityId),(396194,@CityId),(361101,@CityId);

/* ===============================
   CITY: SABARKANTHA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SABARKANTHA', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(383220,@CityId),(383001,@CityId),(383006,@CityId),(383010,@CityId),(383030,@CityId),
(383110,@CityId),(383120,@CityId),(383205,@CityId),(383210,@CityId),(383215,@CityId),
(383225,@CityId),(383230,@CityId),(383235,@CityId),(383255,@CityId),(383260,@CityId),
(383270,@CityId),(383275,@CityId),(383276,@CityId),(383305,@CityId),(383410,@CityId),
(383421,@CityId),(383422,@CityId),(383430,@CityId),(383434,@CityId),(383440,@CityId),
(383460,@CityId),(383462,@CityId),(383721,@CityId);
/* ===============================
   STATE: GUJARAT
   =============================== */
-- Assuming @LocationId_Gujarat is already declared

/* ===============================
   CITY: SURAT
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SURAT', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(396510,@CityId),(395023,@CityId),(395017,@CityId),(395013,@CityId),(395012,@CityId),
(395011,@CityId),(395010,@CityId),(395009,@CityId),(395008,@CityId),(395007,@CityId),
(395006,@CityId),(395005,@CityId),(395004,@CityId),(395003,@CityId),(395002,@CityId),
(395001,@CityId),(394620,@CityId),(394601,@CityId),(394550,@CityId),(394541,@CityId),
(394540,@CityId),(394530,@CityId),(394520,@CityId),(394518,@CityId),(394517,@CityId),
(394516,@CityId),(394515,@CityId),(394510,@CityId),(394445,@CityId),(394440,@CityId),
(394430,@CityId),(394421,@CityId),(394410,@CityId),(394405,@CityId),(394355,@CityId),
(394352,@CityId),(394350,@CityId),(394345,@CityId),(394340,@CityId),(394335,@CityId),
(394330,@CityId),(394327,@CityId),(394326,@CityId),(394325,@CityId),(394320,@CityId),
(394317,@CityId),(394315,@CityId),(394310,@CityId),(394305,@CityId),(394270,@CityId),
(394250,@CityId),(394248,@CityId),(394245,@CityId),(394240,@CityId),(394235,@CityId),
(394230,@CityId),(394221,@CityId),(394211,@CityId),(394210,@CityId),(394190,@CityId),
(394185,@CityId),(394180,@CityId),(394170,@CityId),(394163,@CityId),(394160,@CityId),
(394155,@CityId),(394150,@CityId),(394140,@CityId),(394130,@CityId),(394125,@CityId),
(394120,@CityId),(394112,@CityId),(394111,@CityId),(394110,@CityId),(394107,@CityId),
(394105,@CityId),(394101,@CityId),(394010,@CityId),(394212,@CityId),(394220,@CityId),
(395021,@CityId),(395210,@CityId),(395345,@CityId);

/* ===============================
   CITY: SURENDRA NAGAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SURENDRA NAGAR', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(382775,@CityId),(363530,@CityId),(363520,@CityId),(363510,@CityId),(363440,@CityId),
(363435,@CityId),(363430,@CityId),(363427,@CityId),(363425,@CityId),(363423,@CityId),
(363421,@CityId),(363415,@CityId),(363410,@CityId),(363351,@CityId),(363330,@CityId),
(363320,@CityId),(363310,@CityId),(363115,@CityId),(363110,@CityId),(363040,@CityId),
(363035,@CityId),(363030,@CityId),(363020,@CityId),(363002,@CityId),(363001,@CityId),
(363745,@CityId),(363750,@CityId),(363755,@CityId),(363760,@CityId),(363765,@CityId),
(363775,@CityId),(363780,@CityId),(363622,@CityId);

/* ===============================
   CITY: TAPI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('TAPI', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(394360,@CityId),(394246,@CityId),(394651,@CityId),(394365,@CityId),(394370,@CityId),
(394375,@CityId),(394380,@CityId),(394630,@CityId),(394633,@CityId),(394635,@CityId),
(394640,@CityId),(394641,@CityId),(394650,@CityId),(394652,@CityId),(394655,@CityId),
(394660,@CityId),(394670,@CityId),(394680,@CityId),(394690,@CityId);

/* ===============================
   CITY: VADODARA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('VADODARA', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(392310,@CityId),(391780,@CityId),(391776,@CityId),(391775,@CityId),(391774,@CityId),
(391770,@CityId),(391761,@CityId),(391760,@CityId),(391750,@CityId),(391745,@CityId),
(391740,@CityId),(391530,@CityId),(391520,@CityId),(391510,@CityId),(391450,@CityId),
(391445,@CityId),(391440,@CityId),(391430,@CityId),(391421,@CityId),(391410,@CityId),
(391350,@CityId),(391346,@CityId),(391345,@CityId),(391340,@CityId),(391330,@CityId),
(391320,@CityId),(391310,@CityId),(391250,@CityId),(391244,@CityId),(391243,@CityId),
(391240,@CityId),(391220,@CityId),(391210,@CityId),(391175,@CityId),(391168,@CityId),
(391165,@CityId),(391160,@CityId),(391156,@CityId),(391155,@CityId),(391152,@CityId),
(391150,@CityId),(391145,@CityId),(391140,@CityId),(391135,@CityId),(391130,@CityId),
(391125,@CityId),(391115,@CityId),(391110,@CityId),(390025,@CityId),(390024,@CityId),
(390023,@CityId),(390022,@CityId),(390021,@CityId),(390020,@CityId),(390019,@CityId),
(390018,@CityId),(390017,@CityId),(390016,@CityId),(390014,@CityId),(390013,@CityId),
(390012,@CityId),(390011,@CityId),(390010,@CityId),(390009,@CityId),(390008,@CityId),
(390007,@CityId),(390006,@CityId),(390004,@CityId),(390003,@CityId),(390002,@CityId),
(390001,@CityId),(390015,@CityId),(391120,@CityId),(391121,@CityId),(390005,@CityId),
(391460,@CityId),(391742,@CityId);

/* ===============================
   CITY: VALSAD
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('VALSAD', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(396195,@CityId),(396001,@CityId),(396191,@CityId),(396002,@CityId),(396007,@CityId),
(396020,@CityId),(396030,@CityId),(396035,@CityId),(396045,@CityId),(396050,@CityId),
(396051,@CityId),(396055,@CityId),(396065,@CityId),(396067,@CityId),(396105,@CityId),
(396115,@CityId),(396120,@CityId),(396125,@CityId),(396126,@CityId),(396130,@CityId),
(396135,@CityId),(396140,@CityId),(396145,@CityId),(396150,@CityId),(396155,@CityId),
(396165,@CityId),(396170,@CityId),(396171,@CityId),(396180,@CityId),(396185,@CityId),
(396375,@CityId),(396385,@CityId),(396495,@CityId);

/* ===============================
   CITY: VAPI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('VAPI', @LocationId_Gujarat);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(393236,@CityId);
--End of gujrat
/* ===============================
   STATE: HIMACHAL PRADESH
   =============================== */
-- Assuming @LocationId_Himachal is already declared
Go
DECLARE @LocationId_Himachal INT;
INSERT INTO Locations (Name) VALUES ('Himachal Pradesh');
SET @LocationId_Himachal = SCOPE_IDENTITY();

/* ===============================
   CITY: SOLAN
   =============================== */
DECLARE @CityId INT;
INSERT INTO Cities (Name, LocationId) VALUES ('SOLAN', @LocationId_Himachal);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(173220,@CityId),(173212,@CityId);

/* ===============================
   CITY: KULLU
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KULLU', @LocationId_Himachal);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(175125,@CityId),(175131,@CityId);

/* ===============================
   CITY: KANGRA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KANGRA', @LocationId_Himachal);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(176001,@CityId),(176031,@CityId),(176061,@CityId);

/* ===============================
   CITY: CHAMBA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('CHAMBA', @LocationId_Himachal);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(176303,@CityId),(176310,@CityId);

/* ===============================
   CITY: MANDI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('MANDI', @LocationId_Himachal);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(175003,@CityId),(175001,@CityId);

/* ===============================
   CITY: SHIMLA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SHIMLA', @LocationId_Himachal);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(171006,@CityId),(171009,@CityId),(171004,@CityId),(172001,@CityId);

/* ===============================
   CITY: UNA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('UNA', @LocationId_Himachal);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(177204,@CityId),(174303,@CityId);

/* ===============================
   CITY: BILASPUR HP
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BILASPUR HP', @LocationId_Himachal);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(174021,@CityId),(174029,@CityId);

/* ===============================
   CITY: SIRMAUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SIRMAUR', @LocationId_Himachal);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(173025,@CityId);

/* ===============================
   CITY: HAMIRPURHP
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('HAMIRPURHP', @LocationId_Himachal);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(177024,@CityId);

--End of Himachal
/* ===============================
   STATE: JAMMU AND KASHMIR
   =============================== */
-- Assuming @LocationId_JK is already declared
Go
DECLARE @LocationId_JK INT;
INSERT INTO Locations (Name) VALUES ('Jammu and Kashmir');
SET @LocationId_JK = SCOPE_IDENTITY();


/* ===============================
   CITY: ANANTHNAG
   =============================== */
   DECLARE @CityId INT;
INSERT INTO Cities (Name, LocationId) VALUES ('ANANTHNAG', @LocationId_JK);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(192101,@CityId);

/* ===============================
   CITY: BARAMULLA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BARAMULLA', @LocationId_JK);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(193201,@CityId);

/* ===============================
   CITY: JAMMU
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('JAMMU', @LocationId_JK);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(181221,@CityId),(181202,@CityId),(181152,@CityId),(180004,@CityId);

/* ===============================
   CITY: KATHUA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KATHUA', @LocationId_JK);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(184141,@CityId),(184101,@CityId);

/* ===============================
   CITY: POONCH
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('POONCH', @LocationId_JK);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(185102,@CityId),(185121,@CityId),(185211,@CityId);

/* ===============================
   CITY: RAJAURI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('RAJAURI', @LocationId_JK);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(185101,@CityId),(185131,@CityId),(185132,@CityId),(185133,@CityId),
(185135,@CityId),(185151,@CityId),(185152,@CityId),(185153,@CityId),
(185155,@CityId),(185156,@CityId),(185201,@CityId),(185202,@CityId),
(185212,@CityId),(185234,@CityId);

/* ===============================
   CITY: SAMBA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SAMBA', @LocationId_JK);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(184120,@CityId);

/* ===============================
   CITY: SRINAGAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SRINAGAR', @LocationId_JK);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(190001,@CityId);

/* ===============================
   CITY: UDHAMPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('UDHAMPUR', @LocationId_JK);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(182101,@CityId);
--End of J and k
GO
/* ===============================
   STATE: JHARKHAND
   =============================== */
-- Assuming @LocationId_JH is already declared
INSERT INTO Locations (Name) VALUES ('JHARKHAND');
DECLARE @LocationId_JH INT = SCOPE_IDENTITY();

/* ===============================
   CITY: AZADNAGAR
   =============================== */
   DECLARE @CityId INT;
INSERT INTO Cities (Name, LocationId) VALUES ('AZADNAGAR', @LocationId_JH);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(832110,@CityId);

/* ===============================
   CITY: BOKARO
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BOKARO', @LocationId_JH);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(827001,@CityId),(827003,@CityId),(827004,@CityId),(827006,@CityId),
(827009,@CityId),(827010,@CityId),(827011,@CityId),(827012,@CityId),
(827013,@CityId),(827014,@CityId),(827302,@CityId),(828125,@CityId),
(828134,@CityId),(828302,@CityId),(828303,@CityId),(828307,@CityId),
(828403,@CityId),(828404,@CityId),(829104,@CityId),(829107,@CityId),
(829111,@CityId),(829113,@CityId),(829116,@CityId),(829129,@CityId),
(829149,@CityId),(829301,@CityId);

/* ===============================
   CITY: DEOGHAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('DEOGHAR', @LocationId_JH);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(814112,@CityId),(815353,@CityId),(814113,@CityId),(814114,@CityId),
(814115,@CityId),(814116,@CityId),(814120,@CityId),(814142,@CityId),
(814143,@CityId),(814146,@CityId),(814149,@CityId),(814150,@CityId),
(814152,@CityId),(814157,@CityId),(815357,@CityId);

/* ===============================
   CITY: DHANBAD
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('DHANBAD', @LocationId_JH);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(826001,@CityId),(826003,@CityId),(826004,@CityId),(826005,@CityId),
(828101,@CityId),(828103,@CityId),(828104,@CityId),(828105,@CityId),
(828106,@CityId),(828107,@CityId),(828108,@CityId),(828109,@CityId),
(828110,@CityId),(828112,@CityId),(828113,@CityId),(828114,@CityId),
(828115,@CityId),(828117,@CityId),(828119,@CityId),(828120,@CityId),
(828121,@CityId),(828123,@CityId),(828124,@CityId),(828126,@CityId),
(828127,@CityId),(828128,@CityId),(828129,@CityId),(828130,@CityId),
(828131,@CityId),(828132,@CityId),(828133,@CityId),(828135,@CityId),
(828201,@CityId),(828202,@CityId),(828203,@CityId),(828204,@CityId),
(828205,@CityId),(828206,@CityId),(828207,@CityId),(828301,@CityId),
(828304,@CityId),(828305,@CityId),(828306,@CityId),(828308,@CityId),
(828309,@CityId),(828401,@CityId),(828402,@CityId);

/* ===============================
   CITY: DUMKA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('DUMKA', @LocationId_JH);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(814101,@CityId),(814102,@CityId),(814103,@CityId),(814110,@CityId),
(814118,@CityId),(814119,@CityId),(814122,@CityId),(814144,@CityId),
(814148,@CityId),(814151,@CityId),(814158,@CityId),(814167,@CityId),
(816103,@CityId),(816118,@CityId),(816129,@CityId);

/* ===============================
   CITY: EAST SINGHBHUM
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('EAST SINGHBHUM', @LocationId_JH);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(831002,@CityId),(831003,@CityId),(831005,@CityId),(831006,@CityId),
(831009,@CityId),(831011,@CityId),(831012,@CityId),(831015,@CityId),
(831016,@CityId),(831017,@CityId),(831019,@CityId),(831020,@CityId),
(832101,@CityId),(832102,@CityId),(832103,@CityId),(832104,@CityId),
(832105,@CityId),(832106,@CityId),(832107,@CityId),(832108,@CityId),
(832109,@CityId),(832111,@CityId),(832112,@CityId),(832301,@CityId),
(832302,@CityId),(832303,@CityId),(832304,@CityId),(832403,@CityId);

/* ===============================
   CITY: GARHWA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('GARHWA', @LocationId_JH);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(822112,@CityId),(822114,@CityId),(822121,@CityId),(822124,@CityId),
(822125,@CityId),(822128,@CityId),(822129,@CityId),(822133,@CityId),
(822134,@CityId);

/* ===============================
   CITY: GIRIDH
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('GIRIDH', @LocationId_JH);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(815301,@CityId),(815302,@CityId),(815314,@CityId),(815315,@CityId),
(815316,@CityId),(815317,@CityId),(815318,@CityId),(825106,@CityId),
(825108,@CityId),(825167,@CityId),(825320,@CityId),(825322,@CityId),
(825324,@CityId),(825329,@CityId),(825412,@CityId);

/* ===============================
   CITY: GODDA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('GODDA', @LocationId_JH);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(814133,@CityId),(814145,@CityId),(814147,@CityId),(814153,@CityId),
(814154,@CityId),(814155,@CityId),(814156,@CityId),(814160,@CityId),
(814165,@CityId);

/* ===============================
   CITY: GUMLA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('GUMLA', @LocationId_JH);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(835231,@CityId),(835208,@CityId),(835229,@CityId),(835206,@CityId),
(835207,@CityId),(835203,@CityId),(835220,@CityId),(835230,@CityId),
(835232,@CityId),(835233,@CityId);

/* ===============================
   CITY: HAZARIBAG
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('HAZARIBAG', @LocationId_JH);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(825301,@CityId),(825302,@CityId),(825303,@CityId),(825311,@CityId),
(825312,@CityId),(825313,@CityId),(825314,@CityId),(825317,@CityId),
(825319,@CityId),(825325,@CityId),(825336,@CityId),(825402,@CityId),
(825405,@CityId),(825406,@CityId),(825411,@CityId);

/* ===============================
   CITY: JAMSHEDPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('JAMSHEDPUR', @LocationId_JH);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(831010,@CityId),(831018,@CityId);

/* ===============================
   CITY: JAMTARA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('JAMTARA', @LocationId_JH);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(815351,@CityId),(814166,@CityId),(815352,@CityId),(815354,@CityId),
(815355,@CityId),(815359,@CityId);

/* ===============================
   CITY: KHUNTI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KHUNTI', @LocationId_JH);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(835210,@CityId),(835216,@CityId),(835234,@CityId),(835209,@CityId);

/* ===============================
   CITY: KODERMA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KODERMA', @LocationId_JH);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(825409,@CityId),(825109,@CityId),(825132,@CityId),(825318,@CityId),
(825407,@CityId),(825410,@CityId),(825413,@CityId),(825418,@CityId),
(825421,@CityId);

/* ===============================
   CITY: LATEHAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('LATEHAR', @LocationId_JH);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(835218,@CityId),(822111,@CityId),(822119,@CityId),(829202,@CityId),
(829203,@CityId),(829204,@CityId),(829206,@CityId),(829207,@CityId),
(829208,@CityId);

/* ===============================
   CITY: LOHARDAGA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('LOHARDAGA', @LocationId_JH);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(835302,@CityId),(835213,@CityId);

/* ===============================
   CITY: PAKUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('PAKUR', @LocationId_JH);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(816107,@CityId),(814111,@CityId),(816104,@CityId),(816106,@CityId),
(816117,@CityId),(822116,@CityId);

/* ===============================
   CITY: PALAMAU
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('PALAMAU', @LocationId_JH);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(822101,@CityId),(822102,@CityId),(822110,@CityId),(822113,@CityId),
(822115,@CityId),(822117,@CityId),(822118,@CityId),(822120,@CityId),
(822122,@CityId),(822123,@CityId),(822126,@CityId),(822131,@CityId),
(822132,@CityId);

/* ===============================
   CITY: RAMGARH
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('RAMGARH', @LocationId_JH);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(829118,@CityId),(825101,@CityId),(825316,@CityId),(825330,@CityId),
(829102,@CityId),(829103,@CityId),(829105,@CityId),(829106,@CityId),
(829108,@CityId),(829109,@CityId),(829110,@CityId),(829117,@CityId),
(829119,@CityId),(829125,@CityId),(829126,@CityId),(829130,@CityId),
(829131,@CityId),(829133,@CityId),(829134,@CityId),(829135,@CityId),
(829143,@CityId),(829150,@CityId),(829122,@CityId);

/* ===============================
   CITY: RANCHI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('RANCHI', @LocationId_JH);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(835204,@CityId),(834008,@CityId),(834002,@CityId),(835102,@CityId),
(835325,@CityId),(835227,@CityId),(835103,@CityId),(834004,@CityId),
(835301,@CityId),(835205,@CityId),(834010,@CityId),(835219,@CityId),
(834009,@CityId),(835303,@CityId),(835214,@CityId),(834006,@CityId),
(835217,@CityId),(834001,@CityId),(835221,@CityId),(835202,@CityId),
(835101,@CityId),(834003,@CityId),(829205,@CityId),(829209,@CityId),
(829210,@CityId),(834005,@CityId),(834011,@CityId),(835215,@CityId),
(835222,@CityId),(835225,@CityId),(834007,@CityId),(834012,@CityId),
(834013,@CityId);

/* ===============================
   CITY: SAHIBGANJ
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SAHIBGANJ', @LocationId_JH);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(816108,@CityId),(816109,@CityId),(813208,@CityId),(816101,@CityId),
(816102,@CityId),(816105,@CityId),(816110,@CityId),(816115,@CityId),
(816116,@CityId),(816120,@CityId);

/* ===============================
   CITY: SERAIKELAKHARSAWAN
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SERAIKELAKHARSAWAN', @LocationId_JH);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(831013,@CityId),(831014,@CityId),(832108,@CityId),(832109,@CityId),
(832401,@CityId),(832402,@CityId),(832404,@CityId),(833216,@CityId),
(833219,@CityId),(833220,@CityId);

/* ===============================
   CITY: SIMDEGA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SIMDEGA', @LocationId_JH);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(835223,@CityId),(835235,@CityId),(835212,@CityId),(835201,@CityId),
(835211,@CityId),(835226,@CityId),(835228,@CityId),(835324,@CityId);

/* ===============================
   CITY: SISAI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SISAI', @LocationId_JH);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(835324,@CityId);

/* ===============================
   CITY: WEST SINGHBHUM
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('WEST SINGHBHUM', @LocationId_JH);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(833201,@CityId),(833102,@CityId),(833103,@CityId),(833104,@CityId),
(833105,@CityId),(833106,@CityId),(833202,@CityId),(833203,@CityId),
(833204,@CityId),(833212,@CityId),(833213,@CityId),(833214,@CityId),
(833215,@CityId),(833217,@CityId),(833218,@CityId),(833221,@CityId),
(833222,@CityId),(833223,@CityId);

--END of JH
/* ===============================
   STATE: KARNATAKA
   =============================== */
-- Assuming @LocationId_KA is already declared
GO
INSERT INTO Locations (Name) VALUES ('KARNATAKA');
DECLARE @LocationId_KA INT = SCOPE_IDENTITY();

/* ===============================
   CITY: BAGALKOT
   =============================== */
   DECLARE @CityId INT;
INSERT INTO Cities (Name, LocationId) VALUES ('BAGALKOT', @LocationId_KA);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(587101,@CityId),(587103,@CityId);

/* ===============================
   CITY: BANGALORE / BENGALURU
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BENGALURU', @LocationId_KA);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(560001,@CityId),(560002,@CityId),(560003,@CityId),(560005,@CityId),
(560006,@CityId),(560007,@CityId),(560008,@CityId),(560009,@CityId),
(560010,@CityId),(560012,@CityId),(560013,@CityId),(560014,@CityId),
(560015,@CityId),(560016,@CityId),(560017,@CityId),(560018,@CityId),
(560020,@CityId),(560021,@CityId),(560022,@CityId),(560023,@CityId),
(560024,@CityId),(560025,@CityId),(560026,@CityId),(560032,@CityId),
(560033,@CityId),(560034,@CityId),(560035,@CityId),(560036,@CityId),
(560037,@CityId),(560038,@CityId),(560040,@CityId),(560042,@CityId),
(560043,@CityId),(560045,@CityId),(560046,@CityId),(560047,@CityId),
(560048,@CityId),(560049,@CityId),(560051,@CityId),(560053,@CityId),
(560054,@CityId),(560055,@CityId),(560056,@CityId),(560057,@CityId),
(560058,@CityId),(560059,@CityId),(560063,@CityId),(560064,@CityId),
(560065,@CityId),(560066,@CityId),(560067,@CityId),(560068,@CityId),
(560071,@CityId),(560075,@CityId),(560077,@CityId),(560079,@CityId),
(560080,@CityId),(560084,@CityId),(560085,@CityId),(560086,@CityId),
(560087,@CityId),(560092,@CityId),(560093,@CityId),(560094,@CityId),
(560095,@CityId),(560096,@CityId),(560097,@CityId),(560098,@CityId),
(560100,@CityId),(560103,@CityId),(560104,@CityId),
(562130,@CityId),(562149,@CityId),(562157,@CityId);

/* ===============================
   CITY: BENGALURU RURAL
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BENGALURU RURAL', @LocationId_KA);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(560073,@CityId),(560088,@CityId),(560090,@CityId),(560091,@CityId),
(562110,@CityId),(562111,@CityId);

/* ===============================
   CITY: BENGALURU URBAN
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BENGALURU URBAN', @LocationId_KA);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(560029,@CityId),(560061,@CityId),(560062,@CityId),(560108,@CityId),
(560110,@CityId),(560111,@CityId),(577006,@CityId);

/* ===============================
   CITY: BELAGAVI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BELAGAVI', @LocationId_KA);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(590008,@CityId),(590011,@CityId),(591211,@CityId),(591307,@CityId),
(591313,@CityId);

/* ===============================
   CITY: BELLARY
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BELLARY', @LocationId_KA);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(583101,@CityId),(583103,@CityId);

/* ===============================
   CITY: BIDAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BIDAR', @LocationId_KA);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(585401,@CityId);

/* ===============================
   CITY: BIJAPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BIJAPUR', @LocationId_KA);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(586101,@CityId);

/* ===============================
   CITY: CHICKMAGALUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('CHICKMAGALUR', @LocationId_KA);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(577102,@CityId);

/* ===============================
   CITY: DAKSHINA KANNADA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('DAKSHINA KANNADA', @LocationId_KA);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(574148,@CityId),(575002,@CityId),(575004,@CityId),(575006,@CityId);

/* ===============================
   CITY: DAVANGERE
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('DAVANGERE', @LocationId_KA);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(577004,@CityId);

/* ===============================
   CITY: DHARWAD
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('DHARWAD', @LocationId_KA);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(580001,@CityId),(580008,@CityId);

/* ===============================
   CITY: HASSAN
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('HASSAN', @LocationId_KA);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(573115,@CityId),(573201,@CityId);

/* ===============================
   CITY: KALABURAGI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KALABURAGI', @LocationId_KA);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(585101,@CityId),(585102,@CityId),(585104,@CityId),(585105,@CityId),(585222,@CityId);

/* ===============================
   CITY: KODAGU
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KODAGU', @LocationId_KA);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(563101,@CityId);

/* ===============================
   CITY: KOLAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KOLAR', @LocationId_KA);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(563130,@CityId);

/* ===============================
   CITY: KOPPAL
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KOPPAL', @LocationId_KA);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(583235,@CityId);

/* ===============================
   CITY: MANDYA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('MANDYA', @LocationId_KA);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(571401,@CityId),(571428,@CityId);

/* ===============================
   CITY: MYSURU
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('MYSURU', @LocationId_KA);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(570004,@CityId),(570023,@CityId);

/* ===============================
   CITY: RAICHUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('RAICHUR', @LocationId_KA);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(584122,@CityId),(584128,@CityId),(584143,@CityId);

/* ===============================
   CITY: RAMANAGAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('RAMANAGAR', @LocationId_KA);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(562160,@CityId);

/* ===============================
   CITY: SHIVAMOGGA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SHIVAMOGGA', @LocationId_KA);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(577201,@CityId),(577202,@CityId),(577204,@CityId),(577428,@CityId),(577230,@CityId);

/* ===============================
   CITY: TUMAKURU
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('TUMAKURU', @LocationId_KA);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(572101,@CityId),(572102,@CityId),(572103,@CityId),(572129,@CityId),(572137,@CityId);

/* ===============================
   CITY: UDUPI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('UDUPI', @LocationId_KA);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(576228,@CityId);

/* ===============================
   CITY: UTTARA KANNADA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('UTTARA KANNADA', @LocationId_KA);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(581320,@CityId),(581350,@CityId);
--End of KA
GO
INSERT INTO Locations (Name) VALUES ('Kerala');
DECLARE @LocationId_KL INT = SCOPE_IDENTITY();


/* ===============================
   CITY: ALAPPUZHA
   =============================== */
   DECLARE @CityId INT;
INSERT INTO Cities (Name, LocationId) VALUES ('ALAPPUZHA', @LocationId_KL);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(690572,@CityId),(690571,@CityId),(690559,@CityId),(690558,@CityId),
(690548,@CityId),(690537,@CityId),(690535,@CityId),(690534,@CityId),
(690533,@CityId),(690532,@CityId),(690531,@CityId),(690530,@CityId),
(690529,@CityId),(690527,@CityId),(690517,@CityId),(690516,@CityId),
(690515,@CityId),(690514,@CityId),(690513,@CityId),(690512,@CityId),
(690511,@CityId),(690510,@CityId),(690509,@CityId),(690508,@CityId),
(690507,@CityId),(690506,@CityId),(690505,@CityId),(690504,@CityId),
(690503,@CityId),(690502,@CityId),(690501,@CityId),(690110,@CityId),
(690108,@CityId),(690107,@CityId),(690106,@CityId),(690105,@CityId),
(690104,@CityId),(690103,@CityId),(690102,@CityId),(690101,@CityId),
(689627,@CityId),(689624,@CityId),(689623,@CityId),(689622,@CityId),
(689595,@CityId),(689574,@CityId),(689573,@CityId),(689572,@CityId),
(689571,@CityId),(689521,@CityId),(689520,@CityId),(689512,@CityId),
(689511,@CityId),(689510,@CityId),(689509,@CityId),(689508,@CityId),
(689506,@CityId),(689505,@CityId),(689504,@CityId),(689126,@CityId),
(689124,@CityId),(689123,@CityId),(689122,@CityId),(689121,@CityId),
(689109,@CityId),(688582,@CityId),(688570,@CityId),(688562,@CityId),
(688561,@CityId),(688555,@CityId),(688541,@CityId),(688540,@CityId),
(688539,@CityId),(688538,@CityId),(688537,@CityId),(688536,@CityId),
(688535,@CityId),(688534,@CityId),(688533,@CityId),(688532,@CityId),
(688531,@CityId),(688530,@CityId),(688529,@CityId),(688528,@CityId),
(688527,@CityId),(688526,@CityId),(688525,@CityId),(688524,@CityId),
(688523,@CityId),(688522,@CityId),(688521,@CityId),(688506,@CityId),
(688505,@CityId),(688504,@CityId),(688503,@CityId),(688502,@CityId),
(688501,@CityId),(688014,@CityId),(688013,@CityId),(688012,@CityId),
(688011,@CityId),(688009,@CityId),(688008,@CityId),(688007,@CityId),
(688006,@CityId),(688005,@CityId),(688004,@CityId),(688003,@CityId),
(688002,@CityId),(688001,@CityId),(686534,@CityId),(688542,@CityId);
/* ===============================
   CITY: ERNAKULAM
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('ERNAKULAM', @LocationId_KL);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(686693,@CityId),(686692,@CityId),(686691,@CityId),(686681,@CityId),
(686673,@CityId),(686672,@CityId),(686671,@CityId),(686670,@CityId),
(686669,@CityId),(686668,@CityId),(686667,@CityId),(686666,@CityId),
(686665,@CityId),(686664,@CityId),(686663,@CityId),(686662,@CityId),
(686661,@CityId),(683594,@CityId),(683589,@CityId),(683587,@CityId),
(683585,@CityId),(683581,@CityId),(683580,@CityId),(683579,@CityId),
(683578,@CityId),(683577,@CityId),(683576,@CityId),(683575,@CityId),
(683574,@CityId),(683573,@CityId),(683572,@CityId),(683571,@CityId),
(683565,@CityId),(683563,@CityId),(683562,@CityId),(683561,@CityId),
(683556,@CityId),(683550,@CityId),(683549,@CityId),(683548,@CityId),
(683547,@CityId),(683546,@CityId),(683545,@CityId),(683544,@CityId),
(683543,@CityId),(683542,@CityId),(683541,@CityId),(683522,@CityId),
(683521,@CityId),(683520,@CityId),(683519,@CityId),(683518,@CityId),
(683517,@CityId),(683516,@CityId),(683515,@CityId),(683514,@CityId),
(683513,@CityId),(683512,@CityId),(683511,@CityId),(683503,@CityId),
(683502,@CityId),(683501,@CityId),(683112,@CityId),(683111,@CityId),
(683110,@CityId),(683108,@CityId),(683106,@CityId),(683105,@CityId),
(683104,@CityId),(683102,@CityId),(683101,@CityId),(682511,@CityId),
(682509,@CityId),(682508,@CityId),(682507,@CityId),(682506,@CityId),
(682505,@CityId),(682504,@CityId),(682503,@CityId),(682502,@CityId),
(682501,@CityId),(682317,@CityId),(682316,@CityId),(682315,@CityId),
(682314,@CityId),(682313,@CityId),(682312,@CityId),(682311,@CityId),
(682310,@CityId),(682309,@CityId),(682308,@CityId),(682307,@CityId),
(682306,@CityId),(682305,@CityId),(682304,@CityId),(682303,@CityId),
(682302,@CityId),(682301,@CityId),(682051,@CityId),(682050,@CityId),
(682042,@CityId),(682041,@CityId),(682040,@CityId),(682039,@CityId),
(682038,@CityId),(682037,@CityId),(682036,@CityId),(682035,@CityId),
(682034,@CityId),(682033,@CityId),(682032,@CityId),(682031,@CityId),
(682030,@CityId),(682029,@CityId),(682028,@CityId),(682027,@CityId),
(682026,@CityId),(682025,@CityId),(682024,@CityId),(682023,@CityId),
(682022,@CityId),(682021,@CityId),(682020,@CityId),(682019,@CityId),
(682018,@CityId),(682017,@CityId),(682016,@CityId),(682015,@CityId),
(682013,@CityId),(682012,@CityId),(682011,@CityId),(682010,@CityId),
(682009,@CityId),(682008,@CityId),(682007,@CityId),(682006,@CityId),
(682005,@CityId),(682004,@CityId),(682003,@CityId),(682002,@CityId),
(682001,@CityId);
/* ===============================
   CITY: IDUKKI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('IDUKKI', @LocationId_KL);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(685515,@CityId),(685608,@CityId),(685587,@CityId),(685552,@CityId),
(685583,@CityId),(685553,@CityId),(685582,@CityId),(685565,@CityId),
(685606,@CityId);
/* ===============================
   CITY: KANNUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KANNUR', @LocationId_KL);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(670581,@CityId),(670622,@CityId),(670103,@CityId),(670502,@CityId),
(670511,@CityId),(670106,@CityId),(670303,@CityId),(670142,@CityId),
(670650,@CityId),(670663,@CityId),(670701,@CityId),(670107,@CityId),
(670582,@CityId),(670692,@CityId),(670331,@CityId),(670672,@CityId),
(670101,@CityId),(670593,@CityId),(670704,@CityId),(670604,@CityId),
(670649,@CityId),(670571,@CityId),(670602,@CityId),(670611,@CityId),
(670741,@CityId),(670632,@CityId),(670694,@CityId),(670592,@CityId),
(670633,@CityId),(670601,@CityId),(670674,@CityId),(670001,@CityId);
/* ===============================
   CITY: KASARGOD
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KASARGOD', @LocationId_KL);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(671121,@CityId),(671123,@CityId),(671124,@CityId),(671310,@CityId),
(671311,@CityId),(671313,@CityId),(671314,@CityId),(671316,@CityId),
(671321,@CityId),(671351,@CityId),(671531,@CityId),(671533,@CityId),
(671542,@CityId);
/* ===============================
   CITY: KOCHI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('Kochi', @LocationId_KL);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(683564,@CityId);
/* ===============================
   CITY: KOLLAM
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KOLLAM', @LocationId_KL);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(691001,@CityId),(691002,@CityId),(691003,@CityId),(691004,@CityId),
(691005,@CityId),(691006,@CityId),(691007,@CityId),(691008,@CityId),
(691009,@CityId),(691010,@CityId),(691011,@CityId),(691012,@CityId),
(691013,@CityId),(691014,@CityId),(691015,@CityId),(691016,@CityId),
(691019,@CityId),(691020,@CityId),(691021,@CityId),(691302,@CityId),
(691301,@CityId),(691303,@CityId),(691304,@CityId),(691305,@CityId),
(691306,@CityId),(691307,@CityId),(691308,@CityId),(691309,@CityId),
(691310,@CityId),(691311,@CityId),(691312,@CityId),(691319,@CityId),
(691322,@CityId),(691331,@CityId),(691332,@CityId),(691333,@CityId),
(691334,@CityId),(690523,@CityId),(690524,@CityId),(690525,@CityId),
(690526,@CityId),(690528,@CityId),(690536,@CityId),(690538,@CityId),
(690539,@CityId),(690540,@CityId),(690542,@CityId),(690544,@CityId),
(690546,@CityId),(690547,@CityId),(690561,@CityId),(690573,@CityId),
(690574,@CityId),(689695,@CityId),(689696,@CityId),(691552,@CityId),
(691560,@CityId),(691566,@CityId),(691571,@CityId),(691572,@CityId),
(691573,@CityId),(691574,@CityId),(691576,@CityId),(691577,@CityId),
(691578,@CityId),(691579,@CityId),(691581,@CityId),(691582,@CityId),
(691583,@CityId),(691584,@CityId),(691585,@CityId),(691589,@CityId),
(691590,@CityId),(691601,@CityId),(691602,@CityId);
/* ===============================
   CITY: KOTTAYAM
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KOTTAYAM', @LocationId_KL);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(686006,@CityId),(686008,@CityId),(686016,@CityId),(686021,@CityId),
(686102,@CityId),(686105,@CityId),(686121,@CityId),(686122,@CityId),
(686143,@CityId),(686144,@CityId),(686509,@CityId),(686512,@CityId),
(686513,@CityId),(686516,@CityId),(686518,@CityId),(686535,@CityId),
(686536,@CityId),(686539,@CityId),(686544,@CityId),(686548,@CityId),
(686561,@CityId),(686572,@CityId),(686573,@CityId),(686575,@CityId),
(686576,@CityId),(686579,@CityId),(686581,@CityId),(686605,@CityId),
(686607,@CityId),(686610,@CityId),(686611,@CityId),(686613,@CityId),
(686631,@CityId),(686633,@CityId),(686637,@CityId),(686562,@CityId),(686503,@CityId);
/* ===============================
   CITY: KOZHIKODE
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KOZHIKODE', @LocationId_KL);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(673001,@CityId),(673002,@CityId),(673003,@CityId),(673004,@CityId),
(673005,@CityId),(673006,@CityId),(673007,@CityId),(673008,@CityId),
(673009,@CityId),(673010,@CityId),(673011,@CityId),(673012,@CityId),
(673014,@CityId),(673015,@CityId),(673016,@CityId),(673017,@CityId),
(673018,@CityId),(673019,@CityId),(673020,@CityId),(673021,@CityId),
(673027,@CityId),(673028,@CityId),(673029,@CityId),(673032,@CityId),
(673051,@CityId),(673101,@CityId),(673102,@CityId),(673103,@CityId),
(673104,@CityId),(673105,@CityId),(673106,@CityId),(673301,@CityId),
(673302,@CityId),(673303,@CityId),(673304,@CityId),(673305,@CityId),
(673306,@CityId),(673307,@CityId),(673308,@CityId),(673309,@CityId),
(673310,@CityId),(673328,@CityId),(673323,@CityId),(673317,@CityId),
(673315,@CityId),(673504,@CityId),(673505,@CityId),(673506,@CityId),
(673507,@CityId),(673508,@CityId),(673509,@CityId),(673513,@CityId),
(673517,@CityId),(673521,@CityId),(673522,@CityId),(673523,@CityId),
(673524,@CityId),(673525,@CityId),(673526,@CityId),(673527,@CityId),
(673528,@CityId),(673529,@CityId),(673541,@CityId),(673542,@CityId),
(673570,@CityId),(673571,@CityId),(673572,@CityId),(673573,@CityId),
(673574,@CityId),(673580,@CityId),(673582,@CityId),(673585,@CityId),
(673586,@CityId),(673601,@CityId),(673602,@CityId),(673603,@CityId),
(673604,@CityId),(673611,@CityId),(673612,@CityId),(673613,@CityId),
(673614,@CityId),(673615,@CityId),(673616,@CityId),(673620,@CityId),
(673631,@CityId),(673655,@CityId),(673661,@CityId);
/* ===============================
   CITY: MAHE
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('MAHE', @LocationId_KL);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(673310,@CityId);
/* ===============================
   CITY: MALAPPURAM
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('MALAPPURAM', @LocationId_KL);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(676301,@CityId),(676302,@CityId),(676303,@CityId),(676304,@CityId),
(676305,@CityId),(676306,@CityId),(676307,@CityId),(676309,@CityId),
(676311,@CityId),(676312,@CityId),(676317,@CityId),(676319,@CityId),
(676320,@CityId),(676501,@CityId),(676502,@CityId),(676503,@CityId),
(676504,@CityId),(676505,@CityId),(676506,@CityId),(676507,@CityId),
(676508,@CityId),(676509,@CityId),(676510,@CityId),(676517,@CityId),
(676519,@CityId),(676521,@CityId),(676522,@CityId),(676523,@CityId),
(676525,@CityId),(676528,@CityId),(676541,@CityId),(676542,@CityId),
(676551,@CityId),(676552,@CityId),(676553,@CityId),(676561,@CityId),
(676562,@CityId),(673314,@CityId),(673632,@CityId),(673633,@CityId),
(673634,@CityId),(673635,@CityId),(673636,@CityId),(673637,@CityId),
(673638,@CityId),(673639,@CityId),(673640,@CityId),(673641,@CityId),
(673642,@CityId),(673645,@CityId),(673647,@CityId),(679338,@CityId),
(679339,@CityId),(679340,@CityId),(679341,@CityId),(679357,@CityId),
(679571,@CityId),(679572,@CityId),(679573,@CityId),(679574,@CityId),
(679575,@CityId),(679576,@CityId),(679577,@CityId),(679578,@CityId),
(679579,@CityId),(679580,@CityId),(679581,@CityId),(679582,@CityId),
(679583,@CityId),(679584,@CityId),(679585,@CityId),(679586,@CityId),
(679587,@CityId),(679591,@CityId);
/* ===============================
   CITY: MUVATTUPUZHA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('MUVATTUPUZHA', @LocationId_KL);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(686689,@CityId);
/* ===============================
   CITY: PALAKKAD
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('PALAKKAD', @LocationId_KL);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(678001,@CityId),(678004,@CityId),(678005,@CityId),(678007,@CityId),
(678008,@CityId),(678009,@CityId),(678012,@CityId),(678014,@CityId),
(678501,@CityId),(678504,@CityId),(678505,@CityId),(678506,@CityId),
(678508,@CityId),(678510,@CityId),(678531,@CityId),(678543,@CityId),
(678544,@CityId),(678546,@CityId),(678582,@CityId),(678583,@CityId),
(678595,@CityId),(678596,@CityId),(678597,@CityId),(678601,@CityId),
(678611,@CityId),(678612,@CityId),(678613,@CityId),(678621,@CityId),
(678624,@CityId),(678631,@CityId),(678632,@CityId),(678633,@CityId),
(678682,@CityId),(678683,@CityId),(678684,@CityId),(678687,@CityId),
(679102,@CityId),(679121,@CityId),(679122,@CityId),(679301,@CityId),
(679302,@CityId),(679307,@CityId),(679308,@CityId),(679511,@CityId),
(679513,@CityId),(679534,@CityId),(679551,@CityId);



-- PATHANAMTHITTA
INSERT INTO Cities (Name, LocationId) VALUES ('PATHANAMTHITTA', @LocationId_KL);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(691553, @CityId),
(689590, @CityId),
(689533, @CityId),
(689646, @CityId),
(689102, @CityId),
(689584, @CityId),
(689653, @CityId),
(689674, @CityId),
(689586, @CityId),
(689691, @CityId),
(691523, @CityId),
(689501, @CityId),
(689645, @CityId),
(689103, @CityId),
(689111, @CityId),
(691525, @CityId),
(689110, @CityId),
(689581, @CityId),
(689548, @CityId),
(691554, @CityId),
(689582, @CityId),
(691556, @CityId),
(689672, @CityId),
(689101, @CityId),
(689676, @CityId),
(689503, @CityId),
(691551, @CityId),
(689106, @CityId),
(689621, @CityId);

-- THIRUVANANTHAPURAM
INSERT INTO Cities (Name, LocationId) VALUES ('THIRUVANANTHAPURAM', @LocationId_KL);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(695615, @CityId),
(695614, @CityId),
(695612, @CityId),
(695611, @CityId),
(695610, @CityId),
(695609, @CityId),
(695608, @CityId),
(695607, @CityId),
(695606, @CityId),
(695605, @CityId),
(695604, @CityId),
(695603, @CityId),
(695602, @CityId),
(695601, @CityId),
(695589, @CityId),
(695588, @CityId),
(695587, @CityId),
(695586, @CityId),
(695585, @CityId),
(695584, @CityId),
(695583, @CityId),
(695582, @CityId),
(695581, @CityId),
(695575, @CityId),
(695574, @CityId),
(695573, @CityId),
(695572, @CityId),
(695571, @CityId),
(695570, @CityId),
(695568, @CityId),
(695564, @CityId),
(695563, @CityId),
(695562, @CityId),
(695561, @CityId),
(695551, @CityId),
(695547, @CityId),
(695543, @CityId),
(695542, @CityId),
(695541, @CityId),
(695528, @CityId),
(695527, @CityId),
(695526, @CityId),
(695525, @CityId),
(695524, @CityId),
(695523, @CityId),
(695522, @CityId),
(695521, @CityId),
(695513, @CityId),
(695512, @CityId),
(695508, @CityId),
(695507, @CityId),
(695506, @CityId),
(695505, @CityId),
(695504, @CityId),
(695503, @CityId),
(695502, @CityId),
(695501, @CityId),
(695318, @CityId),
(695317, @CityId),
(695316, @CityId),
(695313, @CityId),
(695312, @CityId),
(695311, @CityId),
(695310, @CityId),
(695309, @CityId),
(695308, @CityId),
(695307, @CityId),
(695306, @CityId),
(695305, @CityId),
(695304, @CityId),
(695303, @CityId),
(695302, @CityId),
(695301, @CityId),
(695146, @CityId),
(695145, @CityId),
(695144, @CityId),
(695143, @CityId),
(695142, @CityId),
(695141, @CityId),
(695134, @CityId),
(695133, @CityId),
(695132, @CityId),
(695126, @CityId),
(695125, @CityId),
(695124, @CityId),
(695123, @CityId),
(695122, @CityId),
(695121, @CityId),
(695104, @CityId),
(695103, @CityId),
(695102, @CityId),
(695101, @CityId),
(695099, @CityId),
(695043, @CityId),
(695042, @CityId),
(695040, @CityId),
(695038, @CityId),
(695036, @CityId),
(695035, @CityId),
(695034, @CityId),
(695033, @CityId),
(695032, @CityId),
(695030, @CityId),
(695029, @CityId),
(695028, @CityId),
(695027, @CityId),
(695026, @CityId),
(695025, @CityId),
(695024, @CityId),
(695023, @CityId),
(695022, @CityId),
(695021, @CityId),
(695020, @CityId),
(695019, @CityId),
(695018, @CityId),
(695017, @CityId),
(695016, @CityId),
(695015, @CityId),
(695014, @CityId),
(695013, @CityId),
(695012, @CityId),
(695011, @CityId),
(695010, @CityId),
(695009, @CityId),
(695008, @CityId),
(695007, @CityId),
(695006, @CityId),
(695005, @CityId),
(695004, @CityId),
(695003, @CityId),
(695002, @CityId),
(695001, @CityId),
(695044, @CityId);

-- THRISSUR
INSERT INTO Cities (Name, LocationId) VALUES ('THRISSUR', @LocationId_KL);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(680751, @CityId),
(680741, @CityId),
(680734, @CityId),
(680733, @CityId),
(680732, @CityId),
(680731, @CityId),
(680724, @CityId),
(680722, @CityId),
(680721, @CityId),
(680712, @CityId),
(680711, @CityId),
(680703, @CityId),
(680702, @CityId),
(680701, @CityId),
(680699, @CityId),
(680697, @CityId),
(680691, @CityId),
(680689, @CityId),
(680688, @CityId),
(680687, @CityId),
(680686, @CityId),
(680685, @CityId),
(680684, @CityId),
(680683, @CityId),
(680682, @CityId),
(680681, @CityId),
(680671, @CityId),
(680670, @CityId),
(680669, @CityId),
(680668, @CityId),
(680667, @CityId),
(680666, @CityId),
(680665, @CityId),
(680664, @CityId),
(680663, @CityId),
(680662, @CityId),
(680661, @CityId),
(680656, @CityId),
(680655, @CityId),
(680654, @CityId),
(680653, @CityId),
(680652, @CityId),
(680651, @CityId),
(680642, @CityId),
(680641, @CityId),
(680631, @CityId),
(680623, @CityId),
(680620, @CityId),
(680619, @CityId),
(680618, @CityId),
(680617, @CityId),
(680616, @CityId),
(680615, @CityId),
(680614, @CityId),
(680613, @CityId),
(680612, @CityId),
(680611, @CityId);

-- WAYANAD
INSERT INTO Cities (Name, LocationId) VALUES ('WAYANAD', @LocationId_KL);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES 
(673121, @CityId),
(673592, @CityId),
(670644, @CityId),
(673581, @CityId),
(673579, @CityId),
(673577, @CityId),
(673122, @CityId),
(670645, @CityId),
(673575, @CityId),
(673123, @CityId),
(673595, @CityId),
(673593, @CityId),
(670721, @CityId);

Go
/* ===============================
   LOCATION : MADHYA PRADESH
   =============================== */
DECLARE @LocationId_MadhyaPradesh INT;
INSERT INTO Locations (Name) VALUES ('Madhya Pradesh');
SET @LocationId_MadhyaPradesh = SCOPE_IDENTITY();


/* ===============================
   CITY : AGAR MALWA
   =============================== */
DECLARE @CityId_AgarMalwa INT;
INSERT INTO Cities (Name, LocationId) VALUES ('AGAR MALWA', @LocationId_MadhyaPradesh);
SET @CityId_AgarMalwa = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(465441, @CityId_AgarMalwa);


/* ===============================
   CITY : ALIRAJPUR
   =============================== */
DECLARE @CityId_Alirajpur INT;
INSERT INTO Cities (Name, LocationId) VALUES ('ALIRAJPUR', @LocationId_MadhyaPradesh);
SET @CityId_Alirajpur = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(457887, @CityId_Alirajpur);


/* ===============================
   CITY : BALAGHAT
   =============================== */
DECLARE @CityId_Balaghat INT;
INSERT INTO Cities (Name, LocationId) VALUES ('BALAGHAT', @LocationId_MadhyaPradesh);
SET @CityId_Balaghat = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(481445, @CityId_Balaghat),
(481335, @CityId_Balaghat),
(481331, @CityId_Balaghat),
(481226, @CityId_Balaghat),
(481222, @CityId_Balaghat),
(481116, @CityId_Balaghat),
(481115, @CityId_Balaghat),
(481111, @CityId_Balaghat),
(481105, @CityId_Balaghat),
(481001, @CityId_Balaghat);


/* ===============================
   CITY : BARWANI
   =============================== */
DECLARE @CityId_Barwani INT;
INSERT INTO Cities (Name, LocationId) VALUES ('BARWANI', @LocationId_MadhyaPradesh);
SET @CityId_Barwani = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(451551, @CityId_Barwani);


/* ===============================
   CITY : BETUL
   =============================== */
DECLARE @CityId_Betul INT;
INSERT INTO Cities (Name, LocationId) VALUES ('BETUL', @LocationId_MadhyaPradesh);
SET @CityId_Betul = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(460668, @CityId_Betul),
(460666, @CityId_Betul),
(460665, @CityId_Betul),
(460663, @CityId_Betul),
(460661, @CityId_Betul),
(460557, @CityId_Betul),
(460554, @CityId_Betul),
(460553, @CityId_Betul),
(460551, @CityId_Betul),
(460449, @CityId_Betul),
(460447, @CityId_Betul),
(460443, @CityId_Betul),
(460440, @CityId_Betul),
(460330, @CityId_Betul),
(460225, @CityId_Betul),
(460220, @CityId_Betul),
(460110, @CityId_Betul),
(460004, @CityId_Betul),
(460001, @CityId_Betul);


/* ===============================
   CITY : BHIND
   =============================== */
DECLARE @CityId_Bhind INT;
INSERT INTO Cities (Name, LocationId) VALUES ('BHIND', @LocationId_MadhyaPradesh);
SET @CityId_Bhind = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(477660, @CityId_Bhind),
(477577, @CityId_Bhind),
(477566, @CityId_Bhind),
(477557, @CityId_Bhind),
(477555, @CityId_Bhind),
(477449, @CityId_Bhind),
(477447, @CityId_Bhind),
(477446, @CityId_Bhind),
(477445, @CityId_Bhind),
(477441, @CityId_Bhind),
(477335, @CityId_Bhind),
(477333, @CityId_Bhind),
(477332, @CityId_Bhind),
(477331, @CityId_Bhind),
(477227, @CityId_Bhind),
(477222, @CityId_Bhind),
(477117, @CityId_Bhind),
(477116, @CityId_Bhind),
(477111, @CityId_Bhind),
(477105, @CityId_Bhind),
(477001, @CityId_Bhind);


/* ===============================
   CITY : BHOPAL
   =============================== */
DECLARE @CityId_Bhopal INT;
INSERT INTO Cities (Name, LocationId) VALUES ('BHOPAL', @LocationId_MadhyaPradesh);
SET @CityId_Bhopal = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(464993, @CityId_Bhopal),
(462023, @CityId_Bhopal),
(462016, @CityId_Bhopal),
(462001, @CityId_Bhopal),
(462002, @CityId_Bhopal),
(462003, @CityId_Bhopal),
(462004, @CityId_Bhopal),
(462007, @CityId_Bhopal),
(462008, @CityId_Bhopal),
(462010, @CityId_Bhopal),
(462011, @CityId_Bhopal),
(462013, @CityId_Bhopal),
(462018, @CityId_Bhopal),
(462020, @CityId_Bhopal),
(462021, @CityId_Bhopal),
(462022, @CityId_Bhopal),
(462024, @CityId_Bhopal),
(462026, @CityId_Bhopal),
(462027, @CityId_Bhopal),
(462030, @CityId_Bhopal),
(462031, @CityId_Bhopal),
(462032, @CityId_Bhopal),
(462033, @CityId_Bhopal),
(462036, @CityId_Bhopal),
(462037, @CityId_Bhopal),
(462038, @CityId_Bhopal),
(462039, @CityId_Bhopal),
(462040, @CityId_Bhopal),
(462041, @CityId_Bhopal),
(462042, @CityId_Bhopal),
(462043, @CityId_Bhopal),
(462044, @CityId_Bhopal),
(462045, @CityId_Bhopal),
(462047, @CityId_Bhopal),
(462066, @CityId_Bhopal),
(462100, @CityId_Bhopal),
(462101, @CityId_Bhopal),
(462120, @CityId_Bhopal),
(462420, @CityId_Bhopal),
(463106, @CityId_Bhopal),
(463111, @CityId_Bhopal);

DECLARE @CityId INT;

/* ===============================
   CITY: BURHANPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BURHANPUR', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(450445,@CityId),
(450332,@CityId),
(450331,@CityId),
(450221,@CityId);

/* ===============================
   CITY: CHHATARPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('CHHATARPUR', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(488001,@CityId),
(471001,@CityId),
(471201,@CityId);

/* ===============================
   CITY: CHHINDWARA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('CHHINDWARA', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(480559,@CityId),
(480557,@CityId),
(480555,@CityId),
(480554,@CityId),
(480553,@CityId),
(480551,@CityId),
(480449,@CityId),
(480447,@CityId),
(480441,@CityId),
(480338,@CityId),
(480337,@CityId),
(480334,@CityId),
(480331,@CityId),
(480224,@CityId),
(480223,@CityId),
(480221,@CityId),
(480115,@CityId),
(480111,@CityId),
(480110,@CityId),
(480109,@CityId),
(480108,@CityId),
(480107,@CityId),
(480106,@CityId),
(480105,@CityId),
(480001,@CityId);

/* ===============================
   CITY: DAMOH
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('DAMOH', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(470661,@CityId);

/* ===============================
   CITY: DATIA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('DATIA', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(475686,@CityId),
(475682,@CityId),
(475675,@CityId),
(475661,@CityId),
(475335,@CityId);

/* ===============================
   CITY: DEWAS
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('DEWAS', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(455459,@CityId),
(455440,@CityId),
(455339,@CityId),
(455336,@CityId),
(455332,@CityId),
(455227,@CityId),
(455223,@CityId),
(455221,@CityId),
(455118,@CityId),
(455116,@CityId),
(455115,@CityId),
(455111,@CityId),
(455001,@CityId);

/* ===============================
   CITY: DHAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('DHAR', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(454774,@CityId),
(454552,@CityId),
(454446,@CityId);

/* ===============================
   CITY: GUNA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('GUNA', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(473001,@CityId),
(473112,@CityId),
(473115,@CityId),
(473226,@CityId);

/* ===============================
   CITY: GUWAHATI (AS PROVIDED)
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('GUWAHATI', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(781033,@CityId);

/* ===============================
   CITY: GWALIOR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('GWALIOR', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(475685,@CityId),
(475673,@CityId),
(475671,@CityId),
(475336,@CityId),
(475330,@CityId),
(475220,@CityId),
(475115,@CityId),
(475110,@CityId),
(475005,@CityId),
(475002,@CityId),
(475001,@CityId),
(474020,@CityId),
(474015,@CityId),
(474012,@CityId),
(474011,@CityId),
(474010,@CityId),
(474009,@CityId),
(474008,@CityId),
(474007,@CityId),
(474006,@CityId),
(474005,@CityId),
(474004,@CityId),
(474003,@CityId),
(474002,@CityId),
(474001,@CityId);

--DECLARE @CityId INT;

/* ===============================
   CITY: HOSHANGABAD
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('HOSHANGABAD', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(461775,@CityId);

/* ===============================
   CITY: INDORE
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('INDORE', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(453661,@CityId),(453446,@CityId),(453441,@CityId),(453331,@CityId),
(452001,@CityId),(452002,@CityId),(452003,@CityId),(452005,@CityId),
(452006,@CityId),(452007,@CityId),(452008,@CityId),(452009,@CityId),
(452010,@CityId),(452011,@CityId),(452012,@CityId),(452013,@CityId),
(452014,@CityId),(452015,@CityId),(452017,@CityId),(452018,@CityId),
(452020,@CityId),(453001,@CityId),(453111,@CityId),(453112,@CityId),
(453115,@CityId),(453220,@CityId),(453332,@CityId),(453551,@CityId),
(453552,@CityId),(453555,@CityId),(453556,@CityId),(453771,@CityId);

/* ===============================
   CITY: KHANDWA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KHANDWA', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(450991,@CityId),(450881,@CityId),(450119,@CityId),
(450114,@CityId),(450110,@CityId),(450051,@CityId);

/* ===============================
   CITY: KHARGONE
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KHARGONE', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(451113,@CityId);

/* ===============================
   CITY: MANDSAUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('MANDSAUR', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(458001,@CityId);

/* ===============================
   CITY: MORENA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('MORENA', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(476554,@CityId),(476444,@CityId),(476339,@CityId),(476337,@CityId),
(476229,@CityId),(476228,@CityId),(476224,@CityId),(476221,@CityId),
(476219,@CityId),(476134,@CityId),(476115,@CityId),(476111,@CityId),
(476001,@CityId);

/* ===============================
   CITY: NARSINGHPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('NARSINGHPUR', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(487881,@CityId),(487770,@CityId),(487661,@CityId),(487555,@CityId),
(487551,@CityId),(487441,@CityId),(487337,@CityId),(487334,@CityId),
(487330,@CityId),(487225,@CityId),(487221,@CityId),(487118,@CityId),
(487114,@CityId),(487110,@CityId),(487001,@CityId);

/* ===============================
   CITY: NEEMUCH
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('NEEMUCH', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(458110,@CityId);

/* ===============================
   CITY: RAISEN
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('RAISEN', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(464986,@CityId),(464884,@CityId),(464881,@CityId),
(464551,@CityId),(462046,@CityId);

/* ===============================
   CITY: RAJGARH
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('RAJGARH', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(465669,@CityId),(465683,@CityId);

/* ===============================
   CITY: REWA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('REWA', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(486556,@CityId),(486553,@CityId),(486550,@CityId),(486451,@CityId),
(486450,@CityId),(486448,@CityId),(486447,@CityId),(486446,@CityId),
(486445,@CityId),(486441,@CityId),(486440,@CityId),(486341,@CityId),
(486340,@CityId),(486338,@CityId),(486335,@CityId),(486333,@CityId),
(486331,@CityId),(486226,@CityId),(486223,@CityId),(486220,@CityId),
(486123,@CityId),(486117,@CityId),(486115,@CityId),(486114,@CityId),
(486111,@CityId),(486006,@CityId),(486005,@CityId),(486003,@CityId),
(486002,@CityId),(486001,@CityId);

/* ===============================
   CITY: SAGAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SAGAR', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(470669,@CityId),(470442,@CityId),(470441,@CityId),(470339,@CityId),
(470337,@CityId),(470335,@CityId),(470235,@CityId),(470232,@CityId),
(470229,@CityId),(470228,@CityId),(470227,@CityId),(470226,@CityId),
(470223,@CityId),(470221,@CityId),(470125,@CityId),(470124,@CityId),
(470120,@CityId),(470119,@CityId),(470118,@CityId),(470117,@CityId),
(470115,@CityId),(470113,@CityId),(470051,@CityId),(470021,@CityId),
(470004,@CityId),(470003,@CityId),(470001,@CityId);

/* ===============================
   CITY: SATNA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SATNA', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(485771,@CityId);

/* ===============================
   CITY: SEHORE
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SEHORE', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(466001,@CityId),(466331,@CityId),(466116,@CityId);

/* ===============================
   CITY: SEONI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SEONI', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(481449,@CityId),(480996,@CityId),(480888,@CityId);

/* ===============================
   CITY: SHAJAPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SHAJAPUR', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(465333,@CityId),(465001,@CityId);

/* ===============================
   CITY: SHEOPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SHEOPUR', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(476355,@CityId),(476335,@CityId),(476332,@CityId);

/* ===============================
   CITY: SHIVPURI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SHIVPURI', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(473995,@CityId),(473990,@CityId),(473880,@CityId),(473865,@CityId),
(473793,@CityId),(473781,@CityId),(473775,@CityId),(473774,@CityId),
(473770,@CityId),(473670,@CityId),(473665,@CityId),(473662,@CityId),
(473660,@CityId),(473638,@CityId),(473585,@CityId),(473551,@CityId);

/* ===============================
   CITY: UJJAIN
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('UJJAIN', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(456006,@CityId);

/* ===============================
   CITY: UMARIA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('UMARIA', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(484661,@CityId);

/* ===============================
   CITY: VIDISHA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('VIDISHA', @LocationId_MadhyaPradesh);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(464337,@CityId),(464331,@CityId),(464258,@CityId),(464228,@CityId),
(464226,@CityId),(464224,@CityId),(464221,@CityId),(464220,@CityId),
(464114,@CityId),(464113,@CityId),(464111,@CityId),(464001,@CityId);

go
/* ===============================
   LOCATION: MAHARASHTRA
   =============================== */
DECLARE @LocationId_Maharashtra INT;
INSERT INTO Locations (Name) VALUES ('Maharashtra');
SET @LocationId_Maharashtra = SCOPE_IDENTITY();

DECLARE @CityId INT;

/* ===============================
   CITY: AHMED NAGAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('AHMED NAGAR', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(414306,@CityId),(414001,@CityId),(422605,@CityId);

/* ===============================
   CITY: AKOLA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('AKOLA', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(444511,@CityId),(444502,@CityId),(444501,@CityId),(444407,@CityId),
(444405,@CityId),(444401,@CityId),(444311,@CityId),(444302,@CityId),
(444126,@CityId),(444117,@CityId),(444111,@CityId),(444109,@CityId),
(444108,@CityId),(444107,@CityId),(444104,@CityId),(444103,@CityId),
(444102,@CityId),(444101,@CityId),(444006,@CityId),(444005,@CityId),
(444003,@CityId),(444002,@CityId),(444001,@CityId);

/* ===============================
   CITY: AMRAVATI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('AMRAVATI', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(444601,@CityId);

/* ===============================
   CITY: AURANGABAD
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('AURANGABAD', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(431003,@CityId);

/* ===============================
   CITY: BEED
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BEED', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(431122,@CityId);

/* ===============================
   CITY: BULDHANA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BULDHANA', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(444312,@CityId),(444306,@CityId),(444304,@CityId),(444303,@CityId),
(444301,@CityId),(444204,@CityId),(444203,@CityId),(444202,@CityId),
(444201,@CityId),(443404,@CityId),(443403,@CityId),(443402,@CityId),
(443401,@CityId),(443308,@CityId),(443304,@CityId),(443303,@CityId),
(443302,@CityId),(443301,@CityId),(443206,@CityId),(443204,@CityId),
(443203,@CityId),(443202,@CityId),(443201,@CityId),(443112,@CityId),
(443106,@CityId),(443104,@CityId),(443103,@CityId),(443102,@CityId),
(443101,@CityId),(443002,@CityId),(443001,@CityId);

/* ===============================
   CITY: CHANDRAPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('CHANDRAPUR', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(442905,@CityId),(442505,@CityId),(442402,@CityId);

/* ===============================
   CITY: DHULE
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('DHULE', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(425406,@CityId),(424005,@CityId);

/* ===============================
   CITY: GONDIA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('GONDIA', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(441614,@CityId);

/* ===============================
   CITY: HINGOLI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('HINGOLI', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(431702,@CityId),(431513,@CityId);

/* ===============================
   CITY: JALGAON
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('JALGAON', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(424119,@CityId),(425401,@CityId),(425001,@CityId);

/* ===============================
   CITY: KOLHAPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KOLHAPUR', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(416012,@CityId),(416115,@CityId),(416109,@CityId);

/* ===============================
   CITY: MUMBAI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('MUMBAI', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(400002,@CityId),(400003,@CityId),(400004,@CityId),(400005,@CityId),
(400006,@CityId),(400007,@CityId),(400008,@CityId),(400009,@CityId),
(400010,@CityId),(400011,@CityId),(400012,@CityId),(400013,@CityId),
(400014,@CityId),(400015,@CityId),(400016,@CityId),(400017,@CityId),
(400018,@CityId),(400019,@CityId),(400020,@CityId),(400021,@CityId),
(400022,@CityId),(400023,@CityId),(400025,@CityId),(400026,@CityId),
(400027,@CityId),(400028,@CityId),(400030,@CityId),(400031,@CityId),
(400032,@CityId),(400033,@CityId),(400034,@CityId),(400035,@CityId),
(400036,@CityId),(400037,@CityId),(400038,@CityId),(400039,@CityId),
(400040,@CityId),(400041,@CityId),(400042,@CityId),(400044,@CityId),
(400045,@CityId),(400046,@CityId),(400048,@CityId),(400062,@CityId),
(400073,@CityId),(400074,@CityId),(400090,@CityId),(400100,@CityId);

/* ===============================
   CITY: MUMBAI SUBURBAN
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('MUMBAI SUBURBAN', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(400049,@CityId),(400050,@CityId),(400054,@CityId),(400061,@CityId),
(400063,@CityId),(400068,@CityId),(400096,@CityId),(400098,@CityId),
(400099,@CityId),(400101,@CityId);

/* ===============================
   CITY: NAGPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('NAGPUR', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(440001,@CityId),(440002,@CityId),(440003,@CityId),(440005,@CityId),
(440006,@CityId),(440007,@CityId),(440008,@CityId),(440009,@CityId),
(440010,@CityId),(440012,@CityId),(440013,@CityId),(440014,@CityId),
(440015,@CityId),(440016,@CityId),(440017,@CityId),(440018,@CityId),
(440019,@CityId),(440020,@CityId),(440021,@CityId),(440022,@CityId),
(440023,@CityId),(440024,@CityId),(440025,@CityId),(440026,@CityId),
(440027,@CityId),(440030,@CityId),(440032,@CityId),(440033,@CityId),
(440034,@CityId),(440035,@CityId),(440036,@CityId),(440037,@CityId),
(441001,@CityId),(441002,@CityId),(441101,@CityId),(441102,@CityId),
(441103,@CityId),(441104,@CityId),(441105,@CityId),(441106,@CityId),
(441107,@CityId),(441108,@CityId),(441109,@CityId),(441110,@CityId),
(441111,@CityId),(441112,@CityId),(441113,@CityId),(441122,@CityId),
(441123,@CityId),(441201,@CityId),(441202,@CityId),(441203,@CityId),
(441204,@CityId),(441210,@CityId),(441214,@CityId),(441301,@CityId),
(441302,@CityId),(441303,@CityId),(441304,@CityId),(441305,@CityId),
(441306,@CityId),(441401,@CityId),(441404,@CityId),(441501,@CityId),
(441502,@CityId);
/* ===============================
   CITY: NANDED
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('NANDED', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(431717,@CityId);

/* ===============================
   CITY: NANDURBAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('NANDURBAR', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(425412,@CityId);

/* ===============================
   CITY: NASHIK
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('NASHIK', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(422003,@CityId),(422013,@CityId);

/* ===============================
   CITY: OSMANABAD
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('OSMANABAD', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(413509,@CityId);

/* ===============================
   CITY: PALGHAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('PALGHAR', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(401304,@CityId),(401207,@CityId),(401206,@CityId),
(401105,@CityId),(401101,@CityId),(401501,@CityId),(401404,@CityId);

/* ===============================
   CITY: PARBHANI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('PARBHANI', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(431401,@CityId);

/* ===============================
   CITY: PUNE
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('PUNE', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(412409,@CityId),(412403,@CityId),(412308,@CityId),(412307,@CityId),
(412301,@CityId),(412216,@CityId),(412208,@CityId),(412207,@CityId),
(412202,@CityId),(412201,@CityId),(412114,@CityId),(412110,@CityId),
(412109,@CityId),(412108,@CityId),(412106,@CityId),(412105,@CityId),
(412104,@CityId),(412101,@CityId),
(411068,@CityId),(411067,@CityId),(411062,@CityId),(411061,@CityId),
(411060,@CityId),(411058,@CityId),(411057,@CityId),(411055,@CityId),
(411053,@CityId),(411052,@CityId),(411051,@CityId),(411048,@CityId),
(411047,@CityId),(411046,@CityId),(411045,@CityId),(411044,@CityId),
(411043,@CityId),(411042,@CityId),(411041,@CityId),(411040,@CityId),
(411039,@CityId),(411038,@CityId),(411037,@CityId),(411036,@CityId),
(411035,@CityId),(411034,@CityId),(411033,@CityId),(411032,@CityId),
(411031,@CityId),(411030,@CityId),(411028,@CityId),(411027,@CityId),
(411026,@CityId),(411025,@CityId),(411024,@CityId),(411023,@CityId),
(411022,@CityId),(411021,@CityId),(411020,@CityId),(411019,@CityId),
(411018,@CityId),(411017,@CityId),(411016,@CityId),(411015,@CityId),
(411014,@CityId),(411013,@CityId),(411012,@CityId),(411011,@CityId),
(411009,@CityId),(411008,@CityId),(411007,@CityId),(411006,@CityId),
(411005,@CityId),(411004,@CityId),(411003,@CityId),(411002,@CityId),
(411001,@CityId),
(410513,@CityId),(410512,@CityId),(410510,@CityId),(410507,@CityId),
(410506,@CityId),(410504,@CityId),(410501,@CityId),(410406,@CityId),
(410402,@CityId),(412115,@CityId);

/* ===============================
   CITY: RAIGARH
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('RAIGARH', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(410205,@CityId),(402401,@CityId),(402209,@CityId),(402208,@CityId),
(402207,@CityId),(402204,@CityId),(402203,@CityId),(402202,@CityId),
(402126,@CityId),(402125,@CityId),(402108,@CityId),(402107,@CityId),
(402106,@CityId),(402301,@CityId),(402302,@CityId);

/* ===============================
   CITY: RAIGARH (MH)
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('RAIGARH (MH)', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(410222,@CityId),(410220,@CityId),(410216,@CityId),(410209,@CityId),
(410207,@CityId),(410204,@CityId),(410203,@CityId),(410202,@CityId),
(410201,@CityId),(410102,@CityId),(410101,@CityId),(400704,@CityId);

/* ===============================
   CITY: SANGLI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SANGLI', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(415304,@CityId),(416410,@CityId);

/* ===============================
   CITY: SATARA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SATARA', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(415109,@CityId),(415206,@CityId);

/* ===============================
   CITY: SOLAPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SOLAPUR', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(413001,@CityId),(413003,@CityId);

/* ===============================
   CITY: THANE
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('THANE', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(421605,@CityId),(421603,@CityId),(421506,@CityId),(421505,@CityId),
(421502,@CityId),(421501,@CityId),(421403,@CityId),(421401,@CityId),
(421312,@CityId),(421311,@CityId),(421308,@CityId),(421306,@CityId),
(421305,@CityId),(421301,@CityId),(421204,@CityId),(421203,@CityId),
(421202,@CityId),(421201,@CityId),(421103,@CityId),(421102,@CityId),
(421101,@CityId),(421005,@CityId),(421004,@CityId),(421003,@CityId),
(421002,@CityId),(421001,@CityId),(401204,@CityId),(401106,@CityId),
(401104,@CityId),(400710,@CityId),(400706,@CityId),(400705,@CityId),
(400703,@CityId),(400701,@CityId),(400615,@CityId),(400612,@CityId),
(400610,@CityId),(400608,@CityId),(400607,@CityId),(400606,@CityId),
(400605,@CityId),(400604,@CityId),(400603,@CityId),(400602,@CityId),
(400601,@CityId);

/* ===============================
   CITY: VASAI VIRAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('VASAI VIRAR', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(401210,@CityId);

/* ===============================
   CITY: WARDHA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('WARDHA', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(442001,@CityId);

/* ===============================
   CITY: WASHIM
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('WASHIM', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(444510,@CityId),(444507,@CityId),(444505,@CityId),(444504,@CityId),
(444503,@CityId),(444409,@CityId),(444404,@CityId),(444402,@CityId),
(444110,@CityId),(444105,@CityId);

/* ===============================
   CITY: YAVATMAL
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('YAVATMAL', @LocationId_Maharashtra);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(445001,@CityId);
go
/* ===============================
   LOCATION: MANIPUR
   =============================== */
DECLARE @LocationId_Manipur INT;
INSERT INTO Locations (Name) VALUES ('Manipur');
SET @LocationId_Manipur = SCOPE_IDENTITY();

DECLARE @CityId INT;

/* ===============================
   CITY: IMPHAL WEST
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('IMPHAL WEST', @LocationId_Manipur);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(795004, @CityId),
(795001, @CityId);
go
DECLARE @LocationId_Megalaya INT;
INSERT INTO Locations (Name) VALUES ('Meghalaya');
SET @LocationId_Megalaya = SCOPE_IDENTITY();

DECLARE @CityId INT;

/* ===============================
   CITY: EAST KHASI HILLS
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('EAST KHASI HILLS', @LocationId_Megalaya);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(793003, @CityId);
go

DECLARE @LocationId_Mizoram INT;
INSERT INTO Locations (Name) VALUES ('Mizoram');
SET @LocationId_Mizoram = SCOPE_IDENTITY();

DECLARE @CityId INT;

/* ===============================
   CITY: AIZAWL
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('AIZAWL', @LocationId_Mizoram);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(796005, @CityId);

/* ===============================
   CITY: WEST TRIPURA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('WEST TRIPURA', @LocationId_Mizoram);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(799004, @CityId);
go
DECLARE @LocationId_Nagaland INT;
INSERT INTO Locations (Name) VALUES ('Nagaland');
SET @LocationId_Nagaland = SCOPE_IDENTITY();

DECLARE @CityId INT;

/* ===============================
   CITY: DIMAPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('DIMAPUR', @LocationId_Nagaland);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(797112, @CityId);
go
DECLARE @LocationId_Odisha INT;
INSERT INTO Locations (Name) VALUES ('Odisha');
SET @LocationId_Odisha = SCOPE_IDENTITY();

DECLARE @CityId INT;

/* ===============================
   CITY: ANGUL
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('ANGUL', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(759037, @CityId),
(759100, @CityId),
(759101, @CityId),
(759102, @CityId),
(759103, @CityId),
(759104, @CityId),
(759105, @CityId),
(759106, @CityId),
(759107, @CityId),
(759111, @CityId),
(759116, @CityId),
(759117, @CityId),
(759118, @CityId),
(759119, @CityId),
(759122, @CityId),
(759123, @CityId),
(759124, @CityId),
(759125, @CityId),
(759126, @CityId),
(759127, @CityId),
(759128, @CityId),
(759129, @CityId),
(759130, @CityId),
(759132, @CityId),
(759141, @CityId),
(759143, @CityId),
(759145, @CityId),
(759146, @CityId),
(759147, @CityId),
(759148, @CityId);

/* ===============================
   CITY: BALANGIR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BALANGIR', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(767001, @CityId),
(767002, @CityId),
(767033, @CityId),
(767039, @CityId),
(767025, @CityId),
(767016, @CityId),
(767020, @CityId),
(767021, @CityId),
(767022, @CityId),
(767024, @CityId),
(767026, @CityId),
(767027, @CityId),
(767028, @CityId),
(767029, @CityId),
(767030, @CityId),
(767032, @CityId),
(767035, @CityId),
(767037, @CityId),
(767038, @CityId),
(767040, @CityId),
(767041, @CityId),
(767042, @CityId),
(767046, @CityId),
(767048, @CityId),
(767060, @CityId),
(767061, @CityId),
(767065, @CityId),
(767066, @CityId),
(767067, @CityId),
(767068, @CityId),
(767070, @CityId);

/* ===============================
   CITY: BALESWAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BALESWAR', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(756001, @CityId),
(756003, @CityId),
(756045, @CityId),
(756032, @CityId),
(756040, @CityId),
(756126, @CityId),
(754223, @CityId),
(756002, @CityId),
(756019, @CityId),
(756020, @CityId),
(756021, @CityId),
(756022, @CityId),
(756023, @CityId),
(756024, @CityId),
(756025, @CityId),
(756026, @CityId),
(756027, @CityId),
(756028, @CityId),
(756029, @CityId),
(756030, @CityId),
(756033, @CityId),
(756034, @CityId),
(756035, @CityId),
(756036, @CityId),
(756037, @CityId),
(756038, @CityId),
(756039, @CityId),
(756041, @CityId),
(756042, @CityId),
(756043, @CityId),
(756044, @CityId),
(756046, @CityId),
(756047, @CityId),
(756048, @CityId),
(756049, @CityId),
(756051, @CityId),
(756055, @CityId),
(756056, @CityId),
(756058, @CityId),
(756059, @CityId),
(756060, @CityId),
(756079, @CityId),
(756080, @CityId),
(756081, @CityId),
(756083, @CityId),
(756084, @CityId),
(756085, @CityId),
(756086, @CityId),
(756134, @CityId),
(756182, @CityId);

/* ===============================
   CITY: BARGARH
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BARGARH', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(768028, @CityId),
(768027, @CityId),
(768029, @CityId),
(768030, @CityId),
(768031, @CityId),
(768032, @CityId),
(768033, @CityId),
(768034, @CityId),
(768035, @CityId),
(768036, @CityId),
(768037, @CityId),
(768038, @CityId),
(768039, @CityId),
(768040, @CityId),
(768042, @CityId),
(768045, @CityId),
(768048, @CityId),
(768049, @CityId),
(768050, @CityId),
(768052, @CityId),
(768102, @CityId),
(768103, @CityId),
(768104, @CityId),
(768111, @CityId),
(768115, @CityId);

/* ===============================
   CITY: BHADRAK
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BHADRAK', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(756125, @CityId),
(756100, @CityId),
(756101, @CityId),
(756133, @CityId),
(756111, @CityId),
(756112, @CityId),
(756113, @CityId),
(756114, @CityId),
(756115, @CityId),
(756116, @CityId),
(756117, @CityId),
(756118, @CityId),
(756119, @CityId),
(756120, @CityId),
(756121, @CityId),
(756122, @CityId),
(756123, @CityId),
(756124, @CityId),
(756127, @CityId),
(756128, @CityId),
(756129, @CityId),
(756130, @CityId),
(756131, @CityId),
(756132, @CityId),
(756135, @CityId),
(756137, @CityId),
(756138, @CityId),
(756139, @CityId),
(756144, @CityId),
(756162, @CityId),
(756163, @CityId),
(756164, @CityId),
(756165, @CityId),
(756166, @CityId),
(756167, @CityId),
(756168, @CityId),
(756171, @CityId),
(756181, @CityId);

/* ===============================
   CITY: BOUDH
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BOUDH', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(762014, @CityId),
(762013, @CityId),
(762015, @CityId),
(762016, @CityId),
(762017, @CityId),
(762018, @CityId),
(762020, @CityId),
(762023, @CityId),
(762024, @CityId),
(762026, @CityId),
(762030, @CityId);

/* ===============================
   CITY: CUTTACK
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('CUTTACK', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(753001, @CityId),
(754008, @CityId),
(753002, @CityId),
(753004, @CityId),
(753003, @CityId),
(753010, @CityId),
(753008, @CityId),
(753012, @CityId),
(753007, @CityId),
(753009, @CityId),
(753013, @CityId),
(754202, @CityId),
(754029, @CityId),
(754025, @CityId),
(754021, @CityId),
(754103, @CityId),
(752120, @CityId),
(753006, @CityId),
(753011, @CityId),
(753014, @CityId),
(753015, @CityId),
(754001, @CityId),
(754002, @CityId),
(754003, @CityId),
(754004, @CityId),
(754005, @CityId),
(754006, @CityId),
(754007, @CityId),
(754009, @CityId),
(754010, @CityId),
(754011, @CityId),
(754013, @CityId),
(754018, @CityId),
(754022, @CityId),
(754026, @CityId),
(754027, @CityId),
(754028, @CityId),
(754030, @CityId),
(754031, @CityId),
(754032, @CityId),
(754035, @CityId),
(754037, @CityId),
(754071, @CityId),
(754100, @CityId),
(754105, @CityId),
(754112, @CityId),
(754130, @CityId),
(754131, @CityId),
(754200, @CityId),
(754201, @CityId),
(754203, @CityId),
(754204, @CityId),
(754206, @CityId),
(754207, @CityId),
(754209, @CityId),
(754221, @CityId),
(754290, @CityId),
(754293, @CityId),
(754295, @CityId);

/* ===============================
   CITY: DEBAGARH
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('DEBAGARH', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(768108, @CityId),
(768109, @CityId),
(768110, @CityId),
(768119, @CityId),
(768121, @CityId);

/* ===============================
   CITY: DHENKANAL
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('DHENKANAL', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(759013, @CityId),
(759001, @CityId),
(759014, @CityId),
(759015, @CityId),
(759016, @CityId),
(759017, @CityId),
(759018, @CityId),
(759019, @CityId),
(759020, @CityId),
(759021, @CityId),
(759022, @CityId),
(759023, @CityId),
(759024, @CityId),
(759025, @CityId),
(759026, @CityId),
(759027, @CityId),
(759028, @CityId),
(759039, @CityId),
(759040, @CityId),
(759120, @CityId),
(759121, @CityId);
/* ===============================
   CITY: GAJAPATI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('GAJAPATI', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(761200, @CityId),
(761015, @CityId),
(761016, @CityId),
(761017, @CityId),
(761201, @CityId),
(761206, @CityId),
(761207, @CityId),
(761208, @CityId),
(761210, @CityId),
(761211, @CityId),
(761212, @CityId),
(761213, @CityId),
(761214, @CityId),
(761215, @CityId),
(761217, @CityId);

/* ===============================
   CITY: GANJAM
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('GANJAM', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(761110, @CityId),
(761119, @CityId),
(761104, @CityId),
(761126, @CityId),
(761118, @CityId),
(761102, @CityId),
(761108, @CityId),
(760001, @CityId),
(760004, @CityId),
(761020, @CityId),
(761012, @CityId),
(760008, @CityId),
(761032, @CityId),
(761028, @CityId),
(760002, @CityId),
(761018, @CityId),
(760006, @CityId),
(760003, @CityId),
(760005, @CityId),
(760007, @CityId),
(760009, @CityId),
(760010, @CityId),
(761001, @CityId),
(761002, @CityId),
(761003, @CityId),
(761004, @CityId),
(761005, @CityId),
(761006, @CityId),
(761007, @CityId),
(761008, @CityId),
(761009, @CityId),
(761010, @CityId),
(761011, @CityId),
(761013, @CityId),
(761014, @CityId),
(761019, @CityId),
(761025, @CityId),
(761026, @CityId),
(761027, @CityId),
(761029, @CityId),
(761030, @CityId),
(761031, @CityId),
(761035, @CityId),
(761037, @CityId),
(761041, @CityId),
(761042, @CityId),
(761043, @CityId),
(761045, @CityId),
(761052, @CityId),
(761054, @CityId),
(761055, @CityId),
(761100, @CityId),
(761101, @CityId),
(761103, @CityId),
(761105, @CityId),
(761106, @CityId),
(761107, @CityId),
(761109, @CityId),
(761111, @CityId),
(761114, @CityId),
(761115, @CityId),
(761116, @CityId),
(761117, @CityId),
(761120, @CityId),
(761121, @CityId),
(761122, @CityId),
(761123, @CityId),
(761124, @CityId),
(761125, @CityId),
(761131, @CityId),
(761132, @CityId),
(761133, @CityId),
(761140, @CityId),
(761141, @CityId),
(761143, @CityId),
(761144, @CityId),
(761146, @CityId),
(761151, @CityId),
(761209, @CityId);
/* ===============================
   CITY: JHARSUGUDA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('JHARSUGUDA', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(768201, @CityId),
(768216, @CityId),
(768202, @CityId),
(768203, @CityId),
(768204, @CityId),
(768211, @CityId),
(768213, @CityId),
(768215, @CityId),
(768217, @CityId),
(768218, @CityId),
(768219, @CityId),
(768220, @CityId),
(768225, @CityId),
(768226, @CityId),
(768233, @CityId),
(768234, @CityId);

/* ===============================
   CITY: KALAHANDI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KALAHANDI', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(766001, @CityId),
(766012, @CityId),
(766002, @CityId),
(766011, @CityId),
(766013, @CityId),
(766014, @CityId),
(766015, @CityId),
(766016, @CityId),
(766017, @CityId),
(766018, @CityId),
(766019, @CityId),
(766020, @CityId),
(766023, @CityId),
(766026, @CityId),
(766027, @CityId),
(766028, @CityId),
(766029, @CityId),
(766031, @CityId),
(766032, @CityId),
(766036, @CityId),
(766037, @CityId),
(766100, @CityId),
(766101, @CityId),
(766102, @CityId),
(766103, @CityId),
(766110, @CityId);

/* ===============================
   CITY: KANDHAMAL
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KANDHAMAL', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(762100, @CityId),
(762001, @CityId),
(762103, @CityId),
(762002, @CityId),
(762010, @CityId),
(762011, @CityId),
(762012, @CityId),
(762019, @CityId),
(762021, @CityId),
(762022, @CityId),
(762027, @CityId),
(762028, @CityId),
(762029, @CityId),
(762101, @CityId),
(762102, @CityId),
(762104, @CityId),
(762105, @CityId),
(762106, @CityId),
(762107, @CityId),
(762109, @CityId),
(762110, @CityId),
(762112, @CityId);

/* ===============================
   CITY: KENDRAPARA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KENDRAPARA', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(754211, @CityId),
(754215, @CityId),
(754134, @CityId),
(754153, @CityId),
(754205, @CityId),
(754208, @CityId),
(754210, @CityId),
(754212, @CityId),
(754213, @CityId),
(754214, @CityId),
(754216, @CityId),
(754217, @CityId),
(754218, @CityId),
(754219, @CityId),
(754220, @CityId),
(754222, @CityId),
(754224, @CityId),
(754225, @CityId),
(754227, @CityId),
(754228, @CityId),
(754231, @CityId),
(754239, @CityId),
(754240, @CityId),
(754244, @CityId),
(754245, @CityId),
(754246, @CityId),
(754248, @CityId),
(754250, @CityId),
(754253, @CityId),
(754289, @CityId),
(754292, @CityId),
(755006, @CityId);

/* ===============================
   CITY: KENDUJHAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KENDUJHAR', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(758021, @CityId),
(758034, @CityId),
(758002, @CityId),
(758001, @CityId),
(758035, @CityId),
(758013, @CityId),
(758014, @CityId),
(758015, @CityId),
(758016, @CityId),
(758017, @CityId),
(758018, @CityId),
(758019, @CityId),
(758020, @CityId),
(758022, @CityId),
(758023, @CityId),
(758025, @CityId),
(758026, @CityId),
(758027, @CityId),
(758028, @CityId),
(758029, @CityId),
(758030, @CityId),
(758031, @CityId),
(758032, @CityId),
(758036, @CityId),
(758037, @CityId),
(758038, @CityId),
(758040, @CityId),
(758041, @CityId),
(758043, @CityId),
(758044, @CityId),
(758045, @CityId),
(758046, @CityId),
(758047, @CityId),
(758076, @CityId),
(758078, @CityId),
(758079, @CityId),
(758080, @CityId),
(758081, @CityId),
(758082, @CityId),
(758083, @CityId),
(758084, @CityId),
(758085, @CityId);
/* ===============================
   CITY: KHORDA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KHORDA', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(751001,@CityId),(751022,@CityId),(751020,@CityId),(751009,@CityId),
(751002,@CityId),(751014,@CityId),(751006,@CityId),(751017,@CityId),
(751007,@CityId),(751003,@CityId),(752031,@CityId),(752030,@CityId),
(752050,@CityId),(752057,@CityId),(751004,@CityId),(751005,@CityId),
(751008,@CityId),(751010,@CityId),(751011,@CityId),(751012,@CityId),
(751013,@CityId),(751015,@CityId),(751016,@CityId),(751018,@CityId),
(751019,@CityId),(751021,@CityId),(751023,@CityId),(751024,@CityId),
(751025,@CityId),(751030,@CityId),(752018,@CityId),(752019,@CityId),
(752020,@CityId),(752021,@CityId),(752022,@CityId),(752023,@CityId),
(752027,@CityId),(752034,@CityId),(752035,@CityId),(752037,@CityId),
(752038,@CityId),(752054,@CityId),(752055,@CityId),(752056,@CityId),
(752060,@CityId),(752061,@CityId),(752062,@CityId),(752064,@CityId),
(752066,@CityId),(752100,@CityId),(752101,@CityId),(752102,@CityId),
(752103,@CityId),(752115,@CityId),(754012,@CityId);

/* ===============================
   CITY: KORAPUT
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KORAPUT', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(764001,@CityId),(764020,@CityId),(764021,@CityId),(763002,@CityId),
(763001,@CityId),(763003,@CityId),(763004,@CityId),(763008,@CityId),
(764002,@CityId),(764003,@CityId),(764004,@CityId),(764005,@CityId),
(764006,@CityId),(764011,@CityId),(764014,@CityId),(764027,@CityId),
(764028,@CityId),(764036,@CityId),(764037,@CityId),(764038,@CityId),
(764039,@CityId),(764041,@CityId),(764043,@CityId),(764055,@CityId),
(764056,@CityId),(764057,@CityId),(764058,@CityId),(764081,@CityId),
(765013,@CityId);

/* ===============================
   CITY: MALKANGIRI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('MALKANGIRI', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(764040,@CityId),(764042,@CityId),(764044,@CityId),(764045,@CityId),
(764046,@CityId),(764047,@CityId),(764048,@CityId),(764051,@CityId),
(764052,@CityId),(764086,@CityId),(764087,@CityId);

/* ===============================
   CITY: MAYURBHANJ
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('MAYURBHANJ', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(757001,@CityId),(757043,@CityId),(757003,@CityId),(757002,@CityId),
(757037,@CityId),(757041,@CityId),(757014,@CityId),(757016,@CityId),
(757017,@CityId),(757018,@CityId),(757019,@CityId),(757020,@CityId),
(757021,@CityId),(757022,@CityId),(757023,@CityId),(757024,@CityId),
(757025,@CityId),(757026,@CityId),(757027,@CityId),(757028,@CityId),
(757029,@CityId),(757030,@CityId),(757031,@CityId),(757032,@CityId),
(757033,@CityId),(757034,@CityId),(757035,@CityId),(757036,@CityId),
(757038,@CityId),(757039,@CityId),(757040,@CityId),(757042,@CityId),
(757045,@CityId),(757046,@CityId),(757047,@CityId),(757048,@CityId),
(757049,@CityId),(757050,@CityId),(757051,@CityId),(757052,@CityId),
(757053,@CityId),(757054,@CityId),(757055,@CityId),(757073,@CityId),
(757074,@CityId),(757075,@CityId),(757077,@CityId),(757079,@CityId),
(757081,@CityId),(757082,@CityId),(757083,@CityId),(757084,@CityId),
(757085,@CityId),(757086,@CityId),(757087,@CityId),(757091,@CityId),
(757092,@CityId),(757093,@CityId),(757100,@CityId),(757101,@CityId),
(757102,@CityId),(757103,@CityId),(757104,@CityId),(757105,@CityId),
(757106,@CityId),(757107,@CityId);

/* ===============================
   CITY: NABARANGAPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('NABARANGAPUR', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(764059,@CityId),(764073,@CityId),(764049,@CityId),(764061,@CityId),
(764063,@CityId),(764070,@CityId),(764071,@CityId),(764072,@CityId),
(764074,@CityId),(764075,@CityId),(764076,@CityId),(764077,@CityId),
(764078,@CityId),(764085,@CityId),(764088,@CityId);

/* ===============================
   CITY: NAYAGARH
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('NAYAGARH', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(752024,@CityId),(752025,@CityId),(752026,@CityId),(752063,@CityId),
(752065,@CityId),(752068,@CityId),(752070,@CityId),(752077,@CityId),
(752078,@CityId),(752079,@CityId),(752080,@CityId),(752081,@CityId),
(752082,@CityId),(752083,@CityId),(752084,@CityId),(752085,@CityId),
(752089,@CityId),(752090,@CityId),(752091,@CityId),(752092,@CityId),
(752093,@CityId),(752094,@CityId);

/* ===============================
   CITY: NUAPADA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('NUAPADA', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(766107,@CityId),(766104,@CityId),(766105,@CityId),(766106,@CityId),
(766108,@CityId),(766111,@CityId),(766118,@CityId);
/* ===============================
   CITY: PURI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('PURI', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(752106,@CityId),(752002,@CityId),(752001,@CityId),(752069,@CityId),
(752003,@CityId),(752011,@CityId),(752012,@CityId),(752013,@CityId),
(752014,@CityId),(752015,@CityId),(752016,@CityId),(752017,@CityId),
(752045,@CityId),(752046,@CityId),(752104,@CityId),(752105,@CityId),
(752107,@CityId),(752108,@CityId),(752109,@CityId),(752110,@CityId),
(752111,@CityId),(752113,@CityId),(752114,@CityId),(752116,@CityId),
(752118,@CityId),(752119,@CityId),(752121,@CityId);

/* ===============================
   CITY: RAYAGADA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('RAYAGADA', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(765017,@CityId),(765022,@CityId),(765001,@CityId),(764062,@CityId),
(765002,@CityId),(765015,@CityId),(765016,@CityId),(765018,@CityId),
(765019,@CityId),(765020,@CityId),(765021,@CityId),(765023,@CityId),
(765024,@CityId),(765025,@CityId),(765026,@CityId),(765029,@CityId),
(765033,@CityId),(765034,@CityId);

/* ===============================
   CITY: SAMBALPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SAMBALPUR', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(768004,@CityId),(768001,@CityId),(768025,@CityId),(768017,@CityId),
(768002,@CityId),(768003,@CityId),(768005,@CityId),(768006,@CityId),
(768016,@CityId),(768018,@CityId),(768019,@CityId),(768020,@CityId),
(768026,@CityId),(768105,@CityId),(768106,@CityId),(768107,@CityId),
(768112,@CityId),(768113,@CityId),(768118,@CityId),(768200,@CityId),
(768212,@CityId),(768214,@CityId),(768221,@CityId),(768222,@CityId),
(768224,@CityId),(768227,@CityId),(768228,@CityId);

/* ===============================
   CITY: SONAPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SONAPUR', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(767017,@CityId),(767018,@CityId),(767019,@CityId),(767023,@CityId),
(767045,@CityId),(767062,@CityId);

/* ===============================
   CITY: SUNDERGARH
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SUNDERGARH', @LocationId_Odisha);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(769012,@CityId),(769001,@CityId),(769004,@CityId),(770033,@CityId),
(770001,@CityId),(769007,@CityId),(769042,@CityId),(769015,@CityId),
(770032,@CityId),(770034,@CityId),(770017,@CityId),(769003,@CityId),
(769006,@CityId),(769002,@CityId),(769005,@CityId),(769008,@CityId),
(769009,@CityId),(769010,@CityId),(769011,@CityId),(769013,@CityId),
(769014,@CityId),(769016,@CityId),(769043,@CityId),(770002,@CityId),
(770011,@CityId),(770012,@CityId),(770013,@CityId),(770014,@CityId),
(770015,@CityId),(770016,@CityId),(770018,@CityId),(770019,@CityId),
(770020,@CityId),(770021,@CityId),(770022,@CityId),(770023,@CityId),
(770024,@CityId),(770031,@CityId),(770035,@CityId),(770036,@CityId),
(770037,@CityId),(770038,@CityId),(770039,@CityId),(770040,@CityId),
(770041,@CityId),(770042,@CityId),(770043,@CityId),(770044,@CityId),
(770046,@CityId),(770048,@CityId),(770051,@CityId),(770052,@CityId),
(770070,@CityId),(770072,@CityId),(770073,@CityId),(770074,@CityId),
(770075,@CityId),(770076,@CityId);
go
DECLARE @LocationId_Pondicherry INT;
INSERT INTO Locations (Name) VALUES ('Pondicherry');
SET @LocationId_Pondicherry = SCOPE_IDENTITY();

DECLARE @CityId INT;

/* ===============================
   CITY: CUDDALORE
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('CUDDALORE', @LocationId_Pondicherry);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(605106,@CityId);

/* ===============================
   CITY: PONDICHERRY
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('PONDICHERRY', @LocationId_Pondicherry);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(607402,@CityId),(605008,@CityId),(605004,@CityId),(605003,@CityId),
(605009,@CityId),(605007,@CityId);
go
DECLARE @LocationId_Punjab INT;
INSERT INTO Locations (Name) VALUES ('Punjab');
SET @LocationId_Punjab = SCOPE_IDENTITY();

DECLARE @CityId INT;

/* ===============================
   CITY: CHANDIGARH
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('CHANDIGARH', @LocationId_Punjab);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(134111,@CityId),(134115,@CityId),(134119,@CityId),(160016,@CityId);

/* ===============================
   CITY: MOHALI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('MOHALI', @LocationId_Punjab);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(140101,@CityId),(140109,@CityId),(140110,@CityId),(140201,@CityId),
(140306,@CityId),(140307,@CityId),(140308,@CityId),(140501,@CityId),
(140506,@CityId),(140507,@CityId),(140603,@CityId),(140604,@CityId),
(140901,@CityId),(160043,@CityId),(160059,@CityId),(160062,@CityId),
(160071,@CityId),(160103,@CityId),(160104,@CityId);

/* ===============================
   CITY: ROPAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('ROPAR', @LocationId_Punjab);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(140103,@CityId),(140108,@CityId),(140112,@CityId),(140301,@CityId),
(140413,@CityId),(140001,@CityId),(140126,@CityId);

/* ===============================
   CITY: PATIALA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('PATIALA', @LocationId_Punjab);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(140602,@CityId),(147001,@CityId),(147004,@CityId);

/* ===============================
   CITY: AMRITSAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('AMRITSAR', @LocationId_Punjab);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(143006,@CityId),(143101,@CityId),(143001,@CityId),(143115,@CityId),(143010,@CityId);

/* ===============================
   CITY: TARN TARAN
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('TARN TARAN', @LocationId_Punjab);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(143402,@CityId);

/* ===============================
   CITY: JALANDHAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('JALANDHAR', @LocationId_Punjab);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(144001,@CityId),(144002,@CityId),(144003,@CityId),(144004,@CityId),(144005,@CityId),
(144006,@CityId),(144007,@CityId),(144008,@CityId),(144009,@CityId),(144010,@CityId),
(144011,@CityId),(144012,@CityId),(144013,@CityId),(144014,@CityId),(144020,@CityId),
(144021,@CityId),(144022,@CityId),(144023,@CityId),(144024,@CityId),(144025,@CityId),
(144026,@CityId),(144027,@CityId),(144028,@CityId),(144029,@CityId),(144030,@CityId),
(144031,@CityId),(144032,@CityId),(144033,@CityId),(144034,@CityId),(144035,@CityId),
(144036,@CityId),(144037,@CityId),(144039,@CityId),(144040,@CityId),(144041,@CityId),
(144042,@CityId),(144043,@CityId),(144044,@CityId),(144101,@CityId),(144102,@CityId),
(144103,@CityId),(144104,@CityId),(144106,@CityId),(144201,@CityId),(144301,@CityId),
(144302,@CityId),(144303,@CityId),(144311,@CityId),(144403,@CityId),(144405,@CityId),
(144407,@CityId),(144409,@CityId),(144410,@CityId),(144416,@CityId),(144419,@CityId),
(144511,@CityId),(144629,@CityId),(144630,@CityId),(144633,@CityId),(144702,@CityId),
(144703,@CityId),(144801,@CityId),(144805,@CityId);

/* ===============================
   CITY: NAWANSHAHR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('NAWANSHAHR', @LocationId_Punjab);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(144418,@CityId),(144514,@CityId);

/* ===============================
   CITY: KAPURTHALA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KAPURTHALA', @LocationId_Punjab);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(144603,@CityId),(144623,@CityId),(144401,@CityId),(144601,@CityId),(144701,@CityId);

/* ===============================
   CITY: PATHANKOT
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('PATHANKOT', @LocationId_Punjab);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(145001,@CityId);

/* ===============================
   CITY: FARIDKOT
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('FARIDKOT', @LocationId_Punjab);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(151203,@CityId);

/* ===============================
   CITY: BATHINDA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BATHINDA', @LocationId_Punjab);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(151001,@CityId);

/* ===============================
   CITY: MOGA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('MOGA', @LocationId_Punjab);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(142001,@CityId);

/* ===============================
   CITY: FAZILKA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('FAZILKA', @LocationId_Punjab);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(152116,@CityId);

/* ===============================
   CITY: SANGRUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SANGRUR', @LocationId_Punjab);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(148001,@CityId),(148101,@CityId);

/* ===============================
   CITY: GURDASPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('GURDASPUR', @LocationId_Punjab);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(143505,@CityId);

/* ===============================
   CITY: MUKTSAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('MUKTSAR', @LocationId_Punjab);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(152026,@CityId);

/* ===============================
   CITY: MANSA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('MANSA', @LocationId_Punjab);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(151505,@CityId);

/* ===============================
   CITY: HOSHIARPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('HOSHIARPUR', @LocationId_Punjab);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(144216,@CityId),(146001,@CityId),(146021,@CityId),(146022,@CityId),
(146023,@CityId),(146111,@CityId);

/* ===============================
   CITY: FIROZPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('FIROZPUR', @LocationId_Punjab);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(152002,@CityId);

go
DECLARE @LocationId_Rajasthan INT;
INSERT INTO Locations (Name) VALUES ('Rajasthan');
SET @LocationId_Rajasthan = SCOPE_IDENTITY();

DECLARE @CityId INT;

/* ===============================
   CITY: AJMER
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('AJMER', @LocationId_Rajasthan);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(305812,@CityId),(305802,@CityId),(305631,@CityId),(305004,@CityId),(305001,@CityId),(305901,@CityId);

/* ===============================
   CITY: ALWAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('ALWAR', @LocationId_Rajasthan);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(301019,@CityId),(301701,@CityId),(301001,@CityId);

/* ===============================
   CITY: BANSWARA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BANSWARA', @LocationId_Rajasthan);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(327001,@CityId);

/* ===============================
   CITY: BARMER
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BARMER', @LocationId_Rajasthan);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(344001,@CityId),(344022,@CityId);

/* ===============================
   CITY: BHARATPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BHARATPUR', @LocationId_Rajasthan);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(321022,@CityId),(321001,@CityId);

/* ===============================
   CITY: BHILWARA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BHILWARA', @LocationId_Rajasthan);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(311001,@CityId),(311021,@CityId),(311602,@CityId);

/* ===============================
   CITY: BIKANER
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BIKANER', @LocationId_Rajasthan);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(334803,@CityId),(334001,@CityId),(334003,@CityId);

/* ===============================
   CITY: BUNDI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('BUNDI', @LocationId_Rajasthan);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(323001,@CityId);

/* ===============================
   CITY: CHITTORGARH
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('CHITTORGARH', @LocationId_Rajasthan);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(312001,@CityId),(323307,@CityId);

/* ===============================
   CITY: CHURU
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('CHURU', @LocationId_Rajasthan);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(331001,@CityId);

/* ===============================
   CITY: DAUSA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('DAUSA', @LocationId_Rajasthan);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(303305,@CityId),(303302,@CityId);

/* ===============================
   CITY: DHOLPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('DHOLPUR', @LocationId_Rajasthan);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(328001,@CityId);

/* ===============================
   CITY: DUNGARPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('DUNGARPUR', @LocationId_Rajasthan);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(314001,@CityId);

/* ===============================
   CITY: HANUMANGARH
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('HANUMANGARH', @LocationId_Rajasthan);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(335512,@CityId);

/* ===============================
   CITY: JAIPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('JAIPUR', @LocationId_Rajasthan);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(303908,@CityId),(303905,@CityId),(303904,@CityId),(303903,@CityId),(303901,@CityId),
(303807,@CityId),(303806,@CityId),(303805,@CityId),(303804,@CityId),(303803,@CityId),
(303801,@CityId),(303712,@CityId),(303706,@CityId),(303704,@CityId),(303702,@CityId),
(303701,@CityId),(303604,@CityId),(303603,@CityId),(303602,@CityId),(303601,@CityId),
(303348,@CityId),(303338,@CityId),(303329,@CityId),(303328,@CityId),(303301,@CityId),
(303124,@CityId),(303123,@CityId),(303122,@CityId),(303121,@CityId),(303120,@CityId),
(303119,@CityId),(303110,@CityId),(303109,@CityId),(303108,@CityId),(303107,@CityId),
(303106,@CityId),(303105,@CityId),(303104,@CityId),(303103,@CityId),(303102,@CityId),
(303012,@CityId),(303009,@CityId),(303008,@CityId),(303007,@CityId),(303006,@CityId),
(303005,@CityId),(303003,@CityId),(303002,@CityId),(303001,@CityId),(302043,@CityId),
(302042,@CityId),(302041,@CityId),(302040,@CityId),(302039,@CityId),(302038,@CityId),
(302037,@CityId),(302036,@CityId),(302034,@CityId),(302033,@CityId),(302031,@CityId),
(302029,@CityId),(302028,@CityId),(302027,@CityId),(302026,@CityId),(302022,@CityId),
(302021,@CityId),(302020,@CityId),(302019,@CityId),(302018,@CityId),(302017,@CityId),
(302016,@CityId),(302015,@CityId),(302013,@CityId),(302012,@CityId),(302006,@CityId),
(302005,@CityId),(302004,@CityId),(302003,@CityId),(302002,@CityId),(302001,@CityId);

/* ===============================
   CITY: JAISALMER
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('JAISALMER', @LocationId_Rajasthan);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(345001,@CityId);

/* ===============================
   CITY: JALOR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('JALOR', @LocationId_Rajasthan);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(343001,@CityId);

/* ===============================
   CITY: JHUJHUNU
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('JHUJHUNU', @LocationId_Rajasthan);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(333026,@CityId),(333001,@CityId);

/* ===============================
   CITY: JODHPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('JODHPUR', @LocationId_Rajasthan);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(342037,@CityId),(342029,@CityId),(342005,@CityId),(342001,@CityId),(342008,@CityId),
(342002,@CityId),(342015,@CityId);

/* ===============================
   CITY: KOTA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KOTA', @LocationId_Rajasthan);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(324005,@CityId),(324010,@CityId),(324001,@CityId),(324009,@CityId);

/* ===============================
   CITY: NAGAUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('NAGAUR', @LocationId_Rajasthan);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(341508,@CityId);

/* ===============================
   CITY: PALI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('PALI', @LocationId_Rajasthan);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(306901,@CityId),(306706,@CityId),(306704,@CityId),(306602,@CityId),(306601,@CityId),
(306504,@CityId),(306501,@CityId),(306422,@CityId),(306307,@CityId),(306304,@CityId),
(306303,@CityId),(306301,@CityId),(306021,@CityId),(306302,@CityId),(306401,@CityId);

/* ===============================
   CITY: SAWAI MADHOPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SAWAI MADHOPUR', @LocationId_Rajasthan);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(322201,@CityId);

/* ===============================
   CITY: SIKAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SIKAR', @LocationId_Rajasthan);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(332404,@CityId),(332024,@CityId);

/* ===============================
   CITY: SRI GANGANAGAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SRI GANGANAGAR', @LocationId_Rajasthan);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(335001,@CityId);

/* ===============================
   CITY: TONK
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('TONK', @LocationId_Rajasthan);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(304504,@CityId);

/* ===============================
   CITY: UDAIPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('UDAIPUR', @LocationId_Rajasthan);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(313001,@CityId),(313002,@CityId),(313324,@CityId);
go
DECLARE @LocationId_Sikkim INT;
INSERT INTO Locations (Name) VALUES ('Sikkim');
SET @LocationId_Sikkim = SCOPE_IDENTITY();

DECLARE @CityId INT;

/* ===============================
   CITY: EAST SIKKIM
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('EAST SIKKIM', @LocationId_Sikkim);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(737101,@CityId),(737102,@CityId),(737103,@CityId),(737106,@CityId),
(737107,@CityId),(737120,@CityId),(737131,@CityId),(737132,@CityId),
(737133,@CityId),(737134,@CityId),(737135,@CityId),(737136,@CityId);

/* ===============================
   CITY: WEST SIKKIM
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('WEST SIKKIM', @LocationId_Sikkim);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(737111,@CityId),(737113,@CityId),(737121,@CityId);

/* ===============================
   CITY: NORTH SIKKIM
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('NORTH SIKKIM', @LocationId_Sikkim);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(737116,@CityId);

/* ===============================
   CITY: SOUTH SIKKIM
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SOUTH SIKKIM', @LocationId_Sikkim);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(737126,@CityId),(737128,@CityId),(737139,@CityId);
go
DECLARE @LocationId_TamilNadu INT;
INSERT INTO Locations (Name) VALUES ('Tamil Nadu');
SET @LocationId_TamilNadu = SCOPE_IDENTITY();

DECLARE @CityId INT;

/* ===============================
   CITY: CHENNAI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('CHENNAI', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(600113,@CityId),(600112,@CityId),(600108,@CityId),(600107,@CityId),
(600106,@CityId),(600104,@CityId),(600102,@CityId),(600101,@CityId),
(600099,@CityId),(600098,@CityId),(600094,@CityId),(600093,@CityId),
(600092,@CityId),(600090,@CityId),(600086,@CityId),(600085,@CityId),
(600084,@CityId),(600083,@CityId),(600082,@CityId),(600081,@CityId),
(600079,@CityId),(600078,@CityId),(600042,@CityId),(600040,@CityId),
(600039,@CityId),(600038,@CityId),(600036,@CityId),(600035,@CityId),
(600034,@CityId),(600033,@CityId),(600032,@CityId),(600031,@CityId),
(600030,@CityId),(600029,@CityId),(600028,@CityId),(600026,@CityId),
(600025,@CityId),(600024,@CityId),(600023,@CityId),(600022,@CityId),
(600021,@CityId),(600020,@CityId),(600018,@CityId),(600017,@CityId),
(600015,@CityId),(600014,@CityId),(600013,@CityId),(600012,@CityId),
(600011,@CityId),(600010,@CityId),(600009,@CityId),(600008,@CityId),
(600007,@CityId),(600006,@CityId),(600005,@CityId),(600004,@CityId),
(600003,@CityId),(600002,@CityId),(600001,@CityId);

/* ===============================
   CITY: COIMBATORE
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('COIMBATORE', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(641668,@CityId),(641659,@CityId),(641653,@CityId),(641407,@CityId),
(641402,@CityId),(641401,@CityId),(641305,@CityId),(641302,@CityId),
(641301,@CityId),(641202,@CityId),(641201,@CityId),(641114,@CityId),
(641113,@CityId),(641112,@CityId),(641111,@CityId),(641110,@CityId),
(641109,@CityId),(641108,@CityId),(641107,@CityId),(641105,@CityId),
(641104,@CityId),(641103,@CityId),(641101,@CityId),(641062,@CityId),
(641050,@CityId),(641049,@CityId),(641048,@CityId),(641047,@CityId),
(641046,@CityId),(641045,@CityId),(641044,@CityId),(641043,@CityId),
(641042,@CityId),(641041,@CityId),(641039,@CityId),(641038,@CityId),
(641037,@CityId),(641036,@CityId),(641035,@CityId),(641034,@CityId),
(641033,@CityId),(641032,@CityId),(641031,@CityId),(641030,@CityId),
(641029,@CityId),(641028,@CityId),(641027,@CityId),(641026,@CityId),
(641025,@CityId),(641024,@CityId),(641023,@CityId),(641022,@CityId),
(641021,@CityId),(641020,@CityId),(641019,@CityId),(641018,@CityId),
(641017,@CityId),(641016,@CityId),(641015,@CityId),(641014,@CityId),
(641013,@CityId),(641012,@CityId),(641011,@CityId),(641010,@CityId),
(641009,@CityId),(641008,@CityId),(641007,@CityId),(641006,@CityId),
(641005,@CityId),(641004,@CityId),(641003,@CityId),(641002,@CityId),
(641001,@CityId),(642002,@CityId);

/* ===============================
   CITY: CUDDALORE
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('CUDDALORE', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(607803,@CityId),(608001,@CityId),(608502,@CityId),(606003,@CityId),(607403,@CityId),(605001,@CityId);

/* ===============================
   CITY: DINDIGUL
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('DINDIGUL', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(624619,@CityId),(624002,@CityId);

/* ===============================
   CITY: ERODE
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('ERODE', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(638002,@CityId),(638001,@CityId);

/* ===============================
   CITY: KANCHIPURAM
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KANCHIPURAM', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(603210,@CityId),(603209,@CityId),(603204,@CityId),(603203,@CityId),(603202,@CityId),
(603112,@CityId),(603104,@CityId),(603103,@CityId),(602117,@CityId),(602106,@CityId),
(602105,@CityId),(601301,@CityId),(600132,@CityId),(600131,@CityId),(600130,@CityId),
(600129,@CityId),(600128,@CityId),(600127,@CityId),(600126,@CityId),(600125,@CityId),
(600122,@CityId),(600119,@CityId),(600117,@CityId),(600115,@CityId),(600100,@CityId),
(603102,@CityId),(603211,@CityId),(603002,@CityId),(631501,@CityId),(631502,@CityId),(603001,@CityId),(603306,@CityId);

/* ===============================
   CITY: KANYAKUMARI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KANYAKUMARI', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(629852,@CityId),(629001,@CityId),(629002,@CityId),(629801,@CityId);

/* ===============================
   CITY: KARAIKAL
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KARAIKAL', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(609609,@CityId),(609606,@CityId),(609605,@CityId),(609602,@CityId);

/* ===============================
   CITY: KARUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KARUR', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(639005,@CityId),(639004,@CityId),(639002,@CityId);

/* ===============================
   CITY: KRISHNAGIRI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KRISHNAGIRI', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(635130,@CityId),(635110,@CityId),(635207,@CityId),(635001,@CityId),(635109,@CityId);

/* ===============================
   CITY: MADURAI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('MADURAI', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(625107,@CityId),(625007,@CityId),(625001,@CityId),(625003,@CityId),(625017,@CityId),
(625016,@CityId),(625014,@CityId),(625501,@CityId),(625301,@CityId);

/* ===============================
   CITY: NAGAPATTINAM
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('NAGAPATTINAM', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(614810,@CityId),(614808,@CityId),(614807,@CityId),(614714,@CityId),(614712,@CityId),
(611108,@CityId),(611002,@CityId),(611001,@CityId);

/* ===============================
   CITY: NILGIRIS
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('NILGIRIS', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(643209,@CityId);

/* ===============================
   CITY: PONDICHERRY
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('PONDICHERRY', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(607403,@CityId),(605001,@CityId);

/* ===============================
   CITY: RAMANATHAPURAM
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('RAMANATHAPURAM', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(623503,@CityId);

/* ===============================
   CITY: SALEM
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SALEM', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(636008,@CityId),(636002,@CityId),(636201,@CityId),(636010,@CityId),(636016,@CityId),
(636005,@CityId),(636001,@CityId);

/* ===============================
   CITY: SIVAGANGA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SIVAGANGA', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(630202,@CityId),(630002,@CityId),(630001,@CityId);

/* ===============================
   CITY: THANJAVUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('THANJAVUR', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(614707,@CityId),(613501,@CityId),(613007,@CityId),(612001,@CityId);

/* ===============================
   CITY: THENI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('THENI', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(625512,@CityId);

/* ===============================
   CITY: TIRUCHIRAPPALLI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('TIRUCHIRAPPALLI', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(621216,@CityId),(620004,@CityId),(621712,@CityId),(620005,@CityId),
(620003,@CityId),(620015,@CityId),(620017,@CityId);

/* ===============================
   CITY: TIRUNELVELI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('TIRUNELVELI', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(627604,@CityId),(627811,@CityId),(627006,@CityId);

/* ===============================
   CITY: TIRUPPUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('TIRUPPUR', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(641697,@CityId),(641671,@CityId),(641669,@CityId),(641666,@CityId),(641664,@CityId),
(641662,@CityId),(641658,@CityId),(641655,@CityId),(641654,@CityId),(641603,@CityId),
(641605,@CityId);

/* ===============================
   CITY: TIRUVALLUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('TIRUVALLUR', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(602001,@CityId),(601102,@CityId),(600123,@CityId),(600120,@CityId),(600118,@CityId),
(600116,@CityId),(600095,@CityId),(600087,@CityId),(600077,@CityId),(600076,@CityId),
(600071,@CityId),(600068,@CityId),(600067,@CityId),(600066,@CityId),(600062,@CityId),
(600060,@CityId),(600058,@CityId),(600057,@CityId),(600056,@CityId),(600054,@CityId),
(600051,@CityId),(600050,@CityId),(600049,@CityId),(600037,@CityId),(600019,@CityId),
(600052,@CityId),(602021,@CityId),(601201,@CityId),(602002,@CityId),(600055,@CityId);

/* ===============================
   CITY: TIRUVANNAMALAI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('TIRUVANNAMALAI', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(635703,@CityId),(606707,@CityId),(606803,@CityId),(606601,@CityId);

/* ===============================
   CITY: TIRUVARUR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('TIRUVARUR', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(610001,@CityId);

/* ===============================
   CITY: TUTICORIN
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('TUTICORIN', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(628103,@CityId),(628007,@CityId),(628003,@CityId);

/* ===============================
   CITY: VELLORE
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('VELLORE', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(632513,@CityId),(632014,@CityId),(632011,@CityId),(631002,@CityId),
(632001,@CityId),(632006,@CityId),(632105,@CityId),(631001,@CityId),
(632009,@CityId);

/* ===============================
   CITY: VILLUPURAM
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('VILLUPURAM', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(604303,@CityId);

/* ===============================
   CITY: VIRUDHUNAGAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('VIRUDHUNAGAR', @LocationId_TamilNadu);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(626123,@CityId),(626102,@CityId),(626111,@CityId);
go
DECLARE @LocationId_Telangana INT;
INSERT INTO Locations (Name) VALUES ('Telangana');
SET @LocationId_Telangana = SCOPE_IDENTITY();

DECLARE @CityId INT;

/* ===============================
   CITY: ADILABAD
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('ADILABAD', @LocationId_Telangana);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(504001,@CityId);

/* ===============================
   CITY: HANAMKONDA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('HANAMKONDA', @LocationId_Telangana);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(506142,@CityId);

/* ===============================
   CITY: HYDERABAD
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('HYDERABAD', @LocationId_Telangana);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(501101,@CityId),(500101,@CityId),(500096,@CityId),(500095,@CityId),(500093,@CityId),
(500091,@CityId),(500085,@CityId),(500082,@CityId),(500081,@CityId),(500078,@CityId),
(500073,@CityId),(500072,@CityId),(500066,@CityId),(500065,@CityId),(500064,@CityId),
(500063,@CityId),(500059,@CityId),(500057,@CityId),(500055,@CityId),(500054,@CityId),
(500053,@CityId),(500050,@CityId),(500045,@CityId),(500043,@CityId),(500042,@CityId),
(500041,@CityId),(500038,@CityId),(500034,@CityId),(500033,@CityId),(500031,@CityId),
(500028,@CityId),(500024,@CityId),(500023,@CityId),(500022,@CityId),(500016,@CityId),
(500015,@CityId),(500014,@CityId),(500012,@CityId),(500011,@CityId),(500010,@CityId),
(500009,@CityId),(500008,@CityId),(500006,@CityId),(500004,@CityId),(500003,@CityId),
(500002,@CityId),(500001,@CityId),(500007,@CityId),(500013,@CityId),(500017,@CityId),
(500020,@CityId),(500025,@CityId),(500026,@CityId),(500027,@CityId),(500029,@CityId),
(500040,@CityId),(500044,@CityId),(500047,@CityId),(500056,@CityId),(500061,@CityId),
(500062,@CityId),(500080,@CityId),(500087,@CityId),(500088,@CityId),(500094,@CityId);

/* ===============================
   CITY: JAGTIAL
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('JAGTIAL', @LocationId_Telangana);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(505327,@CityId);

/* ===============================
   CITY: KAMAREDDY
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KAMAREDDY', @LocationId_Telangana);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(503111,@CityId);

/* ===============================
   CITY: KARIM NAGAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KARIM NAGAR', @LocationId_Telangana);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(505001,@CityId),(505468,@CityId);

/* ===============================
   CITY: KHAMMAM
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KHAMMAM', @LocationId_Telangana);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(507003,@CityId),(507301,@CityId),(507208,@CityId),(507001,@CityId),(507122,@CityId),
(507002,@CityId);

/* ===============================
   CITY: KOTHAGUDEM
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KOTHAGUDEM', @LocationId_Telangana);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(507306,@CityId),(507115,@CityId);

/* ===============================
   CITY: KOTHAGUDEM COLLS
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('KOTHAGUDEM COLLS', @LocationId_Telangana);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(507101,@CityId),(507111,@CityId);

/* ===============================
   CITY: MAHABUB NAGAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('MAHABUB NAGAR', @LocationId_Telangana);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(509001,@CityId);

/* ===============================
   CITY: MANCHERIAL
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('MANCHERIAL', @LocationId_Telangana);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(504208,@CityId),(504303,@CityId);

/* ===============================
   CITY: NALGONDA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('NALGONDA', @LocationId_Telangana);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(508210,@CityId),(508001,@CityId),(508250,@CityId);

/* ===============================
   CITY: NIRMAL
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('NIRMAL', @LocationId_Telangana);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(504106,@CityId);

/* ===============================
   CITY: NIZAMABAD
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('NIZAMABAD', @LocationId_Telangana);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(503224,@CityId),(503124,@CityId),(503001,@CityId);

/* ===============================
   CITY: PARKAL
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('PARKAL', @LocationId_Telangana);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(506343,@CityId),(506319,@CityId);

/* ===============================
   CITY: PEDDAPALLI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('PEDDAPALLI', @LocationId_Telangana);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(505209,@CityId),(505210,@CityId),(505211,@CityId),(505214,@CityId);

/* ===============================
   CITY: RANGAREDDY
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('RANGAREDDY', @LocationId_Telangana);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(501512,@CityId),(501511,@CityId),(501510,@CityId),(501509,@CityId),(501508,@CityId),
(501506,@CityId),(501505,@CityId),(501504,@CityId),(501503,@CityId),(501502,@CityId),
(501501,@CityId),(501401,@CityId),(501218,@CityId),(501203,@CityId),(501158,@CityId),
(501144,@CityId),(501143,@CityId),(501142,@CityId),(501141,@CityId),(501121,@CityId),
(501111,@CityId),(501106,@CityId),(500100,@CityId),(500097,@CityId),(500090,@CityId),
(500089,@CityId),(500086,@CityId),(500084,@CityId),(500079,@CityId),(500077,@CityId),
(500075,@CityId),(500069,@CityId),(500067,@CityId),(500058,@CityId),(500052,@CityId),
(500048,@CityId),(500046,@CityId),(500037,@CityId),(500035,@CityId),(500032,@CityId),
(500030,@CityId),(500019,@CityId),(500018,@CityId),(500005,@CityId),(500036,@CityId),
(500039,@CityId),(500074,@CityId),(500076,@CityId),(500068,@CityId),(509216,@CityId),
(500070,@CityId);

/* ===============================
   CITY: SANGAREDDY
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SANGAREDDY', @LocationId_Telangana);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(502220,@CityId),(502001,@CityId),(502313,@CityId),(502291,@CityId),(502032,@CityId);

/* ===============================
   CITY: SIDDIPET
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SIDDIPET', @LocationId_Telangana);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(502103,@CityId);

/* ===============================
   CITY: SIRCILLA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SIRCILLA', @LocationId_Telangana);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(505302,@CityId),(505301,@CityId);

/* ===============================
   CITY: SURYAPET
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SURYAPET', @LocationId_Telangana);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(508213,@CityId);

/* ===============================
   CITY: TRIMULGHERRY
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('TRIMULGHERRY', @LocationId_Telangana);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(500049,@CityId);

/* ===============================
   CITY: WARANGAL
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('WARANGAL', @LocationId_Telangana);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(506122,@CityId),(506002,@CityId),(506004,@CityId),(506310,@CityId),(506163,@CityId),(506001,@CityId);
go
DECLARE @LocationId_Tripura INT;
INSERT INTO Locations (Name) VALUES ('Tripura');
SET @LocationId_Tripura = SCOPE_IDENTITY();

DECLARE @CityId INT;

/* ===============================
   CITY: DHALAI
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('DHALAI', @LocationId_Tripura);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(799278,@CityId),(799286,@CityId),(799289,@CityId);

/* ===============================
   CITY: SOUTH TRIPURA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('SOUTH TRIPURA', @LocationId_Tripura);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(799120,@CityId),(799144,@CityId),(799145,@CityId),(799142,@CityId),(799114,@CityId);

/* ===============================
   CITY: WEST TRIPURA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('WEST TRIPURA', @LocationId_Tripura);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(799035,@CityId),(799012,@CityId),(799001,@CityId),(799008,@CityId),(799003,@CityId),
(799102,@CityId),(799002,@CityId),(799007,@CityId),(799006,@CityId),(799014,@CityId),
(799005,@CityId),(799009,@CityId),(799201,@CityId),(799103,@CityId),(799203,@CityId);
go
DECLARE @LocationId_Uttarakhand INT;
INSERT INTO Locations (Name) VALUES ('Uttarakhand');
SET @LocationId_Uttarakhand = SCOPE_IDENTITY();

DECLARE @CityId INT;

/* ===============================
   CITY: ALMORA
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('ALMORA', @LocationId_Uttarakhand);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(263601,@CityId),(263645,@CityId);

/* ===============================
   CITY: DEHRADUN
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('DEHRADUN', @LocationId_Uttarakhand);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(248145,@CityId),(248013,@CityId),(248140,@CityId),(248001,@CityId),(248146,@CityId),
(249205,@CityId),(248006,@CityId),(248005,@CityId),(248195,@CityId),(249408,@CityId),
(248009,@CityId),(248007,@CityId),(249201,@CityId);

/* ===============================
   CITY: HARIDWAR
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('HARIDWAR', @LocationId_Uttarakhand);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(247667,@CityId),(249407,@CityId),(249401,@CityId),(249403,@CityId),(249402,@CityId);

/* ===============================
   CITY: NAINITAL
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('NAINITAL', @LocationId_Uttarakhand);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(263148,@CityId),(263139,@CityId),(263153,@CityId),(263135,@CityId),(244713,@CityId);

/* ===============================
   CITY: PAURI GARHWAL
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('PAURI GARHWAL', @LocationId_Uttarakhand);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(249302,@CityId),(246149,@CityId);
go
DECLARE @LocationId_WestBengal INT;
INSERT INTO Locations (Name) VALUES ('West Bengal');
SET @LocationId_WestBengal = SCOPE_IDENTITY();

DECLARE @CityId INT;

/* ===============================
   CITY: Asansol
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('Asansol', @LocationId_WestBengal);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(713383,@CityId);

/* ===============================
   CITY: Bankura
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('Bankura', @LocationId_WestBengal);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(722138,@CityId),(722139,@CityId),(722140,@CityId),(722141,@CityId),(722142,@CityId),
(722143,@CityId),(722144,@CityId),(722146,@CityId),(722147,@CityId),(722148,@CityId),
(722149,@CityId),(722150,@CityId),(722151,@CityId),(722152,@CityId),(722153,@CityId),
(722154,@CityId),(722155,@CityId),(722156,@CityId),(722157,@CityId),(722158,@CityId),
(722160,@CityId),(722161,@CityId),(722162,@CityId),(722164,@CityId),(722173,@CityId),
(722183,@CityId),(722201,@CityId),(722202,@CityId),(722203,@CityId),(722204,@CityId),
(722205,@CityId),(722206,@CityId),(722207,@CityId),(722208,@CityId),(722101,@CityId);

/* ===============================
   CITY: Bardhaman
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('Bardhaman', @LocationId_WestBengal);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(713101,@CityId),(713102,@CityId),(713103,@CityId),(713104,@CityId),(713124,@CityId),
(713125,@CityId),(713141,@CityId),(713142,@CityId),(713143,@CityId),(713144,@CityId),
(713145,@CityId),(713146,@CityId),(713147,@CityId),(713148,@CityId),(713149,@CityId),
(713150,@CityId),(713151,@CityId),(713152,@CityId),(713153,@CityId),(713154,@CityId),
(713156,@CityId),(713166,@CityId),(713201,@CityId),(713202,@CityId),(713203,@CityId),
(713204,@CityId),(713205,@CityId),(713206,@CityId),(713207,@CityId),(713208,@CityId),
(713209,@CityId),(713210,@CityId),(713211,@CityId),(713212,@CityId),(713213,@CityId),
(713214,@CityId),(713215,@CityId),(713216,@CityId),(713217,@CityId),(713301,@CityId),
(713302,@CityId),(713303,@CityId),(713304,@CityId),(713305,@CityId),(713315,@CityId),
(713321,@CityId),(713322,@CityId),(713323,@CityId),(713324,@CityId),(713325,@CityId),
(713326,@CityId),(713330,@CityId),(713331,@CityId),(713332,@CityId),(713333,@CityId),
(713334,@CityId),(713335,@CityId),(713336,@CityId),(713337,@CityId),(713338,@CityId),
(713339,@CityId),(713340,@CityId),(713341,@CityId),(713342,@CityId),(713343,@CityId),
(713344,@CityId),(713346,@CityId),(713347,@CityId),(713357,@CityId),(713358,@CityId),
(713365,@CityId),(713369,@CityId),(713370,@CityId),(713371,@CityId),(713372,@CityId),
(713373,@CityId),(713376,@CityId),(713378,@CityId),(713381,@CityId),(713384,@CityId),
(713385,@CityId),(713386,@CityId),(713401,@CityId),(713403,@CityId),(713404,@CityId),
(713405,@CityId),(713406,@CityId),(713407,@CityId),(713408,@CityId),(713409,@CityId),
(713420,@CityId),(713421,@CityId),(713422,@CityId),(713423,@CityId),(713424,@CityId),
(713426,@CityId),(713427,@CityId),(713428,@CityId),(713434,@CityId),(713502,@CityId),
(713512,@CityId),(713513,@CityId),(713514,@CityId),(713515,@CityId),(713519,@CityId),
(713520,@CityId),(713380,@CityId);

/* ===============================
   CITY: Birbhum
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('Birbhum', @LocationId_WestBengal);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(731101,@CityId),(731102,@CityId),(731103,@CityId),(731104,@CityId),(731121,@CityId),
(731123,@CityId),(731124,@CityId),(731125,@CityId),(731126,@CityId),(731127,@CityId),
(731129,@CityId),(731130,@CityId),(731132,@CityId),(731133,@CityId),(731201,@CityId),
(731202,@CityId),(731204,@CityId),(731213,@CityId),(731214,@CityId),(731216,@CityId),
(731219,@CityId),(731220,@CityId),(731221,@CityId),(731222,@CityId),(731223,@CityId),
(731233,@CityId),(731234,@CityId),(731235,@CityId),(731236,@CityId),(731237,@CityId),
(731238,@CityId),(731240,@CityId),(731241,@CityId),(731242,@CityId),(731243,@CityId),
(731244,@CityId),(731245,@CityId);

/* ===============================
   CITY: Cooch Behar
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('Cooch Behar', @LocationId_WestBengal);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(736101,@CityId),(736133,@CityId),(736145,@CityId),(736156,@CityId),(736165,@CityId),
(736170,@CityId),(736179,@CityId);

/* ===============================
   CITY: Darjeeling
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('Darjeeling', @LocationId_WestBengal);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(734434,@CityId),(734001,@CityId),(734002,@CityId),(734003,@CityId),(734004,@CityId),
(734005,@CityId),(734006,@CityId),(734007,@CityId),(734008,@CityId),(734009,@CityId),
(734011,@CityId),(734012,@CityId),(734013,@CityId),(734014,@CityId),(734015,@CityId),
(734101,@CityId),(734102,@CityId),(734103,@CityId),(734104,@CityId),(734105,@CityId),
(734201,@CityId),(734203,@CityId),(734204,@CityId),(734213,@CityId),(734214,@CityId),
(734215,@CityId),(734216,@CityId),(734217,@CityId),(734218,@CityId),(734220,@CityId),
(734221,@CityId),(734222,@CityId),(734223,@CityId),(734224,@CityId),(734226,@CityId),
(734301,@CityId),(734311,@CityId),(734312,@CityId),(734313,@CityId),(734314,@CityId),
(734315,@CityId),(734316,@CityId),(734421,@CityId),(734423,@CityId),(734424,@CityId),
(734426,@CityId),(734427,@CityId),(734429,@CityId),(734503,@CityId),(735231,@CityId);

/* ===============================
   CITY: Durgapur
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('Durgapur', @LocationId_WestBengal);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(713155,@CityId),(713158,@CityId),(713160,@CityId),(713162,@CityId),(713165,@CityId),
(713167,@CityId),(713172,@CityId),(713173,@CityId),(713218,@CityId),(713219,@CityId),
(713368,@CityId),(713375,@CityId),(713377,@CityId),(713402,@CityId),(713419,@CityId),
(713432,@CityId),(713433,@CityId);

/* ===============================
   CITY: East Midnapore
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('East Midnapore', @LocationId_WestBengal);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(721134,@CityId),(721137,@CityId),(721139,@CityId),(721151,@CityId),(721152,@CityId),
(721153,@CityId),(721154,@CityId),(721158,@CityId),(721171,@CityId),(721172,@CityId),
(721401,@CityId),(721422,@CityId),(721425,@CityId),(721441,@CityId),(721442,@CityId),
(721443,@CityId),(721444,@CityId),(721446,@CityId),(721447,@CityId),(721448,@CityId),
(721449,@CityId),(721450,@CityId),(721452,@CityId),(721453,@CityId),(721454,@CityId),
(721455,@CityId),(721456,@CityId),(721458,@CityId),(721463,@CityId),(721601,@CityId),
(721602,@CityId),(721603,@CityId),(721604,@CityId),(721606,@CityId),(721607,@CityId),
(721625,@CityId),(721626,@CityId),(721627,@CityId),(721628,@CityId),(721629,@CityId),
(721631,@CityId),(721632,@CityId),(721633,@CityId),(721634,@CityId),(721635,@CityId),
(721636,@CityId),(721642,@CityId),(721643,@CityId),(721644,@CityId),(721645,@CityId),
(721646,@CityId),(721647,@CityId),(721648,@CityId),(721649,@CityId),(721650,@CityId),
(721651,@CityId),(721652,@CityId),(721653,@CityId),(721654,@CityId),(721655,@CityId),
(721656,@CityId);
/* ===============================
   CITY: HOOGHLY
   =============================== */
INSERT INTO Cities (Name, LocationId) VALUES ('Hooghly', @LocationId_WestBengal);
SET @CityId = SCOPE_IDENTITY();

INSERT INTO Pincodes (Pincode, CityId) VALUES
(712708, @CityId), (712707, @CityId), (712706, @CityId), (712705, @CityId),
(712704, @CityId), (712702, @CityId), (712701, @CityId), (712617, @CityId),
(712616, @CityId), (712615, @CityId), (712614, @CityId), (712613, @CityId),
(712612, @CityId), (712611, @CityId), (712602, @CityId), (712601, @CityId),
(712515, @CityId), (712514, @CityId), (712513, @CityId), (712512, @CityId),
(712504, @CityId), (712503, @CityId), (712502, @CityId), (712501, @CityId),
(712426, @CityId), (712424, @CityId), (712419, @CityId), (712418, @CityId),
(712417, @CityId), (712416, @CityId), (712415, @CityId), (712414, @CityId),
(712413, @CityId), (712412, @CityId), (712411, @CityId), (712410, @CityId),
(712409, @CityId), (712408, @CityId), (712407, @CityId), (712406, @CityId),
(712405, @CityId), (712404, @CityId), (712403, @CityId), (712402, @CityId),
(712401, @CityId), (712311, @CityId), (712310, @CityId), (712308, @CityId),
(712306, @CityId), (712305, @CityId), (712304, @CityId), (712303, @CityId),
(712302, @CityId), (712301, @CityId), (712258, @CityId), (712250, @CityId),
(712249, @CityId), (712248, @CityId), (712247, @CityId), (712246, @CityId),
(712245, @CityId), (712235, @CityId), (712234, @CityId), (712233, @CityId),
(712232, @CityId), (712223, @CityId), (712222, @CityId), (712221, @CityId),
(712204, @CityId), (712203, @CityId), (712202, @CityId), (712201, @CityId),
(712152, @CityId), (712149, @CityId), (712148, @CityId), (712147, @CityId),
(712146, @CityId), (712139, @CityId), (712138, @CityId), (712137, @CityId),
(712136, @CityId), (712135, @CityId), (712134, @CityId), (712125, @CityId),
(712124, @CityId), (712123, @CityId), (712122, @CityId), (712121, @CityId),
(712105, @CityId), (712104, @CityId), (712103, @CityId), (712102, @CityId),
(712101, @CityId), (713157, @CityId), (713170, @CityId), (712150, @CityId),
(712205, @CityId), (712206, @CityId), (712208, @CityId), (712224, @CityId),
(712331, @CityId), (712344, @CityId), (712420, @CityId), (713168, @CityId),
(721163, @CityId), (721315, @CityId), (732001, @CityId), (743195, @CityId),
(743443, @CityId);
INSERT INTO Cities (Name, LocationId) VALUES ('Puruliya', @LocationId_WestBengal);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES
(723101, @CityId), (723102, @CityId), (723103, @CityId), (723104, @CityId),
(723121, @CityId), (723127, @CityId), (723128, @CityId), (723129, @CityId),
(723130, @CityId), (723131, @CityId), (723132, @CityId), (723143, @CityId),
(723146, @CityId), (723147, @CityId), (723148, @CityId), (723149, @CityId),
(723151, @CityId), (723152, @CityId), (723153, @CityId), (723154, @CityId),
(723155, @CityId), (723156, @CityId), (723161, @CityId), (723168, @CityId),
(723212, @CityId),(723213, @CityId);
-- ===============================
-- CITY: Puruliya
-- ===============================
INSERT INTO Cities (Name, LocationId) VALUES ('Puruliya', @LocationId_WestBengal);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES
(723101, @CityId),(723102, @CityId),(723103, @CityId),(723104, @CityId),
(723121, @CityId),(723127, @CityId),(723128, @CityId),(723129, @CityId),
(723130, @CityId),(723131, @CityId),(723132, @CityId),(723143, @CityId),
(723146, @CityId),(723147, @CityId),(723148, @CityId),(723149, @CityId),
(723151, @CityId),(723152, @CityId),(723153, @CityId),(723154, @CityId),
(723155, @CityId),(723156, @CityId),(723161, @CityId),(723168, @CityId),
(723212, @CityId);

-- ===============================
-- CITY: Siliguri-Darjiling
-- ===============================
INSERT INTO Cities (Name, LocationId) VALUES ('Siliguri-Darjiling', @LocationId_WestBengal);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES
(734121, @CityId),(734123, @CityId),(734227, @CityId),(734317, @CityId),
(734319, @CityId),(734320, @CityId),(734321, @CityId),(734431, @CityId);

-- ===============================
-- CITY: South 24 Parganas
-- ===============================
INSERT INTO Cities (Name, LocationId) VALUES ('South 24 Parganas', @LocationId_WestBengal);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES
(743613,@CityId),(743611,@CityId),(743610,@CityId),(743609,@CityId),
(743513,@CityId),(743504,@CityId),(743503,@CityId),(743502,@CityId),
(743399,@CityId),(743398,@CityId),(743395,@CityId),(743387,@CityId),
(743383,@CityId),(743378,@CityId),(743377,@CityId),(743376,@CityId),
(743375,@CityId),(743374,@CityId),(743373,@CityId),(743372,@CityId),
(743371,@CityId),(743370,@CityId),(743368,@CityId),(743363,@CityId),
(743357,@CityId),(743356,@CityId),(743355,@CityId),(743354,@CityId),
(743351,@CityId),(743349,@CityId),(743348,@CityId),(743347,@CityId),
(743345,@CityId),(743338,@CityId),(743337,@CityId),(743336,@CityId),
(743332,@CityId),(743331,@CityId),(743330,@CityId),(743329,@CityId),
(743318,@CityId),(743312,@CityId),(700154,@CityId),(700153,@CityId),
(700152,@CityId),(700151,@CityId),(700150,@CityId),(700149,@CityId),
(700148,@CityId),(700147,@CityId),(700146,@CityId),(700145,@CityId),
(700144,@CityId),(700143,@CityId),(700142,@CityId),(700141,@CityId),
(700140,@CityId),(700139,@CityId),(700138,@CityId),(700137,@CityId),
(700105,@CityId),(700104,@CityId),(700103,@CityId),(700096,@CityId),
(700093,@CityId),(700084,@CityId),(700070,@CityId);

-- ===============================
-- CITY: South Dinajpur
-- ===============================
INSERT INTO Cities (Name, LocationId) VALUES ('South Dinajpur', @LocationId_WestBengal);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES
(733101,@CityId);

-- ===============================
-- CITY: West Midnapore
-- ===============================
INSERT INTO Cities (Name, LocationId) VALUES ('West Midnapore', @LocationId_WestBengal);
SET @CityId = SCOPE_IDENTITY();
INSERT INTO Pincodes (Pincode, CityId) VALUES
(721124,@CityId),(721125,@CityId),(721126,@CityId),(721127,@CityId),
(721128,@CityId),(721129,@CityId),(721130,@CityId),(721131,@CityId),
(721132,@CityId),(721136,@CityId),(721140,@CityId),(721143,@CityId),
(721144,@CityId),(721145,@CityId),(721147,@CityId),(721148,@CityId),
(721149,@CityId),(721150,@CityId),(721155,@CityId),(721156,@CityId),
(721157,@CityId),(721160,@CityId),(721166,@CityId),(721201,@CityId),
(721211,@CityId),(721212,@CityId),(721222,@CityId),(721232,@CityId),
(721242,@CityId),(721253,@CityId),(721260,@CityId),(721301,@CityId),
(721302,@CityId),(721303,@CityId),(721304,@CityId),(721305,@CityId),
(721306,@CityId),(721420,@CityId),(721424,@CityId),(721426,@CityId),
(721436,@CityId),(721437,@CityId),(721445,@CityId),(721451,@CityId),
(721457,@CityId),(721467,@CityId),(721501,@CityId),(721503,@CityId),
(721504,@CityId),(721515,@CityId),(721516,@CityId),(721641,@CityId),
(734010,@CityId),(721507,@CityId),(721101,@CityId);




