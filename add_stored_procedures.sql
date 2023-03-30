


CREATE OR ALTER PROCEDURE dbo.spAddUser (
	@Firstname VARCHAR(100),
	@Lastname VARCHAR(100),
	@DepartmentId INT, 
	@CreatedBy INT, 
	@RoleId INT 
)
AS
BEGIN
	DECLARE @UserId INT
	
	INSERT INTO [dbo].[Users]
           ([Firstname]
           ,[Lastname]
           ,[DepartmentId]
           ,[InsertDate]
           ,[UpdateDate]
           ,[StartDate]
           ,[EndDate]
           ,[CreatedBy]
           ,[UpdatedBy]
		   ,[Valid])
     VALUES (
           @Firstname --(<Firstname, varchar(100),>
           ,@Lastname --<Lastname, varchar(100),>
           ,@DepartmentId --<DepartmentId, int,>
           ,GETDATE() --<InsertDate, datetime,>
           ,NULL --<UpdateDate, datetime,>
           ,GETDATE() --<StartDate, datetime,>
           ,NULL -- <EndDate, datetime,>
           ,@CreatedBy --<CreatedBy, int,>
           ,NULL --<UpdatedBy, int,>
			,1
	)

	SELECT @UserId = SCOPE_IDENTITY()

	INSERT INTO [dbo].[UserRoles]
           ([UserId]
           ,[RoleId]
           ,[InsertDate]
           ,[UpdateDate]
           ,[StartDate]
           ,[EndDate]
           ,[CreatedBy]
           ,[UpdatedBy]
		   ,[Valid])
     VALUES (
		   @UserId --<UserId, int,>
           ,@RoleId --<RoleId, int,>
           ,GETDATE() --<InsertDate, datetime,>
           ,NULL --<UpdateDate, datetime,>
           ,GETDATE() --<StartDate, datetime,>
           ,NULL --<EndDate, datetime,>
           ,@CreatedBy --<CreatedBy, int,>
           ,NULL --<UpdatedBy, int,>
			,1
		  )


	SELECT @UserId AS UserId
	
END
GO



CREATE OR ALTER PROCEDURE dbo.spUpdateUser (
	@UserId INT,
	@Firstname VARCHAR(100),
	@Lastname VARCHAR(100),
	@DepartmentId INT, 
	@UpdatedBy INT, 
	@RoleId INT 
)
AS
BEGIN
	UPDATE [dbo].[Users]
	SET 
		[Firstname] = @Firstname
      ,[Lastname] = @Lastname
      ,[DepartmentId] = @DepartmentId
      ,[UpdateDate] = GETDATE()
      ,[UpdatedBy] = @UpdatedBy
	WHERE Id = @UserId

	UPDATE [dbo].[UserRoles]
	SET 
      [RoleId] = @RoleId
      ,[UpdateDate] = GETDATE()
      ,[UpdatedBy] = @UpdatedBy
	WHERE RoleId = @RoleId AND UserId = @UserId


	-- invalidate using Valid column
	-- inserting a new one


	SELECT @UserId AS UserId
END

