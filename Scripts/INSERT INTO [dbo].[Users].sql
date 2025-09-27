USE [KabElectroSolutions]
GO

INSERT INTO [dbo].[Users]
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


