/*
 Navicat Premium Data Transfer

 Source Server         : Azure Database
 Source Server Type    : SQL Server
 Source Server Version : 12002255
 Source Host           : trungpham.database.windows.net:1433
 Source Catalog        : teeapp
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 12002255
 File Encoding         : 65001

 Date: 04/11/2021 05:53:59
*/


-- ----------------------------
-- Table structure for __EFMigrationsHistory
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[__EFMigrationsHistory]') AND type IN ('U'))
	DROP TABLE [dbo].[__EFMigrationsHistory]
GO

CREATE TABLE [dbo].[__EFMigrationsHistory] (
  [MigrationId] nvarchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ProductVersion] nvarchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL
)
GO


-- ----------------------------
-- Records of __EFMigrationsHistory
-- ----------------------------
INSERT INTO [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210919221541_Initial', N'5.0.9')
GO

INSERT INTO [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210920094625_AddIsReadNotificationField', N'5.0.9')
GO

INSERT INTO [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210920110452_RemoveSharedPostTable', N'5.0.9')
GO

INSERT INTO [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210925103205_AddUserFields', N'5.0.9')
GO

INSERT INTO [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210925215725_EditNotificationEntity', N'5.0.9')
GO

INSERT INTO [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210926035249_AddNotificationEntityField', N'5.0.9')
GO

INSERT INTO [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210926150636_EditNotificationEntityNotifierToRecipient', N'5.0.9')
GO

INSERT INTO [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211004004747_AddUserCoverAndNickName', N'5.0.9')
GO

INSERT INTO [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211005150635_EditNullableAboutMeAndNickName', N'5.0.9')
GO

INSERT INTO [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211009013350_RenameResponsedToResponded', N'5.0.9')
GO


-- ----------------------------
-- Table structure for AspNetRoleClaims
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoleClaims]') AND type IN ('U'))
	DROP TABLE [dbo].[AspNetRoleClaims]
GO

CREATE TABLE [dbo].[AspNetRoleClaims] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [RoleId] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ClaimType] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ClaimValue] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO


-- ----------------------------
-- Records of AspNetRoleClaims
-- ----------------------------
SET IDENTITY_INSERT [dbo].[AspNetRoleClaims] ON
GO

SET IDENTITY_INSERT [dbo].[AspNetRoleClaims] OFF
GO


-- ----------------------------
-- Table structure for AspNetRoles
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type IN ('U'))
	DROP TABLE [dbo].[AspNetRoles]
GO

CREATE TABLE [dbo].[AspNetRoles] (
  [Id] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Name] nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [NormalizedName] nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ConcurrencyStamp] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO


-- ----------------------------
-- Records of AspNetRoles
-- ----------------------------

-- ----------------------------
-- Table structure for AspNetUserClaims
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type IN ('U'))
	DROP TABLE [dbo].[AspNetUserClaims]
GO

CREATE TABLE [dbo].[AspNetUserClaims] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [UserId] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ClaimType] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ClaimValue] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO


-- ----------------------------
-- Records of AspNetUserClaims
-- ----------------------------
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] ON
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'id', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'2', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'userName', N'teeadmin')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'3', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'firstName', N'Admin')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'4', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'lastName', N'I am')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'5', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'fullName', N'I am Admin')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'6', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'email', N'phamchitrung.work@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'7', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'teeadmin')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'8', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'I am Admin')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'9', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'phamchitrung.work@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'10', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'id', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'11', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'userName', N'guestuser')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'12', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'firstName', N'Guest')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'13', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'lastName', N'User')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'14', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'fullName', N'User Guest')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'15', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'email', N'guest@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'16', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'guestuser')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'17', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'User Guest')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'18', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'guest@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'19', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'id', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'20', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'userName', N'pctrung')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'21', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'firstName', N'Trung')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'22', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'lastName', N'Pham Chí')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'23', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'fullName', N'Pham Chí Trung')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'24', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'email', N'phamchitrung.work@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'25', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'pctrung')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'26', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Pham Chí Trung')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'27', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'phamchitrung.work@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'28', N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'id', N'b693a4ec-5b99-4eeb-a684-9617ed847087')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'29', N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'userName', N'hoangthong')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'30', N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'firstName', N'Thong')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'31', N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'lastName', N'Nguyen')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'32', N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'fullName', N'Nguyen Thong')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'33', N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'email', N'thong0104@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'34', N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'hoangthong')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'35', N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Nguyen Thong')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'36', N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'thong0104@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'37', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'id', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'38', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'userName', N'tunglamnguyen')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'39', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'firstName', N'Lam')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'40', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'lastName', N'Nguyen')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'41', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'fullName', N'Nguyen Lam')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'42', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'email', N'tunglamvl0603@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'43', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'tunglamnguyen')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'44', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Nguyen Lam')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'45', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'tunglamvl0603@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'46', N'1bd1456a-42f8-4932-9016-63f7c209966a', N'id', N'1bd1456a-42f8-4932-9016-63f7c209966a')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'47', N'1bd1456a-42f8-4932-9016-63f7c209966a', N'userName', N'BaoKhanh')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'48', N'1bd1456a-42f8-4932-9016-63f7c209966a', N'firstName', N'Khánh')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'49', N'1bd1456a-42f8-4932-9016-63f7c209966a', N'lastName', N'Nguyễn')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'50', N'1bd1456a-42f8-4932-9016-63f7c209966a', N'fullName', N'Nguyễn Khánh')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'51', N'1bd1456a-42f8-4932-9016-63f7c209966a', N'email', N'khanh@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'52', N'1bd1456a-42f8-4932-9016-63f7c209966a', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'BaoKhanh')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'53', N'1bd1456a-42f8-4932-9016-63f7c209966a', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Nguyễn Khánh')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'54', N'1bd1456a-42f8-4932-9016-63f7c209966a', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'khanh@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'55', N'aed79f8f-a1e6-43b6-b369-151085d6b8d0', N'id', N'aed79f8f-a1e6-43b6-b369-151085d6b8d0')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'56', N'aed79f8f-a1e6-43b6-b369-151085d6b8d0', N'userName', N'lamnhuthuy')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'57', N'aed79f8f-a1e6-43b6-b369-151085d6b8d0', N'firstName', N'Huy')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'58', N'aed79f8f-a1e6-43b6-b369-151085d6b8d0', N'lastName', N'Lam')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'59', N'aed79f8f-a1e6-43b6-b369-151085d6b8d0', N'fullName', N'Lam Huy')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'60', N'aed79f8f-a1e6-43b6-b369-151085d6b8d0', N'email', N'huy@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'61', N'aed79f8f-a1e6-43b6-b369-151085d6b8d0', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'lamnhuthuy')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'62', N'aed79f8f-a1e6-43b6-b369-151085d6b8d0', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Lam Huy')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'63', N'aed79f8f-a1e6-43b6-b369-151085d6b8d0', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'huy@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'64', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'id', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'65', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'userName', N'doxuanyen')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'66', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'firstName', N'Yên')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'67', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'lastName', N'Đỗ')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'68', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'fullName', N'Đỗ Yên')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'69', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'email', N'dxyen3333@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'70', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'doxuanyen')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'71', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Đỗ Yên')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'72', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'dxyen3333@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'73', N'88fa2305-54f7-409b-9b46-a826f1e9e1d4', N'id', N'88fa2305-54f7-409b-9b46-a826f1e9e1d4')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'74', N'88fa2305-54f7-409b-9b46-a826f1e9e1d4', N'userName', N'haudiemxuan')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'75', N'88fa2305-54f7-409b-9b46-a826f1e9e1d4', N'firstName', N'Hầu')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'76', N'88fa2305-54f7-409b-9b46-a826f1e9e1d4', N'lastName', N'Diễm Xuân')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'77', N'88fa2305-54f7-409b-9b46-a826f1e9e1d4', N'fullName', N'Diễm Xuân Hầu')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'78', N'88fa2305-54f7-409b-9b46-a826f1e9e1d4', N'email', N'xuan@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'79', N'88fa2305-54f7-409b-9b46-a826f1e9e1d4', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'haudiemxuan')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'80', N'88fa2305-54f7-409b-9b46-a826f1e9e1d4', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Diễm Xuân Hầu')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'81', N'88fa2305-54f7-409b-9b46-a826f1e9e1d4', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'xuan@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'82', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'id', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'83', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'userName', N'mikami')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'84', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'firstName', N'Mikami')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'85', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'lastName', N'Yua')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'86', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'fullName', N'Yua Mikami')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'87', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'email', N'mikami@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'88', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'mikami')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'89', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Yua Mikami')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'90', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'mikami@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'91', N'62e18ec4-5fc6-4214-83aa-d1486efa4729', N'id', N'62e18ec4-5fc6-4214-83aa-d1486efa4729')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'92', N'62e18ec4-5fc6-4214-83aa-d1486efa4729', N'userName', N'UserName')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'93', N'62e18ec4-5fc6-4214-83aa-d1486efa4729', N'firstName', N'T')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'94', N'62e18ec4-5fc6-4214-83aa-d1486efa4729', N'lastName', N'T')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'95', N'62e18ec4-5fc6-4214-83aa-d1486efa4729', N'fullName', N'T T')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'96', N'62e18ec4-5fc6-4214-83aa-d1486efa4729', N'email', N'b@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'97', N'62e18ec4-5fc6-4214-83aa-d1486efa4729', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'UserName')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'98', N'62e18ec4-5fc6-4214-83aa-d1486efa4729', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'T T')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'99', N'62e18ec4-5fc6-4214-83aa-d1486efa4729', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'b@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'100', N'1e701476-d570-45d0-a0c6-948425401075', N'id', N'1e701476-d570-45d0-a0c6-948425401075')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'101', N'1e701476-d570-45d0-a0c6-948425401075', N'userName', N'testuser')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'102', N'1e701476-d570-45d0-a0c6-948425401075', N'firstName', N'Nghi')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'103', N'1e701476-d570-45d0-a0c6-948425401075', N'lastName', N'Nguyễn Vĩnh')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'104', N'1e701476-d570-45d0-a0c6-948425401075', N'fullName', N'Nguyễn Vĩnh Nghi')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'105', N'1e701476-d570-45d0-a0c6-948425401075', N'email', N'nghinv@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'106', N'1e701476-d570-45d0-a0c6-948425401075', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'testuser')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'107', N'1e701476-d570-45d0-a0c6-948425401075', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Nguyễn Vĩnh Nghi')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'108', N'1e701476-d570-45d0-a0c6-948425401075', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'nghinv@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'109', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'id', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'110', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'userName', N'testuser2')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'111', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'firstName', N'Vi')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'112', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'lastName', N'Lê Ngọc')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'113', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'fullName', N'Lê Ngọc Vi')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'114', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'email', N'lnvi@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'115', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'testuser2')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'116', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Lê Ngọc Vi')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'117', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'lnvi@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'118', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'id', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'119', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'userName', N'buidieuai')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'120', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'firstName', N'Ái')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'121', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'lastName', N'Bùi Diệu')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'122', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'fullName', N'Bùi Diệu Ái')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'123', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'email', N'buidieuai@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'124', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'buidieuai')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'125', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Bùi Diệu Ái')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'126', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'buidieuai@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'127', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'id', N'6e847afd-92b6-4c5a-90ae-98273135b4b1')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'128', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'userName', N'phuongtran')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'129', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'firstName', N'Phương')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'130', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'lastName', N'Trần Mỹ')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'131', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'fullName', N'Trần Mỹ Phương')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'132', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'email', N'phuongtran@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'133', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'phuongtran')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'134', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Trần Mỹ Phương')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'135', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'phuongtran@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'136', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'id', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'137', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'userName', N'guestuser2')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'138', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'firstName', N'Guest 2')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'139', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'lastName', N'User')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'140', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'fullName', N'User Guest 2')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'141', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'email', N'guest@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'142', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'guestuser2')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'143', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'User Guest 2')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'144', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'guest@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'145', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'id', N'2756572a-be3f-472f-9c4d-4e6c0f94c528')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'146', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'userName', N'quynhpham')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'147', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'firstName', N'Quỳnh')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'148', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'lastName', N'Phạm Phương')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'149', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'fullName', N'Phạm Phương Quỳnh')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'150', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'email', N'quynhpham@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'151', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'quynhpham')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'152', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Phạm Phương Quỳnh')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'153', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'quynhpham@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'154', N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'id', N'dc33f05c-611d-456f-9aa7-9ba652f70ee7')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'155', N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'userName', N'phuocloi11223')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'156', N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'firstName', N'Ngô')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'157', N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'lastName', N'Lợi')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'158', N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'fullName', N'Lợi Ngô')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'159', N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'email', N'phuocloi11223@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'160', N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'phuocloi11223')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'161', N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Lợi Ngô')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'162', N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'phuocloi11223@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'163', N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'id', N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'164', N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'userName', N'dhbao2505')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'165', N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'firstName', N'Bảo')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'166', N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'lastName', N'Dương')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'167', N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'fullName', N'Dương Bảo')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'168', N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'email', N'duongbao026@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'169', N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'dhbao2505')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'170', N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Dương Bảo')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'171', N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'duongbao026@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'172', N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'id', N'c43ccaba-83c7-42f3-a83f-fb973dcedadb')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'173', N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'userName', N'Duongnhu')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'174', N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'firstName', N'Dương')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'175', N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'lastName', N'Như')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'176', N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'fullName', N'Như Dương')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'177', N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'email', N'duongthihuynhnhu912017@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'178', N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'Duongnhu')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'179', N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Như Dương')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'180', N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'duongthihuynhnhu912017@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'181', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'id', N'c473bda2-7dec-4e97-a857-9111f63106cf')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'182', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'userName', N'nhamtphat')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'183', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'firstName', N'Phat')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'184', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'lastName', N'Nham')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'185', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'fullName', N'Nham Phat')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'186', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'email', N'phattannham@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'187', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'nhamtphat')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'188', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Nham Phat')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'189', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'phattannham@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'190', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'id', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'191', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'userName', N'ngkinh')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'192', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'firstName', N'Gia')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'193', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'lastName', N'Kính')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'194', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'fullName', N'Kính Gia')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'195', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'email', N'ngkinhitdeveloper@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'196', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'ngkinh')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'197', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Kính Gia')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'198', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'ngkinhitdeveloper@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'199', N'30855389-4934-4350-b69a-2a35bb66a946', N'id', N'30855389-4934-4350-b69a-2a35bb66a946')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'200', N'30855389-4934-4350-b69a-2a35bb66a946', N'userName', N'hoangminh')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'201', N'30855389-4934-4350-b69a-2a35bb66a946', N'firstName', N'Minh')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'202', N'30855389-4934-4350-b69a-2a35bb66a946', N'lastName', N'Hoang')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'203', N'30855389-4934-4350-b69a-2a35bb66a946', N'fullName', N'Hoang Minh')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'204', N'30855389-4934-4350-b69a-2a35bb66a946', N'email', N'hoangnguyengocvl@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'205', N'30855389-4934-4350-b69a-2a35bb66a946', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'hoangminh')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'206', N'30855389-4934-4350-b69a-2a35bb66a946', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Hoang Minh')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'207', N'30855389-4934-4350-b69a-2a35bb66a946', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'hoangnguyengocvl@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'208', N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'id', N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'209', N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'userName', N'guestuser3')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'210', N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'firstName', N'Guest 3')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'211', N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'lastName', N'User')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'212', N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'fullName', N'User Guest 3')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'213', N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'email', N'guest@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'214', N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'guestuser3')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'215', N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'User Guest 3')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'216', N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'guest@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'217', N'6705eedb-12d3-403d-acf5-e164c0d4b625', N'id', N'6705eedb-12d3-403d-acf5-e164c0d4b625')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'218', N'6705eedb-12d3-403d-acf5-e164c0d4b625', N'userName', N'cutegirl')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'219', N'6705eedb-12d3-403d-acf5-e164c0d4b625', N'firstName', N'Cute')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'220', N'6705eedb-12d3-403d-acf5-e164c0d4b625', N'lastName', N'Girl')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'221', N'6705eedb-12d3-403d-acf5-e164c0d4b625', N'fullName', N'Girl Cute')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'222', N'6705eedb-12d3-403d-acf5-e164c0d4b625', N'email', N'hongchau2000st@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'223', N'6705eedb-12d3-403d-acf5-e164c0d4b625', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'cutegirl')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'224', N'6705eedb-12d3-403d-acf5-e164c0d4b625', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Girl Cute')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'225', N'6705eedb-12d3-403d-acf5-e164c0d4b625', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'hongchau2000st@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'226', N'5a48f894-ca56-484b-8f9a-6d21b5868b97', N'id', N'5a48f894-ca56-484b-8f9a-6d21b5868b97')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'227', N'5a48f894-ca56-484b-8f9a-6d21b5868b97', N'userName', N'minhtran2468')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'228', N'5a48f894-ca56-484b-8f9a-6d21b5868b97', N'firstName', N'Tín')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'229', N'5a48f894-ca56-484b-8f9a-6d21b5868b97', N'lastName', N'Nguyễn Thanh')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'230', N'5a48f894-ca56-484b-8f9a-6d21b5868b97', N'fullName', N'Nguyễn Thanh Tín')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'231', N'5a48f894-ca56-484b-8f9a-6d21b5868b97', N'email', N'minhtran24681@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'232', N'5a48f894-ca56-484b-8f9a-6d21b5868b97', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'minhtran2468')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'233', N'5a48f894-ca56-484b-8f9a-6d21b5868b97', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Nguyễn Thanh Tín')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'234', N'5a48f894-ca56-484b-8f9a-6d21b5868b97', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'minhtran24681@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'235', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'id', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'236', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'userName', N'huynhnhuhue')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'237', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'firstName', N'huệ')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'238', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'lastName', N'huỳnh')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'239', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'fullName', N'huỳnh huệ')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'240', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'email', N'huynhnhuhue12345@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'241', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'huynhnhuhue')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'242', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'huỳnh huệ')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'243', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'huynhnhuhue12345@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'244', N'535fbe62-7546-4dd5-a1a8-ed5e2e70c058', N'id', N'535fbe62-7546-4dd5-a1a8-ed5e2e70c058')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'245', N'535fbe62-7546-4dd5-a1a8-ed5e2e70c058', N'userName', N'nguyenhuy2003')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'246', N'535fbe62-7546-4dd5-a1a8-ed5e2e70c058', N'firstName', N'Nguyễn')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'247', N'535fbe62-7546-4dd5-a1a8-ed5e2e70c058', N'lastName', N'Huy')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'248', N'535fbe62-7546-4dd5-a1a8-ed5e2e70c058', N'fullName', N'Huy Nguyễn')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'249', N'535fbe62-7546-4dd5-a1a8-ed5e2e70c058', N'email', N'nlhuy2003@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'250', N'535fbe62-7546-4dd5-a1a8-ed5e2e70c058', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'nguyenhuy2003')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'251', N'535fbe62-7546-4dd5-a1a8-ed5e2e70c058', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Huy Nguyễn')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'252', N'535fbe62-7546-4dd5-a1a8-ed5e2e70c058', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'nlhuy2003@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'253', N'21344cf9-faf5-4201-8eb2-dd8eed4281c2', N'id', N'21344cf9-faf5-4201-8eb2-dd8eed4281c2')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'254', N'21344cf9-faf5-4201-8eb2-dd8eed4281c2', N'userName', N'tolehoai')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'255', N'21344cf9-faf5-4201-8eb2-dd8eed4281c2', N'firstName', N'Tô')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'256', N'21344cf9-faf5-4201-8eb2-dd8eed4281c2', N'lastName', N'Lê Hoài')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'257', N'21344cf9-faf5-4201-8eb2-dd8eed4281c2', N'fullName', N'Lê Hoài Tô')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'258', N'21344cf9-faf5-4201-8eb2-dd8eed4281c2', N'email', N'tolehoai@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'259', N'21344cf9-faf5-4201-8eb2-dd8eed4281c2', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'tolehoai')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'260', N'21344cf9-faf5-4201-8eb2-dd8eed4281c2', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Lê Hoài Tô')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'261', N'21344cf9-faf5-4201-8eb2-dd8eed4281c2', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'tolehoai@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'262', N'a3c356cb-1d66-4307-9ffd-ac8528ccf61d', N'id', N'a3c356cb-1d66-4307-9ffd-ac8528ccf61d')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'263', N'a3c356cb-1d66-4307-9ffd-ac8528ccf61d', N'userName', N'LinhfishCR7')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'264', N'a3c356cb-1d66-4307-9ffd-ac8528ccf61d', N'firstName', N'Linh')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'265', N'a3c356cb-1d66-4307-9ffd-ac8528ccf61d', N'lastName', N'Ha')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'266', N'a3c356cb-1d66-4307-9ffd-ac8528ccf61d', N'fullName', N'Ha Linh')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'267', N'a3c356cb-1d66-4307-9ffd-ac8528ccf61d', N'email', N'linhfish10c1@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'268', N'a3c356cb-1d66-4307-9ffd-ac8528ccf61d', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'LinhfishCR7')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'269', N'a3c356cb-1d66-4307-9ffd-ac8528ccf61d', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Ha Linh')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'270', N'a3c356cb-1d66-4307-9ffd-ac8528ccf61d', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'linhfish10c1@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'271', N'49846e9e-7f13-4831-87aa-81bbf412cd18', N'id', N'49846e9e-7f13-4831-87aa-81bbf412cd18')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'272', N'49846e9e-7f13-4831-87aa-81bbf412cd18', N'userName', N'BinhdeptrainhatDHCT')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'273', N'49846e9e-7f13-4831-87aa-81bbf412cd18', N'firstName', N'Trần')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'274', N'49846e9e-7f13-4831-87aa-81bbf412cd18', N'lastName', N'Vũ Bình')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'275', N'49846e9e-7f13-4831-87aa-81bbf412cd18', N'fullName', N'Vũ Bình Trần')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'276', N'49846e9e-7f13-4831-87aa-81bbf412cd18', N'email', N'tranb4010@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'277', N'49846e9e-7f13-4831-87aa-81bbf412cd18', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'BinhdeptrainhatDHCT')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'278', N'49846e9e-7f13-4831-87aa-81bbf412cd18', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Vũ Bình Trần')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'279', N'49846e9e-7f13-4831-87aa-81bbf412cd18', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'tranb4010@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'280', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'id', N'd52bb534-9f31-4fa5-94b8-be7e091b187a')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'281', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'userName', N'Sky2021')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'282', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'firstName', N'Thái')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'283', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'lastName', N'Nguyễn Quốc')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'284', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'fullName', N'Nguyễn Quốc Thái')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'285', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'email', N'thaictu191@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'286', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'Sky2021')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'287', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Nguyễn Quốc Thái')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'288', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'thaictu191@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'289', N'79dcfd64-e286-4f8b-9f6f-6454b0e3f9ba', N'id', N'79dcfd64-e286-4f8b-9f6f-6454b0e3f9ba')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'290', N'79dcfd64-e286-4f8b-9f6f-6454b0e3f9ba', N'userName', N'GiaNhi')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'291', N'79dcfd64-e286-4f8b-9f6f-6454b0e3f9ba', N'firstName', N'Gia')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'292', N'79dcfd64-e286-4f8b-9f6f-6454b0e3f9ba', N'lastName', N'Nhi')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'293', N'79dcfd64-e286-4f8b-9f6f-6454b0e3f9ba', N'fullName', N'Nhi Gia')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'294', N'79dcfd64-e286-4f8b-9f6f-6454b0e3f9ba', N'email', N'Legiao0568@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'295', N'79dcfd64-e286-4f8b-9f6f-6454b0e3f9ba', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'GiaNhi')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'296', N'79dcfd64-e286-4f8b-9f6f-6454b0e3f9ba', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Nhi Gia')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'297', N'79dcfd64-e286-4f8b-9f6f-6454b0e3f9ba', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'Legiao0568@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'298', N'fa669a9b-d9cd-4b7a-844d-51bb5d3fb7d3', N'id', N'fa669a9b-d9cd-4b7a-844d-51bb5d3fb7d3')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'299', N'fa669a9b-d9cd-4b7a-844d-51bb5d3fb7d3', N'userName', N'rolly.h17')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'300', N'fa669a9b-d9cd-4b7a-844d-51bb5d3fb7d3', N'firstName', N'Thúy')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'301', N'fa669a9b-d9cd-4b7a-844d-51bb5d3fb7d3', N'lastName', N'Hằng')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'302', N'fa669a9b-d9cd-4b7a-844d-51bb5d3fb7d3', N'fullName', N'Hằng Thúy')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'303', N'fa669a9b-d9cd-4b7a-844d-51bb5d3fb7d3', N'email', N'ltthang1721@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'304', N'fa669a9b-d9cd-4b7a-844d-51bb5d3fb7d3', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'rolly.h17')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'305', N'fa669a9b-d9cd-4b7a-844d-51bb5d3fb7d3', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Hằng Thúy')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'306', N'fa669a9b-d9cd-4b7a-844d-51bb5d3fb7d3', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'ltthang1721@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'307', N'31b027d2-a070-4c05-b10b-21743fd8b418', N'id', N'31b027d2-a070-4c05-b10b-21743fd8b418')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'308', N'31b027d2-a070-4c05-b10b-21743fd8b418', N'userName', N'phuochauit')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'309', N'31b027d2-a070-4c05-b10b-21743fd8b418', N'firstName', N'Phước')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'310', N'31b027d2-a070-4c05-b10b-21743fd8b418', N'lastName', N'Hậu')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'311', N'31b027d2-a070-4c05-b10b-21743fd8b418', N'fullName', N'Hậu Phước')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'312', N'31b027d2-a070-4c05-b10b-21743fd8b418', N'email', N'phuochau.it@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'313', N'31b027d2-a070-4c05-b10b-21743fd8b418', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'phuochauit')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'314', N'31b027d2-a070-4c05-b10b-21743fd8b418', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Hậu Phước')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'315', N'31b027d2-a070-4c05-b10b-21743fd8b418', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'phuochau.it@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'316', N'907b94d0-1090-4389-a42c-a74c39cf365c', N'id', N'907b94d0-1090-4389-a42c-a74c39cf365c')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'317', N'907b94d0-1090-4389-a42c-a74c39cf365c', N'userName', N'phatnguyen011000')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'318', N'907b94d0-1090-4389-a42c-a74c39cf365c', N'firstName', N'Phát')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'319', N'907b94d0-1090-4389-a42c-a74c39cf365c', N'lastName', N'Nguyễn')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'320', N'907b94d0-1090-4389-a42c-a74c39cf365c', N'fullName', N'Nguyễn Phát')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'321', N'907b94d0-1090-4389-a42c-a74c39cf365c', N'email', N'huyphat035@gmail.con')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'322', N'907b94d0-1090-4389-a42c-a74c39cf365c', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'phatnguyen011000')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'323', N'907b94d0-1090-4389-a42c-a74c39cf365c', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Nguyễn Phát')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'324', N'907b94d0-1090-4389-a42c-a74c39cf365c', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'huyphat035@gmail.con')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'325', N'8f55ebc3-c9fd-47b1-ba0e-a13803433815', N'id', N'8f55ebc3-c9fd-47b1-ba0e-a13803433815')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'326', N'8f55ebc3-c9fd-47b1-ba0e-a13803433815', N'userName', N'myhanct')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'327', N'8f55ebc3-c9fd-47b1-ba0e-a13803433815', N'firstName', N'Mỹ')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'328', N'8f55ebc3-c9fd-47b1-ba0e-a13803433815', N'lastName', N'Hà')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'329', N'8f55ebc3-c9fd-47b1-ba0e-a13803433815', N'fullName', N'Hà Mỹ')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'330', N'8f55ebc3-c9fd-47b1-ba0e-a13803433815', N'email', N'myhanct@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'331', N'8f55ebc3-c9fd-47b1-ba0e-a13803433815', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'myhanct')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'332', N'8f55ebc3-c9fd-47b1-ba0e-a13803433815', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Hà Mỹ')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'333', N'8f55ebc3-c9fd-47b1-ba0e-a13803433815', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'myhanct@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'334', N'40999a33-44af-457e-921d-f74cae8eeb06', N'id', N'40999a33-44af-457e-921d-f74cae8eeb06')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'335', N'40999a33-44af-457e-921d-f74cae8eeb06', N'userName', N'Lole2k')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'336', N'40999a33-44af-457e-921d-f74cae8eeb06', N'firstName', N'Lê')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'337', N'40999a33-44af-457e-921d-f74cae8eeb06', N'lastName', N'Long')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'338', N'40999a33-44af-457e-921d-f74cae8eeb06', N'fullName', N'Long Lê')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'339', N'40999a33-44af-457e-921d-f74cae8eeb06', N'email', N'hailong3372009@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'340', N'40999a33-44af-457e-921d-f74cae8eeb06', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'Lole2k')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'341', N'40999a33-44af-457e-921d-f74cae8eeb06', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Long Lê')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'342', N'40999a33-44af-457e-921d-f74cae8eeb06', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'hailong3372009@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'343', N'fbeccc5a-5e29-4c83-9ee8-32ae27ede1cf', N'id', N'fbeccc5a-5e29-4c83-9ee8-32ae27ede1cf')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'344', N'fbeccc5a-5e29-4c83-9ee8-32ae27ede1cf', N'userName', N'phuongthao2902')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'345', N'fbeccc5a-5e29-4c83-9ee8-32ae27ede1cf', N'firstName', N'Phương')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'346', N'fbeccc5a-5e29-4c83-9ee8-32ae27ede1cf', N'lastName', N'Thảo')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'347', N'fbeccc5a-5e29-4c83-9ee8-32ae27ede1cf', N'fullName', N'Thảo Phương')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'348', N'fbeccc5a-5e29-4c83-9ee8-32ae27ede1cf', N'email', N'vophuongthao2902@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'349', N'fbeccc5a-5e29-4c83-9ee8-32ae27ede1cf', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'phuongthao2902')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'350', N'fbeccc5a-5e29-4c83-9ee8-32ae27ede1cf', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Thảo Phương')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'351', N'fbeccc5a-5e29-4c83-9ee8-32ae27ede1cf', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'vophuongthao2902@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'352', N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'id', N'c7ae53fe-314d-48ba-8148-c747fe21a26a')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'353', N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'userName', N'phucnguyen')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'354', N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'firstName', N'Phúc')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'355', N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'lastName', N'Nguyễn')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'356', N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'fullName', N'Nguyễn Phúc')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'357', N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'email', N'phucnguyen@gmail.com')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'358', N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier', N'phucnguyen')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'359', N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', N'Nguyễn Phúc')
GO

