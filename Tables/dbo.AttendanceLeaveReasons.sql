SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AttendanceLeaveReasons] (
		[ID]                    [int] IDENTITY(1, 1) NOT NULL,
		[Reason]                [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[AttendanceID]          [int] NULL,
		[CalendarDateID]        [int] NULL,
		[CreatedUserID]         [int] NULL,
		[CreatedDate]           [datetime] NOT NULL,
		[LastUpdatedUserID]     [int] NULL,
		[LastUpdatedDate]       [datetime] NOT NULL,
		[isArchived]            [bit] NOT NULL,
		[ArchivedUserID]        [int] NULL,
		[ArchivedDate]          [datetime] NULL,
		CONSTRAINT [PK__Attendan__3214EC27DDEFA05A]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttendanceLeaveReasons]
	ADD
	CONSTRAINT [DF__Attendanc__Creat__2BFE89A6]
	DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AttendanceLeaveReasons]
	ADD
	CONSTRAINT [DF__Attendanc__LastU__2DE6D218]
	DEFAULT (getdate()) FOR [LastUpdatedDate]
GO
ALTER TABLE [dbo].[AttendanceLeaveReasons]
	ADD
	CONSTRAINT [DF__Attendanc__isArc__2EDAF651]
	DEFAULT ((0)) FOR [isArchived]
GO
ALTER TABLE [dbo].[AttendanceLeaveReasons]
	WITH CHECK
	ADD CONSTRAINT [FK__Attendanc__Atten__29221CFB]
	FOREIGN KEY ([AttendanceID]) REFERENCES [dbo].[Attendance] ([ID])
ALTER TABLE [dbo].[AttendanceLeaveReasons]
	CHECK CONSTRAINT [FK__Attendanc__Atten__29221CFB]

GO
ALTER TABLE [dbo].[AttendanceLeaveReasons]
	WITH CHECK
	ADD CONSTRAINT [FK__Attendanc__Calen__2A164134]
	FOREIGN KEY ([CalendarDateID]) REFERENCES [dbo].[AttendanceWorkCalendar] ([ID])
ALTER TABLE [dbo].[AttendanceLeaveReasons]
	CHECK CONSTRAINT [FK__Attendanc__Calen__2A164134]

GO
ALTER TABLE [dbo].[AttendanceLeaveReasons]
	WITH CHECK
	ADD CONSTRAINT [FK__Attendanc__Creat__2B0A656D]
	FOREIGN KEY ([CreatedUserID]) REFERENCES [dbo].[Users] ([ID])
ALTER TABLE [dbo].[AttendanceLeaveReasons]
	CHECK CONSTRAINT [FK__Attendanc__Creat__2B0A656D]

GO
ALTER TABLE [dbo].[AttendanceLeaveReasons]
	WITH CHECK
	ADD CONSTRAINT [FK__Attendanc__LastU__2CF2ADDF]
	FOREIGN KEY ([LastUpdatedUserID]) REFERENCES [dbo].[Users] ([ID])
ALTER TABLE [dbo].[AttendanceLeaveReasons]
	CHECK CONSTRAINT [FK__Attendanc__LastU__2CF2ADDF]

GO
ALTER TABLE [dbo].[AttendanceLeaveReasons]
	WITH CHECK
	ADD CONSTRAINT [FK__Attendanc__Archi__2FCF1A8A]
	FOREIGN KEY ([ArchivedUserID]) REFERENCES [dbo].[Users] ([ID])
ALTER TABLE [dbo].[AttendanceLeaveReasons]
	CHECK CONSTRAINT [FK__Attendanc__Archi__2FCF1A8A]

GO
ALTER TABLE [dbo].[AttendanceLeaveReasons] SET (LOCK_ESCALATION = TABLE)
GO
