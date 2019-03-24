SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users] (
		[ID]                    [int] IDENTITY(1, 1) NOT NULL,
		[FullName]              [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Designation]           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[DepartmentID]          [int] NULL,
		[isWorking]             [bit] NOT NULL,
		[CreatedUserID]         [int] NULL,
		[CreatedDate]           [datetime] NOT NULL,
		[LastUpdatedUserID]     [int] NULL,
		[LastUpdatedDate]       [datetime] NOT NULL,
		[isArchived]            [bit] NOT NULL,
		[ArchivedUserID]        [int] NULL,
		[ArchivedDate]          [datetime] NULL,
		CONSTRAINT [PK__Users__3214EC279171CE99]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users]
	ADD
	CONSTRAINT [DF__Users__CreatedDa__4D94879B]
	DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Users]
	ADD
	CONSTRAINT [DF__Users__LastUpdat__4F7CD00D]
	DEFAULT (getdate()) FOR [LastUpdatedDate]
GO
ALTER TABLE [dbo].[Users]
	ADD
	CONSTRAINT [DF__Users__isArchive__5070F446]
	DEFAULT ((1)) FOR [isArchived]
GO
ALTER TABLE [dbo].[Users]
	WITH NOCHECK
	ADD CONSTRAINT [FK_Users_Department]
	FOREIGN KEY ([DepartmentID]) REFERENCES [dbo].[UsersDepartment] ([ID])
ALTER TABLE [dbo].[Users]
	CHECK CONSTRAINT [FK_Users_Department]

GO
ALTER TABLE [dbo].[Users]
	WITH CHECK
	ADD CONSTRAINT [FK__Users__CreatedUs__4CA06362]
	FOREIGN KEY ([CreatedUserID]) REFERENCES [dbo].[Users] ([ID])
ALTER TABLE [dbo].[Users]
	CHECK CONSTRAINT [FK__Users__CreatedUs__4CA06362]

GO
ALTER TABLE [dbo].[Users]
	WITH CHECK
	ADD CONSTRAINT [FK__Users__LastUpdat__4E88ABD4]
	FOREIGN KEY ([LastUpdatedUserID]) REFERENCES [dbo].[Users] ([ID])
ALTER TABLE [dbo].[Users]
	CHECK CONSTRAINT [FK__Users__LastUpdat__4E88ABD4]

GO
ALTER TABLE [dbo].[Users]
	WITH CHECK
	ADD CONSTRAINT [FK__Users__ArchivedU__5165187F]
	FOREIGN KEY ([ArchivedUserID]) REFERENCES [dbo].[Users] ([ID])
ALTER TABLE [dbo].[Users]
	CHECK CONSTRAINT [FK__Users__ArchivedU__5165187F]

GO
ALTER TABLE [dbo].[Users] SET (LOCK_ESCALATION = TABLE)
GO
