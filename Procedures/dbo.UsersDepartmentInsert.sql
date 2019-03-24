SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.UsersDepartmentInsert
	(
		@Name [nvarchar](255),
		@CreatedUserID [int] = 1
	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN TRANSACTION

	INSERT INTO [dbo].[UsersDepartment]
	(
		[Name], [CreatedUserID], LastUpdatedUserID
	)
	VALUES
	(
		@Name,
		@CreatedUserID,
		@CreatedUserID

	)
	DECLARE @ID INT = SCOPE_IDENTITY()
	EXEC UsersDepartmentSelect @ID 

	COMMIT
GO
