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

 Date: 30/10/2021 22:56:09
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

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'21', N'2756572a-be3f-472f-9c4d-4e6c0f94c528')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'14', N'6e847afd-92b6-4c5a-90ae-98273135b4b1')
GO

INSERT INTO [dbo].[ChatParticipants] ([JoinedChatsId], [ParticipantsId]) VALUES (N'19', N'6e847afd-92b6-4c5a-90ae-98273135b4b1')
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

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'62e18ec4-5fc6-4214-83aa-d1486efa4729')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'6e847afd-92b6-4c5a-90ae-98273135b4b1')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'1bd1456a-42f8-4932-9016-63f7c209966a', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'88fa2305-54f7-409b-9b46-a826f1e9e1d4')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'aa7a6068-2ca4-494f-9678-5b29fd4f558a')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'aed79f8f-a1e6-43b6-b369-151085d6b8d0')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'b693a4ec-5b99-4eeb-a684-9617ed847087')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'b693a4ec-5b99-4eeb-a684-9617ed847087')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'1bd1456a-42f8-4932-9016-63f7c209966a', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'1e701476-d570-45d0-a0c6-948425401075', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'62e18ec4-5fc6-4214-83aa-d1486efa4729', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'88fa2305-54f7-409b-9b46-a826f1e9e1d4', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'aed79f8f-a1e6-43b6-b369-151085d6b8d0', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'aed79f8f-a1e6-43b6-b369-151085d6b8d0', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f')
GO

INSERT INTO [dbo].[Followers] ([FollowersId], [FollowingId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f')
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

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'0', N'2021-10-29 18:06:08.0912733', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'2021-10-29 18:05:37.3107176', N'0001-01-01 00:00:00.0000000')
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

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1', N'2021-10-29 18:00:52.3750386', N'2021-10-29 18:11:30.8386509')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'0', N'2021-10-29 19:33:14.8142320', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'0', N'2021-10-29 18:17:27.4544153', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'aed79f8f-a1e6-43b6-b369-151085d6b8d0', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'0', N'2021-10-28 14:21:10.2545297', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'1bd1456a-42f8-4932-9016-63f7c209966a', N'0', N'2021-10-28 14:12:58.6371118', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'62e18ec4-5fc6-4214-83aa-d1486efa4729', N'0', N'2021-10-29 21:24:07.4034423', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'1', N'2021-10-28 14:14:25.9181472', N'2021-10-28 14:20:52.9161104')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'88fa2305-54f7-409b-9b46-a826f1e9e1d4', N'0', N'2021-10-28 16:10:07.7839258', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'0', N'2021-10-29 15:46:06.2344958', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'1', N'2021-10-29 15:45:04.0412904', N'2021-10-29 18:30:41.6300836')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'aed79f8f-a1e6-43b6-b369-151085d6b8d0', N'0', N'2021-10-28 14:18:57.2684246', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'0', N'2021-10-28 14:13:13.3113177', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'0', N'2021-10-28 14:21:06.7473528', N'0001-01-01 00:00:00.0000000')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'1', N'2021-10-29 19:23:28.0944050', N'2021-10-29 19:23:33.1056933')
GO

INSERT INTO [dbo].[Friendships] ([RequestedUserId], [RecievedUserId], [Type], [RequestedDate], [RespondedDate]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'1', N'2021-10-28 13:23:51.8977558', N'2021-10-29 18:18:31.6975890')
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

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'25')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'16bcc3db-b0a7-4318-a484-83b2b14eb1eb', N'26')
GO

INSERT INTO [dbo].[MessageStatuses] ([ReadByUsersId], [ReadMessagesId]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'27')
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

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'66', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'2', NULL, N'2021-10-29 15:46:06.2514629', NULL, NULL, N'0', N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'0')
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

INSERT INTO [dbo].[Notifications] ([Id], [CreatorId], [Type], [PostId], [DateCreated], [DateModified], [DateDeleted], [IsRead], [RecipientId], [ReactionType]) VALUES (N'146', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'2', NULL, N'2021-10-29 19:11:18.7329452', NULL, NULL, N'0', N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'0')
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

