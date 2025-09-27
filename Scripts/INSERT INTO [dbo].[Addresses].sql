USE [KabElectroSolutions]
GO

INSERT INTO [dbo].[Addresses]
           ([UserId]
           ,[IsBusinessAddress]
           ,[AddressLine]
           ,[Location]
           ,[Pincode]
           ,[Latitude]
           ,[Longitude]
           ,[City]
           ,[State])
     VALUES
           (1
           ,0
           ,'B21 100ft road lajpat nagar near bajrang dharam kanta maholi road mathura 281001'
           ,1
           ,281001
           ,NULL
           ,NULL
           ,'"Mathura'
           ,'Uttar Pradesh')
GO

INSERT INTO [dbo].[Addresses]
           ([UserId]
           ,[IsBusinessAddress]
           ,[AddressLine]
           ,[Location]
           ,[Pincode]
           ,[Latitude]
           ,[Longitude]
           ,[City]
           ,[State])
     VALUES
           (1
           ,1
           ,'B21 100ft road lajpat nagar near bajrang dharam kanta maholi road mathura 281001'
           ,1
           ,281001
           ,NULL
           ,NULL
           ,'"Mathura'
           ,'Uttar Pradesh')
GO