INSERT INTO [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (N'360', N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress', N'phucnguyen@gmail.com')
GO

SET IDENTITY_INSERT [dbo].[AspNetUserClaims] OFF
GO


-- ----------------------------
-- Table structure for AspNetUserLogins
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type IN ('U'))
	DROP TABLE [dbo].[AspNetUserLogins]
GO

CREATE TABLE [dbo].[AspNetUserLogins] (
  [LoginProvider] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ProviderKey] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ProviderDisplayName] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [UserId] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL
)
GO


-- ----------------------------
-- Records of AspNetUserLogins
-- ----------------------------

-- ----------------------------
-- Table structure for AspNetUserRoles
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type IN ('U'))
	DROP TABLE [dbo].[AspNetUserRoles]
GO

CREATE TABLE [dbo].[AspNetUserRoles] (
  [UserId] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [RoleId] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL
)
GO


-- ----------------------------
-- Records of AspNetUserRoles
-- ----------------------------

-- ----------------------------
-- Table structure for AspNetUserTokens
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserTokens]') AND type IN ('U'))
	DROP TABLE [dbo].[AspNetUserTokens]
GO

CREATE TABLE [dbo].[AspNetUserTokens] (
  [UserId] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [LoginProvider] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Name] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Value] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO


-- ----------------------------
-- Records of AspNetUserTokens
-- ----------------------------

-- ----------------------------
-- Table structure for BlockedUsers
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[BlockedUsers]') AND type IN ('U'))
	DROP TABLE [dbo].[BlockedUsers]
GO

CREATE TABLE [dbo].[BlockedUsers] (
  [BlockedByUsersId] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [BlockedUsersId] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL
)
GO


-- ----------------------------
-- Records of BlockedUsers
-- ----------------------------
INSERT INTO [dbo].[BlockedUsers] ([BlockedByUsersId], [BlockedUsersId]) VALUES (N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'62e18ec4-5fc6-4214-83aa-d1486efa4729')
GO


-- ----------------------------
-- Table structure for ChatParticipants
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ChatParticipants]') AND type IN ('U'))
	DROP TABLE [dbo].[ChatParticipants]
GO

CREATE TABLE [dbo].[ChatParticipants] (
  [JoinedChatsId] int  NOT NULL,
  [ParticipantsId] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL
)
GO


-- ----------------------------
-- Records of ChatParticipants
-- ----------------------------
INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'17', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'3', N'1bd1456a-42f8-4932-9016-63f7c209966a')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'4', N'1bd1456a-42f8-4932-9016-63f7c209966a')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'5', N'1bd1456a-42f8-4932-9016-63f7c209966a')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'6', N'1bd1456a-42f8-4932-9016-63f7c209966a')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'12', N'1e701476-d570-45d0-a0c6-948425401075')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'13', N'1e701476-d570-45d0-a0c6-948425401075')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'22', N'1e701476-d570-45d0-a0c6-948425401075')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'39', N'21344cf9-faf5-4201-8eb2-dd8eed4281c2')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'21', N'2756572a-be3f-472f-9c4d-4e6c0f94c528')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'38', N'2756572a-be3f-472f-9c4d-4e6c0f94c528')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'30', N'30855389-4934-4350-b69a-2a35bb66a946')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'44', N'31b027d2-a070-4c05-b10b-21743fd8b418')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'46', N'40999a33-44af-457e-921d-f74cae8eeb06')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'32', N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'38', N'535fbe62-7546-4dd5-a1a8-ed5e2e70c058')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'33', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'36', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'37', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'23', N'62e18ec4-5fc6-4214-83aa-d1486efa4729')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'14', N'6e847afd-92b6-4c5a-90ae-98273135b4b1')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'19', N'6e847afd-92b6-4c5a-90ae-98273135b4b1')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'34', N'6e847afd-92b6-4c5a-90ae-98273135b4b1')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'35', N'6e847afd-92b6-4c5a-90ae-98273135b4b1')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'36', N'6e847afd-92b6-4c5a-90ae-98273135b4b1')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'41', N'6e847afd-92b6-4c5a-90ae-98273135b4b1')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'4', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'8', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'9', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'10', N'88fa2305-54f7-409b-9b46-a826f1e9e1d4')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'11', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'40', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'45', N'907b94d0-1090-4389-a42c-a74c39cf365c')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'23', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'15', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'20', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'3', N'b693a4ec-5b99-4eeb-a684-9617ed847087')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'7', N'b693a4ec-5b99-4eeb-a684-9617ed847087')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'8', N'b693a4ec-5b99-4eeb-a684-9617ed847087')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'26', N'c43ccaba-83c7-42f3-a83f-fb973dcedadb')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'27', N'c43ccaba-83c7-42f3-a83f-fb973dcedadb')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'28', N'c473bda2-7dec-4e97-a857-9111f63106cf')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'31', N'c473bda2-7dec-4e97-a857-9111f63106cf')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'35', N'c473bda2-7dec-4e97-a857-9111f63106cf')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'37', N'c473bda2-7dec-4e97-a857-9111f63106cf')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'39', N'c473bda2-7dec-4e97-a857-9111f63106cf')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'46', N'c473bda2-7dec-4e97-a857-9111f63106cf')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'2', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'6', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'7', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'9', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'10', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'15', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'16', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'21', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'22', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'24', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'25', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'26', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'28', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'29', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'30', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'32', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'33', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'40', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'41', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'42', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'43', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'44', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'45', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'42', N'd52bb534-9f31-4fa5-94b8-be7e091b187a')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'24', N'dc33f05c-611d-456f-9aa7-9ba652f70ee7')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'27', N'dc33f05c-611d-456f-9aa7-9ba652f70ee7')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'29', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'31', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'34', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'15', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'16', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'17', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'18', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'19', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'20', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'2', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'13', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'14', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'15', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'18', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'43', N'fa669a9b-d9cd-4b7a-844d-51bb5d3fb7d3')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'25', N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc')
GO


-- ----------------------------
-- Table structure for Chats
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Chats]') AND type IN ('U'))
	DROP TABLE [dbo].[Chats]
GO

CREATE TABLE [dbo].[Chats] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [CreatorId] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [AvatarFileName] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Type] int  NOT NULL,
  [DateCreated] datetime2(7)  NOT NULL,
  [DateModified] datetime2(7)  NULL,
  [DateDeleted] datetime2(7)  NULL
)
GO


-- ----------------------------
-- Records of Chats
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Chats] ON
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'1', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', NULL, N'1', N'2021-10-28 13:20:29.1672280', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'2', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', NULL, N'1', N'2021-10-28 13:20:47.5445597', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'3', NULL, N'1bd1456a-42f8-4932-9016-63f7c209966a', NULL, N'1', N'2021-10-28 14:12:25.0031993', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'4', NULL, N'1bd1456a-42f8-4932-9016-63f7c209966a', NULL, N'1', N'2021-10-28 14:12:25.4132085', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'5', NULL, N'1bd1456a-42f8-4932-9016-63f7c209966a', NULL, N'1', N'2021-10-28 14:12:48.8874773', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'6', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', NULL, N'1', N'2021-10-28 14:12:54.8035904', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'7', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', NULL, N'1', N'2021-10-28 14:13:01.5134167', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'8', NULL, N'b693a4ec-5b99-4eeb-a684-9617ed847087', NULL, N'1', N'2021-10-28 14:13:16.4240785', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'9', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', NULL, N'1', N'2021-10-28 14:14:22.8987671', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'10', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', NULL, N'1', N'2021-10-28 16:09:45.2911291', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'11', NULL, N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', NULL, N'1', N'2021-10-29 12:56:57.6136328', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'12', NULL, N'1e701476-d570-45d0-a0c6-948425401075', NULL, N'1', N'2021-10-29 16:58:13.5313308', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'13', NULL, N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', NULL, N'1', N'2021-10-29 17:13:37.4290896', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'14', NULL, N'6e847afd-92b6-4c5a-90ae-98273135b4b1', NULL, N'1', N'2021-10-29 18:12:23.7207648', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'15', N'Awesome Group Chat', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'48960dec-ea7e-492a-a189-af172000019e.jpg', N'2', N'2021-10-29 18:16:23.6395161', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'16', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', NULL, N'1', N'2021-10-29 19:22:37.5743777', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'17', NULL, N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', NULL, N'1', N'2021-10-29 19:24:11.4743692', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'18', NULL, N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', NULL, N'1', N'2021-10-29 19:31:27.4230711', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'19', NULL, N'6e847afd-92b6-4c5a-90ae-98273135b4b1', NULL, N'1', N'2021-10-29 19:32:03.2695717', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'20', NULL, N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', NULL, N'1', N'2021-10-29 19:33:11.0844492', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'21', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', NULL, N'1', N'2021-10-29 21:17:08.9385587', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'22', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', NULL, N'1', N'2021-10-30 00:48:51.7682366', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'23', NULL, N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', NULL, N'1', N'2021-10-31 02:15:17.6163209', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'24', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', NULL, N'1', N'2021-10-31 16:03:00.2848101', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'25', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', NULL, N'1', N'2021-10-31 16:05:50.0828865', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'26', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', NULL, N'1', N'2021-10-31 16:07:43.4868265', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'27', NULL, N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', NULL, N'1', N'2021-10-31 16:22:25.2135071', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'28', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', NULL, N'1', N'2021-11-03 17:24:10.6203035', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'29', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', NULL, N'1', N'2021-11-03 17:38:37.1200169', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'30', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', NULL, N'1', N'2021-11-03 17:38:46.0039339', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'31', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', NULL, N'1', N'2021-11-03 17:39:12.9414311', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'32', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', NULL, N'1', N'2021-11-03 17:41:09.8478446', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'33', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', NULL, N'1', N'2021-11-03 17:57:25.5223100', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'34', NULL, N'6e847afd-92b6-4c5a-90ae-98273135b4b1', NULL, N'1', N'2021-11-03 18:01:26.2531878', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'35', NULL, N'6e847afd-92b6-4c5a-90ae-98273135b4b1', NULL, N'1', N'2021-11-03 18:01:35.2641772', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'36', NULL, N'6e847afd-92b6-4c5a-90ae-98273135b4b1', NULL, N'1', N'2021-11-03 18:01:52.2834830', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'37', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', NULL, N'1', N'2021-11-03 18:04:40.4085129', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'38', NULL, N'2756572a-be3f-472f-9c4d-4e6c0f94c528', NULL, N'1', N'2021-11-03 18:11:01.1644653', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'39', NULL, N'21344cf9-faf5-4201-8eb2-dd8eed4281c2', NULL, N'1', N'2021-11-03 18:19:25.2255371', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'40', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', NULL, N'1', N'2021-11-03 18:24:55.8862112', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'41', NULL, N'6e847afd-92b6-4c5a-90ae-98273135b4b1', NULL, N'1', N'2021-11-03 18:28:07.9741331', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'42', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', NULL, N'1', N'2021-11-03 18:42:24.7206030', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'43', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', NULL, N'1', N'2021-11-03 19:09:56.7537226', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'44', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', NULL, N'1', N'2021-11-03 19:20:00.5857996', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'45', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', NULL, N'1', N'2021-11-03 19:20:06.4854686', NULL, NULL)
GO

INSERT INTO [dbo].[Chats] ([Id], [Name], [CreatorId], [AvatarFileName], [Type], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'46', NULL, N'40999a33-44af-457e-921d-f74cae8eeb06', NULL, N'1', N'2021-11-03 20:57:42.8331423', NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[Chats] OFF
GO


-- ----------------------------
-- Table structure for Comments
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Comments]') AND type IN ('U'))
	DROP TABLE [dbo].[Comments]
GO

CREATE TABLE [dbo].[Comments] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Content] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [CreatorId] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PostId] int  NULL,
  [DateCreated] datetime2(7)  NOT NULL,
  [DateModified] datetime2(7)  NULL,
  [DateDeleted] datetime2(7)  NULL
)
GO


-- ----------------------------
-- Records of Comments
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Comments] ON
GO

INSERT INTO [dbo].[Comments] ([Id], [Content], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'17', N'sds', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'18', N'2021-10-29 02:03:31.1170252', NULL, NULL)
GO

INSERT INTO [dbo].[Comments] ([Id], [Content], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'18', N'222', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'19', N'2021-10-29 02:06:54.9009735', NULL, NULL)
GO

INSERT INTO [dbo].[Comments] ([Id], [Content], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'19', N'😉dsđá', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'20', N'2021-10-29 10:21:02.7072984', N'2021-10-29 10:21:24.3055592', NULL)
GO

INSERT INTO [dbo].[Comments] ([Id], [Content], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'20', N'Dsndns', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'21', N'2021-10-29 12:56:35.2878016', NULL, NULL)
GO

INSERT INTO [dbo].[Comments] ([Id], [Content], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'23', N'comment comment comment', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'27', N'2021-10-29 18:13:52.6395650', NULL, NULL)
GO

INSERT INTO [dbo].[Comments] ([Id], [Content], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'24', N'Hello guest user', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'27', N'2021-10-29 18:19:30.2687248', NULL, NULL)
GO

INSERT INTO [dbo].[Comments] ([Id], [Content], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'25', N'How it''s going', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'31', N'2021-10-29 19:30:10.0859224', NULL, NULL)
GO

INSERT INTO [dbo].[Comments] ([Id], [Content], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'26', N'Thiếu include, main, bla bla', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'34', N'2021-10-31 16:35:58.0553891', NULL, NULL)
GO

INSERT INTO [dbo].[Comments] ([Id], [Content], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'27', N'😆', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'35', N'2021-10-31 16:36:04.8072454', NULL, NULL)
GO

INSERT INTO [dbo].[Comments] ([Id], [Content], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'28', N'Hi Phát!!!', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'36', N'2021-11-03 17:30:43.0230484', NULL, NULL)
GO

INSERT INTO [dbo].[Comments] ([Id], [Content], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'29', N'Có vẻ chưa thể reply được nhỉ 😆', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'36', N'2021-11-03 17:31:43.8438401', NULL, NULL)
GO

INSERT INTO [dbo].[Comments] ([Id], [Content], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'30', N'Chưa được đâu', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'36', N'2021-11-03 17:31:56.3748877', NULL, NULL)
GO

INSERT INTO [dbo].[Comments] ([Id], [Content], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'31', N'Hey men!', N'30855389-4934-4350-b69a-2a35bb66a946', N'14', N'2021-11-03 17:39:12.0837305', NULL, NULL)
GO

INSERT INTO [dbo].[Comments] ([Id], [Content], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'32', N'Hello guy!!', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'14', N'2021-11-03 17:40:39.9743279', NULL, NULL)
GO

INSERT INTO [dbo].[Comments] ([Id], [Content], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'33', N'Ủa hình như là đh cần thơ', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'10', N'2021-11-03 18:41:13.9778357', NULL, NULL)
GO

INSERT INTO [dbo].[Comments] ([Id], [Content], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'34', N'Đúng rồi ông', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'10', N'2021-11-03 18:42:13.5439395', NULL, NULL)
GO

INSERT INTO [dbo].[Comments] ([Id], [Content], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'35', N'Cảm ơn bạn ạ ❤️❤️', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'37', N'2021-11-03 18:56:43.6190172', NULL, NULL)
GO

INSERT INTO [dbo].[Comments] ([Id], [Content], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'36', N'Yua mikamiiiiiiiiiii =)))))))))', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'38', N'2021-11-03 20:54:53.0429620', N'2021-11-03 20:54:57.0811253', NULL)
GO

INSERT INTO [dbo].[Comments] ([Id], [Content], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'37', N'Hôm nay được đạo diễn cho nghỉ nên lướt tí TeeApp ấy mà 😆', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'38', N'2021-11-03 21:03:28.0206064', NULL, NULL)
GO

INSERT INTO [dbo].[Comments] ([Id], [Content], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'38', N'Cảm ơn Long nhe', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'39', N'2021-11-03 21:16:38.7014290', NULL, NULL)
GO

INSERT INTO [dbo].[Comments] ([Id], [Content], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'39', N'Sao tui bấm nút like kh đc?🤣 ', N'fbeccc5a-5e29-4c83-9ee8-32ae27ede1cf', N'38', N'2021-11-03 23:12:43.7670289', NULL, NULL)
GO

INSERT INTO [dbo].[Comments] ([Id], [Content], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'40', N'Hahnaba', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'42', N'2021-11-03 23:30:00.2431708', NULL, NULL)
GO

INSERT INTO [dbo].[Comments] ([Id], [Content], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'41', N'Hâjj', N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'42', N'2021-11-03 23:30:13.3123779', NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[Comments] OFF
GO


-- ----------------------------
-- Table structure for Followers
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Followers]') AND type IN ('U'))
	DROP TABLE [dbo].[Followers]
GO

CREATE TABLE [dbo].[Followers] (
  [FollowersId] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [FollowingId] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL
)
GO