INSERT INTO [dbo].[Posts] ([Id], [Content], [CreatorId], [Privacy], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'9', N'May mắn là mình đã rất enjoy những cái moments này 🤩', N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'0', N'2021-10-28 15:24:24.1504095', N'2021-10-28 15:36:25.6839123', NULL)
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

INSERT INTO [dbo].[Reactions] ([Id], [Type], [CreatorId], [PostId], [DateCreated], [DateModified], [DateDeleted]) VALUES (N'90', N'0', N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'31', N'2021-10-29 19:29:05.2598147', N'2021-10-29 19:29:06.9604218', NULL)
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

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'2756572a-be3f-472f-9c4d-4e6c0f94c528', N'Quỳnh', N'Phạm Phương', N'edd78ec1-13ff-4e2d-b988-b2f67a3cb0c4.jpg', N'2021-10-29 21:06:58.2930394', N'quynhpham', N'QUYNHPHAM', N'quynhpham@gmail.com', N'QUYNHPHAM@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAENKqB0bQ9L4W2XXvitpodV/4+ZgeZVSdFB64ZYnfQii+3GVPHw9DDDlR4Uho3bPDyA==', N'GDJW7P4NELK5RNPPQSKF3YN5OZM3YGLN', N'3b8af6a8-f8bd-4551-9b25-fd292e3acc87', N'', N'0', N'0', NULL, N'1', N'0', N'Kiếm tui có gì hong 😉', N'1999-05-25 00:00:00.0000000', N'1', N'f733f6b3-ec70-4e8c-bb7f-e8288a51da6b.jpg', N'Quyn')
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'62e18ec4-5fc6-4214-83aa-d1486efa4729', N'T', N'T', NULL, N'2021-10-29 10:30:24.9283926', N'UserName', N'USERNAME', N'b@gmail.com', N'B@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEBI/y8he37IFl8e6ONo8gG5Ykm0LSCOWBvct80D5MhP+vnqo7B2bcvSLnejNH0Suhw==', N'7FBEZVAQ24CW6OCUTBVOZNZM5IOVPQVE', N'2b4debc9-03f9-42a3-ba51-081dc4f67de2', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2000-10-16 00:00:00.0000000', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'6e847afd-92b6-4c5a-90ae-98273135b4b1', N'Phương', N'Trần Mỹ', N'f860f83b-f1f5-45ad-9b3a-e287f7ab776c.jpg', N'2021-10-29 18:03:16.7866740', N'phuongtran', N'PHUONGTRAN', N'phuongtran@gmail.com', N'PHUONGTRAN@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEHvBHSB7aB7aUrNtp4dci1t1dlQYpQmTLl4ftJ5GF5rZI+OJXLGoKnswIoUQqp75mg==', N'HLLLUGKLY23YUVKDEARZSJTXLZNWVTPQ', N'4a2ed68a-d187-4adf-bc98-c2fee926480c', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2002-12-11 00:00:00.0000000', N'1', N'8f0bd67d-1508-49b4-88b1-955e0292b03b.jpg', NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'7c960ddb-f8f1-4cb3-a5ea-ccefa2371198', N'Lam', N'Nguyen', N'04f366df-37ad-4b1c-96a4-9cd86e277a00.jpeg', N'2021-10-28 14:11:28.7687463', N'tunglamnguyen', N'TUNGLAMNGUYEN', N'tunglamvl0603@gmail.com', N'TUNGLAMVL0603@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEFTwPuPpJLQ5IPL9QskBK2/28jv1baw3crXo5GFOM0LPbf7mRB7+cFvmipFghej9mw==', N'K3SMZNY3SW44OIMAB3NTNZHXI6HONETM', N'51f45e0b-38f9-417d-b1cc-18b8e1f8aaa6', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2000-06-03 00:00:00.0000000', N'0', N'82d910e4-9baa-46dc-9fcc-56f3aca4db24.png', NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'88fa2305-54f7-409b-9b46-a826f1e9e1d4', N'Hầu', N'Diễm Xuân', NULL, N'2021-10-28 14:16:24.3735825', N'haudiemxuan', N'HAUDIEMXUAN', N'xuan@gmail.com', N'XUAN@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEEQ4l1TrZxqG2bo72JjcWL0xchAVtGIO3muN8ITlgyWtLCjMEKYpiykY4CU1Yw88dg==', N'YKHY44JJDWYHOOUT7CFKUZA4C75OY5HJ', N'c4f16ca4-1dbb-4b1f-be04-cbfbbbfc0353', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2021-10-10 00:00:00.0000000', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'8f2f2c56-268b-483d-8993-1a6d3bce1a55', N'Mikami', N'Yua', NULL, N'2021-10-29 10:19:50.1262158', N'mikami', N'MIKAMI', N'mikami@gmail.com', N'MIKAMI@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAENZJmBeno3TOmSvTts+DAMfrzxjwEqg9DUdukP7sPpVm5E0AMxusVjwCIqU99U23Eg==', N'FEV4MXDABFHZIG5YWSHFFTWJLY2AU3EU', N'618e825e-142d-4749-a3d7-c70fc1ab8796', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'1993-08-16 00:00:00.0000000', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'97a04d5f-56fe-44b8-9c28-9c35f865fd17', N'Trung', N'Phạm Chí', N'03800fff-833f-4dfa-ae43-34ac6cd92116.jpeg', N'2021-10-28 13:37:03.2617721', N'pctrung', N'PCTRUNG', N'phamchitrung.work@gmail.com', N'PHAMCHITRUNG.WORK@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEKculUxVSESvjfGJcwk256EsqEpQtilmE9RgegtHqyHVjopgNhE0K9Ydkd++N+7wKA==', N'WZ647E5BXQGUKG6FDN37KHPQZUQUGKLW', N'21c76ca7-fdec-46cf-815f-fb3b551188f9', N'0369863655', N'0', N'0', NULL, N'1', N'0', N'Hello everyone! My name is Trung and I''m the most handsome developer in the universe. Contact for work: phamchitrung.work@gmail.com', N'2000-02-11 00:00:00.0000000', N'0', N'4ed466eb-24d4-412b-8157-089376dbb0d3.jpeg', N'Trung Xì')
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'aa7a6068-2ca4-494f-9678-5b29fd4f558a', N'Vi', N'Lê Ngọc', N'ff291718-798c-47a1-81c2-ef868ff9a3d3.jpg', N'2021-10-29 17:48:49.4516815', N'testuser2', N'TESTUSER2', N'lnvi@gmail.com', N'LNVI@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEAAAwnNYFwOidPKCNfgSWfo0WmI9VRIdCdMIDJ9PWNNPWQTRlvqx0tMg+lyXs7Bkug==', N'677CR6T4W4O7277K6SMXDJAPXJ4X5TRA', N'e1e9052e-bd73-48ec-b62e-c7ede6ec4610', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2001-10-20 00:00:00.0000000', N'1', N'45d15e91-6be8-4e4f-a6b9-107b3198a765.jpg', NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'aed79f8f-a1e6-43b6-b369-151085d6b8d0', N'Huy', N'Lam', NULL, N'2021-10-28 14:12:17.9765609', N'lamnhuthuy', N'LAMNHUTHUY', N'huy@gmail.com', N'HUY@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEC4W8ok4NtqLX7oNO1G8uWc7/h0BXY/cboyAbC6rL5h9xbX11Ywf77wGzTRFUp6AHg==', N'TID7JWUCTTFTG4WG2LHCZYFBAJUZI2P4', N'994f1169-a706-40b9-856b-80ca8d4e5c6c', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2021-10-28 00:00:00.0000000', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'b693a4ec-5b99-4eeb-a684-9617ed847087', N'Thong', N'Nguyen', N'feccd621-7b37-40db-b71f-6d8143c916a5.jpg', N'2021-10-28 14:11:01.0200681', N'hoangthong', N'HOANGTHONG', N'thong0104@gmail.com', N'THONG0104@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEBdyUK/O7pot8/v2bGC97dWemXn9AC6YMT9XrX2OC1AiMX44/Zxls1ApilZDw6Ne8A==', N'I6BWUSILMAPXRQZFBNKTDQSII2AVFKFX', N'c71cc382-908d-4d67-a751-bff463cb895b', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2000-04-01 00:00:00.0000000', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'cf0a4a57-a7d8-4cf3-9855-78fa00da8c42', N'Admin', N'I am', N'39a81157-9cd7-42c5-a983-ff3893904c30.jpg', N'2021-10-28 12:11:00.3394184', N'teeadmin', N'TEEADMIN', N'phamchitrung.work@gmail.com', N'PHAMCHITRUNG.WORK@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAELG2uJ/Ul6NNAYAucqabSOiRVzcTjzpiEmM89kyQ4IN97lVUVjf7TnkuXM97dKpmRg==', N'ME2NYHXBWXU6GL4Y6Y7ET2Z3NG4P4NAT', N'c668b2c1-3f2d-45f1-bbb5-96c0991806b6', N'0369863655', N'0', N'0', NULL, N'1', N'0', N'Hello everyone! My name is Trung and I''m the most handsome developer in the universe.
Contact for work: phamchitrung.work@gmail.com', N'2000-02-11 00:00:00.0000000', N'0', N'a55027e0-aa39-4478-9e72-644eb95ee13c.jpg', N'Handsome Dev')
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'db2ac8f7-e570-489b-9d38-c2b2c991ab5f', N'Yên', N'Đỗ', N'c720acb2-85d1-42e7-895c-8d44f8b0b537.jpg', N'2021-10-28 14:12:39.1420350', N'doxuanyen', N'DOXUANYEN', N'dxyen3333@gmail.com', N'DXYEN3333@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEMg9QuM7sSl3ZSrNQmCvKJ9j9K5LQnkdhvni56EHZoWupIt91NQxCgS42lyelJlm2w==', N'GFDPJ7U6X2HC2SVOKON3FUBABWXCWUTZ', N'3d0e6561-f1f3-441c-9d77-1af3b320ade1', NULL, N'0', N'0', NULL, N'1', N'0', NULL, N'2000-03-03 00:00:00.0000000', N'2', NULL, NULL)
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'dceab0c3-a550-4132-81c8-2a434dd1d9a3', N'Guest 2', N'User', NULL, N'2021-10-29 19:20:42.1791197', N'guestuser2', N'GUESTUSER2', N'guest@gmail.com', N'GUEST@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEMrUjwREa9Q1XXxm5t5wjSftchVV4fEuwQGdBh4dD2KxXVtQsyjm/9cfOxfjPU52mQ==', N'P2NYMNBWVH2AOABP5SHK7OYL6MSBVIIF', N'fd7cbae2-ad6c-4fbc-899e-25910b795c81', N'', N'0', N'0', NULL, N'1', N'0', N'Welcome to guest account!', N'2000-10-10 00:00:00.0000000', N'2', NULL, N'')
GO

