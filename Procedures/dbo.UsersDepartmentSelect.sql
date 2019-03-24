SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsersDepartmentSelect]
		@ID [int] = NULL
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN TRANSACTION
	IF @ID IS NULL
	BEGIN
		SELECT [ID], [Name], [CreatedUserID], [CreatedDate], [LastUpdatedUserID], [LastUpdatedDate], [isArchived], [ArchivedUserID], [ArchivedDate]
		FROM [dbo].[UsersDepartment]	
	END
	ELSE 
	BEGIN
		SELECT [ID], [Name], [CreatedUserID], [CreatedDate], [LastUpdatedUserID], [LastUpdatedDate], [isArchived], [ArchivedUserID], [ArchivedDate]
		FROM [dbo].[UsersDepartment]
		WHERE ([ID] = @ID)
	END

	COMMIT
GO