-- ----------------------------
-- Records of Followers
-- ----------------------------
INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'1bd1456a-42f8-4932-9016-63f7c209966a')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1bd1456a-42f8-4932-9016-63f7c209966a')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'1bd1456a-42f8-4932-9016-63f7c209966a')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'21344cf9-faf5-4201-8eb2-dd8eed4281c2')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'2756572a-be3f-472f-9c4d-4e6c0f94c528')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'2756572a-be3f-472f-9c4d-4e6c0f94c528')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'2756572a-be3f-472f-9c4d-4e6c0f94c528')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'30855389-4934-4350-b69a-2a35bb66a946')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'30855389-4934-4350-b69a-2a35bb66a946')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'31b027d2-a070-4c05-b10b-21743fd8b418')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'40999a33-44af-457e-921d-f74cae8eeb06')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'49846e9e-7f13-4831-87aa-81bbf412cd18')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'49846e9e-7f13-4831-87aa-81bbf412cd18')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'535fbe62-7546-4dd5-a1a8-ed5e2e70c058')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'5a48f894-ca56-484b-8f9a-6d21b5868b97')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'5a48f894-ca56-484b-8f9a-6d21b5868b97')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'62e18ec4-5fc6-4214-83aa-d1486efa4729')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'6705eedb-12d3-403d-acf5-e164c0d4b625')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'6705eedb-12d3-403d-acf5-e164c0d4b625')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'6e847afd-92b6-4c5a-90ae-98273135b4b1')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'6e847afd-92b6-4c5a-90ae-98273135b4b1')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'6e847afd-92b6-4c5a-90ae-98273135b4b1')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'6e847afd-92b6-4c5a-90ae-98273135b4b1')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'6e847afd-92b6-4c5a-90ae-98273135b4b1')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'79dcfd64-e286-4f8b-9f6f-6454b0e3f9ba')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'1bd1456a-42f8-4932-9016-63f7c209966a', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'88fa2305-54f7-409b-9b46-a826f1e9e1d4')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'8f55ebc3-c9fd-47b1-ba0e-a13803433815')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'907b94d0-1090-4389-a42c-a74c39cf365c')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'a3c356cb-1d66-4307-9ffd-ac8528ccf61d')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'aed79f8f-a1e6-43b6-b369-151085d6b8d0')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'b693a4ec-5b99-4eeb-a684-9617ed847087')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'c43ccaba-83c7-42f3-a83f-fb973dcedadb')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'c473bda2-7dec-4e97-a857-9111f63106cf')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'c473bda2-7dec-4e97-a857-9111f63106cf')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'c473bda2-7dec-4e97-a857-9111f63106cf')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'1bd1456a-42f8-4932-9016-63f7c209966a', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'21344cf9-faf5-4201-8eb2-dd8eed4281c2', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'30855389-4934-4350-b69a-2a35bb66a946', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'31b027d2-a070-4c05-b10b-21743fd8b418', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'40999a33-44af-457e-921d-f74cae8eeb06', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'49846e9e-7f13-4831-87aa-81bbf412cd18', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'535fbe62-7546-4dd5-a1a8-ed5e2e70c058', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'5a48f894-ca56-484b-8f9a-6d21b5868b97', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'62e18ec4-5fc6-4214-83aa-d1486efa4729', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'6705eedb-12d3-403d-acf5-e164c0d4b625', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'79dcfd64-e286-4f8b-9f6f-6454b0e3f9ba', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'88fa2305-54f7-409b-9b46-a826f1e9e1d4', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'8f55ebc3-c9fd-47b1-ba0e-a13803433815', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'907b94d0-1090-4389-a42c-a74c39cf365c', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'a3c356cb-1d66-4307-9ffd-ac8528ccf61d', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'aed79f8f-a1e6-43b6-b369-151085d6b8d0', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'fa669a9b-d9cd-4b7a-844d-51bb5d3fb7d3', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'fbeccc5a-5e29-4c83-9ee8-32ae27ede1cf', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'd52bb534-9f31-4fa5-94b8-be7e091b187a')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'd52bb534-9f31-4fa5-94b8-be7e091b187a')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'd52bb534-9f31-4fa5-94b8-be7e091b187a')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'aed79f8f-a1e6-43b6-b369-151085d6b8d0', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'dc33f05c-611d-456f-9aa7-9ba652f70ee7')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'fa669a9b-d9cd-4b7a-844d-51bb5d3fb7d3')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'fbeccc5a-5e29-4c83-9ee8-32ae27ede1cf')
GO


-- ----------------------------
-- Table structure for Friendships
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Friendships]') AND type IN ('U'))
	DROP TABLE [dbo].[Friendships]
GO

CREATE TABLE [dbo].[Friendships] (
  [RequestedUserId] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [RecievedUserId] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Type] int  NOT NULL,
  [RequestedDate] datetime2(7)  NOT NULL,
  [RespondedDate] datetime2(7)  NOT NULL
)
GO


-- ----------------------------
-- Records of Friendships
-- ----------------------------
INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'2021-10-29 17:59:33.5665833', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'1', N'2021-10-29 19:24:14.2424829', N'2021-10-29 19:28:07.1266289')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'1', N'2021-10-29 18:12:57.0033388', N'2021-10-29 19:31:04.7911940')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'1bd1456a-42f8-4932-9016-63f7c209966a', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'1', N'2021-10-28 14:17:00.6866071', N'2021-10-28 14:20:52.2225291')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'2021-10-29 18:09:38.9545642', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'21344cf9-faf5-4201-8eb2-dd8eed4281c2', N'0', N'2021-11-03 18:20:36.6419316', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'0', N'2021-11-03 18:05:00.8828054', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'49846e9e-7f13-4831-87aa-81bbf412cd18', N'0', N'2021-11-03 18:34:12.4549817', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'535fbe62-7546-4dd5-a1a8-ed5e2e70c058', N'0', N'2021-11-03 18:11:06.6220651', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'5a48f894-ca56-484b-8f9a-6d21b5868b97', N'0', N'2021-11-03 18:04:48.2858812', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'6705eedb-12d3-403d-acf5-e164c0d4b625', N'0', N'2021-11-03 18:25:07.2353987', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'1', N'2021-11-03 18:25:11.9483282', N'2021-11-03 18:25:24.8611199')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'a3c356cb-1d66-4307-9ffd-ac8528ccf61d', N'0', N'2021-11-03 18:34:04.4640287', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'1', N'2021-11-03 18:04:42.0549685', N'2021-11-03 18:05:05.0931911')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'49846e9e-7f13-4831-87aa-81bbf412cd18', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'2021-11-03 18:31:53.0512560', N'2021-11-03 18:33:46.7202505')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'0', N'2021-10-29 18:06:08.0912733', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'1', N'2021-11-03 18:01:55.8806543', N'2021-11-03 19:36:14.7782680')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'1', N'2021-11-03 18:01:38.5486688', N'2021-11-03 18:06:54.2014932')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'2021-10-29 18:05:37.3107176', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'1', N'2021-11-03 18:01:28.6251172', N'2021-11-03 18:05:06.0307447')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'0', N'2021-10-29 19:32:06.6865125', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'0', N'2021-10-29 18:12:09.7657443', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'0', N'2021-10-29 18:30:15.8658498', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'0', N'2021-10-29 19:11:18.1275402', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'0', N'2021-10-29 19:28:59.4192121', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'0', N'2021-10-29 18:30:27.0526697', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'1', N'2021-10-29 18:01:24.9919796', N'2021-10-29 18:01:41.2152676')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'30855389-4934-4350-b69a-2a35bb66a946', N'0', N'2021-11-03 18:04:12.6415163', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'1', N'2021-11-03 18:04:05.4378617', N'2021-11-03 19:36:13.8872171')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'5a48f894-ca56-484b-8f9a-6d21b5868b97', N'0', N'2021-11-03 18:03:57.9530318', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'1', N'2021-11-03 18:03:48.1658789', N'2021-11-03 18:06:54.7679712')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'2021-10-29 18:00:52.3750386', N'2021-10-29 18:11:30.8386509')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'1', N'2021-11-03 18:04:20.7419784', N'2021-11-03 18:05:04.9684332')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'0', N'2021-10-29 19:33:14.8142320', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'0', N'2021-10-29 18:17:27.4544153', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'aed79f8f-a1e6-43b6-b369-151085d6b8d0', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'0', N'2021-10-28 14:21:10.2545297', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'6705eedb-12d3-403d-acf5-e164c0d4b625', N'0', N'2021-11-03 23:34:51.7647579', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1bd1456a-42f8-4932-9016-63f7c209966a', N'0', N'2021-10-28 14:12:58.6371118', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'30855389-4934-4350-b69a-2a35bb66a946', N'1', N'2021-11-03 17:38:55.7515788', N'2021-11-03 17:40:08.2218620')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'31b027d2-a070-4c05-b10b-21743fd8b418', N'0', N'2021-11-03 19:20:22.3844777', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'40999a33-44af-457e-921d-f74cae8eeb06', N'0', N'2021-11-03 21:08:24.3140649', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'1', N'2021-11-03 17:41:12.1747350', N'2021-11-03 18:51:33.0856762')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'1', N'2021-11-03 17:57:28.6084372', N'2021-11-03 19:36:12.2925875')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'62e18ec4-5fc6-4214-83aa-d1486efa4729', N'0', N'2021-10-29 21:24:07.4034423', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'79dcfd64-e286-4f8b-9f6f-6454b0e3f9ba', N'0', N'2021-11-03 23:39:42.9421307', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'1', N'2021-10-28 14:14:25.9181472', N'2021-10-28 14:20:52.9161104')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'88fa2305-54f7-409b-9b46-a826f1e9e1d4', N'0', N'2021-10-28 16:10:07.7839258', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'1', N'2021-10-29 15:46:06.2344958', N'2021-11-03 18:25:28.2444613')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'8f55ebc3-c9fd-47b1-ba0e-a13803433815', N'0', N'2021-11-03 23:39:53.9552837', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'907b94d0-1090-4389-a42c-a74c39cf365c', N'1', N'2021-11-03 19:20:24.0500310', N'2021-11-03 19:20:36.6564436')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'1', N'2021-10-29 15:45:04.0412904', N'2021-10-29 18:30:41.6300836')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'aed79f8f-a1e6-43b6-b369-151085d6b8d0', N'0', N'2021-10-28 14:18:57.2684246', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'1', N'2021-10-31 16:10:51.3324040', N'2021-10-31 16:41:09.6599782')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'0', N'2021-11-03 21:42:06.3488522', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'1', N'2021-11-03 18:42:16.7291713', N'2021-11-03 18:44:02.1676625')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'0', N'2021-10-28 14:21:06.7473528', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'1', N'2021-10-31 16:03:34.5599709', N'2021-10-31 16:06:54.5627366')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'1', N'2021-11-03 17:38:53.9114875', N'2021-11-03 18:05:04.5933602')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'1', N'2021-10-29 19:23:28.0944050', N'2021-10-29 19:23:33.1056933')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'1', N'2021-10-28 13:23:51.8977558', N'2021-10-29 18:18:31.6975890')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'fa669a9b-d9cd-4b7a-844d-51bb5d3fb7d3', N'0', N'2021-11-03 19:09:06.4676943', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'0', N'2021-10-31 16:05:58.6874371', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'fbeccc5a-5e29-4c83-9ee8-32ae27ede1cf', N'0', N'2021-11-03 23:31:32.4680676', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'0', N'2021-11-03 18:44:10.1566511', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'1', N'2021-11-03 18:45:09.0821932', N'2021-11-03 18:52:27.1970356')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'1', N'2021-11-03 18:48:49.7401822', N'2021-11-03 18:52:37.2091285')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'1bd1456a-42f8-4932-9016-63f7c209966a', N'0', N'2021-10-28 14:16:52.2940820', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'1', N'2021-10-28 14:17:32.6345949', N'2021-10-28 14:20:53.6410810')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'1', N'2021-10-28 14:16:41.1716471', N'2021-10-28 14:21:03.5365251')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'0', N'2021-10-29 19:31:30.1592952', N'0001-01-01 00:00:00.0000000')
GO


-- ----------------------------
-- Table structure for Messages
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Messages]') AND type IN ('U'))
	DROP TABLE [dbo].[Messages]
GO

CREATE TABLE [dbo].[Messages] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Content] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ImageFileName] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [SenderId] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ChatId] int  NOT NULL,
  [DateCreated] datetime2(7)  NOT NULL,
  [DateModified] datetime2(7)  NULL,
  [DateDeleted] datetime2(7)  NULL
)
GO


