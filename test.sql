

INSERT Departments
	SELECT 
		'Sales'
		,NULL
		,GETDATE()
		,NULL
		,NULL
		,NULL
		,1
		,1


INSERT Departments
	SELECT 
		'Accounting'
		,NULL
		,GETDATE()
		,NULL
		,NULL
		,NULL
		,1
		,1

INSERT Roles
	SELECT 
		'Admin'
		,GETDATE()
		,NULL
		,GETDATE()
		,NULL
		,NULL
		,NULL
		,1

INSERT Roles
	SELECT 
		'Reporter'
		,GETDATE()
		,NULL
		,GETDATE()
		,NULL
		,NULL
		,NULL
		,1


EXEC dbo.spAddUser
	@Firstname = 'Jhon',
	@Lastname = '',
	@DepartmentId = 1, 
	@CreatedBy  = NULL, 
	@RoleId = 1


EXEC dbo.spUpdateUser
	@UserId = 1,
	@Firstname = 'Jhon',
	@Lastname = 'Smith',
	@DepartmentId = 2, 
	@RoleId = 2,
	@UpdatedBy = NULL

SELECT  * FROM Departments NOLOCK
SELECT  * FROM Roles NOLOCK
SELECT  * FROM Users NOLOCK
SELECT  * FROM UserRoles NOLOCK