

DROP TABLE IF EXISTS UserRoles
DROP TABLE IF EXISTS Users
DROP TABLE IF EXISTS Departments
DROP TABLE IF EXISTS Roles


CREATE TABLE Departments (
	Id INT NOT NULL IDENTITY PRIMARY KEY,
	Name VARCHAR(100) NOT NULL,
	Description VARCHAR(150) NULL,
	InsertDate DATETIME NOT NULL DEFAULT(GETDATE()),
	UpdateDate DATETIME NULL,
	CreatedBy INT NULL,
	UpdatedBy INT NULL,
	Active BIT DEFAULT(1),
	Valid BIT DEFAULT(1)
)


CREATE TABLE Roles (
	Id INT NOT NULL IDENTITY PRIMARY KEY,
	Name VARCHAR(100) NOT NULL,
	InsertDate DATETIME NOT NULL DEFAULT(GETDATE()),
	UpdateDate DATETIME NULL,
	StartDate DATETIME NOT NULL DEFAULT(GETDATE()),
	EndDate DATETIME NULL,
	CreatedBy INT NULL,
	UpdatedBy INT NULL,
	Valid BIT DEFAULT(1)
)


CREATE TABLE Users (
	Id INT NOT NULL IDENTITY PRIMARY KEY,
	Firstname VARCHAR(100) NOT NULL,
	Lastname VARCHAR(100) NOT NULL,
	DepartmentId INT NOT NULL, 
	InsertDate DATETIME NOT NULL DEFAULT(GETDATE()),
	UpdateDate DATETIME NULL,
	StartDate DATETIME NOT NULL DEFAULT(GETDATE()),
	EndDate DATETIME NULL,
	CreatedBy INT NULL,
	UpdatedBy INT NULL,
	Valid BIT DEFAULT(1)
)

ALTER TABLE Users
	ADD CONSTRAINT fk_users_departments FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)


CREATE TABLE UserRoles (
	Id INT NOT NULL IDENTITY PRIMARY KEY,
	UserId INT NOT NULL,
	RoleId INT NOT NULL,
	InsertDate DATETIME NOT NULL DEFAULT(GETDATE()),
	UpdateDate DATETIME NULL,
	StartDate DATETIME NOT NULL DEFAULT(GETDATE()),
	EndDate DATETIME NULL,
	CreatedBy INT NULL,
	UpdatedBy INT NULL,
	Valid BIT DEFAULT(1)
)
ALTER TABLE UserRoles
	ADD CONSTRAINT fk_userRoles_users_created_by FOREIGN KEY (CreatedBy) REFERENCES Users(Id)

ALTER TABLE UserRoles
	ADD CONSTRAINT fk_userRoles_users_updated_by FOREIGN KEY (UpdatedBy) REFERENCES Users(Id)