-- ----------------------------
-- Records of Messages
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Messages] ON
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'1', N'Hello! Nice to see you!', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'2021-10-28 13:20:42.3359076', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'2', N'Hello! Nice to see you!', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', N'2021-10-28 13:20:54.2541841', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'3', N'hiiiiiiii', NULL, N'1bd1456a-42f8-4932-9016-63f7c209966a', N'3', N'2021-10-28 14:12:32.0372581', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'4', N'hiiiiiiiiii', NULL, N'1bd1456a-42f8-4932-9016-63f7c209966a', N'4', N'2021-10-28 14:12:35.4427570', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'5', N'hello', NULL, N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'3', N'2021-10-28 14:12:57.7432493', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'6', N'haha', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'7', N'2021-10-28 14:13:04.8321793', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'7', N'sao lại không biết', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'7', N'2021-10-28 14:13:09.3832003', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'8', N'hahahahaha', NULL, N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'8', N'2021-10-28 14:13:19.5497739', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'9', N'32313212', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'10', N'2021-10-28 16:09:49.6341574', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'10', N'ewe', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'10', N'2021-10-29 01:45:09.6718563', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'11', N'đâ', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'10', N'2021-10-29 01:45:20.4540383', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'12', N'tesst', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'10', N'2021-10-29 02:00:51.9018651', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'13', N'aaaaaa', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'10', N'2021-10-29 02:00:59.8709570', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'14', N'zzzzzz', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'10', N'2021-10-29 02:02:44.7624841', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'15', N'Dkdmnf', NULL, N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'11', N'2021-10-29 12:57:12.3531588', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'16', N'Csbajansmsm', NULL, N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'11', N'2021-10-29 12:57:26.2534843', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'17', NULL, N'cca568b1-7a40-40b1-bc22-180a4836664f.jpeg', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'11', N'2021-10-29 12:57:44.4893247', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'18', N'wewe', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'10', N'2021-10-29 15:51:58.0067789', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'19', N'aaaa', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'10', N'2021-10-29 16:15:57.8372760', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'20', N'Hello', NULL, N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'2', N'2021-10-29 17:13:51.3052939', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'21', N'hi', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', N'2021-10-29 18:09:53.5052874', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'22', N'Nice to see you! 😁', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', N'2021-10-29 18:10:32.8085724', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'23', N'Chào bạn!!!!', NULL, N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'14', N'2021-10-29 18:12:31.8153022', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'24', N'Hello everyone!!!!', NULL, N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'15', N'2021-10-29 18:16:31.3796736', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'25', N'Hello! Nice to see you.', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'16', N'2021-10-29 19:22:46.6022102', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'26', N'Chào bạn!!!', NULL, N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'17', N'2021-10-29 19:24:25.7031468', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'27', N'Hello my friends 😆', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'15', N'2021-10-29 19:27:42.0143731', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'28', N'Nice to see you! 😁', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', N'2021-10-29 19:46:07.8753510', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'29', N'Hsjsu', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'10', N'2021-10-30 00:44:44.3976154', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'30', N'Ndkodld', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'10', N'2021-10-30 00:44:47.4772496', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'31', N'Hiện', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'10', N'2021-10-30 00:44:49.8371385', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'32', N'Hbsisj', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'10', N'2021-10-30 00:45:01.8359580', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'33', N'Test', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'10', N'2021-10-30 00:45:04.1336585', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'34', N'Coi nó có bị gì ko', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'10', N'2021-10-30 00:45:08.8807837', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'35', N'Mong là ko sao', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'10', N'2021-10-30 00:45:28.3186174', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'36', N'Ủa nó được rồi hả ta', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'10', N'2021-10-30 00:45:36.8502740', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'37', N'Aaa', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'10', N'2021-10-30 00:45:42.2729902', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'38', N'Qận', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'10', N'2021-10-30 00:45:44.2407050', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'39', N'Jaoow', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'10', N'2021-10-30 00:45:46.1483366', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'40', N'Rồi sao', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'10', N'2021-10-30 00:45:49.1606284', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'41', N'alo alo alo', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'22', N'2021-10-30 00:48:55.0826111', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'42', N'nghe ko', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'22', N'2021-10-30 00:48:56.6310493', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'43', N'rồi nghe', NULL, N'1e701476-d570-45d0-a0c6-948425401075', N'22', N'2021-10-30 00:49:01.9758929', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'44', N'chat đại 1 lát xem', NULL, N'1e701476-d570-45d0-a0c6-948425401075', N'22', N'2021-10-30 00:49:05.1987614', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'45', N'có ổng ko', NULL, N'1e701476-d570-45d0-a0c6-948425401075', N'22', N'2021-10-30 00:49:07.6038538', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'46', N'chắc là được', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'22', N'2021-10-30 00:49:11.1160797', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'47', N'adsd', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'22', N'2021-10-30 00:49:11.7092788', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'48', N'đa', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'22', N'2021-10-30 00:49:12.4134786', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'49', N'czcz', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'22', N'2021-10-30 00:49:12.9752439', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'50', N'sd', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'22', N'2021-10-30 00:49:13.6313931', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'51', N'wewe', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'22', N'2021-10-30 00:49:14.2876099', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'52', N'adas', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'22', N'2021-10-30 00:49:15.1162619', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'53', N'zxc', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'22', N'2021-10-30 00:49:15.8507509', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'54', N'ewe', NULL, N'1e701476-d570-45d0-a0c6-948425401075', N'22', N'2021-10-30 00:49:18.3037023', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'55', N'rể', NULL, N'1e701476-d570-45d0-a0c6-948425401075', N'22', N'2021-10-30 00:49:19.1442422', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'56', N'trtr', NULL, N'1e701476-d570-45d0-a0c6-948425401075', N'22', N'2021-10-30 00:49:19.8771694', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'57', N'cxzvc', NULL, N'1e701476-d570-45d0-a0c6-948425401075', N'22', N'2021-10-30 00:49:20.7275110', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'58', N'ád', NULL, N'1e701476-d570-45d0-a0c6-948425401075', N'22', N'2021-10-30 00:49:21.2995823', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'59', N'zxcx', NULL, N'1e701476-d570-45d0-a0c6-948425401075', N'22', N'2021-10-30 00:49:22.1716564', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'60', N'sdas', NULL, N'1e701476-d570-45d0-a0c6-948425401075', N'22', N'2021-10-30 00:49:22.8800519', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'61', N'we', NULL, N'1e701476-d570-45d0-a0c6-948425401075', N'22', N'2021-10-30 00:49:23.5392725', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'62', N'w', NULL, N'1e701476-d570-45d0-a0c6-948425401075', N'22', N'2021-10-30 00:49:23.7266265', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'63', N'ád', NULL, N'1e701476-d570-45d0-a0c6-948425401075', N'22', N'2021-10-30 00:49:24.0853228', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'64', N'ewew', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'22', N'2021-10-30 00:49:30.6555169', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'65', N'ádsa', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'22', N'2021-10-30 00:49:31.5066854', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'66', N'dá', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'22', N'2021-10-30 00:49:31.9907910', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'67', N'dá', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'22', N'2021-10-30 00:49:32.5846154', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'68', N'Hâh', NULL, N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'23', N'2021-10-31 02:15:22.7205736', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'69', N'Hshs', NULL, N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'23', N'2021-10-31 02:15:36.4249442', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'70', N'Hellooo', NULL, N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'23', N'2021-10-31 02:16:16.1053751', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'71', N'Chào em', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'24', N'2021-10-31 16:03:03.9588284', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'72', N'dạ chào anh', NULL, N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'24', N'2021-10-31 16:04:29.0498116', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'73', N'app đỉnh quá anh ơi ', NULL, N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'24', N'2021-10-31 16:04:41.0423003', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'74', N'Yub! Vậy cứ vọc vọc có gì cho anh feedback nha', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'24', N'2021-10-31 16:05:04.5583102', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'75', N'dạ🤣', NULL, N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'24', N'2021-10-31 16:05:32.6876905', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'76', N'Hello Bảo', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'25', N'2021-10-31 16:05:53.9264603', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'77', N'Hello anh', NULL, N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'25', N'2021-10-31 16:06:46.0754574', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'78', N'Xài ổn hong em', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'25', N'2021-10-31 16:07:35.4648016', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'79', N'đăng bài, reaction đồ thử xem', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'25', N'2021-10-31 16:07:41.3968709', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'80', N'Chào Như!', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'26', N'2021-10-31 16:07:49.4005300', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'81', N'Ảnh đại diện bộ có giới hạn hả anh', NULL, N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'25', N'2021-10-31 16:08:45.3016456', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'82', N'Sao có vài ảnh tải lên không được', NULL, N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'25', N'2021-10-31 16:08:56.6593775', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'83', NULL, N'28c61c33-81e5-4056-b828-2f1838c3c77b.png', N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'25', N'2021-10-31 16:09:01.8742752', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'84', N'Ảnh gì cũng có giới hạn 3MB', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'25', N'2021-10-31 16:09:02.0602714', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'85', N'anh ơi hình như nếu em vào các mục khác ngoài trang chủ mà reload là nó lỗi á anh', NULL, N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'24', N'2021-10-31 16:09:15.8960116', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'86', N'À dạ', NULL, N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'25', N'2021-10-31 16:09:21.8669048', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'87', N'À đúng rồi. Do anh xài đồ free nên ko xài f5 được', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'24', N'2021-10-31 16:09:54.2292035', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'88', N'dạ 😂', NULL, N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'24', N'2021-10-31 16:10:17.1317006', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'89', N'dạ chào anh ... hihi', NULL, N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'26', N'2021-10-31 16:18:59.0458507', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'90', N'Xài thấy sao rồi', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'26', N'2021-10-31 16:19:40.2580835', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'91', N'thấy ổn lắm anh, kiểu giống giống facebook', NULL, N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'26', N'2021-10-31 16:20:46.3849662', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'92', N'Ok. Được thì em đăng bài gì đó, rồi đi like comment dạo thử xem nha', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'26', N'2021-10-31 16:21:18.5141516', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'93', N'dạ ok anh', NULL, N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'26', N'2021-10-31 16:21:52.1117771', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'94', N'mấy nay học online sao rồi em', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'26', N'2021-10-31 16:42:33.9735006', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'95', N'dạ cũng ổn anh, dạo này lịch học lớp em 1 tuần học 2 hôm thui nên thoải mái lắm ạ', NULL, N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'26', N'2021-10-31 16:46:51.7683034', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'96', N'Rồi bạn bè có hoạt động gì chơi với nhau ko', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'26', N'2021-10-31 16:47:12.7362781', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'97', N'dạ hông có anh, em chỉ có nhắn tin với vài bạn trong lớp về chuyện học này nọ thôi', NULL, N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'26', N'2021-10-31 16:53:55.4079679', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'98', N'chán vậy ta', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'26', N'2021-10-31 16:54:10.5342648', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'99', N'phải chi lớp trưởng hay bch có hoạt động gì vui cho mọi người làm thân thì tốt hơn ấy', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'26', N'2021-10-31 16:54:50.7670482', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'100', N'😆😰', NULL, N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'26', N'2021-10-31 16:56:29.5495238', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'101', N'Hello Phát', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28', N'2021-11-03 17:24:18.9673727', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'102', N'Woa nice UI', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 17:24:27.6744736', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'103', N'êm êm', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28', N'2021-11-03 17:24:35.2396529', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'104', N'Thích giao diện rồi nha', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 17:24:43.6155433', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'105', N'😆😆', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 17:24:46.7944862', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'106', N'😆😆 cũng cop facebook ra chứ chưa tự làm nhiều. ', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28', N'2021-11-03 17:24:59.0330848', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'107', N'mà ổn là ok rồi', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28', N'2021-11-03 17:25:00.9094628', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'108', N'Gradient nhìn trẻ trung hơn', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 17:25:15.0245324', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'109', N'ừm gradient hiện đại hơn', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28', N'2021-11-03 17:25:36.9255297', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'110', N'Kaka', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 17:26:38.3893005', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'111', N'Giờ cứ rũ rê ', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 17:26:41.9780714', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'112', N'Bạn bè vô xài chung ', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 17:26:47.7185461', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'113', N'😆😆', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 17:26:50.5486159', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'114', N'Giống FB mấy ngày đầu tiên', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 17:26:56.8641696', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'115', N'😆 chắc cho chạy vài ngày', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28', N'2021-11-03 17:27:13.2114620', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'116', N'server này mà chạy vài trăm chắc ko nổi', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28', N'2021-11-03 17:27:25.6676446', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'117', N'ngán vụ server thôi', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28', N'2021-11-03 17:27:29.6447997', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'118', N'Alibaba cloud đang có free cho student ', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 17:27:51.2085990', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'119', N'cái này xài azure cũng ngon rồi', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28', N'2021-11-03 17:28:09.1449545', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'120', N'sợ vài bữa hết tiền thôi', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28', N'2021-11-03 17:28:21.5838418', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'121', N'https://www.alibabacloud.com/vi/campaign/education', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 17:28:37.3792388', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'122', N'Được free 1 năm để nghiên cứu', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 17:28:44.7255188', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'123', N'Cũng tạm được ấy, thử xem', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 17:28:50.7438313', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'124', N'ok để t coi thử', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28', N'2021-11-03 17:29:06.0363103', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'125', NULL, N'01bb8ea1-ee9e-4561-9e3a-e8cca68cfbc0.png', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28', N'2021-11-03 17:29:31.1710467', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'126', N'thêm 1 bug', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28', N'2021-11-03 17:29:35.0669287', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'127', N'😆😆 vô nhiều là lòi bug nhiều', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28', N'2021-11-03 17:30:31.1019807', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'128', N'Bug nhiều là việc nhiều ', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 17:32:01.0989228', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'129', N'Kaka', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 17:32:01.9774509', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'130', N'Mà chắc niên luận tới đây được rồi. Ngồi fix nữa mất thời gian', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28', N'2021-11-03 17:32:21.3337436', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'131', N'để làm môn khác', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28', N'2021-11-03 17:32:25.0056428', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'132', N'Đồng ý, cái này niên luận thì vượt chỉ tiêu rồi ', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 17:32:49.6743726', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'133', N'😂 Ok! rồi ông làm niên luận gì d', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28', N'2021-11-03 17:33:29.2397202', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'134', N'Đang tập tành làm ML à 🥲', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 17:33:49.5544145', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'135', N'Mà tới giờ nó vẫn ngáo', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 17:34:11.6943102', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'136', N'à nhớ rồi. Làm đó thì cực hơn', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28', N'2021-11-03 17:34:21.5156952', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'137', N'website còn hình dung được', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28', N'2021-11-03 17:34:28.9003063', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'138', N'Nó nặng kỹ thuật chứ khối lượng việc thì k nhiều ', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 17:34:57.9266497', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'139', N'Còn làm cái App này coi ra đầu tư thời gian dữ à', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 17:35:24.4280429', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'140', N'Dành cả ngày làm thì cả tháng xong.', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28', N'2021-11-03 17:35:47.9651574', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'141', N'còn vài tuần báo cáo rồi. Chúc máy mắn nhe', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28', N'2021-11-03 17:35:57.0553444', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'142', N'Kaka okay, good luck ', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 17:36:08.4066805', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'143', N'Đang apply một cty cần thơ', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 17:36:17.7094500', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'144', N'Nhưng mà để xem kết quả rồi có gì tui share sau 😆', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 17:36:34.7159788', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'145', N'Cũng có nhiều cái mới mà đó giờ mình chưa từng để ý tới', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 17:37:10.0410474', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'146', N'thì làm được cứ làm. Nhưng nếu muốn vô Nash thì cũng tính coi có đường lui để năm sau vô ko đó', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28', N'2021-11-03 17:37:29.0579178', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'147', N'Hello Kính', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'29', N'2021-11-03 17:38:43.9184550', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'148', N'Hi Minh', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'30', N'2021-11-03 17:38:50.9293519', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'149', N'Kaka, có tg đệ t mới vào kìa', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 17:39:10.5826939', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'150', N'Hello em ', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'31', N'2021-11-03 17:39:18.3925415', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'151', N':)))', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'31', N'2021-11-03 17:39:19.6145961', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'152', N'Mượt hơn FB =)) ', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 17:39:32.9133138', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'153', N'Chat realtime kiểu này đỡ ức chế', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 17:39:42.4027472', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'154', N'hehe 😂😂', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28', N'2021-11-03 17:40:29.1045636', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'155', N'Hello!!!', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'32', N'2021-11-03 17:41:16.6323746', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'156', N'Hi', NULL, N'30855389-4934-4350-b69a-2a35bb66a946', N'30', N'2021-11-03 17:41:17.2406679', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'157', N'Xài ổn hong bồ', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'30', N'2021-11-03 17:41:39.1308905', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'158', N'Nó có liên kết gì với mxh nào khác hông hay độc lập z', NULL, N'30855389-4934-4350-b69a-2a35bb66a946', N'30', N'2021-11-03 17:42:50.6419227', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'159', N'độc lập em', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'30', N'2021-11-03 17:42:56.3401449', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'160', N'ý lộn', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'30', N'2021-11-03 17:43:05.0536828', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'161', N'ông sv năm mấy ', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'30', N'2021-11-03 17:43:09.7851794', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'162', N'Tui ra trường rồi', NULL, N'30855389-4934-4350-b69a-2a35bb66a946', N'30', N'2021-11-03 17:43:51.9084882', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'163', N'à nảy tưởng em tui. ', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'30', N'2021-11-03 17:44:03.8969677', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'164', N'Này tui làm project riêng ấy', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'30', N'2021-11-03 17:44:09.4917095', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'165', N'Thấy link trên fb ông nên tui trải nghiệm thử á', NULL, N'30855389-4934-4350-b69a-2a35bb66a946', N'30', N'2021-11-03 17:44:24.0722638', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'166', N'ông thấy ổn hong', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'30', N'2021-11-03 17:44:44.2934120', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'167', N'Hi anh =)))', NULL, N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'31', N'2021-11-03 17:44:44.5114980', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'168', N'Em lên vọc thử coi có gì vui hông ', NULL, N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'31', N'2021-11-03 17:45:10.7670576', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'169', N'Hello anh', NULL, N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'29', N'2021-11-03 17:45:23.4296240', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'170', N'Tuyệt đó', NULL, N'30855389-4934-4350-b69a-2a35bb66a946', N'30', N'2021-11-03 17:45:26.1168349', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'171', N'Em dùng thấy ổn hong', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'29', N'2021-11-03 17:45:43.6643466', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'172', N'😁😁', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'30', N'2021-11-03 17:45:54.4596612', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'173', N'Có ra app trên ch play hay appstore gì chưa á', NULL, N'30855389-4934-4350-b69a-2a35bb66a946', N'30', N'2021-11-03 17:46:10.3516322', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'174', N'này tui làm web à không làm app', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'30', N'2021-11-03 17:46:19.5231009', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'175', N'Dạ mượt lắm anh', NULL, N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'29', N'2021-11-03 17:48:22.3101127', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'176', N'Em thấy sao :v', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'31', N'2021-11-03 17:49:22.8168282', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'177', N'Các chức năng rất trực quan', NULL, N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'29', N'2021-11-03 17:50:26.7022902', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'178', N'yub!!', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'29', N'2021-11-03 17:50:27.5534594', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'179', N'em thấy ổn là ok rồi', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'29', N'2021-11-03 17:50:37.6012899', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'180', N'Mượt quá anh ', NULL, N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'31', N'2021-11-03 17:50:44.3505707', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'181', N'Mấy chức năng cũng trực quan nữa', NULL, N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'31', N'2021-11-03 17:50:55.6900947', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'182', N'Em xin phép share bài viết trên fb của anh nha anh', NULL, N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'29', N'2021-11-03 17:54:51.4584492', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'183', N'Được nha em 😁', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'29', N'2021-11-03 17:55:52.6078551', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'184', N'Hi Huệ!', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'33', N'2021-11-03 17:57:56.5697875', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'185', N'Có trap không mà thấy mấy bạn gái req nhiều thế 😆', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 18:05:06.5258367', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'186', N'😂 phải có tí trap chứ', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28', N'2021-11-03 18:05:44.1671735', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'187', N'báo cáo thì phải fake data xíu', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28', N'2021-11-03 18:05:58.4722477', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'188', N'Hay lắm bạn toy :v', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 18:06:44.5246352', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'189', N'Tưởng đâu thiệt :v', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 18:07:10.2664507', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'190', N'Để t qc trong đây có phát người yêu', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 18:07:25.1859170', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'191', N'=)))))))0', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'28', N'2021-11-03 18:07:27.1498996', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'192', N'😂 thôi nào. Đừng dễ bị trap v chứ', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28', N'2021-11-03 18:08:38.7261981', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'193', N'Hello anh', NULL, N'21344cf9-faf5-4201-8eb2-dd8eed4281c2', N'39', N'2021-11-03 18:19:29.3998058', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'194', N'😀', NULL, N'21344cf9-faf5-4201-8eb2-dd8eed4281c2', N'39', N'2021-11-03 18:19:35.1672899', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'195', NULL, N'1565fa55-421b-46c9-bf29-d30be44a0d54.jpeg', N'21344cf9-faf5-4201-8eb2-dd8eed4281c2', N'39', N'2021-11-03 18:20:29.4340837', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'196', N'Ủa em', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'39', N'2021-11-03 18:29:12.1994900', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'197', N':v xây dựng hình tượng mới hả', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'39', N'2021-11-03 18:29:25.3294608', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'198', N'Hello Mikami', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'40', N'2021-11-03 18:29:36.2822857', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'199', N'Hello Trung', NULL, N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'40', N'2021-11-03 18:29:51.2617584', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'200', N'Hôm nay đoàn phim cho nghỉ hả', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'40', N'2021-11-03 18:29:56.9031091', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'201', N'Have you watched my movies?', NULL, N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'40', N'2021-11-03 18:30:17.9174433', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'202', N' Of course!! You are the idol of many men', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'40', N'2021-11-03 18:33:27.1219123', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'203', N'I''m so grateful for that <3', NULL, N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'40', N'2021-11-03 18:37:03.2964330', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'204', N' I have to practice singing now, see you later', NULL, N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'40', N'2021-11-03 18:37:45.6181272', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'205', N'Good bye! See ya', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'40', N'2021-11-03 18:42:02.3116673', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'206', N'Hello Thái', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'42', N'2021-11-03 18:42:28.9044791', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'207', N'Hello anh', NULL, N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'42', N'2021-11-03 18:43:17.1418581', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'208', N'Anh giờ đang làm gì ạ anh', NULL, N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'42', N'2021-11-03 18:43:32.3683459', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'209', N'Anh đang check mọi người thôi', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'42', N'2021-11-03 18:51:28.0001583', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'210', N'có ai vào thì nhắn tin với người ta nè', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'42', N'2021-11-03 18:51:36.2503059', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'211', N'Haha anh thấy được hết tin tụi em đúng không kkk', NULL, N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'42', N'2021-11-03 18:52:13.8806590', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'212', N'😂 mò vào database thì thấy. Mà thôi ai chơi vậy', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'42', N'2021-11-03 18:53:10.8033635', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'213', N'Chào Hằng', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'43', N'2021-11-03 19:10:00.9611314', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'214', N'Hi!!!', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'32', N'2021-11-03 19:16:17.4873497', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'215', N'Hi!!', NULL, N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'32', N'2021-11-03 19:16:29.7996106', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'216', N'Bạn dùng thấy ổn hong', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'32', N'2021-11-03 19:17:20.5345975', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'217', N'Chào Hậu', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'44', N'2021-11-03 19:20:05.4093569', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'218', N'Chào Phát', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'45', N'2021-11-03 19:20:11.7125499', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'219', N'Hello', NULL, N'907b94d0-1090-4389-a42c-a74c39cf365c', N'45', N'2021-11-03 19:20:27.2584916', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'220', N'Chào ông🤣', NULL, N'31b027d2-a070-4c05-b10b-21743fd8b418', N'44', N'2021-11-03 19:20:41.2056414', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'221', N'Xài thử rồi cho tui feedback nhe', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'45', N'2021-11-03 19:20:44.5504184', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'222', N'Vippro quá', NULL, N'31b027d2-a070-4c05-b10b-21743fd8b418', N'44', N'2021-11-03 19:20:46.9752129', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'223', N'êm hong êm hong. Xài thử có lỗi báo dùm nhe', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'44', N'2021-11-03 19:20:57.8315455', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'224', N'Oke ạ', NULL, N'907b94d0-1090-4389-a42c-a74c39cf365c', N'45', N'2021-11-03 19:21:05.7227273', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'225', N'Quá êm..', NULL, N'31b027d2-a070-4c05-b10b-21743fd8b418', N'44', N'2021-11-03 19:21:22.4037723', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'226', N'Mà hay lúc nó bị something wrong á', NULL, N'907b94d0-1090-4389-a42c-a74c39cf365c', N'45', N'2021-11-03 19:21:22.5911333', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'227', N'Ok nè🤣', NULL, N'31b027d2-a070-4c05-b10b-21743fd8b418', N'44', N'2021-11-03 19:21:36.0802286', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'228', N'😂 à chắc tại server cùi ấy. User vào xài nhiều nó lag', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'45', N'2021-11-03 19:24:07.2696878', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'229', N'Hey', NULL, N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'41', N'2021-11-03 19:27:08.0246825', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'230', N'dạ chào anh', NULL, N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'33', N'2021-11-03 19:34:49.0820254', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'231', N'Dùng thấy ổn hong em', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'33', N'2021-11-03 19:38:01.9615323', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'232', N'dạ ổn lắm ạk', NULL, N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'33', N'2021-11-03 19:44:12.6026604', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'233', N'em thấy ổn là ok rồi. Cảm ơn em nha!', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'33', N'2021-11-03 19:50:05.3531958', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'234', N'Chào anh, em chỉ vừa mới đăng nhập vào thôi, em thấy giao diện sáng sang xịn mịn lắm ạ', NULL, N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'32', N'2021-11-03 20:19:18.3798249', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'235', N'Hii', NULL, N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'32', N'2021-11-03 20:19:38.4950713', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'236', N'Mượt thật', NULL, N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'32', N'2021-11-03 20:25:59.4458387', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'237', N'Cảm ơn bạn nhiều!', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'32', N'2021-11-03 20:26:16.4269308', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'238', N'Cái chat này nhúng bên thứ 3 hay dùng websocket z bro', NULL, N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'32', N'2021-11-03 20:28:09.6923765', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'239', N'Chat này mình code bên BE nha. Xài .NET, SignalR', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'32', N'2021-11-03 20:28:52.7280808', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'240', N'😍', NULL, N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'32', N'2021-11-03 20:29:30.9259011', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'241', N'chúc cho ứng dụng của anh ngày càng phát triển ạ😊', NULL, N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'33', N'2021-11-03 20:36:56.2598409', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'242', N'Cảm ơn em!!!', NULL, N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'33', N'2021-11-03 20:38:35.4685060', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'243', N'hí anh em', NULL, N'40999a33-44af-457e-921d-f74cae8eeb06', N'46', N'2021-11-03 20:57:49.3933257', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'244', N'Hí hí', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'46', N'2021-11-03 20:59:49.2181352', NULL, NULL)
GO

INSERT INTO [dbo].[Messages] ([Id], [Content], [ImageFileName], [SenderId], [ChatId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'245', N'Thấy nút dark theme k :v', NULL, N'c473bda2-7dec-4e97-a857-9111f63106cf', N'46', N'2021-11-03 20:59:56.3209708', NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[Messages] OFF
GO


-- ----------------------------
-- Table structure for MessageStatuses
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[MessageStatuses]') AND type IN ('U'))
	DROP TABLE [dbo].[MessageStatuses]
GO

CREATE TABLE [dbo].[MessageStatuses] (
  [ReadByUsersId] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ReadMessagesId] int  NOT NULL
)
GO


-- ----------------------------
-- Records of MessageStatuses
-- ----------------------------
INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'2')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1bd1456a-42f8-4932-9016-63f7c209966a', N'3')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'3')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1bd1456a-42f8-4932-9016-63f7c209966a', N'4')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'4')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1bd1456a-42f8-4932-9016-63f7c209966a', N'5')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'5')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'6')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'6')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'7')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'7')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'8')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'8')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'9')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'10')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'11')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'12')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'13')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'14')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'15')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'16')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'17')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'18')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'19')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'20')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'20')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'21')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'21')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'22')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'22')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'23')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'24')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'24')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'24')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'25')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'26')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'27')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'27')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'29')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'30')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'31')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'32')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'33')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'34')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'35')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'36')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'37')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'38')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'39')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'40')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'41')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'41')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'42')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'42')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'43')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'43')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'44')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'44')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'45')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'45')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'46')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'46')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'47')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'47')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'48')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'48')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'49')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'49')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'50')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'50')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'51')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'51')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'52')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'52')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'53')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'53')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'54')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'54')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'55')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'55')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'56')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'56')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'57')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'57')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'58')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'58')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'59')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'59')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'60')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'60')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'61')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'61')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'62')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'62')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'63')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'63')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'64')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'64')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'65')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'65')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'66')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'66')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'67')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'67')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'68')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'69')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'70')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'71')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'71')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'72')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'72')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'73')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'73')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'74')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'74')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'75')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'75')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'76')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'76')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'77')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'77')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'78')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'78')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'79')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'79')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'80')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'80')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'81')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'81')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'82')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'82')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'83')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'83')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'84')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'84')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'85')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'85')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'86')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'86')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'87')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'87')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'88')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'88')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'89')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'89')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'90')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'90')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'91')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'91')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'92')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'92')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'93')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'93')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'94')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'94')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'95')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'95')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'96')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'96')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'97')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'97')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'98')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'98')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'99')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'99')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'100')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'100')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'101')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'101')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'102')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'102')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'103')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'103')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'104')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'104')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'105')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'105')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'106')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'106')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'107')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'107')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'108')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'108')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'109')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'109')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'110')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'110')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'111')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'111')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'112')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'112')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'113')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'113')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'114')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'114')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'115')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'115')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'116')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'116')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'117')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'117')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'118')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'118')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'119')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'119')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'120')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'120')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'121')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'121')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'122')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'122')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'123')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'123')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'124')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'124')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'125')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'125')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'126')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'126')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'127')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'127')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'128')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'128')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'129')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'129')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'130')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'130')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'131')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'131')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'132')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'132')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'133')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'133')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'134')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'134')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'135')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'135')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'136')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'136')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'137')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'137')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'138')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'138')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'139')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'139')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'140')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'140')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'141')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'141')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'142')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'142')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'143')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'143')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'144')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'144')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'145')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'145')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'146')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'146')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'147')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'147')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'30855389-4934-4350-b69a-2a35bb66a946', N'148')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'148')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'149')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'149')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'150')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'150')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'151')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'151')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'152')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'152')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'153')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'153')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'154')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'154')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'155')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'155')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'30855389-4934-4350-b69a-2a35bb66a946', N'156')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'156')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'30855389-4934-4350-b69a-2a35bb66a946', N'157')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'157')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'30855389-4934-4350-b69a-2a35bb66a946', N'158')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'158')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'30855389-4934-4350-b69a-2a35bb66a946', N'159')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'159')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'30855389-4934-4350-b69a-2a35bb66a946', N'160')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'160')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'30855389-4934-4350-b69a-2a35bb66a946', N'161')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'161')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'30855389-4934-4350-b69a-2a35bb66a946', N'162')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'162')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'30855389-4934-4350-b69a-2a35bb66a946', N'163')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'163')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'30855389-4934-4350-b69a-2a35bb66a946', N'164')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'164')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'30855389-4934-4350-b69a-2a35bb66a946', N'165')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'165')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'30855389-4934-4350-b69a-2a35bb66a946', N'166')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'166')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'167')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'167')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'168')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'168')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'169')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'169')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'30855389-4934-4350-b69a-2a35bb66a946', N'170')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'170')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'171')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'171')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'30855389-4934-4350-b69a-2a35bb66a946', N'172')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'172')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'30855389-4934-4350-b69a-2a35bb66a946', N'173')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'173')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'30855389-4934-4350-b69a-2a35bb66a946', N'174')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'174')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'175')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'175')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'176')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'176')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'177')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'177')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'178')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'178')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'179')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'179')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'180')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'180')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'181')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'181')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'182')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'182')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'183')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'183')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'184')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'184')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'185')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'185')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'186')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'186')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'187')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'187')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'188')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'188')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'189')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'189')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'190')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'190')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'191')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'191')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'192')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'192')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'21344cf9-faf5-4201-8eb2-dd8eed4281c2', N'193')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'193')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'21344cf9-faf5-4201-8eb2-dd8eed4281c2', N'194')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'194')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'21344cf9-faf5-4201-8eb2-dd8eed4281c2', N'195')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'195')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'196')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'197')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'198')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'198')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'199')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'199')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'200')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'200')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'201')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'201')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'202')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'202')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'203')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'203')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'204')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'204')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'205')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'206')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'206')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'207')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'207')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'208')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'208')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'209')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'209')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'210')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'210')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'211')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'211')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'212')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'213')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'214')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'214')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'215')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'215')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'216')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'216')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'31b027d2-a070-4c05-b10b-21743fd8b418', N'217')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'217')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'907b94d0-1090-4389-a42c-a74c39cf365c', N'218')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'218')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'907b94d0-1090-4389-a42c-a74c39cf365c', N'219')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'219')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'31b027d2-a070-4c05-b10b-21743fd8b418', N'220')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'220')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'907b94d0-1090-4389-a42c-a74c39cf365c', N'221')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'221')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'31b027d2-a070-4c05-b10b-21743fd8b418', N'222')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'222')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'31b027d2-a070-4c05-b10b-21743fd8b418', N'223')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'223')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'907b94d0-1090-4389-a42c-a74c39cf365c', N'224')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'224')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'31b027d2-a070-4c05-b10b-21743fd8b418', N'225')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'225')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'907b94d0-1090-4389-a42c-a74c39cf365c', N'226')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'226')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'31b027d2-a070-4c05-b10b-21743fd8b418', N'227')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'227')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'228')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'229')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'229')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'230')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'230')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'231')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'231')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'232')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'232')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'233')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'233')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'234')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'234')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'235')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'235')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'236')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'236')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'237')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'237')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'238')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'238')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'239')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'239')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'240')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'240')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'241')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'241')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'242')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'40999a33-44af-457e-921d-f74cae8eeb06', N'243')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'243')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'244')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'245')
GO


-- ----------------------------
-- Table structure for Notifications
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Notifications]') AND type IN ('U'))
	DROP TABLE [dbo].[Notifications]
GO

CREATE TABLE [dbo].[Notifications] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [CreatorId] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Type] int  NOT NULL,
  [PostId] int  NULL,
  [DateCreated] datetime2(7)  NOT NULL,
  [DateModified] datetime2(7)  NULL,
  [DateDeleted] datetime2(7)  NULL,
  [IsRead] bit DEFAULT (CONVERT([bit],(0))) NOT NULL,
  [RecipientId] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT (N'') NOT NULL,
  [ReactionType] int DEFAULT ((0)) NOT NULL
)
GO


