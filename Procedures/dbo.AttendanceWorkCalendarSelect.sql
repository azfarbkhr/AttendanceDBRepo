SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.AttendanceWorkCalendarSelect
		@ID [int] = NULL
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN TRANSACTION
	
	IF @ID IS NOT NULL 
	BEGIN 
		SELECT [ID], [Date], [isOperationWorkDay], [isMarketingWorkDay], [isTechWorkDay], [CreatedUserID], [CreatedDate], [LastUpdatedUserID], [LastUpdatedDate], [isArchived], [ArchivedUserID], [ArchivedDate]
		FROM [dbo].[AttendanceWorkCalendar]
		WHERE ([ID] = @ID)
	END

	ELSE 
	BEGIN 
		SELECT [ID], [Date], [isOperationWorkDay], [isMarketingWorkDay], [isTechWorkDay], [CreatedUserID], [CreatedDate], [LastUpdatedUserID], [LastUpdatedDate], [isArchived], [ArchivedUserID], [ArchivedDate]
		FROM [dbo].[AttendanceWorkCalendar]
	END
	COMMIT
GO
