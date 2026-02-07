CREATE TABLE MsReview (
    Id INT IDENTITY(1,1) PRIMARY KEY,      -- unique id
    UserId INT NOT NULL,                   -- foreign key
    Comment NVARCHAR(500) NOT NULL,
    Rating INT NOT NULL,
    CurrentDate DATE NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_MsReview_MsUser
        FOREIGN KEY (UserId)
        REFERENCES MsUsers(Id)
        ON DELETE CASCADE
);

INSERT INTO MsReview (UserId, Comment, Rating)
VALUES (1, 'Very good experience', 5);