-- ----------------------------
-- Records of Notifications
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Notifications] ON
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'1', N'2021-10-28 12:51:35.9060207', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'2', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'2', N'2021-10-28 13:05:39.4668878', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'3', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'4', N'2021-10-28 13:17:08.7159436', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'4', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'3', N'2021-10-28 13:17:11.2868929', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'5', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'1', N'4', N'2021-10-28 13:20:07.0900443', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'3')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'6', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'1', N'3', N'2021-10-28 13:20:10.0145628', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'7', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'1', N'2', N'2021-10-28 13:20:12.8933763', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'8', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-10-28 13:23:52.0493390', NULL, NULL, N'1', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'9', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-10-28 14:12:58.6552334', NULL, NULL, N'1', N'1bd1456a-42f8-4932-9016-63f7c209966a', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'10', N'aed79f8f-a1e6-43b6-b369-151085d6b8d0', N'1', N'6', N'2021-10-28 14:13:02.8074836', NULL, NULL, N'0', N'aed79f8f-a1e6-43b6-b369-151085d6b8d0', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'11', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-10-28 14:13:13.3276994', NULL, NULL, N'1', N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'12', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'5', N'2021-10-28 14:13:34.0600399', NULL, NULL, N'1', N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'13', N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'1', N'6', N'2021-10-28 14:14:22.8834394', NULL, NULL, N'1', N'aed79f8f-a1e6-43b6-b369-151085d6b8d0', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'14', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-10-28 14:14:25.9432195', NULL, NULL, N'0', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'15', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'2', NULL, N'2021-10-28 14:16:41.1875631', NULL, NULL, N'1', N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'16', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'2', NULL, N'2021-10-28 14:16:52.3216785', NULL, NULL, N'1', N'1bd1456a-42f8-4932-9016-63f7c209966a', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'17', N'1bd1456a-42f8-4932-9016-63f7c209966a', N'2', NULL, N'2021-10-28 14:17:00.7030673', NULL, NULL, N'0', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'18', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'2', NULL, N'2021-10-28 14:17:32.6582300', NULL, NULL, N'1', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'19', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'6', N'2021-10-28 14:18:56.6571800', NULL, NULL, N'0', N'aed79f8f-a1e6-43b6-b369-151085d6b8d0', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'20', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-10-28 14:18:57.2829820', NULL, NULL, N'0', N'aed79f8f-a1e6-43b6-b369-151085d6b8d0', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'21', N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'1', N'7', N'2021-10-28 14:20:50.5681934', NULL, NULL, N'0', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'22', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'3', NULL, N'2021-10-28 14:20:52.2468191', NULL, NULL, N'0', N'1bd1456a-42f8-4932-9016-63f7c209966a', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'23', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'3', NULL, N'2021-10-28 14:20:52.9463126', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'24', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'3', NULL, N'2021-10-28 14:20:53.6552335', NULL, NULL, N'0', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'25', N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'3', NULL, N'2021-10-28 14:21:03.5519893', NULL, NULL, N'0', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'26', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-10-28 14:21:06.7719698', NULL, NULL, N'0', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'27', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'1', N'7', N'2021-10-28 14:21:08.3604153', NULL, NULL, N'0', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'28', N'aed79f8f-a1e6-43b6-b369-151085d6b8d0', N'2', NULL, N'2021-10-28 14:21:10.2716525', NULL, NULL, N'0', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'29', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'1', N'4', N'2021-10-28 14:21:11.7530917', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'30', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'7', N'2021-10-28 14:24:05.4524688', NULL, NULL, N'0', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'5')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'31', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'7', N'2021-10-28 14:24:07.3970916', NULL, NULL, N'0', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'32', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'8', N'2021-10-28 15:19:08.6592213', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'33', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'9', N'2021-10-28 15:24:28.9728328', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'34', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'10', N'2021-10-28 15:28:06.7752559', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'35', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'12', N'2021-10-28 15:35:00.1580255', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'36', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'14', N'2021-10-28 15:38:16.8494797', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'37', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'13', N'2021-10-28 15:38:19.1546849', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'38', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'14', N'2021-10-28 16:09:29.8513710', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'39', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-10-28 16:10:07.9133143', NULL, NULL, N'0', N'88fa2305-54f7-409b-9b46-a826f1e9e1d4', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'40', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'7', N'2021-10-28 17:46:34.7061569', NULL, NULL, N'0', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'41', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'7', N'2021-10-28 17:47:49.7846861', NULL, NULL, N'0', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'42', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'7', N'2021-10-29 01:13:47.8867669', NULL, NULL, N'0', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'43', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'7', N'2021-10-29 01:14:03.2295964', NULL, NULL, N'0', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'44', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'7', N'2021-10-29 01:14:56.7928738', NULL, NULL, N'0', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'45', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'7', N'2021-10-29 01:16:27.6692154', NULL, NULL, N'0', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'46', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'7', N'2021-10-29 01:16:43.4277855', NULL, NULL, N'0', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'47', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'14', N'2021-10-29 01:20:19.2439776', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'48', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'14', N'2021-10-29 01:21:26.0771671', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'49', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'11', N'2021-10-29 01:23:03.9291824', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'50', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'11', N'2021-10-29 01:23:08.0983133', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'51', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'11', N'2021-10-29 01:23:22.9455180', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'52', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'11', N'2021-10-29 01:24:56.4768373', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'53', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'11', N'2021-10-29 01:28:22.3905042', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'54', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'15', N'2021-10-29 01:43:11.8824291', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'55', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'7', N'2021-10-29 02:00:30.3775490', NULL, NULL, N'0', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'56', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'18', N'2021-10-29 02:02:37.4083439', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'57', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'18', N'2021-10-29 02:02:38.8259703', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'58', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'18', N'2021-10-29 02:02:40.9093450', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'59', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'18', N'2021-10-29 02:03:31.1403078', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'60', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'19', N'2021-10-29 02:06:54.9163813', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'61', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'1', N'20', N'2021-10-29 10:20:56.2493948', NULL, NULL, N'1', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'62', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'0', N'20', N'2021-10-29 10:21:02.7877828', NULL, NULL, N'1', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'63', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'1', N'21', N'2021-10-29 12:56:28.2501223', NULL, NULL, N'1', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'2')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'64', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'0', N'21', N'2021-10-29 12:56:35.3664967', NULL, NULL, N'1', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'65', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-10-29 15:45:04.2344737', NULL, NULL, N'1', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'66', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-10-29 15:46:06.2514629', NULL, NULL, N'1', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'67', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-10-29 15:46:14.8820127', NULL, NULL, N'0', N'62e18ec4-5fc6-4214-83aa-d1486efa4729', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'68', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'13', N'2021-10-29 15:47:14.6627587', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'69', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'13', N'2021-10-29 16:15:44.1598082', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'70', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'14', N'2021-10-29 16:20:31.5483396', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'71', N'1e701476-d570-45d0-a0c6-948425401075', N'1', N'14', N'2021-10-29 16:58:11.4707336', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'72', N'1e701476-d570-45d0-a0c6-948425401075', N'1', N'13', N'2021-10-29 17:31:50.1638098', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'73', N'1e701476-d570-45d0-a0c6-948425401075', N'1', N'12', N'2021-10-29 17:31:51.8707665', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'74', N'1e701476-d570-45d0-a0c6-948425401075', N'1', N'11', N'2021-10-29 17:31:54.2823735', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'3')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'75', N'1e701476-d570-45d0-a0c6-948425401075', N'1', N'10', N'2021-10-29 17:31:57.1707353', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'76', N'1e701476-d570-45d0-a0c6-948425401075', N'1', N'9', N'2021-10-29 17:31:59.6996408', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'77', N'1e701476-d570-45d0-a0c6-948425401075', N'1', N'2', N'2021-10-29 17:32:10.5463227', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'78', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'1', N'22', N'2021-10-29 17:53:27.9150730', NULL, NULL, N'1', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'79', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'1', N'23', N'2021-10-29 17:57:58.1086342', NULL, NULL, N'1', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'80', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'1', N'24', N'2021-10-29 17:58:20.9833957', NULL, NULL, N'1', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'81', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'1', N'22', N'2021-10-29 17:59:11.9217417', NULL, NULL, N'1', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'2')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'82', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'2', NULL, N'2021-10-29 17:59:33.6835162', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'83', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'1', N'14', N'2021-10-29 17:59:38.1720874', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'84', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'1', N'13', N'2021-10-29 17:59:40.3335970', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'85', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'1', N'12', N'2021-10-29 17:59:46.6286169', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'3')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'86', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'1', N'11', N'2021-10-29 17:59:48.8713758', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'87', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'1', N'10', N'2021-10-29 17:59:52.3012952', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'88', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'1', N'9', N'2021-10-29 17:59:56.3136030', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'89', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'1', N'8', N'2021-10-29 17:59:58.1914237', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'90', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'1', N'4', N'2021-10-29 18:00:01.0326818', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'91', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'1', N'3', N'2021-10-29 18:00:04.1880839', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'3')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'92', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'1', N'2', N'2021-10-29 18:00:06.9631876', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'93', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'2', NULL, N'2021-10-29 18:00:52.3893949', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'94', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'1', N'14', N'2021-10-29 18:00:56.3013136', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'95', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'1', N'13', N'2021-10-29 18:00:58.6310683', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'96', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'1', N'12', N'2021-10-29 18:01:00.8921395', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'97', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'1', N'11', N'2021-10-29 18:01:02.4097404', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'98', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'1', N'10', N'2021-10-29 18:01:03.7958162', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'99', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'1', N'9', N'2021-10-29 18:01:05.9075723', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'100', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'1', N'8', N'2021-10-29 18:01:07.6010100', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'101', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'1', N'4', N'2021-10-29 18:01:09.6785795', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'102', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'1', N'3', N'2021-10-29 18:01:11.3419514', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'103', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'1', N'2', N'2021-10-29 18:01:12.8984939', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'104', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'2', NULL, N'2021-10-29 18:01:25.0112942', NULL, NULL, N'1', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'105', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'3', NULL, N'2021-10-29 18:01:41.2343397', NULL, NULL, N'0', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'106', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'1', N'25', N'2021-10-29 18:05:32.3908190', NULL, NULL, N'1', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'107', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'2', NULL, N'2021-10-29 18:05:37.3397882', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'108', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'1', N'14', N'2021-10-29 18:05:40.3659377', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'109', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'1', N'13', N'2021-10-29 18:05:41.5966089', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'110', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'1', N'12', N'2021-10-29 18:05:42.7814944', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'111', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'1', N'11', N'2021-10-29 18:05:44.0703577', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'112', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'1', N'10', N'2021-10-29 18:05:45.3861852', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'113', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'1', N'9', N'2021-10-29 18:05:47.2246803', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'114', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'1', N'8', N'2021-10-29 18:05:50.5658535', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'115', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'1', N'4', N'2021-10-29 18:05:52.2899779', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'116', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'1', N'3', N'2021-10-29 18:05:53.8213108', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'117', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'1', N'2', N'2021-10-29 18:05:56.4751059', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'118', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'2', NULL, N'2021-10-29 18:06:08.1106415', NULL, NULL, N'0', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'119', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'1', N'24', N'2021-10-29 18:06:09.3359124', NULL, NULL, N'0', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'120', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'1', N'23', N'2021-10-29 18:06:11.5884302', NULL, NULL, N'0', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'121', N'1e701476-d570-45d0-a0c6-948425401075', N'1', N'26', N'2021-10-29 18:09:27.1253758', NULL, NULL, N'1', N'1e701476-d570-45d0-a0c6-948425401075', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'122', N'1e701476-d570-45d0-a0c6-948425401075', N'2', NULL, N'2021-10-29 18:09:38.9730937', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'123', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'3', NULL, N'2021-10-29 18:11:30.8705212', NULL, NULL, N'0', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'124', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'2', NULL, N'2021-10-29 18:12:09.7831572', NULL, NULL, N'0', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'125', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'2', NULL, N'2021-10-29 18:12:57.0179728', NULL, NULL, N'0', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'126', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'0', N'27', N'2021-10-29 18:13:52.6979435', NULL, NULL, N'1', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'127', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'1', N'27', N'2021-10-29 18:13:54.0284589', NULL, NULL, N'1', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'128', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'1', N'27', N'2021-10-29 18:14:16.2941198', NULL, NULL, N'0', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'129', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'27', N'2021-10-29 18:14:48.0090709', NULL, NULL, N'1', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'130', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'22', N'2021-10-29 18:14:54.6164851', NULL, NULL, N'0', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'2')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'131', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'1', N'24', N'2021-10-29 18:15:47.3110240', NULL, NULL, N'0', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'2')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'132', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'1', N'23', N'2021-10-29 18:15:49.2686096', NULL, NULL, N'0', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'133', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'2', NULL, N'2021-10-29 18:17:27.4798420', NULL, NULL, N'0', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'134', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'1', N'27', N'2021-10-29 18:17:28.9786641', NULL, NULL, N'0', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'135', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'3', NULL, N'2021-10-29 18:18:31.7223578', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'136', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'27', N'2021-10-29 18:19:30.2859648', NULL, NULL, N'1', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'137', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'1', N'28', N'2021-10-29 18:27:45.7062172', NULL, NULL, N'0', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'138', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'1', N'30', N'2021-10-29 18:29:35.3803319', NULL, NULL, N'0', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'139', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'1', N'29', N'2021-10-29 18:29:37.3790205', NULL, NULL, N'0', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'140', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'2', NULL, N'2021-10-29 18:30:15.8987165', NULL, NULL, N'0', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'141', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'2', NULL, N'2021-10-29 18:30:27.0750406', NULL, NULL, N'0', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'142', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'3', NULL, N'2021-10-29 18:30:41.6453276', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'143', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'30', N'2021-10-29 18:32:42.4204834', NULL, NULL, N'0', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'144', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'29', N'2021-10-29 18:36:01.0030447', NULL, NULL, N'0', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'145', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'28', N'2021-10-29 18:36:02.5199452', NULL, NULL, N'0', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'146', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'2', NULL, N'2021-10-29 19:11:18.7329452', NULL, NULL, N'1', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'147', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'4', NULL, N'2021-10-29 19:18:56.4818048', NULL, NULL, N'0', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'148', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'1', N'31', N'2021-10-29 19:22:03.5060010', NULL, NULL, N'1', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'149', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'2', NULL, N'2021-10-29 19:22:23.5914466', NULL, NULL, N'1', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'150', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-10-29 19:23:28.1133704', NULL, NULL, N'1', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'151', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'3', NULL, N'2021-10-29 19:23:33.1261035', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'152', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'2', NULL, N'2021-10-29 19:24:14.2620807', NULL, NULL, N'0', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'153', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'1', N'31', N'2021-10-29 19:24:33.9087785', NULL, NULL, N'1', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'154', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'3', NULL, N'2021-10-29 19:28:07.2262425', NULL, NULL, N'0', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'155', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'2', NULL, N'2021-10-29 19:28:59.4587249', NULL, NULL, N'0', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'156', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'1', N'31', N'2021-10-29 19:29:05.4287581', NULL, NULL, N'0', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'157', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'0', N'31', N'2021-10-29 19:30:10.1608959', NULL, NULL, N'0', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'158', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'3', NULL, N'2021-10-29 19:31:04.8150992', NULL, NULL, N'0', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'159', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'1', N'24', N'2021-10-29 19:31:10.2533596', NULL, NULL, N'0', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'160', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'1', N'14', N'2021-10-29 19:31:22.5799475', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'161', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'2', NULL, N'2021-10-29 19:31:30.1767808', NULL, NULL, N'0', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'162', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'1', N'31', N'2021-10-29 19:31:35.1304830', NULL, NULL, N'1', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'163', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'1', N'27', N'2021-10-29 19:31:51.8670022', NULL, NULL, N'0', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'164', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'1', N'27', N'2021-10-29 19:31:53.3038520', NULL, NULL, N'0', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'2')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'165', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'2', NULL, N'2021-10-29 19:32:06.7008724', NULL, NULL, N'0', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'166', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'1', N'31', N'2021-10-29 19:32:08.5006253', NULL, NULL, N'0', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'167', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'2', NULL, N'2021-10-29 19:33:14.8328833', NULL, NULL, N'0', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'168', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'1', N'31', N'2021-10-29 19:33:16.3848371', NULL, NULL, N'0', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'169', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'1', N'32', N'2021-10-29 21:16:33.6651509', NULL, NULL, N'1', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'170', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-10-29 21:24:07.4253479', NULL, NULL, N'0', N'62e18ec4-5fc6-4214-83aa-d1486efa4729', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'171', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'4', NULL, N'2021-10-31 02:14:05.0016249', NULL, NULL, N'0', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'172', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'4', NULL, N'2021-10-31 02:14:08.3508208', NULL, NULL, N'1', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'173', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'4', NULL, N'2021-10-31 02:14:27.9109506', NULL, NULL, N'0', N'62e18ec4-5fc6-4214-83aa-d1486efa4729', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'174', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'2', NULL, N'2021-10-31 02:14:29.8310533', NULL, NULL, N'0', N'62e18ec4-5fc6-4214-83aa-d1486efa4729', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'175', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'4', NULL, N'2021-10-31 02:14:43.7098737', NULL, NULL, N'0', N'62e18ec4-5fc6-4214-83aa-d1486efa4729', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'176', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-10-31 16:03:34.6647888', NULL, NULL, N'1', N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'177', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-10-31 16:05:58.7107965', NULL, NULL, N'1', N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'178', N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'3', NULL, N'2021-10-31 16:06:54.5817976', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'179', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-10-31 16:10:51.3521531', NULL, NULL, N'1', N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'180', N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'1', N'12', N'2021-10-31 16:15:50.3119698', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'181', N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'1', N'14', N'2021-10-31 16:19:55.1787515', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'182', N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'1', N'34', N'2021-10-31 16:33:16.4222452', NULL, NULL, N'1', N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'183', N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'1', N'34', N'2021-10-31 16:33:27.2854425', NULL, NULL, N'1', N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'184', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'35', N'2021-10-31 16:35:04.6872433', NULL, NULL, N'0', N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'185', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'34', N'2021-10-31 16:35:07.8173407', NULL, NULL, N'1', N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'186', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'34', N'2021-10-31 16:35:58.1155619', NULL, NULL, N'1', N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'187', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'35', N'2021-10-31 16:36:04.8230057', NULL, NULL, N'1', N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'188', N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'3', NULL, N'2021-10-31 16:41:09.6748245', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'189', N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'1', N'35', N'2021-10-31 16:56:11.5691434', NULL, NULL, N'1', N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'190', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'1', N'4', N'2021-11-03 17:25:25.4937021', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'191', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-11-03 17:30:37.4558753', NULL, NULL, N'1', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'192', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'36', N'2021-11-03 17:30:38.9272292', NULL, NULL, N'1', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'193', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'36', N'2021-11-03 17:30:43.1736029', NULL, NULL, N'1', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'194', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'0', N'36', N'2021-11-03 17:31:43.8817368', NULL, NULL, N'1', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'195', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'36', N'2021-11-03 17:31:56.3953898', NULL, NULL, N'1', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'196', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-11-03 17:38:53.9314949', NULL, NULL, N'1', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'197', N'30855389-4934-4350-b69a-2a35bb66a946', N'1', N'14', N'2021-11-03 17:38:55.1135315', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'198', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-11-03 17:38:55.7674409', NULL, NULL, N'1', N'30855389-4934-4350-b69a-2a35bb66a946', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'199', N'30855389-4934-4350-b69a-2a35bb66a946', N'0', N'14', N'2021-11-03 17:39:12.1001568', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'200', N'30855389-4934-4350-b69a-2a35bb66a946', N'3', NULL, N'2021-11-03 17:40:08.2428081', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'201', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'14', N'2021-11-03 17:40:39.9924357', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'202', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-11-03 17:41:12.1950914', NULL, NULL, N'1', N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'203', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-11-03 17:57:28.6258375', NULL, NULL, N'1', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'204', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'2', NULL, N'2021-11-03 18:01:28.6422207', NULL, NULL, N'1', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'205', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'2', NULL, N'2021-11-03 18:01:38.5684268', NULL, NULL, N'1', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'206', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'1', N'36', N'2021-11-03 18:01:40.8023617', NULL, NULL, N'1', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'2')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'207', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'2', NULL, N'2021-11-03 18:01:55.8962273', NULL, NULL, N'1', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'208', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'2', NULL, N'2021-11-03 18:03:48.1833663', NULL, NULL, N'1', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'209', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'2', NULL, N'2021-11-03 18:03:57.9738976', NULL, NULL, N'0', N'5a48f894-ca56-484b-8f9a-6d21b5868b97', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'210', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'2', NULL, N'2021-11-03 18:04:05.4529955', NULL, NULL, N'1', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'211', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'2', NULL, N'2021-11-03 18:04:12.6589653', NULL, NULL, N'0', N'30855389-4934-4350-b69a-2a35bb66a946', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'212', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'2', NULL, N'2021-11-03 18:04:20.7668138', NULL, NULL, N'1', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'213', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'3', NULL, N'2021-11-03 18:04:25.0341922', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'214', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'2', NULL, N'2021-11-03 18:04:42.0736448', NULL, NULL, N'1', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'215', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'2', NULL, N'2021-11-03 18:04:48.3033866', NULL, NULL, N'0', N'5a48f894-ca56-484b-8f9a-6d21b5868b97', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'216', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'2', NULL, N'2021-11-03 18:05:00.9013114', NULL, NULL, N'1', N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'217', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'3', NULL, N'2021-11-03 18:05:04.6113172', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'218', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'3', NULL, N'2021-11-03 18:05:04.9861858', NULL, NULL, N'0', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'219', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'3', NULL, N'2021-11-03 18:05:05.1298125', NULL, NULL, N'1', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'220', N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'3', NULL, N'2021-11-03 18:05:06.0548536', NULL, NULL, N'1', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'221', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'3', NULL, N'2021-11-03 18:06:54.2180893', NULL, NULL, N'1', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'222', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'3', NULL, N'2021-11-03 18:06:54.7858156', NULL, NULL, N'0', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'223', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'2', NULL, N'2021-11-03 18:11:06.6429432', NULL, NULL, N'0', N'535fbe62-7546-4dd5-a1a8-ed5e2e70c058', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'224', N'21344cf9-faf5-4201-8eb2-dd8eed4281c2', N'1', N'14', N'2021-11-03 18:16:27.1341243', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'225', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'2', NULL, N'2021-11-03 18:20:36.6570991', NULL, NULL, N'0', N'21344cf9-faf5-4201-8eb2-dd8eed4281c2', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'226', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'2', NULL, N'2021-11-03 18:25:07.2490326', NULL, NULL, N'0', N'6705eedb-12d3-403d-acf5-e164c0d4b625', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'227', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'2', NULL, N'2021-11-03 18:25:11.9645356', NULL, NULL, N'1', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'228', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'3', NULL, N'2021-11-03 18:25:24.8750248', NULL, NULL, N'1', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'229', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'3', NULL, N'2021-11-03 18:25:28.2603067', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'230', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'1', N'32', N'2021-11-03 18:26:46.4684289', NULL, NULL, N'1', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'231', N'49846e9e-7f13-4831-87aa-81bbf412cd18', N'1', N'14', N'2021-11-03 18:31:34.3260900', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'232', N'49846e9e-7f13-4831-87aa-81bbf412cd18', N'2', NULL, N'2021-11-03 18:31:53.0694677', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'233', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'3', NULL, N'2021-11-03 18:33:46.7412006', NULL, NULL, N'0', N'49846e9e-7f13-4831-87aa-81bbf412cd18', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'234', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'2', NULL, N'2021-11-03 18:34:04.4809261', NULL, NULL, N'0', N'a3c356cb-1d66-4307-9ffd-ac8528ccf61d', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'235', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'2', NULL, N'2021-11-03 18:34:12.4703159', NULL, NULL, N'0', N'49846e9e-7f13-4831-87aa-81bbf412cd18', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'236', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'1', N'37', N'2021-11-03 18:40:33.8654865', NULL, NULL, N'1', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'237', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'1', N'10', N'2021-11-03 18:41:01.5227495', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'238', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'0', N'10', N'2021-11-03 18:41:14.0202647', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'239', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'10', N'2021-11-03 18:42:13.5708526', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'240', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-11-03 18:42:16.7486175', NULL, NULL, N'1', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'241', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'37', N'2021-11-03 18:42:18.2596173', NULL, NULL, N'1', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'242', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'3', NULL, N'2021-11-03 18:44:02.1860407', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'243', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'2', NULL, N'2021-11-03 18:44:10.1729439', NULL, NULL, N'0', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'244', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'1', N'23', N'2021-11-03 18:44:20.0053784', NULL, NULL, N'0', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'245', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'2', NULL, N'2021-11-03 18:45:09.1013544', NULL, NULL, N'1', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'246', N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'1', N'14', N'2021-11-03 18:47:38.7475842', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'247', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'2', NULL, N'2021-11-03 18:48:49.7607806', NULL, NULL, N'1', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'248', N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'3', NULL, N'2021-11-03 18:51:33.1029455', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'249', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'3', NULL, N'2021-11-03 18:52:27.2135436', NULL, NULL, N'0', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'250', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'3', NULL, N'2021-11-03 18:52:37.2245031', NULL, NULL, N'0', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'251', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'37', N'2021-11-03 18:56:43.6526907', NULL, NULL, N'0', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'252', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'1', N'37', N'2021-11-03 18:57:28.1272225', NULL, NULL, N'0', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'2')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'253', N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'1', N'37', N'2021-11-03 18:58:04.4655673', NULL, NULL, N'0', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'254', N'fa669a9b-d9cd-4b7a-844d-51bb5d3fb7d3', N'1', N'14', N'2021-11-03 19:06:51.9313119', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'255', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-11-03 19:09:06.4919698', NULL, NULL, N'0', N'fa669a9b-d9cd-4b7a-844d-51bb5d3fb7d3', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'256', N'907b94d0-1090-4389-a42c-a74c39cf365c', N'1', N'13', N'2021-11-03 19:20:04.0854729', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'257', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-11-03 19:20:22.4055530', NULL, NULL, N'1', N'31b027d2-a070-4c05-b10b-21743fd8b418', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'258', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-11-03 19:20:24.0870737', NULL, NULL, N'1', N'907b94d0-1090-4389-a42c-a74c39cf365c', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'259', N'907b94d0-1090-4389-a42c-a74c39cf365c', N'3', NULL, N'2021-11-03 19:20:36.6743902', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'260', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'3', NULL, N'2021-11-03 19:36:12.3102845', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'261', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'3', NULL, N'2021-11-03 19:36:13.9025858', NULL, NULL, N'0', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'262', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'3', NULL, N'2021-11-03 19:36:14.7922090', NULL, NULL, N'0', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'263', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'1', N'25', N'2021-11-03 19:36:36.4969690', NULL, NULL, N'0', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'264', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'1', N'22', N'2021-11-03 19:36:39.4019625', NULL, NULL, N'0', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'265', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'4', NULL, N'2021-11-03 20:08:09.2873388', NULL, NULL, N'0', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'266', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'38', N'2021-11-03 20:38:55.8800114', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'267', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'1', N'38', N'2021-11-03 20:54:38.2034475', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'268', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'0', N'38', N'2021-11-03 20:54:53.0634261', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'269', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'38', N'2021-11-03 21:03:28.0432228', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'270', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'39', N'2021-11-03 21:08:21.9425075', NULL, NULL, N'0', N'40999a33-44af-457e-921d-f74cae8eeb06', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'271', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-11-03 21:08:24.3343524', NULL, NULL, N'0', N'40999a33-44af-457e-921d-f74cae8eeb06', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'272', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'39', N'2021-11-03 21:16:38.7374454', NULL, NULL, N'0', N'40999a33-44af-457e-921d-f74cae8eeb06', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'273', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-11-03 21:41:57.4911522', NULL, NULL, N'0', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'274', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-11-03 21:41:59.9116391', NULL, NULL, N'0', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'275', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-11-03 21:42:06.3676646', NULL, NULL, N'0', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'276', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'1', N'8', N'2021-11-03 22:26:10.5800153', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'277', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'1', N'8', N'2021-11-03 22:26:15.3871252', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'278', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'1', N'8', N'2021-11-03 22:26:22.1390425', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'279', N'fbeccc5a-5e29-4c83-9ee8-32ae27ede1cf', N'0', N'38', N'2021-11-03 23:12:43.8042769', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'280', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'1', N'24', N'2021-11-03 23:24:12.8490264', NULL, NULL, N'0', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'281', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'40', N'2021-11-03 23:24:43.4795829', NULL, NULL, N'0', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'282', N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'1', N'14', N'2021-11-03 23:27:23.4940264', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'283', N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'1', N'41', N'2021-11-03 23:27:40.6859356', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'284', N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'1', N'41', N'2021-11-03 23:28:16.6163038', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'285', N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'1', N'42', N'2021-11-03 23:29:50.2067844', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'286', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'42', N'2021-11-03 23:30:00.2643026', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'287', N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'1', N'42', N'2021-11-03 23:30:10.8676160', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'288', N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'0', N'42', N'2021-11-03 23:30:13.3333543', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'289', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'42', N'2021-11-03 23:30:20.2039410', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'3')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'290', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-11-03 23:31:32.5289398', NULL, NULL, N'0', N'fbeccc5a-5e29-4c83-9ee8-32ae27ede1cf', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'291', N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'1', N'13', N'2021-11-03 23:34:35.6403362', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'292', N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'2', NULL, N'2021-11-03 23:34:51.7824877', NULL, NULL, N'0', N'6705eedb-12d3-403d-acf5-e164c0d4b625', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'293', N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'1', N'35', N'2021-11-03 23:35:15.0533208', NULL, NULL, N'0', N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'1')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'294', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'43', N'2021-11-03 23:38:06.2870401', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'295', N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'1', N'43', N'2021-11-03 23:39:14.5685480', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'4')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'296', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-11-03 23:39:42.9595819', NULL, NULL, N'0', N'79dcfd64-e286-4f8b-9f6f-6454b0e3f9ba', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'297', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-11-03 23:39:53.9772785', NULL, NULL, N'0', N'8f55ebc3-c9fd-47b1-ba0e-a13803433815', N'0')
GO

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'298', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'1', N'43', N'2021-11-04 05:45:11.7693917', NULL, NULL, N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0')
GO

