SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.UsersUpdate
	(
		@ID [int],
		@FullName [nvarchar](255) = NULL,
		@Designation [nvarchar](255) = NULL,
		@DepartmentID [int] = NULL,
		@isWorking [bit] = NULL,
		@CreatedUserID [int] = NULL,
		@CreatedDate [datetime] = NULL,
		@LastUpdatedUserID [int] = NULL,
		@LastUpdatedDate [datetime] = NULL,
		@isArchived [bit] = NULL,
		@ArchivedUserID [int] = NULL,
		@ArchivedDate [datetime] = NULL
	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN TRANSACTION
	DECLARE @UserExists INT 
	SET @UserExists = (SELECT COUNT(*) FROM dbo.Users u WHERE u.ID = @ID)

	IF @UserExists = 1
	BEGIN 
		UPDATE [dbo].[Users]
		SET [FullName] = ISNULL(@FullName, FullName), 
			[Designation] = ISNULL(@Designation, Designation),
			[DepartmentID] = ISNULL(@DepartmentID, DepartmentID),
			[isWorking] = ISNULL(@isWorking, isWorking),
			[CreatedUserID] = ISNULL(@CreatedUserID, CreatedUserID),
			[CreatedDate] = ISNULL(@CreatedDate, CreatedDate),
			[LastUpdatedUserID] = ISNULL(@LastUpdatedUserID, LastUpdatedUserID),
			[LastUpdatedDate] = ISNULL(@LastUpdatedDate, LastUpdatedDate),
			[isArchived] = ISNULL(@isArchived, isArchived),
			[ArchivedUserID] = ISNULL(@ArchivedUserID, ArchivedUserID),
			[ArchivedDate] = ISNULL(@ArchivedDate, ArchivedDate)
		WHERE ([ID] = @ID)

		EXEC UsersSelect @ID
	END
	ELSE
		PRINT 'UserID not valid'
	COMMIT
GO
