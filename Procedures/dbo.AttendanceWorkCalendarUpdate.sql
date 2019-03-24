SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.AttendanceWorkCalendarUpdate
	(
		@ID [int],
		@Date [datetime] = NULL,
		@isOperationWorkDay [bit] = NULL,
		@isMarketingWorkDay [bit] = NULL,
		@isTechWorkDay [bit] = NULL,
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
	DECLARE @WorkCalendarIDExists INT = (SELECT COUNT(*) FROM dbo.AttendanceWorkCalendar awc WHERE awc.ID = @ID)

	IF @WorkCalendarIDExists = 1
	BEGIN
		UPDATE [dbo].[AttendanceWorkCalendar]
		SET 
			[Date] = ISNULL(@Date,[Date] ),
			[isOperationWorkDay] = ISNULL(@isOperationWorkDay,[isOperationWorkDay] ),
			[isMarketingWorkDay] = ISNULL(@isMarketingWorkDay,[isMarketingWorkDay] ),
			[isTechWorkDay] = ISNULL(@isTechWorkDay,[isTechWorkDay] ),
			[CreatedUserID] = ISNULL(@CreatedUserID,[CreatedUserID] ),
			[CreatedDate] = ISNULL(@CreatedDate,[CreatedDate] ),
			[LastUpdatedUserID] = ISNULL(@LastUpdatedUserID,[LastUpdatedUserID] ),
			[LastUpdatedDate] = ISNULL(@LastUpdatedDate,[LastUpdatedDate] ),
			[isArchived] = ISNULL(@isArchived,[isArchived] ),
			[ArchivedUserID] = ISNULL(@ArchivedUserID,[ArchivedUserID] ),
			[ArchivedDate] = ISNULL(@ArchivedDate,[ArchivedDate] )
		WHERE ([ID] = @ID)

		EXEC AttendanceWorkCalendarSelect @ID
	END
	ELSE 
	BEGIN
		PRINT 'ID not valid'
	END
	COMMIT
GO
