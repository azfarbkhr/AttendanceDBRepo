SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.UsersSelect
		@ID [int] = NULL
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN TRANSACTION
	IF @ID IS NOT NULL
	BEGIN
		SELECT [ID], [FullName], [Designation], [DepartmentID], [isWorking], [CreatedUserID], [CreatedDate], [LastUpdatedUserID], [LastUpdatedDate], [isArchived], [ArchivedUserID], [ArchivedDate]
		FROM [dbo].[Users]
		WHERE ([ID] = @ID)
	END 
	ELSE
	BEGIN
		SELECT [ID], [FullName], [Designation], [DepartmentID], [isWorking], [CreatedUserID], [CreatedDate], [LastUpdatedUserID], [LastUpdatedDate], [isArchived], [ArchivedUserID], [ArchivedDate]
		FROM [dbo].[Users]
	END
	COMMIT
GO
