CREATE TABLE UserRoles (
    UserId INT,
    RoleId INT,
    FOREIGN KEY (UserId) REFERENCES Users(Id)
);