SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.UsersInsert
	(
		@FullName [nvarchar](255),
		@CreatedUserID [int],
		@Designation [nvarchar](255) = NULL,
		@DepartmentName [nvarchar](255) = NULL,
		@DepartmentID [int] = NULL,
		@isWorking [bit] = 1
	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN TRANSACTION
	IF @DepartmentName IS NOT NULL 
	BEGIN 
		SELECT @DepartmentID = ID FROM [dbo].[UsersDepartment] ud WHERE ud.Name = @DepartmentName
	END 
	
	INSERT INTO [dbo].[Users]
	(
		[FullName], [Designation], [DepartmentID], [isWorking], [CreatedUserID], [LastUpdatedUserID]
	)
	VALUES
	(
		@FullName,
		@Designation,
		@DepartmentID,
		@isWorking,
		@CreatedUserID,
		@CreatedUserID
	)
	SELECT [ID], [FullName], [Designation], [DepartmentID], [isWorking], [CreatedUserID], [CreatedDate], [LastUpdatedUserID], [LastUpdatedDate], [isArchived], [ArchivedUserID], [ArchivedDate]
	FROM [dbo].[Users]
	WHERE ([ID] = SCOPE_IDENTITY())

	COMMIT
GO
