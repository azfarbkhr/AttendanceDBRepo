SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Attendance] (
		[ID]                    [int] IDENTITY(1, 1) NOT NULL,
		[UserID]                [int] NULL,
		[CalendarDateID]        [int] NULL,
		[ClockInTime]           [datetime] NULL,
		[ClockOutTime]          [datetime] NULL,
		[OfficialTimeID]        [int] NULL,
		[isLeaveDay]            [bit] NOT NULL,
		[isLateDay]             [bit] NOT NULL,
		[isExtraDay]            [bit] NOT NULL,
		[CreatedUserID]         [int] NULL,
		[CreatedDate]           [datetime] NOT NULL,
		[LastUpdatedUserID]     [int] NULL,
		[LastUpdatedDate]       [datetime] NOT NULL,
		[isArchived]            [bit] NOT NULL,
		[ArchivedUserID]        [int] NULL,
		[ArchivedDate]          [datetime] NULL,
		CONSTRAINT [PK__Attendan__3214EC273CCF2795]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Attendance]
	ADD
	CONSTRAINT [DF__Attendanc__Clock__6E01572D]
	DEFAULT (getdate()) FOR [ClockInTime]
GO
ALTER TABLE [dbo].[Attendance]
	ADD
	CONSTRAINT [DF__Attendanc__isLea__6FE99F9F]
	DEFAULT ((1)) FOR [isLeaveDay]
GO
ALTER TABLE [dbo].[Attendance]
	ADD
	CONSTRAINT [DF__Attendanc__isLat__70DDC3D8]
	DEFAULT ((1)) FOR [isLateDay]
GO
ALTER TABLE [dbo].[Attendance]
	ADD
	CONSTRAINT [DF__Attendanc__isExt__71D1E811]
	DEFAULT ((1)) FOR [isExtraDay]
GO
ALTER TABLE [dbo].[Attendance]
	ADD
	CONSTRAINT [DF__Attendanc__Creat__73BA3083]
	DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Attendance]
	ADD
	CONSTRAINT [DF__Attendanc__LastU__75A278F5]
	DEFAULT (getdate()) FOR [LastUpdatedDate]
GO
ALTER TABLE [dbo].[Attendance]
	ADD
	CONSTRAINT [DF__Attendanc__isArc__76969D2E]
	DEFAULT ((1)) FOR [isArchived]
GO
ALTER TABLE [dbo].[Attendance]
	WITH CHECK
	ADD CONSTRAINT [FK__Attendanc__UserI__6C190EBB]
	FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([ID])
ALTER TABLE [dbo].[Attendance]
	CHECK CONSTRAINT [FK__Attendanc__UserI__6C190EBB]

GO
ALTER TABLE [dbo].[Attendance]
	WITH CHECK
	ADD CONSTRAINT [FK__Attendanc__Calen__6D0D32F4]
	FOREIGN KEY ([CalendarDateID]) REFERENCES [dbo].[AttendanceWorkCalendar] ([ID])
ALTER TABLE [dbo].[Attendance]
	CHECK CONSTRAINT [FK__Attendanc__Calen__6D0D32F4]

GO
ALTER TABLE [dbo].[Attendance]
	WITH CHECK
	ADD CONSTRAINT [FK__Attendanc__Offic__6EF57B66]
	FOREIGN KEY ([OfficialTimeID]) REFERENCES [dbo].[AttendanceUsersOfficialTime] ([ID])
ALTER TABLE [dbo].[Attendance]
	CHECK CONSTRAINT [FK__Attendanc__Offic__6EF57B66]

GO
ALTER TABLE [dbo].[Attendance]
	WITH CHECK
	ADD CONSTRAINT [FK__Attendanc__Creat__72C60C4A]
	FOREIGN KEY ([CreatedUserID]) REFERENCES [dbo].[Users] ([ID])
ALTER TABLE [dbo].[Attendance]
	CHECK CONSTRAINT [FK__Attendanc__Creat__72C60C4A]

GO
ALTER TABLE [dbo].[Attendance]
	WITH CHECK
	ADD CONSTRAINT [FK__Attendanc__LastU__74AE54BC]
	FOREIGN KEY ([LastUpdatedUserID]) REFERENCES [dbo].[Users] ([ID])
ALTER TABLE [dbo].[Attendance]
	CHECK CONSTRAINT [FK__Attendanc__LastU__74AE54BC]

GO
ALTER TABLE [dbo].[Attendance]
	WITH CHECK
	ADD CONSTRAINT [FK__Attendanc__Archi__778AC167]
	FOREIGN KEY ([ArchivedUserID]) REFERENCES [dbo].[Users] ([ID])
ALTER TABLE [dbo].[Attendance]
	CHECK CONSTRAINT [FK__Attendanc__Archi__778AC167]

GO
ALTER TABLE [dbo].[Attendance] SET (LOCK_ESCALATION = TABLE)
GO