SET IDENTITY_INSERT [dbo].[Notifications] OFF
GO


-- ----------------------------
-- Table structure for Photos
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Photos]') AND type IN ('U'))
	DROP TABLE [dbo].[Photos]
GO

CREATE TABLE [dbo].[Photos] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Caption] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ImageFileName] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PostId] int  NULL,
  [DateCreated] datetime2(7)  NOT NULL,
  [DateModified] datetime2(7)  NULL,
  [DateDeleted] datetime2(7)  NULL
)
GO


-- ----------------------------
-- Records of Photos
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Photos] ON
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'3', N'Post photo', N'bdfd8e9c-d4f5-40cf-a093-6989c85df046.jpeg', N'2', N'2021-10-28 13:05:24.8173451', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'4', N'Post photo', N'3003ce37-22dd-45e5-ac53-6e30ab68d3d8.jpeg', N'3', N'2021-10-28 13:15:59.5734049', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'5', N'Post photo', N'2975249c-e459-451f-ba8a-ccd7a9d8fd2b.jpeg', N'3', N'2021-10-28 13:15:59.7480736', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'6', N'Post photo', N'01176964-bf20-4087-bae3-3e36d91773ba.jpeg', N'3', N'2021-10-28 13:16:00.0704056', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'7', N'Post photo', N'f8410747-8706-42ac-b3b4-7100bf7a5a5d.jpeg', N'4', N'2021-10-28 13:16:59.9612991', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'8', N'Post photo', N'49618d10-78bf-44d5-994d-99fa580af6ff.jpeg', N'4', N'2021-10-28 13:17:00.2218285', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'9', N'Post photo', N'893d435d-95e8-4496-ac84-7a74a31b4241.png', N'5', N'2021-10-28 14:12:43.9840618', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'10', N'Post photo', N'078dddfc-395a-4efb-a2be-337bddc8d340.jpg', N'7', N'2021-10-28 14:16:15.3223076', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'11', N'Post photo', N'cb4979b7-4049-4e93-9e14-9ee4e4e1aaff.jpeg', N'8', N'2021-10-28 15:19:03.1203059', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'12', N'Post photo', N'28756587-a46a-4e0c-8b90-c5708015d662.jpeg', N'8', N'2021-10-28 15:19:03.1200112', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'13', N'Post photo', N'bbe02777-2eb3-4270-ab46-8442b89e970d.jpeg', N'8', N'2021-10-28 15:19:03.2843215', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'14', N'Post photo', N'1e5e85d7-715a-4f5c-a7ba-1defc30dd076.jpeg', N'8', N'2021-10-28 15:19:03.5603491', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'15', N'Post photo', N'd53c9cdd-b18f-448b-852c-523b183249df.jpeg', N'9', N'2021-10-28 15:24:25.3731887', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'16', N'Post photo', N'47455b5c-697a-4ca3-8e6b-be49d6920a52.jpeg', N'9', N'2021-10-28 15:24:25.5215740', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'17', N'Post photo', N'56a3925b-81e6-4ef6-8be6-ba99af548c86.jpeg', N'9', N'2021-10-28 15:24:25.5425681', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'18', N'Post photo', N'5bd98d67-f652-44dd-98a4-fc19079d9c45.jpeg', N'9', N'2021-10-28 15:24:25.7542704', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'19', N'Post photo', N'ff294e82-6a98-4292-a7f8-6153487a4715.jpeg', N'9', N'2021-10-28 15:24:29.1191190', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'20', N'Post photo', N'51d05991-bbc6-4e79-8654-1abaa7cf2d80.jpeg', N'9', N'2021-10-28 15:26:47.3441992', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'21', N'Post photo', N'be709028-bc67-4313-b791-d25adef4a75e.jpeg', N'10', N'2021-10-28 15:27:56.2195618', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'22', N'Post photo', N'2e1116a8-aa9c-4046-9414-3abeab9efd1f.jpeg', N'11', N'2021-10-28 15:31:47.7922136', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'23', N'Post photo', N'3399ecda-de28-42d2-b56d-8934b9caf866.jpeg', N'11', N'2021-10-28 15:31:47.8170948', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'24', N'Post photo', N'a1464d0f-9662-4afd-9e17-2e359881e10f.jpeg', N'11', N'2021-10-28 15:31:51.0702636', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'25', N'Post photo', N'12dd3bee-aa4b-4204-9dc7-b75c866e8a65.jpeg', N'12', N'2021-10-28 15:33:36.6533252', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'26', N'Post photo', N'2183f488-1d28-4881-9df8-c8d83884525f.jpeg', N'9', N'2021-10-28 15:36:26.3322211', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'27', N'Post photo', N'8cc06920-1b3a-46d1-b346-202e1d7350b2.jpeg', N'9', N'2021-10-28 15:36:26.3507384', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'28', N'Post photo', N'3542a6c7-858b-4a17-aee3-9dd7f0035421.jpeg', N'13', N'2021-10-28 15:37:30.4692495', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'29', N'Post photo', N'94a41775-421f-4ad0-8254-4977c14c3085.jpeg', N'13', N'2021-10-28 15:37:30.6224490', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'30', N'Post photo', N'ad1d729c-9d9f-4fea-9958-88f8bddecf0f.jpeg', N'14', N'2021-10-28 15:38:09.6378158', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'31', N'Post photo', N'198e8b51-7a65-43e0-a786-7533e34578e2.jpeg', N'21', N'2021-10-29 12:56:21.8835333', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'32', N'Post photo', N'52e3c816-b242-4e9f-94c1-bae249ebf7fc.jpg', N'22', N'2021-10-29 17:53:15.1721686', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'33', N'Post photo', N'26d79f9f-6e42-4011-8307-b1aabc88b09e.jpg', N'23', N'2021-10-29 17:57:54.3574181', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'34', N'Post photo', N'c47a8ea3-d782-4a72-aadb-fb7cbde3e08d.jpg', N'25', N'2021-10-29 18:05:30.1277333', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'35', N'Post photo', N'2c42087c-9a9d-4bf4-a59c-2850b401fabe.jpeg', N'28', N'2021-10-29 18:27:41.9147716', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'36', N'Post photo', N'ed446c06-dbde-4937-b1f4-c14fa9b94420.jpeg', N'29', N'2021-10-29 18:28:12.2303503', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'37', N'Post photo', N'820fe7cd-aa9d-459f-bff8-726348747abc.jpeg', N'29', N'2021-10-29 18:28:25.9362707', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'38', N'Post photo', N'43ba649d-0da6-453f-9157-0e049c7c3b4f.jpeg', N'30', N'2021-10-29 18:29:32.6974876', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'39', N'Post photo', N'39454e98-0da6-4493-bcf8-2849a7b6edf2.jpg', N'31', N'2021-10-29 19:22:00.3720876', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'40', N'Post photo', N'bf27d3a1-0ff5-4bd8-a61f-8fa69aebe515.jpg', N'32', N'2021-10-29 21:16:29.6817375', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'41', N'Post photo', N'f85f2126-1b1a-4c11-ba82-f85e065c1830.png', N'33', N'2021-10-30 22:22:28.3543310', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'42', N'Post photo', N'247a498c-7ef3-483f-8738-2065755a0ade.jpg', N'35', N'2021-10-31 16:33:51.6724464', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'43', N'Post photo', N'0c05861c-4bda-4bc5-a6c1-57b3868a645a.png', N'38', N'2021-11-03 20:38:14.1824366', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'44', N'Post photo', N'36ff0825-7e4e-4cdb-88bc-29a6d7c372de.jpg', N'39', N'2021-11-03 20:59:04.7188593', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'45', N'Post photo', N'e23f3fc6-9c1f-4737-ac01-b192b38fc435.jpeg', N'41', N'2021-11-03 23:28:06.7453096', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'46', N'Post photo', N'210c65a4-7177-4316-90c9-b59b24254077.jpeg', N'42', N'2021-11-03 23:29:44.8556425', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'47', N'Post photo', N'7f2d027c-1a7c-46bc-b606-4d366e6a02ae.jpeg', N'42', N'2021-11-03 23:29:44.9544391', NULL, NULL)
GO

INSERT INTO [dbo].[Photos] ([Id], [Caption], [ImageFileName], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'49', N'Post photo', N'1f49a718-c7c5-4884-9456-532f060b6696.png', N'43', N'2021-11-04 05:44:20.4731090', NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[Photos] OFF
GO


-- ----------------------------
-- Table structure for Posts
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Posts]') AND type IN ('U'))
	DROP TABLE [dbo].[Posts]
GO

CREATE TABLE [dbo].[Posts] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Content] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [CreatorId] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Privacy] int  NOT NULL,
  [DateCreated] datetime2(7)  NOT NULL,
  [DateModified] datetime2(7)  NULL,
  [DateDeleted] datetime2(7)  NULL
)
GO


-- ----------------------------
-- Records of Posts
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Posts] ON
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'1', N'Bhana', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'2021-10-28 12:51:31.3217779', NULL, N'2021-10-28 12:51:39.1659722')
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'2', N'Welcome to TeeApp! An awesome social networking website 🥳✌️', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'2021-10-28 13:03:31.4527866', N'2021-10-29 08:58:49.7545799', NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'3', N'Không biết chừng nào mới được đi coi phim nữa 🙁', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'2021-10-28 13:15:58.3930020', N'2021-10-28 13:21:40.6528439', NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'4', N'My hair after 4 months in quarantine 😆', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'2021-10-28 13:16:57.1430984', N'2021-10-28 13:51:23.9057226', NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'5', N'Pizza', N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'0', N'2021-10-28 14:12:43.7908965', NULL, NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'6', N'Hôm nay tôi mệt!!', N'aed79f8f-a1e6-43b6-b369-151085d6b8d0', N'0', N'2021-10-28 14:13:00.4784104', NULL, NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'7', N'Mô phật.', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'0', N'2021-10-28 14:16:14.9513101', NULL, NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'8', N'Thèm cảm giác chạy vòng vòng ngoài đường rồi ăn uống đủ thứ quá đi 😋😋', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'2021-10-28 15:19:01.4060990', NULL, NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'9', N'May mắn là mình đã rất enjoy những cái moments không bịt khẩu trang này 🤩', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'2021-10-28 15:24:24.1504095', N'2021-10-31 01:13:22.3452279', NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'10', N'1m52!', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'2021-10-28 15:27:55.3408192', NULL, NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'11', N'Những buổi sáng đẹp trời ở công ty và góc làm việc lý tưởng của mình nè 🥰', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'2021-10-28 15:31:47.0965915', NULL, NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'12', N'Hello my friends! ✌️✌️ 
How are you today?! ', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'2021-10-28 15:33:35.9576124', N'2021-10-28 15:34:57.2864365', NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'13', N'Gì cũng có lần đầu 🤣🤣', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'2021-10-28 15:37:29.7054210', NULL, NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'14', N'Welcome to TeeApp! An awesome social networking website 🥳✌️', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'2021-10-28 15:38:09.0024763', N'2021-10-29 08:58:42.6724395', NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'15', N'ewew', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'2021-10-29 01:42:49.0391949', NULL, N'2021-10-29 01:43:18.2681253')
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'16', N'aaaaaaaaaa', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'2021-10-29 01:43:46.7457017', NULL, N'2021-10-29 02:01:26.8755164')
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'17', N'3232', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'2021-10-29 02:01:29.0673214', NULL, N'2021-10-29 02:02:27.1193597')
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'18', N'12111111', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'2021-10-29 02:02:32.1457800', NULL, N'2021-10-29 02:06:43.0458480')
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'19', N'2323', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'2021-10-29 02:06:51.1947303', NULL, N'2021-10-29 02:06:59.8371933')
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'20', N'🤩', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'0', N'2021-10-29 10:20:48.9654622', NULL, N'2021-10-29 10:22:51.3475594')
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'21', N'', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'1', N'2021-10-29 12:56:20.2654293', NULL, NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'22', N'Happy birthday to me! ❤️❤️', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'0', N'2021-10-29 17:53:14.1259108', NULL, NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'23', N'안녕하세요 !!', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'0', N'2021-10-29 17:57:53.8165126', NULL, NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'24', N'Chào mọi người!!!!!!!!!!', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'0', N'2021-10-29 17:58:19.1143101', NULL, NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'25', N'❤️❤️', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'0', N'2021-10-29 18:05:29.8415864', NULL, NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'26', N'Đăng thử một bài xem nào', N'1e701476-d570-45d0-a0c6-948425401075', N'0', N'2021-10-29 18:09:25.1220688', NULL, NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'27', N'Test post 😆😆', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'0', N'2021-10-29 18:13:46.3892355', NULL, NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'28', N'Con bé bán bông', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'0', N'2021-10-29 18:27:41.1633713', NULL, NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'29', N'Ai đây 😆😆', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'0', N'2021-10-29 18:28:11.3918804', N'2021-10-29 18:28:25.3485237', NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'30', N'🥰🥰', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'0', N'2021-10-29 18:29:32.0719290', NULL, NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'31', N'Hello!!!!', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'0', N'2021-10-29 19:21:59.3114227', NULL, NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'32', N'Thể dục buổi sáng nào 👯‍♀️👯‍♀️', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'0', N'2021-10-29 21:16:29.0277982', NULL, NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'33', N'', N'1e701476-d570-45d0-a0c6-948425401075', N'0', N'2021-10-30 22:22:26.5019478', NULL, N'2021-10-30 22:22:34.6979234')
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'34', N'Hello world!', N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'0', N'2021-10-31 16:32:28.1932047', NULL, NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'35', N'Helu,,,
👀 Nhìn vào ảnh thui nào
👏 Tèn ten có tận 13 con người xinh đẹp đang nhìn nhau ^-^', N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'0', N'2021-10-31 16:33:50.6278818', N'2021-10-31 16:36:00.8641299', NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'36', N'Hello Tee 😎😎', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'0', N'2021-11-03 17:27:27.4947654', NULL, NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'37', N'App này nhìn dễ thương dữ ạ admin kkk
', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'0', N'2021-11-03 18:40:31.3935527', NULL, NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'38', N'Cảm ơn mọi người rất nhiều vì đã dùng thử và cho mình nhận xét nhaaa 😘😘', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'2021-11-03 20:38:13.4259555', N'2021-11-04 05:45:26.7531133', NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'39', N'Web chất lượng 
Web xuất sắc
Web 10 điểm', N'40999a33-44af-457e-921d-f74cae8eeb06', N'0', N'2021-11-03 20:59:04.3580067', NULL, NULL)
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'40', N'Hshshs', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'0', N'2021-11-03 23:24:34.8131300', NULL, N'2021-11-03 23:24:48.6132930')
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'41', N'Kgog', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'2021-11-03 23:27:35.5743873', N'2021-11-03 23:28:06.2083627', N'2021-11-03 23:28:27.7599606')
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'42', N'Hsjsjsbaj', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'2021-11-03 23:29:44.4728804', NULL, N'2021-11-03 23:30:24.2710685')
GO

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'43', N'Cảm ơn tất cả mọi người rất nhiều vì đã dùng thử và cho mình nhận xét nhaaa 😘😘
', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'2021-11-03 23:38:01.8773021', N'2021-11-04 05:44:26.7773303', NULL)
GO

SET IDENTITY_INSERT [dbo].[Posts] OFF
GO


-- ----------------------------
-- Table structure for Reactions
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Reactions]') AND type IN ('U'))
	DROP TABLE [dbo].[Reactions]
GO

CREATE TABLE [dbo].[Reactions] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Type] int  NOT NULL,
  [CreatorId] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PostId] int  NULL,
  [DateCreated] datetime2(7)  NOT NULL,
  [DateModified] datetime2(7)  NULL,
  [DateDeleted] datetime2(7)  NULL
)
GO


