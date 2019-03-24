SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[AttendanceUsersOfficialTime] (
		[ID]                    [int] IDENTITY(1, 1) NOT NULL,
		[ClockIn]               [datetime] NULL,
		[ClockOut]              [datetime] NULL,
		[UserID]                [int] NULL,
		[CreatedUserID]         [int] NULL,
		[CreatedDate]           [datetime] NOT NULL,
		[LastUpdatedUserID]     [int] NULL,
		[LastUpdatedDate]       [datetime] NOT NULL,
		[isArchived]            [bit] NOT NULL,
		[ArchivedUserID]        [int] NULL,
		[ArchivedDate]          [datetime] NULL,
		CONSTRAINT [PK__UserOffi__3214EC27BC6C0C63]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttendanceUsersOfficialTime]
	ADD
	CONSTRAINT [DF__UserOffic__Creat__5DCAEF64]
	DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AttendanceUsersOfficialTime]
	ADD
	CONSTRAINT [DF__UserOffic__LastU__5FB337D6]
	DEFAULT (getdate()) FOR [LastUpdatedDate]
GO
ALTER TABLE [dbo].[AttendanceUsersOfficialTime]
	ADD
	CONSTRAINT [DF__UserOffic__isArc__60A75C0F]
	DEFAULT ((1)) FOR [isArchived]
GO
ALTER TABLE [dbo].[AttendanceUsersOfficialTime]
	WITH CHECK
	ADD CONSTRAINT [FK__UserOffic__UserI__5BE2A6F2]
	FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([ID])
ALTER TABLE [dbo].[AttendanceUsersOfficialTime]
	CHECK CONSTRAINT [FK__UserOffic__UserI__5BE2A6F2]

GO
ALTER TABLE [dbo].[AttendanceUsersOfficialTime]
	WITH CHECK
	ADD CONSTRAINT [FK__UserOffic__Creat__5CD6CB2B]
	FOREIGN KEY ([CreatedUserID]) REFERENCES [dbo].[Users] ([ID])
ALTER TABLE [dbo].[AttendanceUsersOfficialTime]
	CHECK CONSTRAINT [FK__UserOffic__Creat__5CD6CB2B]

GO
ALTER TABLE [dbo].[AttendanceUsersOfficialTime]
	WITH CHECK
	ADD CONSTRAINT [FK__UserOffic__LastU__5EBF139D]
	FOREIGN KEY ([LastUpdatedUserID]) REFERENCES [dbo].[Users] ([ID])
ALTER TABLE [dbo].[AttendanceUsersOfficialTime]
	CHECK CONSTRAINT [FK__UserOffic__LastU__5EBF139D]

GO
ALTER TABLE [dbo].[AttendanceUsersOfficialTime]
	WITH CHECK
	ADD CONSTRAINT [FK__UserOffic__Archi__619B8048]
	FOREIGN KEY ([ArchivedUserID]) REFERENCES [dbo].[Users] ([ID])
ALTER TABLE [dbo].[AttendanceUsersOfficialTime]
	CHECK CONSTRAINT [FK__UserOffic__Archi__619B8048]

GO
ALTER TABLE [dbo].[AttendanceUsersOfficialTime] SET (LOCK_ESCALATION = TABLE)
GO
