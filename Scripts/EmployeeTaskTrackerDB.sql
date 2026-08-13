USE [EmployeeTaskTrackerDB]
GO
/****** Object:  Table [dbo].[ExceptionLog]    Script Date: 8/13/2026 10:41:31 PM ******/
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
/****** Object:  Table [dbo].[TaskHistory]    Script Date: 8/13/2026 10:41:31 PM ******/
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
/****** Object:  Table [dbo].[Tasks]    Script Date: 8/13/2026 10:41:31 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 8/13/2026 10:41:31 PM ******/
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
SET IDENTITY_INSERT [dbo].[ExceptionLog] ON 
GO
INSERT [dbo].[ExceptionLog] ([ExceptionLogId], [SPName], [ErrorNumber], [ErrorSeverity], [ErrorState], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDate]) VALUES (1, N'SP_Employee_Create', 50001, 16, 1, 23, N'SP_Employee_Create', N'Email already exists.', CAST(N'2026-08-13T14:00:40.0000000' AS DateTime2))
GO
INSERT [dbo].[ExceptionLog] ([ExceptionLogId], [SPName], [ErrorNumber], [ErrorSeverity], [ErrorState], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDate]) VALUES (2, N'SP_Task_Create', 50004, 16, 1, 32, N'SP_Task_Create', N'Assigned employee is invalid or inactive.', CAST(N'2026-08-13T17:37:21.0000000' AS DateTime2))
GO
INSERT [dbo].[ExceptionLog] ([ExceptionLogId], [SPName], [ErrorNumber], [ErrorSeverity], [ErrorState], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDate]) VALUES (3, N'SP_Task_Update', 50007, 16, 1, 40, N'SP_Task_Update', N'Assigned employee is invalid or inactive.', CAST(N'2026-08-13T17:40:22.0000000' AS DateTime2))
GO
INSERT [dbo].[ExceptionLog] ([ExceptionLogId], [SPName], [ErrorNumber], [ErrorSeverity], [ErrorState], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDate]) VALUES (4, N'SP_Task_UpdateStatus', 50010, 16, 1, 25, N'SP_Task_UpdateStatus', N'Task not found.', CAST(N'2026-08-13T17:47:10.0000000' AS DateTime2))
GO
INSERT [dbo].[ExceptionLog] ([ExceptionLogId], [SPName], [ErrorNumber], [ErrorSeverity], [ErrorState], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDate]) VALUES (5, N'SP_Task_UpdateStatus', 50010, 16, 1, 25, N'SP_Task_UpdateStatus', N'Task not found for this user.', CAST(N'2026-08-13T17:48:37.0000000' AS DateTime2))
GO
INSERT [dbo].[ExceptionLog] ([ExceptionLogId], [SPName], [ErrorNumber], [ErrorSeverity], [ErrorState], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDate]) VALUES (6, N'SP_Task_UpdateStatus', 50010, 16, 1, 25, N'SP_Task_UpdateStatus', N'Task not found for this user.', CAST(N'2026-08-13T17:52:32.0000000' AS DateTime2))
GO
INSERT [dbo].[ExceptionLog] ([ExceptionLogId], [SPName], [ErrorNumber], [ErrorSeverity], [ErrorState], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDate]) VALUES (7, N'SP_Task_UpdateStatus', 50010, 16, 1, 25, N'SP_Task_UpdateStatus', N'Task not found for this user.', CAST(N'2026-08-13T17:52:59.0000000' AS DateTime2))
GO
INSERT [dbo].[ExceptionLog] ([ExceptionLogId], [SPName], [ErrorNumber], [ErrorSeverity], [ErrorState], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDate]) VALUES (8, N'SP_Task_UpdateStatus', 50010, 16, 1, 25, N'SP_Task_UpdateStatus', N'Task not found for this user.', CAST(N'2026-08-13T17:53:46.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[ExceptionLog] OFF
GO
SET IDENTITY_INSERT [dbo].[TaskHistory] ON 
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (1, 1, N'Prepare API documentation', N'Create API documentation for the task tracker', 5, N'High', N'Pending', CAST(N'2026-08-20T18:00:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T17:37:37.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, N'INSERT', CAST(N'2026-08-13T17:37:37.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (2, 1, N'Prepare API documentation', N'Create API documentation for the task tracker', 5, N'High', N'Pending', CAST(N'2026-08-20T18:00:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T17:37:37.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, N'UPDATE', CAST(N'2026-08-13T17:38:30.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (3, 1, N'Updated API documentation', N'Updated task description', 3, N'Low', N'Pending', CAST(N'2026-08-22T18:00:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T17:37:37.0000000' AS DateTime2), 1, CAST(N'2026-08-13T17:38:30.0000000' AS DateTime2), 1, NULL, NULL, N'UPDATE', CAST(N'2026-08-13T17:39:40.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (4, 1, N'Updated API documentation', N'Updated task description', 5, N'Low', N'Pending', CAST(N'2026-08-22T18:00:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T17:37:37.0000000' AS DateTime2), 1, CAST(N'2026-08-13T17:39:40.0000000' AS DateTime2), 1, NULL, NULL, N'STATUS_UPDATE', CAST(N'2026-08-13T17:42:48.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (5, 1, N'Updated API documentation', N'Updated task description', 5, N'Low', N'Pending', CAST(N'2026-08-22T18:00:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T17:37:37.0000000' AS DateTime2), 1, CAST(N'2026-08-13T17:42:48.0000000' AS DateTime2), 1, NULL, NULL, N'STATUS_UPDATE', CAST(N'2026-08-13T17:45:50.0000000' AS DateTime2), 3)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (6, 2, N'Prepare API documentation', N'Create API documentation for the task tracker', 3, N'High', N'Pending', CAST(N'2026-08-20T18:00:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T17:51:57.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, N'INSERT', CAST(N'2026-08-13T17:51:57.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (7, 3, N'Prepare API documentation', N'Create API documentation for the task tracker', 4, N'High', N'Pending', CAST(N'2026-08-20T18:00:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T17:55:32.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, N'INSERT', CAST(N'2026-08-13T17:55:32.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (8, 3, N'Prepare API documentation', N'Create API documentation for the task tracker', 4, N'High', N'Pending', CAST(N'2026-08-20T18:00:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T17:55:32.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, N'STATUS_UPDATE', CAST(N'2026-08-13T17:56:02.0000000' AS DateTime2), 4)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (9, 3, N'Prepare API documentation', N'Create API documentation for the task tracker', 4, N'High', N'Completed', CAST(N'2026-08-20T18:00:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T17:55:32.0000000' AS DateTime2), 1, CAST(N'2026-08-13T17:56:02.0000000' AS DateTime2), 4, CAST(N'2026-08-13T18:04:25.0000000' AS DateTime2), 1, N'DELETE', CAST(N'2026-08-13T18:04:25.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (10, 4, N'New Title', N'Desc', 4, N'High', N'Pending', CAST(N'2026-08-13T19:37:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T19:37:51.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, N'INSERT', CAST(N'2026-08-13T19:37:51.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (11, 4, N'New Title', N'Desc', 4, N'High', N'Pending', CAST(N'2026-08-13T19:37:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T19:37:51.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, N'STATUS_UPDATE', CAST(N'2026-08-13T19:38:01.0000000' AS DateTime2), 4)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (12, 4, N'New Title', N'Desc', 4, N'High', N'Completed', CAST(N'2026-08-13T19:37:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T19:37:51.0000000' AS DateTime2), 1, CAST(N'2026-08-13T19:38:01.0000000' AS DateTime2), 4, NULL, NULL, N'STATUS_UPDATE', CAST(N'2026-08-13T20:20:29.0000000' AS DateTime2), 4)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (13, 4, N'New Title', N'Desc', 4, N'High', N'Pending', CAST(N'2026-08-13T19:37:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T19:37:51.0000000' AS DateTime2), 1, CAST(N'2026-08-13T20:20:29.0000000' AS DateTime2), 4, NULL, NULL, N'STATUS_UPDATE', CAST(N'2026-08-13T20:20:32.0000000' AS DateTime2), 4)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (14, 5, N'ww', N'ww', 4, N'Low', N'Pending', CAST(N'2026-08-13T20:21:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T20:21:22.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, N'INSERT', CAST(N'2026-08-13T20:21:22.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (15, 5, N'ww', N'ww', 4, N'Low', N'Pending', CAST(N'2026-08-13T20:21:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T20:21:22.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, N'STATUS_UPDATE', CAST(N'2026-08-13T20:21:30.0000000' AS DateTime2), 4)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (16, 5, N'ww', N'ww', 4, N'Low', N'Completed', CAST(N'2026-08-13T20:21:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T20:21:22.0000000' AS DateTime2), 1, CAST(N'2026-08-13T20:21:30.0000000' AS DateTime2), 4, NULL, NULL, N'UPDATE', CAST(N'2026-08-13T20:31:50.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (17, 5, N'ww', N'ww', 4, N'Low', N'Completed', CAST(N'2026-08-13T20:21:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T20:21:22.0000000' AS DateTime2), 1, CAST(N'2026-08-13T20:31:50.0000000' AS DateTime2), 1, NULL, NULL, N'UPDATE', CAST(N'2026-08-13T20:32:01.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (18, 5, N'ww', N'wwasas', 4, N'Low', N'Completed', CAST(N'2026-08-13T20:21:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T20:21:22.0000000' AS DateTime2), 1, CAST(N'2026-08-13T20:32:01.0000000' AS DateTime2), 1, NULL, NULL, N'UPDATE', CAST(N'2026-08-13T20:32:11.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (19, 5, N'wwasas', N'wwasas', 4, N'Low', N'Completed', CAST(N'2026-08-13T20:21:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T20:21:22.0000000' AS DateTime2), 1, CAST(N'2026-08-13T20:32:11.0000000' AS DateTime2), 1, NULL, NULL, N'UPDATE', CAST(N'2026-08-13T20:32:17.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (20, 6, N'asdasdfsdf', N'dsfds', 4, N'Low', N'Pending', CAST(N'2026-08-13T20:44:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T20:44:22.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, N'INSERT', CAST(N'2026-08-13T20:44:22.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (21, 6, N'asdasdfsdf', N'dsfds', 4, N'Low', N'Pending', CAST(N'2026-08-13T20:44:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T20:44:22.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, N'STATUS_UPDATE', CAST(N'2026-08-13T20:44:31.0000000' AS DateTime2), 4)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (22, 6, N'asdasdfsdf', N'dsfds', 4, N'Low', N'Completed', CAST(N'2026-08-13T20:44:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T20:44:22.0000000' AS DateTime2), 1, CAST(N'2026-08-13T20:44:31.0000000' AS DateTime2), 4, NULL, NULL, N'UPDATE', CAST(N'2026-08-13T20:45:35.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (23, 7, N'Test Task 1', N'TEst TAsk DEsc', 6, N'High', N'Pending', CAST(N'2026-08-13T20:49:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T20:49:23.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, N'INSERT', CAST(N'2026-08-13T20:49:23.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (24, 7, N'Test Task 1', N'TEst TAsk DEsc', 6, N'High', N'Pending', CAST(N'2026-08-13T20:49:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T20:49:23.0000000' AS DateTime2), 1, NULL, NULL, NULL, NULL, N'STATUS_UPDATE', CAST(N'2026-08-13T20:49:49.0000000' AS DateTime2), 6)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (25, 7, N'Test Task 1', N'TEst TAsk DEsc', 6, N'High', N'Completed', CAST(N'2026-08-13T20:49:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T20:49:23.0000000' AS DateTime2), 1, CAST(N'2026-08-13T20:49:49.0000000' AS DateTime2), 6, NULL, NULL, N'UPDATE', CAST(N'2026-08-13T21:41:12.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[TaskHistory] ([TaskHistoryId], [TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [HistoryAction], [HistoryOn], [HistoryBy]) VALUES (26, 2, N'Prepare API documentation', N'Create API documentation for the task tracker', 3, N'High', N'Pending', CAST(N'2026-08-20T18:00:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T17:51:57.0000000' AS DateTime2), 1, NULL, NULL, CAST(N'2026-08-13T21:46:59.0000000' AS DateTime2), 1, N'DELETE', CAST(N'2026-08-13T21:46:59.0000000' AS DateTime2), 1)
GO
SET IDENTITY_INSERT [dbo].[TaskHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Tasks] ON 
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [StatusUpdatedOn], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (1, N'Updated API documentation', N'Updated task description', 5, N'Low', N'Pending', CAST(N'2026-08-22T18:00:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T17:37:37.0000000' AS DateTime2), 1, NULL, CAST(N'2026-08-13T17:45:50.0000000' AS DateTime2), 3, NULL, NULL)
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [StatusUpdatedOn], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (2, N'Prepare API documentation', N'Create API documentation for the task tracker', 3, N'High', N'Pending', CAST(N'2026-08-20T18:00:00.0000000' AS DateTime2), 0, 1, CAST(N'2026-08-13T17:51:57.0000000' AS DateTime2), 1, NULL, CAST(N'2026-08-13T21:46:59.0000000' AS DateTime2), 1, CAST(N'2026-08-13T21:46:59.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [StatusUpdatedOn], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (3, N'Prepare API documentation', N'Create API documentation for the task tracker', 4, N'High', N'Completed', CAST(N'2026-08-20T18:00:00.0000000' AS DateTime2), 0, 1, CAST(N'2026-08-13T17:55:32.0000000' AS DateTime2), 1, NULL, CAST(N'2026-08-13T18:04:25.0000000' AS DateTime2), 1, CAST(N'2026-08-13T18:04:25.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [StatusUpdatedOn], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (4, N'New Title', N'Desc', 4, N'High', N'Completed', CAST(N'2026-08-13T19:37:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T19:37:51.0000000' AS DateTime2), 1, CAST(N'2026-08-13T20:20:32.1033333' AS DateTime2), CAST(N'2026-08-13T20:20:32.0000000' AS DateTime2), 4, NULL, NULL)
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [StatusUpdatedOn], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (5, N'wwasas', N'wwasas', 5, N'Low', N'Completed', CAST(N'2026-08-13T20:21:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T20:21:22.0000000' AS DateTime2), 1, CAST(N'2026-08-13T20:21:30.2266667' AS DateTime2), CAST(N'2026-08-13T20:32:17.0000000' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [StatusUpdatedOn], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (6, N'asdasdfsdf', N'dsfds', 4, N'Low', N'Completed', CAST(N'2026-08-13T20:44:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T20:44:22.0000000' AS DateTime2), 1, CAST(N'2026-08-13T20:44:30.8700000' AS DateTime2), CAST(N'2026-08-13T20:45:35.0000000' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedTo], [Priority], [Status], [DueDate], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [StatusUpdatedOn], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (7, N'Test Task 1', N'TEst TAsk DEsc', 6, N'High', N'Completed', CAST(N'2026-08-13T20:49:00.0000000' AS DateTime2), 1, 0, CAST(N'2026-08-13T20:49:23.0000000' AS DateTime2), 1, CAST(N'2026-08-13T20:49:48.6033333' AS DateTime2), CAST(N'2026-08-13T21:41:12.0000000' AS DateTime2), 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Tasks] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [PasswordHash], [Role], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'System Admin', N'admin@test.com', N'2JivJfc6cijJSOHvSVT8MA==.AHjf8zzl0lVwCqCe6L12BpBkaxBvU7JiSCLYf8/Wg/E=', N'Admin', 1, CAST(N'2026-08-13T13:39:51.0000000' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [PasswordHash], [Role], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, N'Updated Employee', N'emp3@example.com', N'1J4Pv2MTa4TS+Jd0jho6NQ==.Dhh9ka/d/wRC0ECPssr32q4qzG/qNsx48Ljm/irZSdc=', N'Employee', 1, CAST(N'2026-08-13T14:01:35.0000000' AS DateTime2), 1, CAST(N'2026-08-13T17:33:53.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [PasswordHash], [Role], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (3, N'Employee 2', N'emp2@test.com', N'2rGRW09HXBwioiBakXL7HQ==.e3TGPnhFVprc2dNSItdc5StCOHj5l7Guiivr+nR8+ek=', N'Employee', 0, CAST(N'2026-08-13T14:11:13.0000000' AS DateTime2), 1, CAST(N'2026-08-13T19:34:27.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [PasswordHash], [Role], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (4, N'Employee 3', N'emp3@test.com', N'z/NPoZ5gD7IVpqPzHjzoqQ==.w5lG795UJMhZHod2cXq0iN0yV9HFhS6a6vzdFZtK5Gs=', N'Employee', 1, CAST(N'2026-08-13T17:30:43.0000000' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [PasswordHash], [Role], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (5, N'Employee 5', N'emp5@test.com', N'xXsmfgcVojwhYdpxPg9m4A==.8+gcd47w2u/iBYSl3CLM8hMXUfFsxkvYU/NLaRtyers=', N'Employee', 1, CAST(N'2026-08-13T17:35:29.0000000' AS DateTime2), 1, CAST(N'2026-08-13T17:50:58.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [PasswordHash], [Role], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (6, N'Test', N'test@gmail.com', N'8XaZynE5MfxMQo9CeT3PCw==.wtkoLpT+/xp160aaZr58FYbw5/LGJv/2C16BtX9sPMU=', N'Employee', 1, CAST(N'2026-08-13T20:48:57.0000000' AS DateTime2), 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Users_Email]    Script Date: 8/13/2026 10:41:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Dashboard_GetRecentTasks]    Script Date: 8/13/2026 10:41:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Dashboard_GetStatistics]    Script Date: 8/13/2026 10:41:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Employee_Create]    Script Date: 8/13/2026 10:41:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Employee_GetAll]    Script Date: 8/13/2026 10:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_Employee_GetAll]
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
        WHERE Role = 'Employee'
          AND IsActive = 1
        ORDER BY Name;

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
/****** Object:  StoredProcedure [dbo].[SP_Employee_GetByEmail]    Script Date: 8/13/2026 10:41:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Employee_GetById]    Script Date: 8/13/2026 10:41:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Employee_Update]    Script Date: 8/13/2026 10:41:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_LogException]    Script Date: 8/13/2026 10:41:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Task_Create]    Script Date: 8/13/2026 10:41:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Task_Delete]    Script Date: 8/13/2026 10:41:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Task_GetAll]    Script Date: 8/13/2026 10:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_Task_GetAll]
(
    @Search NVARCHAR(200) = NULL,
    @Status NVARCHAR(20) = NULL,
    @Priority NVARCHAR(10) = NULL,
    @AssignedTo INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        SELECT T.TaskId, T.Title, T.Description, T.AssignedTo, U.Name AS AssignedEmployee, T.Priority,
               T.Status, T.DueDate, T.IsActive, T.CreatedOn, T.CreatedBy, T.StatusUpdatedOn, T.UpdatedOn, T.UpdatedBy
        FROM Tasks T
        INNER JOIN Users U ON T.AssignedTo = U.UserId
        WHERE T.IsActive = 1 AND T.IsDeleted = 0
          AND
          (
              @Search IS NULL
              OR T.Title LIKE '%' + @Search + '%'
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
        ORDER BY T.TaskId DESC;

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
/****** Object:  StoredProcedure [dbo].[SP_Task_GetById]    Script Date: 8/13/2026 10:41:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Task_Update]    Script Date: 8/13/2026 10:41:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Task_UpdateStatus]    Script Date: 8/13/2026 10:41:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_User_Login]    Script Date: 8/13/2026 10:41:31 PM ******/
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
