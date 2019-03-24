SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[AttendanceWorkCalendar] (
		[ID]                     [int] IDENTITY(1, 1) NOT NULL,
		[Date]                   [datetime] NOT NULL,
		[isOperationWorkDay]     [bit] NOT NULL,
		[isMarketingWorkDay]     [bit] NOT NULL,
		[isTechWorkDay]          [bit] NOT NULL,
		[CreatedUserID]          [int] NULL,
		[CreatedDate]            [datetime] NOT NULL,
		[LastUpdatedUserID]      [int] NULL,
		[LastUpdatedDate]        [datetime] NOT NULL,
		[isArchived]             [bit] NOT NULL,
		[ArchivedUserID]         [int] NULL,
		[ArchivedDate]           [datetime] NULL,
		CONSTRAINT [PK__WorkCale__3214EC275CBC0316]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttendanceWorkCalendar]
	ADD
	CONSTRAINT [DF__WorkCalen__Creat__656C112C]
	DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AttendanceWorkCalendar]
	ADD
	CONSTRAINT [DF__WorkCalen__LastU__6754599E]
	DEFAULT (getdate()) FOR [LastUpdatedDate]
GO
ALTER TABLE [dbo].[AttendanceWorkCalendar]
	ADD
	CONSTRAINT [DF__WorkCalen__isArc__68487DD7]
	DEFAULT ((1)) FOR [isArchived]
GO
ALTER TABLE [dbo].[AttendanceWorkCalendar]
	WITH CHECK
	ADD CONSTRAINT [FK__WorkCalen__Creat__6477ECF3]
	FOREIGN KEY ([CreatedUserID]) REFERENCES [dbo].[Users] ([ID])
ALTER TABLE [dbo].[AttendanceWorkCalendar]
	CHECK CONSTRAINT [FK__WorkCalen__Creat__6477ECF3]

GO
ALTER TABLE [dbo].[AttendanceWorkCalendar]
	WITH CHECK
	ADD CONSTRAINT [FK__WorkCalen__LastU__66603565]
	FOREIGN KEY ([LastUpdatedUserID]) REFERENCES [dbo].[Users] ([ID])
ALTER TABLE [dbo].[AttendanceWorkCalendar]
	CHECK CONSTRAINT [FK__WorkCalen__LastU__66603565]

GO
ALTER TABLE [dbo].[AttendanceWorkCalendar]
	WITH CHECK
	ADD CONSTRAINT [FK__WorkCalen__Archi__693CA210]
	FOREIGN KEY ([ArchivedUserID]) REFERENCES [dbo].[Users] ([ID])
ALTER TABLE [dbo].[AttendanceWorkCalendar]
	CHECK CONSTRAINT [FK__WorkCalen__Archi__693CA210]

GO
ALTER TABLE [dbo].[AttendanceWorkCalendar] SET (LOCK_ESCALATION = TABLE)
GO