-- ----------------------------
-- Records of Reactions
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Reactions] ON
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'1', N'4', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'2021-10-28 12:51:35.6734400', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'2', N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', N'2021-10-28 13:05:39.4465230', N'2021-10-28 13:05:42.0363540', NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'3', N'4', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'4', N'2021-10-28 13:17:08.7031516', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'4', N'2', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'3', N'2021-10-28 13:17:11.2723289', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'5', N'0', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'4', N'2021-10-28 13:20:07.0713861', N'2021-10-28 13:20:08.1177978', NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'6', N'4', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'3', N'2021-10-28 13:20:10.0008008', N'2021-10-28 13:20:15.9516626', NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'7', N'2', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'2', N'2021-10-28 13:20:12.8798847', N'2021-10-28 13:20:14.0142862', NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'8', N'0', N'aed79f8f-a1e6-43b6-b369-151085d6b8d0', N'6', N'2021-10-28 14:13:02.7909698', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'9', N'4', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'5', N'2021-10-28 14:13:34.0415151', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'10', N'4', N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'6', N'2021-10-28 14:14:22.8676750', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'11', N'5', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'6', N'2021-10-28 14:18:56.6133487', N'2021-10-28 14:19:00.9226933', NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'12', N'4', N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'7', N'2021-10-28 14:20:50.5542751', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'13', N'4', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'7', N'2021-10-28 14:21:08.3233158', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'14', N'4', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'4', N'2021-10-28 14:21:11.7373060', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'16', N'0', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'7', N'2021-10-28 14:24:07.3792540', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'17', N'4', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'8', N'2021-10-28 15:19:08.4962680', N'2021-10-28 15:19:10.8450693', NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'18', N'4', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'9', N'2021-10-28 15:24:28.9579687', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'19', N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'10', N'2021-10-28 15:28:06.7436660', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'20', N'4', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'12', N'2021-10-28 15:35:00.1372427', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'23', N'3', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'14', N'2021-10-28 16:09:29.5466416', N'2021-10-30 01:01:48.3177614', NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'24', N'2', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'11', N'2021-10-29 01:23:03.8659768', N'2021-10-29 01:23:05.3518569', NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'25', N'2', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'15', N'2021-10-29 01:43:11.8684599', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'26', N'0', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'18', N'2021-10-29 02:02:38.7705208', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'27', N'0', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'20', N'2021-10-29 10:20:56.1044230', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'28', N'5', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'21', N'2021-10-29 12:56:28.0689215', N'2021-10-29 12:56:32.1223746', NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'29', N'4', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'13', N'2021-10-29 15:47:14.5278104', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'30', N'4', N'1e701476-d570-45d0-a0c6-948425401075', N'14', N'2021-10-29 16:58:11.4310116', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'31', N'0', N'1e701476-d570-45d0-a0c6-948425401075', N'13', N'2021-10-29 17:31:50.0981789', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'32', N'0', N'1e701476-d570-45d0-a0c6-948425401075', N'12', N'2021-10-29 17:31:51.8555471', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'33', N'3', N'1e701476-d570-45d0-a0c6-948425401075', N'11', N'2021-10-29 17:31:54.2635235', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'34', N'2', N'1e701476-d570-45d0-a0c6-948425401075', N'10', N'2021-10-29 17:31:57.1549328', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'35', N'0', N'1e701476-d570-45d0-a0c6-948425401075', N'9', N'2021-10-29 17:31:59.6851561', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'36', N'0', N'1e701476-d570-45d0-a0c6-948425401075', N'2', N'2021-10-29 17:32:10.5293274', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'37', N'1', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'22', N'2021-10-29 17:53:27.7361567', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'38', N'1', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'23', N'2021-10-29 17:57:58.0955760', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'39', N'4', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'24', N'2021-10-29 17:58:20.9692440', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'40', N'4', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'22', N'2021-10-29 17:59:11.9067989', N'2021-10-29 17:59:13.5544343', NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'41', N'1', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'14', N'2021-10-29 17:59:38.1545402', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'42', N'2', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'13', N'2021-10-29 17:59:40.3173845', N'2021-10-29 17:59:41.9719304', NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'43', N'3', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'12', N'2021-10-29 17:59:46.6129127', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'44', N'4', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'11', N'2021-10-29 17:59:48.8426002', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'45', N'4', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'10', N'2021-10-29 17:59:52.2832801', N'2021-10-29 17:59:53.4860083', NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'46', N'2', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'9', N'2021-10-29 17:59:56.2960919', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'47', N'2', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'8', N'2021-10-29 17:59:58.1733883', N'2021-10-29 17:59:59.4551613', NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'48', N'1', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'4', N'2021-10-29 18:00:01.0175709', N'2021-10-29 18:00:01.9426424', NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'49', N'3', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'3', N'2021-10-29 18:00:04.1684684', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'50', N'0', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'2', N'2021-10-29 18:00:06.9327143', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'51', N'4', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'14', N'2021-10-29 18:00:56.2844707', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'52', N'1', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'13', N'2021-10-29 18:00:58.6124702', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'53', N'1', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'12', N'2021-10-29 18:01:00.8766084', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'54', N'1', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'11', N'2021-10-29 18:01:02.3920990', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'55', N'1', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'10', N'2021-10-29 18:01:03.7808960', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'56', N'1', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'9', N'2021-10-29 18:01:05.8920649', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'57', N'1', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'8', N'2021-10-29 18:01:07.5801936', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'58', N'1', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'4', N'2021-10-29 18:01:09.6601054', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'59', N'1', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'3', N'2021-10-29 18:01:11.3201934', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'60', N'1', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'2', N'2021-10-29 18:01:12.8822375', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'61', N'1', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'25', N'2021-10-29 18:05:32.3763810', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'62', N'1', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'14', N'2021-10-29 18:05:40.3496865', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'63', N'1', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'13', N'2021-10-29 18:05:41.5802997', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'64', N'1', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'12', N'2021-10-29 18:05:42.7628436', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'65', N'1', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'11', N'2021-10-29 18:05:44.0495374', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'66', N'1', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'10', N'2021-10-29 18:05:45.3516840', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'67', N'1', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'9', N'2021-10-29 18:05:47.1923358', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'68', N'2', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'8', N'2021-10-29 18:05:50.5488348', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'69', N'0', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'4', N'2021-10-29 18:05:52.2695707', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'70', N'0', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'3', N'2021-10-29 18:05:53.8011533', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'71', N'0', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'2', N'2021-10-29 18:05:56.4164808', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'72', N'1', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'24', N'2021-10-29 18:06:09.3002211', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'73', N'0', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'23', N'2021-10-29 18:06:11.5527612', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'74', N'4', N'1e701476-d570-45d0-a0c6-948425401075', N'26', N'2021-10-29 18:09:27.1123633', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'75', N'4', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'27', N'2021-10-29 18:13:54.0153775', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'76', N'0', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'27', N'2021-10-29 18:14:16.2796916', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'77', N'3', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'27', N'2021-10-29 18:14:47.9845484', N'2021-10-29 18:14:50.9950113', NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'78', N'2', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'22', N'2021-10-29 18:14:54.5954809', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'79', N'2', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'24', N'2021-10-29 18:15:47.2948986', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'80', N'1', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'23', N'2021-10-29 18:15:49.2497006', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'81', N'4', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'27', N'2021-10-29 18:17:28.9611579', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'82', N'4', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'28', N'2021-10-29 18:27:45.6927222', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'83', N'1', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'30', N'2021-10-29 18:29:35.3653754', N'2021-10-29 18:29:39.1064315', NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'84', N'4', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'29', N'2021-10-29 18:29:37.3655286', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'85', N'2', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'30', N'2021-10-29 18:32:42.3999486', N'2021-10-29 18:35:57.1496100', NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'86', N'4', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'29', N'2021-10-29 18:36:00.9869202', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'87', N'4', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'28', N'2021-10-29 18:36:02.5027711', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'88', N'4', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'31', N'2021-10-29 19:22:03.3688446', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'89', N'1', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'31', N'2021-10-29 19:24:33.8916423', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'90', N'0', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'31', N'2021-10-29 19:29:05.2598147', N'2021-11-03 23:23:17.9515491', NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'92', N'0', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'14', N'2021-10-29 19:31:22.5528168', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'93', N'4', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'31', N'2021-10-29 19:31:35.1150540', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'95', N'2', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'27', N'2021-10-29 19:31:53.2893518', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'96', N'1', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'31', N'2021-10-29 19:32:08.4843936', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'97', N'1', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'31', N'2021-10-29 19:33:16.3699987', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'98', N'1', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'32', N'2021-10-29 21:16:33.6515290', N'2021-10-29 21:16:40.3995608', NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'99', N'1', N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'12', N'2021-10-31 16:15:50.1587136', N'2021-10-31 16:15:56.2985009', NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'100', N'1', N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'14', N'2021-10-31 16:19:55.1589891', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'103', N'4', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'35', N'2021-10-31 16:35:04.6660945', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'104', N'4', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'34', N'2021-10-31 16:35:07.7929024', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'106', N'4', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'4', N'2021-11-03 17:25:25.2945835', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'107', N'4', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'36', N'2021-11-03 17:30:38.9079825', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'108', N'0', N'30855389-4934-4350-b69a-2a35bb66a946', N'14', N'2021-11-03 17:38:55.0963318', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'109', N'2', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'36', N'2021-11-03 18:01:40.7813728', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'110', N'2', N'21344cf9-faf5-4201-8eb2-dd8eed4281c2', N'14', N'2021-11-03 18:16:27.0973309', N'2021-11-03 18:16:32.6905373', NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'111', N'1', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'32', N'2021-11-03 18:26:46.4373189', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'112', N'4', N'49846e9e-7f13-4831-87aa-81bbf412cd18', N'14', N'2021-11-03 18:31:34.3033846', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'113', N'1', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'37', N'2021-11-03 18:40:33.8472610', N'2021-11-03 18:41:35.6000338', NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'114', N'0', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'10', N'2021-11-03 18:41:01.4989649', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'115', N'4', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'37', N'2021-11-03 18:42:18.2387039', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'116', N'0', N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'23', N'2021-11-03 18:44:19.9813819', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'117', N'4', N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'14', N'2021-11-03 18:47:38.7281214', N'2021-11-03 18:51:09.7880561', NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'118', N'2', N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'37', N'2021-11-03 18:57:28.1104008', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'119', N'4', N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'37', N'2021-11-03 18:58:04.4261942', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'120', N'4', N'fa669a9b-d9cd-4b7a-844d-51bb5d3fb7d3', N'14', N'2021-11-03 19:06:51.9038032', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'121', N'1', N'907b94d0-1090-4389-a42c-a74c39cf365c', N'13', N'2021-11-03 19:20:04.0601779', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'122', N'0', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'25', N'2021-11-03 19:36:36.4825752', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'123', N'0', N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'22', N'2021-11-03 19:36:39.3885881', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'124', N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'38', N'2021-11-03 20:38:55.8587279', N'2021-11-04 05:44:52.5631374', NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'125', N'4', N'c473bda2-7dec-4e97-a857-9111f63106cf', N'38', N'2021-11-03 20:54:38.1600665', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'126', N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'39', N'2021-11-03 21:08:21.9094411', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'130', N'0', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'24', N'2021-11-03 23:24:12.8328843', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'131', N'1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'40', N'2021-11-03 23:24:43.4322928', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'132', N'2', N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'14', N'2021-11-03 23:27:23.4754469', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'134', N'0', N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'41', N'2021-11-03 23:28:16.5954130', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'136', N'4', N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'42', N'2021-11-03 23:30:10.8494847', N'2021-11-03 23:30:15.6754118', NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'137', N'3', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'42', N'2021-11-03 23:30:20.1794059', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'138', N'4', N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'13', N'2021-11-03 23:34:35.6046674', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'139', N'1', N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'35', N'2021-11-03 23:35:15.0307928', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'140', N'2', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'43', N'2021-11-03 23:38:06.2680508', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'141', N'4', N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'43', N'2021-11-03 23:39:14.5497512', NULL, NULL)
GO

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'142', N'0', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'43', N'2021-11-04 05:45:11.5960431', NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[Reactions] OFF
GO


-- ----------------------------
-- Table structure for Users
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type IN ('U'))
	DROP TABLE [dbo].[Users]
GO

CREATE TABLE [dbo].[Users] (
  [Id] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [FirstName] nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [LastName] nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [AvatarFileName] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [DateCreated] datetime2(7)  NOT NULL,
  [UserName] nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [NormalizedUserName] nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Email] nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [NormalizedEmail] nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [EmailConfirmed] bit  NOT NULL,
  [PasswordHash] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [SecurityStamp] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ConcurrencyStamp] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PhoneNumber] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PhoneNumberConfirmed] bit  NOT NULL,
  [TwoFactorEnabled] bit  NOT NULL,
  [LockoutEnd] datetimeoffset(7)  NULL,
  [LockoutEnabled] bit  NOT NULL,
  [AccessFailedCount] int  NOT NULL,
  [AboutMe] nvarchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [DateOfBirth] datetime2(7) DEFAULT ('0001-01-01T00:00:00.0000000') NOT NULL,
  [Gender] int DEFAULT ((0)) NOT NULL,
  [CoverFileName] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [NickName] nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO


-- ----------------------------
-- Records of Users
-- ----------------------------
INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'Ái', N'Bùi Diệu', N'f6a13291-d7e6-41b6-95c4-ca63fc262673.jpg', N'2021-10-29 17:54:29.2048672', N'buidieuai', N'BUIDIEUAI', N'buidieuai@gmail.com', N'BUIDIEUAI@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEOOwgrDGHhPsQs26XcCDJH+HDnsch9TPIJAkEO+NIu0gAeMsq03K2rCDAP+exQAMPg==', N'HFXY3JYZF2NRWNFPKMHVUY2JC2KCODMX', N'3fcd0dd3-3a17-4e09-9f4a-dd9def43f053', N'', N'0', N'0', NULL, N'1', N'0', N'Chào mừng bạn đã đến với sự dễ thương của mình!!!', N'2003-01-10 00:00:00.0000000', N'1', N'aadd6779-0b97-421f-927a-f4189f857fa5.jpg', N'Cute')
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'1bd1456a-42f8-4932-9016-63f7c209966a', N'Khánh', N'Nguyễn', N'5b915639-707c-4426-a32c-c7548b04d2e6.jpg', N'2021-10-28 14:11:53.1535302', N'BaoKhanh', N'BAOKHANH', N'khanh@gmail.com', N'KHANH@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEH3Vxt6mlUjyN2X58ogQCDAz45VfUXhUHLUsEaOFDysSyKw1GfknvuKtpx7QVyh52w==', N'UVHODLNZBVOIWMKONPKXTXOMSHLFHU6S', N'b222ca03-75cc-4265-a936-c8e8fbc27ebc', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2000-12-03 00:00:00.0000000', N'0', N'8b4b998d-772b-442c-acb5-aff515a73690.jpg', NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'Nghi', N'Nguyễn Vĩnh', N'4a7f775f-db1f-4e5b-ad42-362af1bb9d37.jpg', N'2021-10-29 16:57:57.0253331', N'testuser', N'TESTUSER', N'nghinv@gmail.com', N'NGHINV@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEEDtpr3GQE2ojyLH8mqHqqHRnuNmq1KndLnvRtu2WMOY+qDhhkjKU0f0mZZH9689kQ==', N'PPMZZ4JJ52DSYP45F7K45XW3ESFYCSTW', N'2913c25d-3d96-4be4-968a-13535ed44217', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2000-11-11 00:00:00.0000000', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'21344cf9-faf5-4201-8eb2-dd8eed4281c2', N'Tô', N'Lê Hoài', N'ff5c2bab-5b5f-462e-8c8f-cbb177d51edd.jpeg', N'2021-11-03 18:12:51.4696572', N'tolehoai', N'TOLEHOAI', N'tolehoai@gmail.com', N'TOLEHOAI@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAECaM7kHzhZe1xT91KP9dL2amXYTG03BQanAKtaQHkGhrmTTiOVqjoqaAI0J9SLwk5Q==', N'5WBZB2KVGMBWUY63DWBP4CLYADVAROCK', N'444898c3-4a44-45a2-b293-ec229f88f320', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2000-03-04 00:00:00.0000000', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'Quỳnh', N'Phạm Phương', N'edd78ec1-13ff-4e2d-b988-b2f67a3cb0c4.jpg', N'2021-10-29 21:06:58.2930394', N'quynhpham', N'QUYNHPHAM', N'quynhpham@gmail.com', N'QUYNHPHAM@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAENKqB0bQ9L4W2XXvitpodV/4+ZgeZVSdFB64ZYnfQii+3GVPHw9DDDlR4Uho3bPDyA==', N'GDJW7P4NELK5RNPPQSKF3YN5OZM3YGLN', N'3b8af6a8-f8bd-4551-9b25-fd292e3acc87', N'', N'0', N'0', NULL, N'1', N'0', N'Kiếm tui có gì hong 😉', N'1999-05-25 00:00:00.0000000', N'1', N'f733f6b3-ec70-4e8c-bb7f-e8288a51da6b.jpg', N'Quyn')
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'30855389-4934-4350-b69a-2a35bb66a946', N'Minh', N'Hoang', NULL, N'2021-11-03 17:37:57.2446429', N'hoangminh', N'HOANGMINH', N'hoangnguyengocvl@gmail.com', N'HOANGNGUYENGOCVL@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEDjwQteMNMvayM8uLEhq/FVWYniZP6CGCR1kJt7ud7rqq6OZlYPGUV+0l/96jrAOyw==', N'FTEXK676MQ6G3E4HSGGP432HUU7DFA2F', N'87af1e54-8645-4634-ba69-a7c7f24869d4', N'0376799236', N'0', N'0', NULL, N'1', N'0', N'', N'2000-05-13 00:00:00.0000000', N'0', NULL, N'')
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'31b027d2-a070-4c05-b10b-21743fd8b418', N'Hậu', N'Phước', NULL, N'2021-11-03 19:18:53.1306578', N'phuochauit', N'PHUOCHAUIT', N'phuochau.it@gmail.com', N'PHUOCHAU.IT@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEIsw7VGz+Yo292tcdxd5YFFd9vutRhGppImoI/f6Xxq1DrhEiVDc5jhnsn0yvg+kPg==', N'534RNYGSRDKD2DTY77EZ6CGCA4LU2YSI', N'baa49aba-be2f-4d41-9a19-b8dd3b695cdc', N'', N'0', N'0', NULL, N'1', N'0', N'Cậu bé xinh trai nhất trên đời', N'2000-07-29 00:00:00.0000000', N'0', NULL, N'')
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'40999a33-44af-457e-921d-f74cae8eeb06', N'Lê', N'Long', N'7515f81b-0386-4540-b8a3-0c059df30b8f.jpg', N'2021-11-03 20:55:36.3084823', N'Lole2k', N'LOLE2K', N'hailong3372009@gmail.com', N'HAILONG3372009@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAELHzYOLq7u/AZhD2/QK8fDTUnlYyjSsDGaFklVjYmPx4HRVFbZJCVL2cfqSNyS63HA==', N'YW7ZFPXUW6V7A6ZUKJXY4PMZD4UBVEAW', N'0df9767c-04bb-4568-a2a3-fc4ea73290f4', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2000-05-25 00:00:00.0000000', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'41e85443-ee34-4cbf-914a-e7ba04cdbf4d', N'Guest 3', N'User', NULL, N'2021-11-03 17:39:59.9475886', N'guestuser3', N'GUESTUSER3', N'guest@gmail.com', N'GUEST@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAECsxWnBvqNyIWTLC74U8XlwWvik9+sKTqZG4TINRjJCitsBEz6bZFbgaBDeb59lUrw==', N'TBLM4ZHCBKV3HQIZVXS2GOUVVCMKTUN6', N'4b4bb523-1385-4688-80ee-5c65941fa622', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2000-01-01 00:00:00.0000000', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'49846e9e-7f13-4831-87aa-81bbf412cd18', N'Trần', N'Vũ Bình', NULL, N'2021-11-03 18:31:11.0009763', N'BinhdeptrainhatDHCT', N'BINHDEPTRAINHATDHCT', N'tranb4010@gmail.com', N'TRANB4010@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAENvKZb8lMVWj00bd6tkFEWxU3c38Zpoh9YqAAUlIC9CefARAPnxoTlzHe71h61We4g==', N'NCIDKDFYSHJ56VQZUGEATTXDSAJ4VB66', N'e0522640-77c3-4233-a517-9de876b6f400', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2003-07-13 00:00:00.0000000', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'535fbe62-7546-4dd5-a1a8-ed5e2e70c058', N'Nguyễn', N'Huy', NULL, N'2021-11-03 18:10:19.7759732', N'nguyenhuy2003', N'NGUYENHUY2003', N'nlhuy2003@gmail.com', N'NLHUY2003@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEONDTvkik+nfeywKYLz/PHvRpRdHjYGfZMAQHYwVBXzTOqHywVtwS6SDwFb2B2xm+g==', N'7ZIZ57PEGGBMRQ7YBH3W44Q5MY3QFXAQ', N'603c9ce1-c8b9-4220-8381-72af0ca2de34', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2003-01-16 00:00:00.0000000', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'57ab2a13-5adb-48c6-85cc-3b6d06a6c9d0', N'Huệ', N'Huỳnh Như', N'de290a11-99dc-48d8-aead-b0605598c396.jpg', N'2021-11-03 17:51:44.9185511', N'huynhnhuhue', N'HUYNHNHUHUE', N'huynhnhuhue12345@gmail.com', N'HUYNHNHUHUE12345@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEDSUqkDlADYoT31+uoJbAIdatcK6H5og9iIhAu0qoWCqJZS2M5gsNLr3Wv2U9DE/yQ==', N'W5HK3PEEBBG2WWKSM7HKEFKMIOCWXLSD', N'a8c75527-97e9-442d-acbd-7a5e159489f1', N'0825465612', N'0', N'0', NULL, N'1', N'0', N'', N'2003-03-06 00:00:00.0000000', N'1', N'2935b16f-0e3c-4ad4-a804-169e50fa9f5b.jpg', N'')
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'5a48f894-ca56-484b-8f9a-6d21b5868b97', N'Tín', N'Nguyễn Thanh', NULL, N'2021-11-03 17:44:33.0715603', N'minhtran2468', N'MINHTRAN2468', N'minhtran24681@gmail.com', N'MINHTRAN24681@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEJkp0zMrlkxB3/w85RlkaOIWr2Y55DGyWX1VadIe6hgaLJ1h2X1MDKE4tD4yJiFi7A==', N'RID37W5OTR2OGLDAX2L5SESAZY6SXMJR', N'84796fad-d384-475c-8b86-901f38d9991e', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2001-09-04 00:00:00.0000000', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'62e18ec4-5fc6-4214-83aa-d1486efa4729', N'T', N'T', NULL, N'2021-10-29 10:30:24.9283926', N'UserName', N'USERNAME', N'b@gmail.com', N'B@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEBI/y8he37IFl8e6ONo8gG5Ykm0LSCOWBvct80D5MhP+vnqo7B2bcvSLnejNH0Suhw==', N'7FBEZVAQ24CW6OCUTBVOZNZM5IOVPQVE', N'2b4debc9-03f9-42a3-ba51-081dc4f67de2', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2000-10-16 00:00:00.0000000', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'6705eedb-12d3-403d-acf5-e164c0d4b625', N'Cute', N'Girl', NULL, N'2021-11-03 17:44:27.2555713', N'cutegirl', N'CUTEGIRL', N'hongchau2000st@gmail.com', N'HONGCHAU2000ST@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAED2ppiR3Pxh+Lag9PSvitUh3S2H9QU8xTT7RYUSBlnGVzOkgzKrTA739LYhMxYuZvg==', N'BZO5T7RCXTUEHEVEROTKNOBXFW2DVLZR', N'3c40a4be-3750-4577-9ea7-46a3ff791fe9', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2000-10-17 00:00:00.0000000', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'Phương', N'Trần Mỹ', N'f860f83b-f1f5-45ad-9b3a-e287f7ab776c.jpg', N'2021-10-29 18:03:16.7866740', N'phuongtran', N'PHUONGTRAN', N'phuongtran@gmail.com', N'PHUONGTRAN@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEHvBHSB7aB7aUrNtp4dci1t1dlQYpQmTLl4ftJ5GF5rZI+OJXLGoKnswIoUQqp75mg==', N'HLLLUGKLY23YUVKDEARZSJTXLZNWVTPQ', N'4a2ed68a-d187-4adf-bc98-c2fee926480c', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2002-12-11 00:00:00.0000000', N'1', N'8f0bd67d-1508-49b4-88b1-955e0292b03b.jpg', NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'79dcfd64-e286-4f8b-9f6f-6454b0e3f9ba', N'Gia', N'Nhi', NULL, N'2021-11-03 19:01:00.7157606', N'GiaNhi', N'GIANHI', N'Legiao0568@gmail.com', N'LEGIAO0568@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEAs/jcNmFv1J7tPJ2JqWkjpTQ+0CyMfN6FQ6sjYcOMf3eZzcS3Cbi7beJ3kv7XBQOA==', N'D5NEHH3Z3S3RSUIMMYJUGWU24LO7J5AU', N'ae107f03-9c8b-49c4-a416-d0e5fe859a6f', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2000-11-05 00:00:00.0000000', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'Lam', N'Nguyen', N'04f366df-37ad-4b1c-96a4-9cd86e277a00.jpeg', N'2021-10-28 14:11:28.7687463', N'tunglamnguyen', N'TUNGLAMNGUYEN', N'tunglamvl0603@gmail.com', N'TUNGLAMVL0603@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEFTwPuPpJLQ5IPL9QskBK2/28jv1baw3crXo5GFOM0LPbf7mRB7+cFvmipFghej9mw==', N'K3SMZNY3SW44OIMAB3NTNZHXI6HONETM', N'51f45e0b-38f9-417d-b1cc-18b8e1f8aaa6', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2000-06-03 00:00:00.0000000', N'0', N'82d910e4-9baa-46dc-9fcc-56f3aca4db24.png', NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'88fa2305-54f7-409b-9b46-a826f1e9e1d4', N'Hầu', N'Diễm Xuân', NULL, N'2021-10-28 14:16:24.3735825', N'haudiemxuan', N'HAUDIEMXUAN', N'xuan@gmail.com', N'XUAN@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEEQ4l1TrZxqG2bo72JjcWL0xchAVtGIO3muN8ITlgyWtLCjMEKYpiykY4CU1Yw88dg==', N'YKHY44JJDWYHOOUT7CFKUZA4C75OY5HJ', N'c4f16ca4-1dbb-4b1f-be04-cbfbbbfc0353', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2021-10-10 00:00:00.0000000', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'Mikami', N'Yua', NULL, N'2021-10-29 10:19:50.1262158', N'mikami', N'MIKAMI', N'mikami@gmail.com', N'MIKAMI@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAENZJmBeno3TOmSvTts+DAMfrzxjwEqg9DUdukP7sPpVm5E0AMxusVjwCIqU99U23Eg==', N'FEV4MXDABFHZIG5YWSHFFTWJLY2AU3EU', N'618e825e-142d-4749-a3d7-c70fc1ab8796', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'1993-08-16 00:00:00.0000000', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'8f55ebc3-c9fd-47b1-ba0e-a13803433815', N'Hà', N'Mỹ', NULL, N'2021-11-03 20:13:15.3817772', N'myhanct', N'MYHANCT', N'myhanct@gmail.com', N'MYHANCT@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEJXRUQJYVtEr7HjMnC4H/r+IduM/zagZoGdSFBTDaZejeM+fNOUNc+KIkMfIRFnakQ==', N'6C4AXMTSE7PHQRFHOPYOMYIY7EDGV4NT', N'4d1ae18d-32fe-411d-9005-459cb12c5a28', N'', N'0', N'0', NULL, N'1', N'0', N'', N'2000-10-25 00:00:00.0000000', N'1', NULL, N'')
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'907b94d0-1090-4389-a42c-a74c39cf365c', N'Phát', N'Nguyễn', NULL, N'2021-11-03 19:19:08.4677055', N'phatnguyen011000', N'PHATNGUYEN011000', N'huyphat035@gmail.con', N'HUYPHAT035@GMAIL.CON', N'0', N'AQAAAAEAACcQAAAAEHes80hNm3sDqo9S41GFNbHQR+hAObPguGI7F4JndmhHQ5X7XrDC8K3I7m1n6K0xjg==', N'DCD33RZOKDVRC3X6ENRNQTOICT6WGALY', N'33dc1ed2-7b7e-4a83-8400-fbb91edb0b61', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2000-10-01 00:00:00.0000000', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'Trung', N'Phạm Chí', N'03800fff-833f-4dfa-ae43-34ac6cd92116.jpeg', N'2021-10-28 13:37:03.2617721', N'pctrung', N'PCTRUNG', N'phamchitrung.work@gmail.com', N'PHAMCHITRUNG.WORK@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEKculUxVSESvjfGJcwk256EsqEpQtilmE9RgegtHqyHVjopgNhE0K9Ydkd++N+7wKA==', N'WZ647E5BXQGUKG6FDN37KHPQZUQUGKLW', N'21c76ca7-fdec-46cf-815f-fb3b551188f9', N'0369863655', N'0', N'0', NULL, N'1', N'0', N'Hello everyone! My name is Trung and I''m the most handsome developer in the universe. Contact for work: phamchitrung.work@gmail.com', N'2000-02-11 00:00:00.0000000', N'0', N'4ed466eb-24d4-412b-8157-089376dbb0d3.jpeg', N'Trung Xì')
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'a3c356cb-1d66-4307-9ffd-ac8528ccf61d', N'Linh', N'Ha', NULL, N'2021-11-03 18:18:55.7033289', N'LinhfishCR7', N'LINHFISHCR7', N'linhfish10c1@gmail.com', N'LINHFISH10C1@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEK6akIwYkLoQdwRgeaN1Pt4shB7fZRzfqEc6UVr57MFrNMbwknGeN30mi4xmyAuQXA==', N'4KWSURPIWJJOOGU3T2BZWQ6VWW64LLNG', N'60160057-19c1-449f-84a2-29dea4b55695', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2000-03-17 00:00:00.0000000', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'Vi', N'Lê Ngọc', N'ff291718-798c-47a1-81c2-ef868ff9a3d3.jpg', N'2021-10-29 17:48:49.4516815', N'testuser2', N'TESTUSER2', N'lnvi@gmail.com', N'LNVI@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEAAAwnNYFwOidPKCNfgSWfo0WmI9VRIdCdMIDJ9PWNNPWQTRlvqx0tMg+lyXs7Bkug==', N'677CR6T4W4O7277K6SMXDJAPXJ4X5TRA', N'e1e9052e-bd73-48ec-b62e-c7ede6ec4610', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2001-10-20 00:00:00.0000000', N'1', N'45d15e91-6be8-4e4f-a6b9-107b3198a765.jpg', NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'aed79f8f-a1e6-43b6-b369-151085d6b8d0', N'Huy', N'Lam', NULL, N'2021-10-28 14:12:17.9765609', N'lamnhuthuy', N'LAMNHUTHUY', N'huy@gmail.com', N'HUY@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEC4W8ok4NtqLX7oNO1G8uWc7/h0BXY/cboyAbC6rL5h9xbX11Ywf77wGzTRFUp6AHg==', N'TID7JWUCTTFTG4WG2LHCZYFBAJUZI2P4', N'994f1169-a706-40b9-856b-80ca8d4e5c6c', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2021-10-28 00:00:00.0000000', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'Thong', N'Nguyen', N'feccd621-7b37-40db-b71f-6d8143c916a5.jpg', N'2021-10-28 14:11:01.0200681', N'hoangthong', N'HOANGTHONG', N'thong0104@gmail.com', N'THONG0104@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEBdyUK/O7pot8/v2bGC97dWemXn9AC6YMT9XrX2OC1AiMX44/Zxls1ApilZDw6Ne8A==', N'I6BWUSILMAPXRQZFBNKTDQSII2AVFKFX', N'c71cc382-908d-4d67-a751-bff463cb895b', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2000-04-01 00:00:00.0000000', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'c43ccaba-83c7-42f3-a83f-fb973dcedadb', N'Dương', N'Như', N'bfd0bb3c-0206-4002-8c29-ed16cb014e4e.jpg', N'2021-10-31 16:06:41.4065258', N'Duongnhu', N'DUONGNHU', N'duongthihuynhnhu912017@gmail.com', N'DUONGTHIHUYNHNHU912017@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEPKP1tg4iXaNKRrO5Xp4VZXK3ITubFriVO3/fU6ySs4WBsSXTQPO0Hboz0izd+ZrpA==', N'JPR6CBOJSC2GHQSY3VXA3JI2BEAJLP2N', N'772edc04-704c-43d5-a4bb-a27025c58855', N'', N'0', N'0', NULL, N'1', N'0', N'', N'2003-07-10 00:00:00.0000000', N'1', N'079b4143-2d82-4b94-9e6b-e32e369245e7.jpg', N'Rùa')
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'c473bda2-7dec-4e97-a857-9111f63106cf', N'Phat', N'Nham', N'8888399a-6d48-4ebf-8a3e-a0088328e935.jpg', N'2021-11-03 17:21:27.4573425', N'nhamtphat', N'NHAMTPHAT', N'phattannham@gmail.com', N'PHATTANNHAM@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEGpVT+6tPxZi9HhMDv4KrIQ6JfqJP0v2qw4mQu/F7W2kbYHYZK0qrlo9leGuIe/qYw==', N'BRJD4R7OWHKZFRLMIFFBIPDNBKAC7SXB', N'fd49a606-0aef-486d-a917-7e4000f71b5d', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'1999-06-04 00:00:00.0000000', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'c7ae53fe-314d-48ba-8148-c747fe21a26a', N'Phúc', N'Nguyễn', N'3c9080ac-49f7-49b3-b070-860d3af20e83.jpeg', N'2021-11-03 23:27:08.5270490', N'phucnguyen', N'PHUCNGUYEN', N'phucnguyen@gmail.com', N'PHUCNGUYEN@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEM9sRnYmKOFVpY7FSCQuL/vw5uDgr6TkrZZewMKE0ptM7wTaPe10Jjnq9QAxF3p2qQ==', N'NFHTWSLBXZ344K6RBZQBJGIVN5WYQQVY', N'1e8080e0-7b7d-45e2-a3a9-73c4c0096a79', N'', N'0', N'0', NULL, N'1', N'0', N'Anh chàng đẹp trai', N'2000-11-03 00:00:00.0000000', N'0', N'1c8955ed-6375-41c8-8937-9604bd2fe9cd.jpeg', N'')
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'Admin', N'I am', N'39a81157-9cd7-42c5-a983-ff3893904c30.jpg', N'2021-10-28 12:11:00.3394184', N'teeadmin', N'TEEADMIN', N'phamchitrung.work@gmail.com', N'PHAMCHITRUNG.WORK@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAELG2uJ/Ul6NNAYAucqabSOiRVzcTjzpiEmM89kyQ4IN97lVUVjf7TnkuXM97dKpmRg==', N'ME2NYHXBWXU6GL4Y6Y7ET2Z3NG4P4NAT', N'c668b2c1-3f2d-45f1-bbb5-96c0991806b6', N'0369863655', N'0', N'0', NULL, N'1', N'0', N'Hello everyone! My name is Trung and I''m the most handsome developer in the universe.
Contact for work: phamchitrung.work@gmail.com', N'2000-02-11 00:00:00.0000000', N'0', N'a55027e0-aa39-4478-9e72-644eb95ee13c.jpg', N'Handsome Dev')
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'd52bb534-9f31-4fa5-94b8-be7e091b187a', N'Thái', N'Nguyễn Quốc', N'f2bc0dce-4f30-41f3-91bf-10e5779dad0a.jpg', N'2021-11-03 18:39:27.9050928', N'Sky2021', N'SKY2021', N'thaictu191@gmail.com', N'THAICTU191@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEH9zWY5dxQAERj+Ju604x+gKHjCcdE3rzm82N1DJqnYc/I4ulDYKdaHLIIwmCIpGcg==', N'KVXSHFPDIYTUCHXSM7TJIG334KTVCOBM', N'7a87596b-4353-4665-b821-5236e5aaa060', N'', N'0', N'0', NULL, N'1', N'0', N'Vào đây là mình thích bạn rồi, hân hạnh được làm quen bạn nhó
 ❤️', N'2021-11-03 00:00:00.0000000', N'0', NULL, N'')
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'Yên', N'Đỗ', N'c720acb2-85d1-42e7-895c-8d44f8b0b537.jpg', N'2021-10-28 14:12:39.1420350', N'doxuanyen', N'DOXUANYEN', N'dxyen3333@gmail.com', N'DXYEN3333@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEMg9QuM7sSl3ZSrNQmCvKJ9j9K5LQnkdhvni56EHZoWupIt91NQxCgS42lyelJlm2w==', N'GFDPJ7U6X2HC2SVOKON3FUBABWXCWUTZ', N'3d0e6561-f1f3-441c-9d77-1af3b320ade1', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2000-03-03 00:00:00.0000000', N'2', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'dc33f05c-611d-456f-9aa7-9ba652f70ee7', N'Ngô', N'Lợi', NULL, N'2021-10-31 16:01:34.3807403', N'phuocloi11223', N'PHUOCLOI11223', N'phuocloi11223@gmail.com', N'PHUOCLOI11223@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAED0ibKXOLC0CCKIwik+ZT+ZZ0iijoz4iD3o/psCTG9r/v4/Y/SiHsIG0nITDXN0H7Q==', N'DUWOBLMVL7FZCPJ73X2RL7EBD4IJQ45V', N'e683ed3d-8e0c-4fcc-b863-9a4c9948e0e7', N'0796863758', N'0', N'0', NULL, N'1', N'0', N'', N'2003-11-25 00:00:00.0000000', N'0', N'40c11c15-a3f8-4d3a-a266-c37c25fca3db.jpg', N'NgoPhuocLoi')
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'dcaf3d3d-1e92-4253-82f1-a5e36927f682', N'Kính', N'Gia', NULL, N'2021-11-03 17:35:11.4178740', N'ngkinh', N'NGKINH', N'ngkinhitdeveloper@gmail.com', N'NGKINHITDEVELOPER@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAELyNz88JSf8tdoVTbuOr5GFnTL1rvH3N6yuRf/jj/L1mYyeS8LASXWePLNGPG59PCw==', N'ZJCAOOHC5S42TCCTBH35NUXCFYG7SFHC', N'729e6f69-721d-444a-b170-8971d014b612', N'', N'0', N'0', NULL, N'1', N'0', N'', N'2001-04-01 00:00:00.0000000', N'0', NULL, N'')
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'Guest 2', N'User', NULL, N'2021-10-29 19:20:42.1791197', N'guestuser2', N'GUESTUSER2', N'guest@gmail.com', N'GUEST@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEMrUjwREa9Q1XXxm5t5wjSftchVV4fEuwQGdBh4dD2KxXVtQsyjm/9cfOxfjPU52mQ==', N'P2NYMNBWVH2AOABP5SHK7OYL6MSBVIIF', N'fd7cbae2-ad6c-4fbc-899e-25910b795c81', N'', N'0', N'0', NULL, N'1', N'0', N'Welcome to guest account!', N'2000-10-10 00:00:00.0000000', N'2', NULL, N'')
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'Guest', N'User', NULL, N'2021-10-28 13:19:28.8520103', N'guestuser', N'GUESTUSER', N'guest@gmail.com', N'GUEST@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEGiP5+P3BcvKzu3nDu2OAI/HmfO46SJm32Vh8Cl6SYj8tDX/7TO6rjedhSNRjvIftA==', N'MEHVKOILSZZUXX5CEM4S5HINQTZSPPJP', N'cf3ad1b4-1664-47b3-9de0-f16c68aa3152', N'', N'0', N'0', NULL, N'1', N'0', N'Welcome to guest account!', N'2000-01-01 00:00:00.0000000', N'0', NULL, N'')
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'fa669a9b-d9cd-4b7a-844d-51bb5d3fb7d3', N'Hằng', N'Thúy', N'e234cbf7-4ce6-435e-a270-c20e34ba595b.png', N'2021-11-03 19:06:14.6704001', N'rolly.h17', N'ROLLY.H17', N'ltthang1721@gmail.com', N'LTTHANG1721@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAECTmqhxNWIlK28CoBU2jAD8lh2fg/V5prqie73tJ+L4dsaKGMEzg3a5Ul9YYrYvnOw==', N'GQX62V3E4Z7YVN2DEYSADB6OSRKY7NSJ', N'ee9ab4f3-d54d-43b8-bb42-b0aef8247114', N'', N'0', N'0', NULL, N'1', N'0', N'', N'2001-07-01 00:00:00.0000000', N'1', NULL, N'')
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'fbbed9c9-dd49-4556-8b79-3a24d0c53fbc', N'Bảo', N'Dương', N'784f1ba0-09be-4643-99a4-75593ce7005e.png', N'2021-10-31 16:03:57.9310672', N'dhbao2505', N'DHBAO2505', N'duongbao026@gmail.com', N'DUONGBAO026@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEAj84BLQKNYC65VGrKrh8JIOXG4ye5vAmkgQKOSJM/LvXUECTwUM/DperqjVJ8RU3A==', N'MYEKJTYXX5PLCWRENBJL7E5LSHAMPPTX', N'4beb22a0-fcb5-470c-855f-0eb2ed7332ac', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2003-05-25 00:00:00.0000000', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'fbeccc5a-5e29-4c83-9ee8-32ae27ede1cf', N'Phương', N'Thảo', NULL, N'2021-11-03 23:09:26.7412385', N'phuongthao2902', N'PHUONGTHAO2902', N'vophuongthao2902@gmail.com', N'VOPHUONGTHAO2902@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAENu+pF1Bn00uD/ewpEBsjikcgpmwn8xcRb/ON7r7rYL1aRlb0l+N4i/y57lJZrmTPw==', N'PU23P55PQDYLFEGMBJBGLA2QQUJATPVN', N'3519bb09-17a3-4546-acd1-fa9429b0d691', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2000-02-29 00:00:00.0000000', N'1', NULL, NULL)
GO


