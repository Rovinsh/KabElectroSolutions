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
