CREATE TABLE MsUserPrivileges (
    UserId INT,
    PrivilegeId INT,
    FOREIGN KEY (UserId) REFERENCES MsUsers(Id)
);