USE [EmployeeTaskTrackerDB]
GO
/****** Object:  Table [dbo].[ExceptionLog]    Script Date: 8/14/2026 11:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExceptionLog](
	[ExceptionLogId] [bigint] IDENTITY(1,1) NOT NULL,
	[SPName] [nvarchar](200) NULL,
	[ErrorNumber] [int] NULL,
	[ErrorSeverity] [int] NULL,
	[ErrorState] [int] NULL,
	[ErrorLine] [int] NULL,
	[ErrorProcedure] [nvarchar](200) NULL,
	[ErrorMessage] [nvarchar](max) NULL,
	[ErrorDate] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_ExceptionLog] PRIMARY KEY CLUSTERED 
(
	[ExceptionLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskHistory]    Script Date: 8/14/2026 11:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskHistory](
	[TaskHistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[TaskId] [int] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[AssignedTo] [int] NOT NULL,
	[Priority] [nvarchar](10) NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[DueDate] [datetime2](0) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime2](0) NOT NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime2](0) NULL,
	[UpdatedBy] [int] NULL,
	[DeletedOn] [datetime2](0) NULL,
	[DeletedBy] [int] NULL,
	[HistoryAction] [nvarchar](20) NOT NULL,
	[HistoryOn] [datetime2](0) NOT NULL,
	[HistoryBy] [int] NULL,
 CONSTRAINT [PK_TaskHistory] PRIMARY KEY CLUSTERED 
(
	[TaskHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 8/14/2026 11:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[AssignedTo] [int] NOT NULL,
	[Priority] [nvarchar](10) NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[DueDate] [datetime2](0) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime2](0) NOT NULL,
	[CreatedBy] [int] NULL,
	[StatusUpdatedOn] [datetime2](7) NULL,
	[UpdatedOn] [datetime2](0) NULL,
	[UpdatedBy] [int] NULL,
	[DeletedOn] [datetime2](0) NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/14/2026 11:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[PasswordHash] [nvarchar](500) NOT NULL,
	[Role] [nvarchar](20) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime2](0) NOT NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime2](0) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TaskHistory] ON 
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (1, 1, N'TASK 1', N'DESC', 2, N'Low', N'Pending', CAST(N'2026-08-14T10:51:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-14T10:51:41.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, N'INSERT', CAST(N'2026-08-14T10:51:41.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (2, 1, N'TASK 1', N'DESC', 2, N'Low', N'Pending', CAST(N'2026-08-14T10:51:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-14T10:51:41.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, N'STATUS_UPDATE', CAST(N'2026-08-14T10:52:38.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (3, 1, N'TASK 1', N'DESC', 2, N'Low', N'Completed', CAST(N'2026-08-14T10:51:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-14T10:51:41.0000000' AS DateTime2), 1, CAST(N'2026-08-14T10:52:38.0000000' AS DateTime2), 2, NULL, NULL, N'UPDATE', CAST(N'2026-08-14T10:55:07.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (4, 2, N'TASK 2', N'TASK DESC 2', 2, N'Low', N'Pending', CAST(N'2026-08-14T10:55:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-14T10:55:44.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, N'INSERT', CAST(N'2026-08-14T10:55:44.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (5, 3, N'TASK 3', N'TASK DESC 3', 2, N'High', N'Pending', CAST(N'2026-08-14T10:56:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-14T10:56:04.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, N'INSERT', CAST(N'2026-08-14T10:56:04.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (6, 4, N'TASK 4', N'TASK DESC 4', 2, N'High', N'Pending', CAST(N'2026-08-14T10:56:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-14T10:56:20.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, N'INSERT', CAST(N'2026-08-14T10:56:20.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (7, 5, N'TASK 5', N'TASK DESC 5', 2, N'Low', N'Pending', CAST(N'2026-08-14T10:56:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-14T10:56:39.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, N'INSERT', CAST(N'2026-08-14T10:56:39.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (8, 6, N'TASK 6', N'TASK DESC 6', 2, N'Low', N'Pending', CAST(N'2026-08-14T10:57:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-14T10:57:04.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, N'INSERT', CAST(N'2026-08-14T10:57:04.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (9, 7, N'TASK 7', N'TASK DESC 7', 2, N'Low', N'Pending', CAST(N'2026-08-14T10:57:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-14T10:57:28.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, N'INSERT', CAST(N'2026-08-14T10:57:28.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (10, 8, N'TASK 8', N'TASK DESC 8', 2, N'Low', N'Pending', CAST(N'2026-08-14T10:57:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-14T10:57:53.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, N'INSERT', CAST(N'2026-08-14T10:57:53.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (11, 9, N'TASK 9', N'TASK DESC 9', 2, N'Low', N'Pending', CAST(N'2026-08-14T10:58:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-14T10:58:15.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, N'INSERT', CAST(N'2026-08-14T10:58:15.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (12, 10, N'TASK 10', N'TASK DESC 10', 2, N'High', N'Pending', CAST(N'2026-08-14T10:58:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-14T10:58:28.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, N'INSERT', CAST(N'2026-08-14T10:58:28.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (13, 11, N'TASK 11', N'TASK DESC 11', 3, N'High', N'Pending', CAST(N'2026-08-14T10:58:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-14T10:58:53.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, N'INSERT', CAST(N'2026-08-14T10:58:53.0000000' AS DateTime2), 1)
GO
SET IDENTITY_INSERT [dbo].[TaskHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Tasks] ON 
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [StatusUpdatedOn], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (1, N'TASK 1', N'TASK DESC', 2, N'Low', N'Completed', CAST(N'2026-08-14T10:51:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-14T10:51:41.0000000' AS DateTime2), 1, CAST(N'2026-08-14T10:52:38.2500000' AS DateTime2), CAST(N'2026-08-14T10:55:07.0000000' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [StatusUpdatedOn], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (2, N'TASK 2', N'TASK DESC 2', 2, N'Low', N'Pending', CAST(N'2026-08-14T10:55:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-14T10:55:44.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [StatusUpdatedOn], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (3, N'TASK 3', N'TASK DESC 3', 2, N'High', N'Pending', CAST(N'2026-08-14T10:56:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-14T10:56:04.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [StatusUpdatedOn], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (4, N'TASK 4', N'TASK DESC 4', 2, N'High', N'Pending', CAST(N'2026-08-14T10:56:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-14T10:56:20.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [StatusUpdatedOn], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (5, N'TASK 5', N'TASK DESC 5', 2, N'Low', N'Pending', CAST(N'2026-08-14T10:56:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-14T10:56:39.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [StatusUpdatedOn], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (6, N'TASK 6', N'TASK DESC 6', 2, N'Low', N'Pending', CAST(N'2026-08-14T10:57:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-14T10:57:04.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [StatusUpdatedOn], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (7, N'TASK 7', N'TASK DESC 7', 2, N'Low', N'Pending', CAST(N'2026-08-14T10:57:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-14T10:57:28.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [StatusUpdatedOn], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (8, N'TASK 8', N'TASK DESC 8', 2, N'Low', N'Pending', CAST(N'2026-08-14T10:57:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-14T10:57:53.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [StatusUpdatedOn], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (9, N'TASK 9', N'TASK DESC 9', 2, N'Low', N'Pending', CAST(N'2026-08-14T10:58:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-14T10:58:15.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [StatusUpdatedOn], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (10, N'TASK 10', N'TASK DESC 10', 2, N'High', N'Pending', CAST(N'2026-08-14T10:58:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-14T10:58:28.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [StatusUpdatedOn], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (11, N'TASK 11', N'TASK DESC 11', 3, N'High', N'Pending', CAST(N'2026-08-14T10:58:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-14T10:58:53.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Tasks] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [PasswordHash], [Role], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'Admin', N'admin@test.com', N'2JivJfc6cijJSOHvSVT8MA==.AHjf8zzl0lVwCqCe6L12BpBkaxBvU7JiSCLYf8/Wg/E=', N'Admin', 1, CAST(N'2026-08-14T10:49:03.0000000' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [PasswordHash], [Role], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, N'Employee 1', N'emp1@gmail.com', N'92IlNZAJHz5GmxNWKZu9qQ==.Y/HMPpmAhnOlY6lmQAki9wjGTt8xTckR1LILRIMvme8=', N'Employee', 1, CAST(N'2026-08-14T10:49:49.0000000' AS DateTime2), 1, CAST(N'2026-08-14T10:50:35.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [PasswordHash], [Role], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (3, N'Employee 2', N'emp2@gmail.com', N'yVTuRRgx202JV9TCal9AkA==.ZvGDwUoJ0YHzGgUONJXr6Qw4HpyRqsGYn+2pCXXsCTE=', N'Employee', 1, CAST(N'2026-08-14T10:50:52.0000000' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [PasswordHash], [Role], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (4, N'Employee 3', N'emp3@gmail.com', N'f1YhIQU79wWG0xlejnTNIw==.YFXw3Nfl6DScBl6/rkMt3E4STTCGOP5FP75jEAtyGfM=', N'Employee', 1, CAST(N'2026-08-14T10:51:16.0000000' AS DateTime2), 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Users_Email]    Script Date: 8/14/2026 11:06:10 AM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ_Users_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ExceptionLog] ADD  CONSTRAINT [DF_ExceptionLog_ErrorDate]  DEFAULT (getdate()) FOR [ErrorDate]
GO
ALTER TABLE [dbo].[TaskHistory] ADD  CONSTRAINT [DF_TaskHistory_HistoryOn]  DEFAULT (getdate()) FOR [HistoryOn]
GO
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[TaskHistory]  WITH CHECK ADD  CONSTRAINT [FK_TaskHistory_Task] FOREIGN KEY([TaskId])
REFERENCES [dbo].[Tasks] ([TaskId])
GO
ALTER TABLE [dbo].[TaskHistory] CHECK CONSTRAINT [FK_TaskHistory_Task]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_AssignedTo] FOREIGN KEY([AssignedTo])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_AssignedTo]
GO
ALTER TABLE [dbo].[TaskHistory]  WITH CHECK ADD  CONSTRAINT [CK_TaskHistory_Action] CHECK  (([HistoryAction]='STATUS_UPDATE' OR [HistoryAction]='DELETE' OR [HistoryAction]='UPDATE' OR [HistoryAction]='INSERT'))
GO
ALTER TABLE [dbo].[TaskHistory] CHECK CONSTRAINT [CK_TaskHistory_Action]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [CK_Tasks_Priority] CHECK  (([Priority]='High' OR [Priority]='Low'))
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [CK_Tasks_Priority]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [CK_Tasks_Status] CHECK  (([Status]='Completed' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [CK_Tasks_Status]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK_Users_Role] CHECK  (([Role]='Employee' OR [Role]='Admin'))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK_Users_Role]
GO
/****** Object:  StoredProcedure [dbo].[SP_Dashboard_GetRecentTasks]    Script Date: 8/14/2026 11:06:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_Dashboard_GetRecentTasks]
(
    @TopCount INT = 5,
    @AssignedTo INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        SELECT TOP (@TopCount)
            T.TaskId,
            T.Title,
            U.Name AS AssignedEmployee,
            T.Priority,
            T.Status,
            T.DueDate,
            T.CreatedOn,
            T.StatusUpdatedOn

        FROM Tasks T
        INNER JOIN Users U
            ON U.UserId = T.AssignedTo

        WHERE T.IsActive = 1
          AND T.IsDeleted = 0
          AND
          (
              @AssignedTo IS NULL
              OR T.AssignedTo = @AssignedTo
          )

        ORDER BY
            T.CreatedOn DESC;

    END TRY

    BEGIN CATCH

        DECLARE
            @SPName NVARCHAR(150),
            @ErrorNumber INT,
            @ErrorSeverity INT,
            @ErrorState INT,
            @ErrorLine INT,
            @ErrorProcedure NVARCHAR(200),
            @ErrorMessage NVARCHAR(MAX);

        SELECT
            @SPName = OBJECT_NAME(@@PROCID),
            @ErrorNumber = ERROR_NUMBER(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE(),
            @ErrorLine = ERROR_LINE(),
            @ErrorProcedure = ERROR_PROCEDURE(),
            @ErrorMessage = ERROR_MESSAGE();

        EXEC SP_LogException
            @SPName = @SPName,
            @ErrorNumber = @ErrorNumber,
            @ErrorSeverity = @ErrorSeverity,
            @ErrorState = @ErrorState,
            @ErrorLine = @ErrorLine,
            @ErrorProcedure = @ErrorProcedure,
            @ErrorMessage = @ErrorMessage;

        THROW;

    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_Dashboard_GetStatistics]    Script Date: 8/14/2026 11:06:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_Dashboard_GetStatistics]
(
    @AssignedTo INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        SELECT
            COUNT(*) AS TotalTasks,

            COALESCE(
                SUM(CASE
                    WHEN Status = 'Pending' THEN 1
                    ELSE 0
                END), 0
            ) AS PendingTasks,

            COALESCE(
                SUM(CASE
                    WHEN Status = 'Completed' THEN 1
                    ELSE 0
                END), 0
            ) AS CompletedTasks,

            COALESCE(
                SUM(CASE
                    WHEN Priority = 'High' THEN 1
                    ELSE 0
                END), 0
            ) AS HighPriorityTasks

        FROM Tasks
        WHERE IsActive = 1
          AND IsDeleted = 0
          AND (
              @AssignedTo IS NULL
              OR AssignedTo = @AssignedTo
          );

    END TRY

    BEGIN CATCH

        DECLARE
            @SPName NVARCHAR(150),
            @ErrorNumber INT,
            @ErrorSeverity INT,
            @ErrorState INT,
            @ErrorLine INT,
            @ErrorProcedure NVARCHAR(200),
            @ErrorMessage NVARCHAR(MAX);

        SELECT
            @SPName = OBJECT_NAME(@@PROCID),
            @ErrorNumber = ERROR_NUMBER(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE(),
            @ErrorLine = ERROR_LINE(),
            @ErrorProcedure = ERROR_PROCEDURE(),
            @ErrorMessage = ERROR_MESSAGE();

        EXEC SP_LogException
            @SPName = @SPName,
            @ErrorNumber = @ErrorNumber,
            @ErrorSeverity = @ErrorSeverity,
            @ErrorState = @ErrorState,
            @ErrorLine = @ErrorLine,
            @ErrorProcedure = @ErrorProcedure,
            @ErrorMessage = @ErrorMessage;

        THROW;

    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_Employee_Create]    Script Date: 8/14/2026 11:06:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_Employee_Create]
(
    @Name NVARCHAR(100),
    @Email NVARCHAR(150),
    @PasswordHash NVARCHAR(500),
    @CreatedBy INT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        BEGIN TRANSACTION;

        IF EXISTS
        (
            SELECT 1
            FROM Users
            WHERE Email = @Email
        )
        BEGIN
            THROW 50001, 'Email already exists.', 1;
        END;

        INSERT INTO Users
        (
            Name,
            Email,
            PasswordHash,
            Role,
            IsActive,
            CreatedOn,
            CreatedBy
        )
        OUTPUT INSERTED.UserId
        VALUES
        (
            @Name,
            @Email,
            @PasswordHash,
            'Employee',
            1,
            GETDATE(),
            @CreatedBy
        );

        COMMIT TRANSACTION;

    END TRY
    BEGIN CATCH

        DECLARE
            @SPName NVARCHAR(200),
            @ErrorNumber INT,
            @ErrorSeverity INT,
            @ErrorState INT,
            @ErrorLine INT,
            @ErrorProcedure NVARCHAR(200),
            @ErrorMessage NVARCHAR(MAX);

        SELECT
            @SPName = OBJECT_NAME(@@PROCID),
            @ErrorNumber = ERROR_NUMBER(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE(),
            @ErrorLine = ERROR_LINE(),
            @ErrorProcedure = ERROR_PROCEDURE(),
            @ErrorMessage = ERROR_MESSAGE();

        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        EXEC SP_LogException
            @SPName = @SPName,
            @ErrorNumber = @ErrorNumber,
            @ErrorSeverity = @ErrorSeverity,
            @ErrorState = @ErrorState,
            @ErrorLine = @ErrorLine,
            @ErrorProcedure = @ErrorProcedure,
            @ErrorMessage = @ErrorMessage;

        THROW;

    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_Employee_GetAll]    Script Date: 8/14/2026 11:06:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_Employee_GetAll]
(
    @PageNumber INT = 1,
    @PageSize   INT = 0
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        IF @PageNumber IS NULL OR @PageNumber < 1
            SET @PageNumber = 1;

        IF @PageSize IS NULL OR @PageSize < 0
            SET @PageSize = 100;

        ELSE IF @PageSize > 100
            SET @PageSize = 100;

        IF @PageSize = 0
        BEGIN
            SELECT @PageSize = COUNT(*)
            FROM Users
            WHERE Role = 'Employee'
              AND IsActive = 1;

            IF @PageSize = 0
            BEGIN
                RETURN;
            END
        END
        SELECT
            UserId,
            Name,
            Email,
            Role,
            IsActive,
            CreatedOn,
            CreatedBy,
            UpdatedOn,
            UpdatedBy,
            COUNT(*) OVER() AS TotalCount
        FROM Users
        WHERE Role = 'Employee'
          AND IsActive = 1
        ORDER BY Name
        OFFSET (@PageNumber - 1) * @PageSize ROWS
        FETCH NEXT @PageSize ROWS ONLY;

    END TRY
    BEGIN CATCH

        DECLARE
            @SPName NVARCHAR(200),
            @ErrorNumber INT,
            @ErrorSeverity INT,
            @ErrorState INT,
            @ErrorLine INT,
            @ErrorProcedure NVARCHAR(200),
            @ErrorMessage NVARCHAR(MAX);

        SELECT
            @SPName = OBJECT_NAME(@@PROCID),
            @ErrorNumber = ERROR_NUMBER(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE(),
            @ErrorLine = ERROR_LINE(),
            @ErrorProcedure = ERROR_PROCEDURE(),
            @ErrorMessage = ERROR_MESSAGE();

        EXEC SP_LogException
            @SPName = @SPName,
            @ErrorNumber = @ErrorNumber,
            @ErrorSeverity = @ErrorSeverity,
            @ErrorState = @ErrorState,
            @ErrorLine = @ErrorLine,
            @ErrorProcedure = @ErrorProcedure,
            @ErrorMessage = @ErrorMessage;

        THROW;

    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_Employee_GetByEmail]    Script Date: 8/14/2026 11:06:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_Employee_GetByEmail]
(
    @Email NVARCHAR(150),
    @UserId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        SELECT
            UserId,
            Name,
            Email,
            Role,
            IsActive
        FROM Users
        WHERE Email = @Email AND UserId <> @UserId;

    END TRY
    BEGIN CATCH

        DECLARE
            @SPName NVARCHAR(200),
            @ErrorNumber INT,
            @ErrorSeverity INT,
            @ErrorState INT,
            @ErrorLine INT,
            @ErrorProcedure NVARCHAR(200),
            @ErrorMessage NVARCHAR(MAX);

        SELECT
            @SPName = OBJECT_NAME(@@PROCID),
            @ErrorNumber = ERROR_NUMBER(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE(),
            @ErrorLine = ERROR_LINE(),
            @ErrorProcedure = ERROR_PROCEDURE(),
            @ErrorMessage = ERROR_MESSAGE();

        EXEC SP_LogException
            @SPName = @SPName,
            @ErrorNumber = @ErrorNumber,
            @ErrorSeverity = @ErrorSeverity,
            @ErrorState = @ErrorState,
            @ErrorLine = @ErrorLine,
            @ErrorProcedure = @ErrorProcedure,
            @ErrorMessage = @ErrorMessage;

        THROW;

    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_Employee_GetById]    Script Date: 8/14/2026 11:06:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_Employee_GetById]
(
    @UserId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        SELECT
            UserId,
            Name,
            Email,
            Role,
            IsActive,
            CreatedOn,
            CreatedBy,
            UpdatedOn,
            UpdatedBy
        FROM Users
        WHERE UserId = @UserId
          AND Role = 'Employee';

    END TRY
    BEGIN CATCH

        DECLARE
            @SPName NVARCHAR(200),
            @ErrorNumber INT,
            @ErrorSeverity INT,
            @ErrorState INT,
            @ErrorLine INT,
            @ErrorProcedure NVARCHAR(200),
            @ErrorMessage NVARCHAR(MAX);

        SELECT
            @SPName = OBJECT_NAME(@@PROCID),
            @ErrorNumber = ERROR_NUMBER(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE(),
            @ErrorLine = ERROR_LINE(),
            @ErrorProcedure = ERROR_PROCEDURE(),
            @ErrorMessage = ERROR_MESSAGE();

        EXEC SP_LogException
            @SPName = @SPName,
            @ErrorNumber = @ErrorNumber,
            @ErrorSeverity = @ErrorSeverity,
            @ErrorState = @ErrorState,
            @ErrorLine = @ErrorLine,
            @ErrorProcedure = @ErrorProcedure,
            @ErrorMessage = @ErrorMessage;

        THROW;

    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_Employee_Update]    Script Date: 8/14/2026 11:06:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_Employee_Update]
(
    @UserId INT,
    @Name NVARCHAR(100),
    @Email NVARCHAR(150),
    @IsActive BIT,
    @UpdatedBy INT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        BEGIN TRANSACTION;

        IF NOT EXISTS
        (
            SELECT 1
            FROM Users
            WHERE UserId = @UserId
              AND Role = 'Employee'
        )
        BEGIN
            THROW 50002, 'Employee not found.', 1;
        END;

        IF EXISTS
        (
            SELECT 1
            FROM Users
            WHERE Email = @Email
              AND UserId <> @UserId
        )
        BEGIN
            THROW 50003, 'Email already exists.', 1;
        END;

        UPDATE Users
        SET
            Name = @Name,
            Email = @Email,
            IsActive = @IsActive,
            UpdatedOn = GETDATE(),
            UpdatedBy = @UpdatedBy
        OUTPUT INSERTED.UserId
        WHERE UserId = @UserId
          AND Role = 'Employee';

        COMMIT TRANSACTION;

    END TRY
    BEGIN CATCH

        DECLARE
            @SPName NVARCHAR(200),
            @ErrorNumber INT,
            @ErrorSeverity INT,
            @ErrorState INT,
            @ErrorLine INT,
            @ErrorProcedure NVARCHAR(200),
            @ErrorMessage NVARCHAR(MAX);

        SELECT
            @SPName = OBJECT_NAME(@@PROCID),
            @ErrorNumber = ERROR_NUMBER(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE(),
            @ErrorLine = ERROR_LINE(),
            @ErrorProcedure = ERROR_PROCEDURE(),
            @ErrorMessage = ERROR_MESSAGE();

        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        EXEC SP_LogException
            @SPName = @SPName,
            @ErrorNumber = @ErrorNumber,
            @ErrorSeverity = @ErrorSeverity,
            @ErrorState = @ErrorState,
            @ErrorLine = @ErrorLine,
            @ErrorProcedure = @ErrorProcedure,
            @ErrorMessage = @ErrorMessage;

        THROW;

    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_LogException]    Script Date: 8/14/2026 11:06:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_LogException]
(
    @SPName NVARCHAR(200),
    @ErrorNumber INT,
    @ErrorSeverity INT,
    @ErrorState INT,
    @ErrorLine INT,
    @ErrorProcedure NVARCHAR(200),
    @ErrorMessage NVARCHAR(MAX)
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        INSERT INTO ExceptionLog
        (
            SPName,
            ErrorNumber,
            ErrorSeverity,
            ErrorState,
            ErrorLine,
            ErrorProcedure,
            ErrorMessage
        )
        VALUES
        (
            @SPName,
            @ErrorNumber,
            @ErrorSeverity,
            @ErrorState,
            @ErrorLine,
            @ErrorProcedure,
            @ErrorMessage
        );

    END TRY
    BEGIN CATCH
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_Task_Create]    Script Date: 8/14/2026 11:06:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_Task_Create]
(
    @Title NVARCHAR(200),
    @Description NVARCHAR(MAX),
    @AssignedTo INT,
    @Priority NVARCHAR(10),
    @DueDate DATETIME2(0),
    @CreatedBy INT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        DECLARE @NewTask TABLE
        (
            TaskId INT
        );

        BEGIN TRANSACTION;

        IF NOT EXISTS
        (
            SELECT 1
            FROM Users
            WHERE UserId = @AssignedTo
              AND Role = 'Employee'
              AND IsActive = 1
        )
        BEGIN
            THROW 50004, 'Assigned employee is invalid or inactive.', 1;
        END;

        IF @Priority NOT IN ('Low', 'High')
        BEGIN
            THROW 50005, 'Invalid task priority.', 1;
        END;

        INSERT INTO Tasks
        (
            Title,
            Description,
            AssignedTo,
            Priority,
            Status,
            DueDate,
            IsActive,
            IsDeleted,
            CreatedOn,
            CreatedBy
        )
        OUTPUT INSERTED.TaskId INTO @NewTask
        VALUES
        (
            @Title,
            @Description,
            @AssignedTo,
            @Priority,
            'Pending',
            @DueDate,
            1,
            0,
            GETDATE(),
            @CreatedBy
        );

        DECLARE @TaskId INT;

        SELECT
            @TaskId = TaskId
        FROM @NewTask;

        INSERT INTO TaskHistory
        (
            TaskId,
            Title,
            Description,
            AssignedTo,
            Priority,
            Status,
            DueDate,
            IsActive,
            IsDeleted,
            CreatedOn,
            CreatedBy,
            HistoryAction,
            HistoryOn,
            HistoryBy
        )
        SELECT
            TaskId,
            Title,
            Description,
            AssignedTo,
            Priority,
            Status,
            DueDate,
            IsActive,
            IsDeleted,
            CreatedOn,
            CreatedBy,
            'INSERT',
            GETDATE(),
            @CreatedBy
        FROM Tasks
        WHERE TaskId = @TaskId;

        COMMIT TRANSACTION;

        SELECT @TaskId AS TaskId;

    END TRY
    BEGIN CATCH

        DECLARE
            @SPName NVARCHAR(200),
            @ErrorNumber INT,
            @ErrorSeverity INT,
            @ErrorState INT,
            @ErrorLine INT,
            @ErrorProcedure NVARCHAR(200),
            @ErrorMessage NVARCHAR(MAX);

        SELECT
            @SPName = OBJECT_NAME(@@PROCID),
            @ErrorNumber = ERROR_NUMBER(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE(),
            @ErrorLine = ERROR_LINE(),
            @ErrorProcedure = ERROR_PROCEDURE(),
            @ErrorMessage = ERROR_MESSAGE();

        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        EXEC SP_LogException
            @SPName = @SPName,
            @ErrorNumber = @ErrorNumber,
            @ErrorSeverity = @ErrorSeverity,
            @ErrorState = @ErrorState,
            @ErrorLine = @ErrorLine,
            @ErrorProcedure = @ErrorProcedure,
            @ErrorMessage = @ErrorMessage;

        THROW;

    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_Task_Delete]    Script Date: 8/14/2026 11:06:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_Task_Delete]
(
    @TaskId INT,
    @DeletedBy INT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        BEGIN TRANSACTION;

        IF NOT EXISTS
        (
            SELECT 1
            FROM Tasks
            WHERE TaskId = @TaskId
              AND IsActive = 1
              AND IsDeleted = 0
        )
        BEGIN
            THROW 50009, 'Task not found.', 1;
        END;

        INSERT INTO TaskHistory
        (
            TaskId,
            Title,
            Description,
            AssignedTo,
            Priority,
            Status,
            DueDate,
            IsActive,
            IsDeleted,
            CreatedOn,
            CreatedBy,
            UpdatedOn,
            UpdatedBy,
            DeletedOn,
            DeletedBy,
            HistoryAction,
            HistoryOn,
            HistoryBy
        )
        SELECT
            TaskId,
            Title,
            Description,
            AssignedTo,
            Priority,
            Status,
            DueDate,
            IsActive,
            IsDeleted,
            CreatedOn,
            CreatedBy,
            UpdatedOn,
            UpdatedBy,
            GETDATE(),
            @DeletedBy,
            'DELETE',
            GETDATE(),
            @DeletedBy
        FROM Tasks
        WHERE TaskId = @TaskId;

        UPDATE Tasks
        SET
            IsActive = 0,
            IsDeleted = 1,
            DeletedOn = GETDATE(),
            DeletedBy = @DeletedBy,
            UpdatedOn = GETDATE(),
            UpdatedBy = @DeletedBy
        OUTPUT INSERTED.TaskId
        WHERE TaskId = @TaskId;

        COMMIT TRANSACTION;

    END TRY
    BEGIN CATCH

        DECLARE
            @SPName NVARCHAR(200),
            @ErrorNumber INT,
            @ErrorSeverity INT,
            @ErrorState INT,
            @ErrorLine INT,
            @ErrorProcedure NVARCHAR(200),
            @ErrorMessage NVARCHAR(MAX);

        SELECT
            @SPName = OBJECT_NAME(@@PROCID),
            @ErrorNumber = ERROR_NUMBER(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE(),
            @ErrorLine = ERROR_LINE(),
            @ErrorProcedure = ERROR_PROCEDURE(),
            @ErrorMessage = ERROR_MESSAGE();

        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        EXEC SP_LogException
            @SPName = @SPName,
            @ErrorNumber = @ErrorNumber,
            @ErrorSeverity = @ErrorSeverity,
            @ErrorState = @ErrorState,
            @ErrorLine = @ErrorLine,
            @ErrorProcedure = @ErrorProcedure,
            @ErrorMessage = @ErrorMessage;

        THROW;

    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_Task_GetAll]    Script Date: 8/14/2026 11:06:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_Task_GetAll]
(
    @Search      NVARCHAR(200) = NULL,
    @Status      NVARCHAR(20)  = NULL,
    @Priority    NVARCHAR(10)  = NULL,
    @AssignedTo  INT           = NULL,
    @PageNumber  INT           = 1,
    @PageSize    INT           = 10
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        IF @PageNumber IS NULL OR @PageNumber < 1
            SET @PageNumber = 1;

        IF @PageSize IS NULL OR @PageSize < 1
            SET @PageSize = 10;

        IF @PageSize > 100
            SET @PageSize = 100;

        SELECT T.TaskId, T.Title, T.Description, T.AssignedTo, U.Name AS AssignedEmployee, T.Priority,
               T.Status, T.DueDate, T.IsActive, T.CreatedOn, T.CreatedBy, T.StatusUpdatedOn, T.UpdatedOn, T.UpdatedBy,
               COUNT(*) OVER() AS TotalCount
        FROM Tasks T
        INNER JOIN Users U ON T.AssignedTo = U.UserId
        WHERE T.IsActive = 1 AND T.IsDeleted = 0
          AND
          (
              @Search IS NULL
              OR T.Title LIKE '%' + @Search + '%'
              OR U.Name LIKE '%' + @Search + '%'
          )
          AND
          (
              @Status IS NULL
              OR T.Status = @Status
          )
          AND
          (
              @Priority IS NULL
              OR T.Priority = @Priority
          )
          AND
          (
              @AssignedTo IS NULL
              OR T.AssignedTo = @AssignedTo
          )
        ORDER BY T.TaskId DESC
        OFFSET (@PageNumber - 1) * @PageSize ROWS
        FETCH NEXT @PageSize ROWS ONLY;

    END TRY
    BEGIN CATCH

        DECLARE
            @SPName NVARCHAR(200),
            @ErrorNumber INT,
            @ErrorSeverity INT,
            @ErrorState INT,
            @ErrorLine INT,
            @ErrorProcedure NVARCHAR(200),
            @ErrorMessage NVARCHAR(MAX);

        SELECT
            @SPName = OBJECT_NAME(@@PROCID),
            @ErrorNumber = ERROR_NUMBER(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE(),
            @ErrorLine = ERROR_LINE(),
            @ErrorProcedure = ERROR_PROCEDURE(),
            @ErrorMessage = ERROR_MESSAGE();

        EXEC SP_LogException
            @SPName = @SPName,
            @ErrorNumber = @ErrorNumber,
            @ErrorSeverity = @ErrorSeverity,
            @ErrorState = @ErrorState,
            @ErrorLine = @ErrorLine,
            @ErrorProcedure = @ErrorProcedure,
            @ErrorMessage = @ErrorMessage;

        THROW;

    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_Task_GetById]    Script Date: 8/14/2026 11:06:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_Task_GetById]
(
    @TaskId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        SELECT
            T.TaskId,
            T.Title,
            T.Description,
            T.AssignedTo,
            U.Name AS AssignedEmployee,
            T.Priority,
            T.Status,
            T.DueDate,
            T.IsActive,
            T.IsDeleted,
            T.CreatedOn,
            T.CreatedBy,
            T.StatusUpdatedOn,
            T.UpdatedOn,
            T.UpdatedBy
        FROM Tasks T
        INNER JOIN Users U
            ON T.AssignedTo = U.UserId
        WHERE T.TaskId = @TaskId
          AND T.IsActive = 1
          AND T.IsDeleted = 0;

    END TRY
    BEGIN CATCH

        DECLARE
            @SPName NVARCHAR(200),
            @ErrorNumber INT,
            @ErrorSeverity INT,
            @ErrorState INT,
            @ErrorLine INT,
            @ErrorProcedure NVARCHAR(200),
            @ErrorMessage NVARCHAR(MAX);

        SELECT
            @SPName = OBJECT_NAME(@@PROCID),
            @ErrorNumber = ERROR_NUMBER(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE(),
            @ErrorLine = ERROR_LINE(),
            @ErrorProcedure = ERROR_PROCEDURE(),
            @ErrorMessage = ERROR_MESSAGE();

        EXEC SP_LogException
            @SPName = @SPName,
            @ErrorNumber = @ErrorNumber,
            @ErrorSeverity = @ErrorSeverity,
            @ErrorState = @ErrorState,
            @ErrorLine = @ErrorLine,
            @ErrorProcedure = @ErrorProcedure,
            @ErrorMessage = @ErrorMessage;

        THROW;

    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_Task_Update]    Script Date: 8/14/2026 11:06:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_Task_Update]
(
    @TaskId INT,
    @Title NVARCHAR(200),
    @Description NVARCHAR(MAX),
    @AssignedTo INT,
    @Priority NVARCHAR(10),
    @DueDate DATETIME2(0),
    @UpdatedBy INT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        BEGIN TRANSACTION;

        IF NOT EXISTS
        (
            SELECT 1
            FROM Tasks
            WHERE TaskId = @TaskId
              AND IsActive = 1
              AND IsDeleted = 0
        )
        BEGIN
            THROW 50006, 'Task not found.', 1;
        END;

        IF NOT EXISTS
        (
            SELECT 1
            FROM Users
            WHERE UserId = @AssignedTo
              AND Role = 'Employee'
              AND IsActive = 1
        )
        BEGIN
            THROW 50007, 'Assigned employee is invalid or inactive.', 1;
        END;

        IF @Priority NOT IN ('Low', 'High')
        BEGIN
            THROW 50008, 'Invalid task priority.', 1;
        END;

        INSERT INTO TaskHistory
        (
            TaskId,
            Title,
            Description,
            AssignedTo,
            Priority,
            Status,
            DueDate,
            IsActive,
            IsDeleted,
            CreatedOn,
            CreatedBy,
            UpdatedOn,
            UpdatedBy,
            DeletedOn,
            DeletedBy,
            HistoryAction,
            HistoryOn,
            HistoryBy
        )
        SELECT
            TaskId,
            Title,
            Description,
            AssignedTo,
            Priority,
            Status,
            DueDate,
            IsActive,
            IsDeleted,
            CreatedOn,
            CreatedBy,
            UpdatedOn,
            UpdatedBy,
            DeletedOn,
            DeletedBy,
            'UPDATE',
            GETDATE(),
            @UpdatedBy
        FROM Tasks
        WHERE TaskId = @TaskId;

        UPDATE Tasks
        SET
            Title = @Title,
            Description = @Description,
            AssignedTo = @AssignedTo,
            Priority = @Priority,
            DueDate = @DueDate,
            UpdatedOn = GETDATE(),
            UpdatedBy = @UpdatedBy
        OUTPUT INSERTED.TaskId
        WHERE TaskId = @TaskId;

        COMMIT TRANSACTION;

    END TRY
    BEGIN CATCH

        DECLARE
            @SPName NVARCHAR(200),
            @ErrorNumber INT,
            @ErrorSeverity INT,
            @ErrorState INT,
            @ErrorLine INT,
            @ErrorProcedure NVARCHAR(200),
            @ErrorMessage NVARCHAR(MAX);

        SELECT
            @SPName = OBJECT_NAME(@@PROCID),
            @ErrorNumber = ERROR_NUMBER(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE(),
            @ErrorLine = ERROR_LINE(),
            @ErrorProcedure = ERROR_PROCEDURE(),
            @ErrorMessage = ERROR_MESSAGE();

        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        EXEC SP_LogException
            @SPName = @SPName,
            @ErrorNumber = @ErrorNumber,
            @ErrorSeverity = @ErrorSeverity,
            @ErrorState = @ErrorState,
            @ErrorLine = @ErrorLine,
            @ErrorProcedure = @ErrorProcedure,
            @ErrorMessage = @ErrorMessage;

        THROW;

    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_Task_UpdateStatus]    Script Date: 8/14/2026 11:06:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_Task_UpdateStatus]
(
    @TaskId INT,
    @Status NVARCHAR(20),
    @UpdatedBy INT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        BEGIN TRANSACTION;

        IF NOT EXISTS
        (
            SELECT 1
            FROM Tasks
            WHERE TaskId = @TaskId
              AND IsActive = 1
              AND IsDeleted = 0
              AND AssignedTo = @UpdatedBy
        )
        BEGIN
            THROW 50010, 'Task not found for this user.', 1;
        END;

        IF @Status NOT IN ('Pending', 'Completed')
        BEGIN
            THROW 50011, 'Invalid task status.', 1;
        END;

        INSERT INTO TaskHistory
        (
            TaskId,
            Title,
            Description,
            AssignedTo,
            Priority,
            Status,
            DueDate,
            IsActive,
            IsDeleted,
            CreatedOn,
            CreatedBy,
            UpdatedOn,
            UpdatedBy,
            DeletedOn,
            DeletedBy,
            HistoryAction,
            HistoryOn,
            HistoryBy
        )
        SELECT
            TaskId,
            Title,
            Description,
            AssignedTo,
            Priority,
            Status,
            DueDate,
            IsActive,
            IsDeleted,
            CreatedOn,
            CreatedBy,
            UpdatedOn,
            UpdatedBy,
            DeletedOn,
            DeletedBy,
            'STATUS_UPDATE',
            GETDATE(),
            @UpdatedBy
        FROM Tasks
        WHERE TaskId = @TaskId;

        UPDATE Tasks
        SET
            Status = @Status,
            StatusUpdatedOn = GETDATE(),
            UpdatedOn = GETDATE(),
            UpdatedBy = @UpdatedBy
        OUTPUT INSERTED.TaskId
        WHERE TaskId = @TaskId;

        COMMIT TRANSACTION;

    END TRY
    BEGIN CATCH

        DECLARE
            @SPName NVARCHAR(200),
            @ErrorNumber INT,
            @ErrorSeverity INT,
            @ErrorState INT,
            @ErrorLine INT,
            @ErrorProcedure NVARCHAR(200),
            @ErrorMessage NVARCHAR(MAX);

        SELECT
            @SPName = OBJECT_NAME(@@PROCID),
            @ErrorNumber = ERROR_NUMBER(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE(),
            @ErrorLine = ERROR_LINE(),
            @ErrorProcedure = ERROR_PROCEDURE(),
            @ErrorMessage = ERROR_MESSAGE();

        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        EXEC SP_LogException
            @SPName = @SPName,
            @ErrorNumber = @ErrorNumber,
            @ErrorSeverity = @ErrorSeverity,
            @ErrorState = @ErrorState,
            @ErrorLine = @ErrorLine,
            @ErrorProcedure = @ErrorProcedure,
            @ErrorMessage = @ErrorMessage;

        THROW;

    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_User_Login]    Script Date: 8/14/2026 11:06:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_User_Login]
(
    @Email NVARCHAR(150)
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        SELECT
            UserId,
            Name,
            Email,
            PasswordHash,
            Role,
            IsActive
        FROM Users
        WHERE Email = @Email
          AND IsActive = 1;

    END TRY
    BEGIN CATCH

        DECLARE
            @SPName NVARCHAR(200),
            @ErrorNumber INT,
            @ErrorSeverity INT,
            @ErrorState INT,
            @ErrorLine INT,
            @ErrorProcedure NVARCHAR(200),
            @ErrorMessage NVARCHAR(MAX);

        SELECT
            @SPName = OBJECT_NAME(@@PROCID),
            @ErrorNumber = ERROR_NUMBER(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE(),
            @ErrorLine = ERROR_LINE(),
            @ErrorProcedure = ERROR_PROCEDURE(),
            @ErrorMessage = ERROR_MESSAGE();

        EXEC SP_LogException
            @SPName = @SPName,
            @ErrorNumber = @ErrorNumber,
            @ErrorSeverity = @ErrorSeverity,
            @ErrorState = @ErrorState,
            @ErrorLine = @ErrorLine,
            @ErrorProcedure = @ErrorProcedure,
            @ErrorMessage = @ErrorMessage;

        THROW;

    END CATCH
END;
GO
