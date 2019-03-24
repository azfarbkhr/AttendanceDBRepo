SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsersDepartment] (
		[ID]                    [int] IDENTITY(1, 1) NOT NULL,
		[Name]                  [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[CreatedUserID]         [int] NULL,
		[CreatedDate]           [datetime] NOT NULL,
		[LastUpdatedUserID]     [int] NULL,
		[LastUpdatedDate]       [datetime] NOT NULL,
		[isArchived]            [bit] NOT NULL,
		[ArchivedUserID]        [int] NULL,
		[ArchivedDate]          [datetime] NULL,
		CONSTRAINT [PK__UsersDep__3214EC2781BDDAF6]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UsersDepartment]
	ADD
	CONSTRAINT [DF__UsersDepa__Creat__5535A963]
	DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UsersDepartment]
	ADD
	CONSTRAINT [DF__UsersDepa__LastU__571DF1D5]
	DEFAULT (getdate()) FOR [LastUpdatedDate]
GO
ALTER TABLE [dbo].[UsersDepartment]
	ADD
	CONSTRAINT [DF__UsersDepa__isArc__5812160E]
	DEFAULT ((1)) FOR [isArchived]
GO
ALTER TABLE [dbo].[UsersDepartment]
	WITH CHECK
	ADD CONSTRAINT [FK__UsersDepa__Creat__5441852A]
	FOREIGN KEY ([CreatedUserID]) REFERENCES [dbo].[Users] ([ID])
ALTER TABLE [dbo].[UsersDepartment]
	CHECK CONSTRAINT [FK__UsersDepa__Creat__5441852A]

GO
ALTER TABLE [dbo].[UsersDepartment]
	WITH CHECK
	ADD CONSTRAINT [FK__UsersDepa__LastU__5629CD9C]
	FOREIGN KEY ([LastUpdatedUserID]) REFERENCES [dbo].[Users] ([ID])
ALTER TABLE [dbo].[UsersDepartment]
	CHECK CONSTRAINT [FK__UsersDepa__LastU__5629CD9C]

GO
ALTER TABLE [dbo].[UsersDepartment]
	WITH CHECK
	ADD CONSTRAINT [FK__UsersDepa__Archi__59063A47]
	FOREIGN KEY ([ArchivedUserID]) REFERENCES [dbo].[Users] ([ID])
ALTER TABLE [dbo].[UsersDepartment]
	CHECK CONSTRAINT [FK__UsersDepa__Archi__59063A47]

GO
ALTER TABLE [dbo].[UsersDepartment] SET (LOCK_ESCALATION = TABLE)
GO