-- ----------------------------
-- Primary Key structure for table __EFMigrationsHistory
-- ----------------------------
ALTER TABLE [dbo].[__EFMigrationsHistory] ADD CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED ([MigrationId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for AspNetRoleClaims
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[AspNetRoleClaims]', RESEED, 1)
GO


-- ----------------------------
-- Indexes structure for table AspNetRoleClaims
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId]
ON [dbo].[AspNetRoleClaims] (
  [RoleId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table AspNetRoleClaims
-- ----------------------------
ALTER TABLE [dbo].[AspNetRoleClaims] ADD CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Indexes structure for table AspNetRoles
-- ----------------------------
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex]
ON [dbo].[AspNetRoles] (
  [NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
GO


-- ----------------------------
-- Primary Key structure for table AspNetRoles
-- ----------------------------
ALTER TABLE [dbo].[AspNetRoles] ADD CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for AspNetUserClaims
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[AspNetUserClaims]', RESEED, 360)
GO


-- ----------------------------
-- Indexes structure for table AspNetUserClaims
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId]
ON [dbo].[AspNetUserClaims] (
  [UserId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table AspNetUserClaims
-- ----------------------------
ALTER TABLE [dbo].[AspNetUserClaims] ADD CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Indexes structure for table AspNetUserLogins
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId]
ON [dbo].[AspNetUserLogins] (
  [UserId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table AspNetUserLogins
-- ----------------------------
ALTER TABLE [dbo].[AspNetUserLogins] ADD CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED ([LoginProvider], [ProviderKey])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Indexes structure for table AspNetUserRoles
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId]
ON [dbo].[AspNetUserRoles] (
  [RoleId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table AspNetUserRoles
-- ----------------------------
ALTER TABLE [dbo].[AspNetUserRoles] ADD CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED ([UserId], [RoleId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Primary Key structure for table AspNetUserTokens
-- ----------------------------
ALTER TABLE [dbo].[AspNetUserTokens] ADD CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED ([UserId], [LoginProvider], [Name])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Indexes structure for table BlockedUsers
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_BlockedUsers_BlockedUsersId]
ON [dbo].[BlockedUsers] (
  [BlockedUsersId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table BlockedUsers
-- ----------------------------
ALTER TABLE [dbo].[BlockedUsers] ADD CONSTRAINT [PK_BlockedUsers] PRIMARY KEY CLUSTERED ([BlockedByUsersId], [BlockedUsersId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Indexes structure for table ChatParticipants
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_ChatParticipants_ParticipantsId]
ON [dbo].[ChatParticipants] (
  [ParticipantsId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table ChatParticipants
-- ----------------------------
ALTER TABLE [dbo].[ChatParticipants] ADD CONSTRAINT [PK_ChatParticipants] PRIMARY KEY CLUSTERED ([JoinedChatsId], [ParticipantsId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for Chats
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Chats]', RESEED, 46)
GO


-- ----------------------------
-- Indexes structure for table Chats
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_Chats_CreatorId]
ON [dbo].[Chats] (
  [CreatorId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table Chats
-- ----------------------------
ALTER TABLE [dbo].[Chats] ADD CONSTRAINT [PK_Chats] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for Comments
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Comments]', RESEED, 41)
GO


-- ----------------------------
-- Indexes structure for table Comments
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_Comments_CreatorId]
ON [dbo].[Comments] (
  [CreatorId] ASC
)
GO

CREATE NONCLUSTERED INDEX [IX_Comments_PostId]
ON [dbo].[Comments] (
  [PostId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table Comments
-- ----------------------------
ALTER TABLE [dbo].[Comments] ADD CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Indexes structure for table Followers
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_Followers_FollowingId]
ON [dbo].[Followers] (
  [FollowingId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table Followers
-- ----------------------------
ALTER TABLE [dbo].[Followers] ADD CONSTRAINT [PK_Followers] PRIMARY KEY CLUSTERED ([FollowersId], [FollowingId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Indexes structure for table Friendships
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_Friendships_RecievedUserId]
ON [dbo].[Friendships] (
  [RecievedUserId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table Friendships
-- ----------------------------
ALTER TABLE [dbo].[Friendships] ADD CONSTRAINT [PK_Friendships] PRIMARY KEY CLUSTERED ([RequestedUserId], [RecievedUserId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for Messages
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Messages]', RESEED, 245)
GO


-- ----------------------------
-- Indexes structure for table Messages
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_Messages_ChatId]
ON [dbo].[Messages] (
  [ChatId] ASC
)
GO

CREATE NONCLUSTERED INDEX [IX_Messages_SenderId]
ON [dbo].[Messages] (
  [SenderId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table Messages
-- ----------------------------
ALTER TABLE [dbo].[Messages] ADD CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Indexes structure for table MessageStatuses
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_MessageStatuses_ReadMessagesId]
ON [dbo].[MessageStatuses] (
  [ReadMessagesId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table MessageStatuses
-- ----------------------------
ALTER TABLE [dbo].[MessageStatuses] ADD CONSTRAINT [PK_MessageStatuses] PRIMARY KEY CLUSTERED ([ReadByUsersId], [ReadMessagesId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for Notifications
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Notifications]', RESEED, 298)
GO


-- ----------------------------
-- Indexes structure for table Notifications
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_Notifications_CreatorId]
ON [dbo].[Notifications] (
  [CreatorId] ASC
)
GO

CREATE NONCLUSTERED INDEX [IX_Notifications_PostId]
ON [dbo].[Notifications] (
  [PostId] ASC
)
GO

CREATE NONCLUSTERED INDEX [IX_Notifications_RecipientId]
ON [dbo].[Notifications] (
  [RecipientId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table Notifications
-- ----------------------------
ALTER TABLE [dbo].[Notifications] ADD CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for Photos
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Photos]', RESEED, 49)
GO


-- ----------------------------
-- Indexes structure for table Photos
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_Photos_PostId]
ON [dbo].[Photos] (
  [PostId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table Photos
-- ----------------------------
ALTER TABLE [dbo].[Photos] ADD CONSTRAINT [PK_Photos] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for Posts
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Posts]', RESEED, 43)
GO


-- ----------------------------
-- Indexes structure for table Posts
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_Posts_CreatorId]
ON [dbo].[Posts] (
  [CreatorId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table Posts
-- ----------------------------
ALTER TABLE [dbo].[Posts] ADD CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for Reactions
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Reactions]', RESEED, 142)
GO


-- ----------------------------
-- Indexes structure for table Reactions
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_Reactions_CreatorId]
ON [dbo].[Reactions] (
  [CreatorId] ASC
)
GO

CREATE NONCLUSTERED INDEX [IX_Reactions_PostId]
ON [dbo].[Reactions] (
  [PostId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table Reactions
-- ----------------------------
ALTER TABLE [dbo].[Reactions] ADD CONSTRAINT [PK_Reactions] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Indexes structure for table Users
-- ----------------------------
CREATE NONCLUSTERED INDEX [EmailIndex]
ON [dbo].[Users] (
  [NormalizedEmail] ASC
)
GO

CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex]
ON [dbo].[Users] (
  [NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
GO


-- ----------------------------
-- Primary Key structure for table Users
-- ----------------------------
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Foreign Keys structure for table AspNetRoleClaims
-- ----------------------------
ALTER TABLE [dbo].[AspNetRoleClaims] ADD CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table AspNetUserClaims
-- ----------------------------
ALTER TABLE [dbo].[AspNetUserClaims] ADD CONSTRAINT [FK_AspNetUserClaims_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table AspNetUserLogins
-- ----------------------------
ALTER TABLE [dbo].[AspNetUserLogins] ADD CONSTRAINT [FK_AspNetUserLogins_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table AspNetUserRoles
-- ----------------------------
ALTER TABLE [dbo].[AspNetUserRoles] ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[AspNetUserRoles] ADD CONSTRAINT [FK_AspNetUserRoles_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table AspNetUserTokens
-- ----------------------------
ALTER TABLE [dbo].[AspNetUserTokens] ADD CONSTRAINT [FK_AspNetUserTokens_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table BlockedUsers
-- ----------------------------
ALTER TABLE [dbo].[BlockedUsers] ADD CONSTRAINT [FK_BlockedUsers_Users_BlockedByUsersId] FOREIGN KEY ([BlockedByUsersId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[BlockedUsers] ADD CONSTRAINT [FK_BlockedUsers_Users_BlockedUsersId] FOREIGN KEY ([BlockedUsersId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table ChatParticipants
-- ----------------------------
ALTER TABLE [dbo].[ChatParticipants] ADD CONSTRAINT [FK_ChatParticipants_Chats_JoinedChatsId] FOREIGN KEY ([JoinedChatsId]) REFERENCES [dbo].[Chats] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[ChatParticipants] ADD CONSTRAINT [FK_ChatParticipants_Users_ParticipantsId] FOREIGN KEY ([ParticipantsId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Chats
-- ----------------------------
ALTER TABLE [dbo].[Chats] ADD CONSTRAINT [FK_Chats_Users_CreatorId] FOREIGN KEY ([CreatorId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Comments
-- ----------------------------
ALTER TABLE [dbo].[Comments] ADD CONSTRAINT [FK_Comments_Posts_PostId] FOREIGN KEY ([PostId]) REFERENCES [dbo].[Posts] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Comments] ADD CONSTRAINT [FK_Comments_Users_CreatorId] FOREIGN KEY ([CreatorId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Followers
-- ----------------------------
ALTER TABLE [dbo].[Followers] ADD CONSTRAINT [FK_Followers_Users_FollowersId] FOREIGN KEY ([FollowersId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Followers] ADD CONSTRAINT [FK_Followers_Users_FollowingId] FOREIGN KEY ([FollowingId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Friendships
-- ----------------------------
ALTER TABLE [dbo].[Friendships] ADD CONSTRAINT [FK_Friendships_Users_RecievedUserId] FOREIGN KEY ([RecievedUserId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Friendships] ADD CONSTRAINT [FK_Friendships_Users_RequestedUserId] FOREIGN KEY ([RequestedUserId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Messages
-- ----------------------------
ALTER TABLE [dbo].[Messages] ADD CONSTRAINT [FK_Messages_Chats_ChatId] FOREIGN KEY ([ChatId]) REFERENCES [dbo].[Chats] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Messages] ADD CONSTRAINT [FK_Messages_Users_SenderId] FOREIGN KEY ([SenderId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table MessageStatuses
-- ----------------------------
ALTER TABLE [dbo].[MessageStatuses] ADD CONSTRAINT [FK_MessageStatuses_Messages_ReadMessagesId] FOREIGN KEY ([ReadMessagesId]) REFERENCES [dbo].[Messages] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[MessageStatuses] ADD CONSTRAINT [FK_MessageStatuses_Users_ReadByUsersId] FOREIGN KEY ([ReadByUsersId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Notifications
-- ----------------------------
ALTER TABLE [dbo].[Notifications] ADD CONSTRAINT [FK_Notifications_Posts_PostId] FOREIGN KEY ([PostId]) REFERENCES [dbo].[Posts] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Notifications] ADD CONSTRAINT [FK_Notifications_Users_CreatorId] FOREIGN KEY ([CreatorId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Notifications] ADD CONSTRAINT [FK_Notifications_Users_RecipientId] FOREIGN KEY ([RecipientId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Photos
-- ----------------------------
ALTER TABLE [dbo].[Photos] ADD CONSTRAINT [FK_Photos_Posts_PostId] FOREIGN KEY ([PostId]) REFERENCES [dbo].[Posts] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Posts
-- ----------------------------
ALTER TABLE [dbo].[Posts] ADD CONSTRAINT [FK_Posts_Users_CreatorId] FOREIGN KEY ([CreatorId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Reactions
-- ----------------------------
ALTER TABLE [dbo].[Reactions] ADD CONSTRAINT [FK_Reactions_Posts_PostId] FOREIGN KEY ([PostId]) REFERENCES [dbo].[Posts] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Reactions] ADD CONSTRAINT [FK_Reactions_Users_CreatorId] FOREIGN KEY ([CreatorId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

