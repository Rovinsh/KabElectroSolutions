CREATE TABLE UserPrivileges (
    UserId INT,
    PrivilegeId INT,
    FOREIGN KEY (UserId) REFERENCES Users(Id)
);