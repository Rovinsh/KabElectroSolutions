CREATE TABLE MsUserRoles (
    UserId INT,
    RoleId INT,
    FOREIGN KEY (UserId) REFERENCES MsUsers(Id)
);