SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.AttendanceWorkCalendarInsert
	(
		@Date [datetime],
		@isOperationWorkDay [bit] = 0,
		@isMarketingWorkDay [bit] = 0,
		@isTechWorkDay [bit] = 0,
		@CreatedUserID [int],
		@CreatedDate [datetime] = NULL,
		@isArchived [bit] = 0
	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN TRANSACTION
	IF @CreatedDate IS NULL
	BEGIN  SET @CreatedDate = GetDate() END


	INSERT INTO [dbo].[AttendanceWorkCalendar]
	(
		[Date], [isOperationWorkDay], [isMarketingWorkDay], [isTechWorkDay], [CreatedUserID], [CreatedDate], [LastUpdatedUserID], [LastUpdatedDate], [isArchived]
	)
	VALUES
	(
		@Date,
		@isOperationWorkDay,
		@isMarketingWorkDay,
		@isTechWorkDay,
		@CreatedUserID,
		@CreatedDate,
		@CreatedUserID,
		@CreatedDate,
		@isArchived

	)
	DECLARE @ID INT = SCOPE_IDENTITY()
	EXEC AttendanceWorkCalendarSelect @ID 

	COMMIT
GO