INSERT INTO [dbo].[Users] ([Id], [FirstName], [LastName], [AvatarFileName], [DateCreated], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AboutMe], [DateOfBirth], [Gender], [CoverFileName], [NickName]) VALUES (N'f510595e-5e21-42ba-8c7a-c585bb57f5f7', N'Guest', N'User', NULL, N'2021-10-28 13:19:28.8520103', N'guestuser', N'GUESTUSER', N'guest@gmail.com', N'GUEST@GMAIL.COM', N'0', N'AQAAAAEAACcQAAAAEGiP5+P3BcvKzu3nDu2OAI/HmfO46SJm32Vh8Cl6SYj8tDX/7TO6rjedhSNRjvIftA==', N'MEHVKOILSZZUXX5CEM4S5HINQTZSPPJP', N'cf3ad1b4-1664-47b3-9de0-f16c68aa3152', N'', N'0', N'0', NULL, N'1', N'0', N'Welcome to guest account!', N'2000-01-01 00:00:00.0000000', N'0', NULL, N'')
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
DBCC CHECKIDENT ('[dbo].[AspNetUserClaims]', RESEED, 153)
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
DBCC CHECKIDENT ('[dbo].[Chats]', RESEED, 22)
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
DBCC CHECKIDENT ('[dbo].[Comments]', RESEED, 25)
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
DBCC CHECKIDENT ('[dbo].[Messages]', RESEED, 67)
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
DBCC CHECKIDENT ('[dbo].[Notifications]', RESEED, 170)
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
DBCC CHECKIDENT ('[dbo].[Photos]', RESEED, 41)
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
DBCC CHECKIDENT ('[dbo].[Posts]', RESEED, 33)
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
DBCC CHECKIDENT ('[dbo].[Reactions]', RESEED, 98)
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

