USE [KabElectroSolutions]
GO

INSERT INTO [dbo].[MsUsers]
           ([Firstname]
           ,[Lastname]
           ,[Image]
           ,[Phone]
           ,[Email]
           ,[Empid]
           ,[Manager]
           ,[Authtoken]
           ,[ExecutiveId]
           ,[ChannelName]
           ,[Business]
           ,[BusinessPhone]
           ,[BusinessEmail]
           ,[Businessname]
           ,[Businessrole]
           ,[BusinessGst]
           ,[BusinessPan]
           ,[BusinessroleName]
           ,[IsActiveBusiness]
           ,[PasswordHash])
     VALUES
           ('MADHUVALA'
           ,'SHARMA'
           ,NULL
           ,'8433112032'
           ,'kabelectrosolutions@gmail.com'
           ,NULL
           ,NULL
           ,NULL
           ,NULL
           ,NULL
           ,1
           ,'8433112032'
           ,'kabelectrosolutions@gmail.com'
           ,'KAB ELECTRO SOLUTIONS'
           ,1
           ,'09IXPPS3444Q1Z6'
           ,'IXPPS3444Q'
           ,'Service Center Head'
           ,1
           ,'8433112032')
GO
update MsUsers set PasswordHash='$2a$11$gXYhUkelbL6EsIVNNDjlKOG9n41NtO6ckYMR5W6.b7YTzkRDZlz9q' where id=1

