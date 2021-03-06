USE [master]
GO
/****** Object:  Database [CMS]    Script Date: 2019/12/7 10:35:33 ******/
CREATE DATABASE [CMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CMS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [CMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CMS] SET RECOVERY FULL 
GO
ALTER DATABASE [CMS] SET  MULTI_USER 
GO
ALTER DATABASE [CMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CMS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CMS', N'ON'
GO
ALTER DATABASE [CMS] SET QUERY_STORE = OFF
GO
USE [CMS]
GO
/****** Object:  Table [dbo].[t_action]    Script Date: 2019/12/7 10:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_action](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActionCode] [nvarchar](20) NULL,
	[ActionName] [nvarchar](40) NULL,
	[Position] [int] NULL,
	[Icon] [nvarchar](30) NULL,
	[Method] [nvarchar](20) NULL,
	[Remark] [nvarchar](50) NULL,
	[OrderBy] [int] NULL,
	[Status] [bit] NULL,
	[CreateOn] [datetime] NULL,
	[UpdateOn] [datetime] NULL,
	[CreateBy] [int] NULL,
	[UpdateBy] [int] NULL,
	[ClassName] [nvarchar](30) NULL,
 CONSTRAINT [pk_t_action] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_article]    Script Date: 2019/12/7 10:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_article](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[ZhaiYao] [nvarchar](500) NULL,
	[ImgUrl] [nvarchar](255) NULL,
	[Content] [nvarchar](max) NULL,
	[TypeId] [int] NULL,
	[ClassId] [int] NULL,
	[Ding] [int] NULL,
	[ReadNum] [int] NULL,
	[CommentNum] [int] NULL,
	[Status] [bit] NULL,
	[CreateOn] [datetime] NULL,
	[UpdateOn] [datetime] NULL,
 CONSTRAINT [pk_t_article] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_article_class]    Script Date: 2019/12/7 10:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_article_class](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
	[OrderNo] [int] NULL,
	[CreateOn] [datetime] NULL,
 CONSTRAINT [pk_t_article_class] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_article_type]    Script Date: 2019/12/7 10:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_article_type](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
	[CreateOn] [datetime] NULL,
 CONSTRAINT [pk_t_article_type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_comment]    Script Date: 2019/12/7 10:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SendId] [int] NULL,
	[AcceptId] [int] NULL,
	[Content] [nvarchar](500) NULL,
	[Status] [bit] NULL,
	[ParentId] [int] NULL,
	[ArticleId] [int] NULL,
	[CreateOn] [datetime] NULL,
 CONSTRAINT [pk_t_comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_diarys]    Script Date: 2019/12/7 10:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_diarys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[CreateOn] [datetime] NULL,
 CONSTRAINT [pk_t_diarys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_feedback]    Script Date: 2019/12/7 10:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_feedback](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SendId] [int] NULL,
	[AcceptId] [int] NULL,
	[Content] [nvarchar](500) NULL,
	[ParentId] [int] NULL,
	[City] [nvarchar](50) NULL,
	[Equip] [nvarchar](50) NULL,
	[CreateOn] [datetime] NULL,
 CONSTRAINT [pk_t_feedback] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_links]    Script Date: 2019/12/7 10:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_links](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
	[Url] [nvarchar](255) NULL,
	[Icon] [nvarchar](255) NULL,
	[Describe] [nvarchar](100) NULL,
	[CreateOn] [datetime] NULL,
 CONSTRAINT [pk_t_links] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_log]    Script Date: 2019/12/7 10:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LogType] [nvarchar](20) NULL,
	[UserName] [nvarchar](20) NULL,
	[RealName] [nvarchar](20) NULL,
	[ModuleName] [nvarchar](20) NULL,
	[Description] [nvarchar](200) NULL,
	[CreateOn] [datetime] NULL,
	[IPAddress] [nvarchar](20) NULL,
	[IPAddressName] [nvarchar](100) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [pk_t_log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_menu]    Script Date: 2019/12/7 10:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](20) NULL,
	[MenuUrl] [nvarchar](60) NULL,
	[MenuIcon] [nvarchar](30) NULL,
	[OrderNo] [int] NULL,
	[ParentId] [int] NULL,
	[Status] [bit] NULL,
	[CreateOn] [datetime] NULL,
	[UpdateOn] [datetime] NULL,
	[CreateBy] [int] NULL,
	[UpdateBy] [int] NULL,
 CONSTRAINT [pk_t_menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_menu_action]    Script Date: 2019/12/7 10:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_menu_action](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[ActionId] [int] NOT NULL,
 CONSTRAINT [pk_t_menu_action] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC,
	[ActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_menu_role_action]    Script Date: 2019/12/7 10:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_menu_role_action](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[ActionId] [int] NOT NULL,
 CONSTRAINT [pk_t_menu_role_action] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC,
	[RoleId] ASC,
	[ActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_qq_user]    Script Date: 2019/12/7 10:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_qq_user](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OpenId] [nvarchar](100) NULL,
	[NickName] [nvarchar](50) NULL,
	[Gender] [int] NULL,
	[HeadShot] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[LastLogin] [datetime] NULL,
	[CreateOn] [datetime] NULL,
 CONSTRAINT [pk_t_qq_user] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_role]    Script Date: 2019/12/7 10:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleCode] [nvarchar](20) NULL,
	[RoleName] [nvarchar](30) NULL,
	[Remark] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[CreateOn] [datetime] NULL,
	[UpdateOn] [datetime] NULL,
	[CreateBy] [int] NULL,
	[UpdateBy] [int] NULL,
 CONSTRAINT [pk_t_role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_user]    Script Date: 2019/12/7 10:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_user](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](20) NULL,
	[RealName] [nvarchar](20) NULL,
	[PassWord] [nchar](32) NULL,
	[RoleId] [int] NULL,
	[Status] [bit] NULL,
	[CreateOn] [datetime] NULL,
	[UpdateOn] [datetime] NULL,
	[CreateBy] [int] NULL,
	[UpdateBy] [int] NULL,
	[Gender] [int] NULL,
	[Phone] [nvarchar](11) NULL,
	[Email] [nvarchar](30) NULL,
	[Remark] [nvarchar](50) NULL,
	[HeadShot] [nvarchar](200) NULL,
 CONSTRAINT [pk_t_user] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[t_action] ON 

INSERT [dbo].[t_action] ([Id], [ActionCode], [ActionName], [Position], [Icon], [Method], [Remark], [OrderBy], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy], [ClassName]) VALUES (1, N'Add', N'添加', 1, N'icon-add', N'Add', N'', 0, 1, CAST(N'2019-02-28T14:44:33.000' AS DateTime), CAST(N'2019-06-15T23:32:07.000' AS DateTime), 0, 1, N'')
INSERT [dbo].[t_action] ([Id], [ActionCode], [ActionName], [Position], [Icon], [Method], [Remark], [OrderBy], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy], [ClassName]) VALUES (2, N'edit', N'编辑', 0, N'icon-bianji', N'edit', N'', 0, 1, CAST(N'2019-02-28T14:44:36.000' AS DateTime), CAST(N'2019-02-28T14:45:21.000' AS DateTime), 0, 0, N'')
INSERT [dbo].[t_action] ([Id], [ActionCode], [ActionName], [Position], [Icon], [Method], [Remark], [OrderBy], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy], [ClassName]) VALUES (3, N'detail', N'查看', 0, N'icon-chakan', N'detail', N'', 0, 1, CAST(N'2019-02-28T14:44:39.000' AS DateTime), CAST(N'2019-02-28T14:45:24.000' AS DateTime), 0, 0, N'layui-btn-normal')
INSERT [dbo].[t_action] ([Id], [ActionCode], [ActionName], [Position], [Icon], [Method], [Remark], [OrderBy], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy], [ClassName]) VALUES (4, N'del', N'删除', 0, N'icon-guanbi', N'del', N'', 0, 1, CAST(N'2019-02-28T14:44:42.000' AS DateTime), CAST(N'2019-02-28T14:45:27.000' AS DateTime), 0, 0, N'layui-btn-danger')
INSERT [dbo].[t_action] ([Id], [ActionCode], [ActionName], [Position], [Icon], [Method], [Remark], [OrderBy], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy], [ClassName]) VALUES (5, N'reset', N'重置密码', 0, N'icon-reset', N'reset', N'', 0, 1, CAST(N'2019-02-28T14:44:45.000' AS DateTime), CAST(N'2019-06-15T23:34:55.000' AS DateTime), 0, 1, N'layui-btn-warm')
INSERT [dbo].[t_action] ([Id], [ActionCode], [ActionName], [Position], [Icon], [Method], [Remark], [OrderBy], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy], [ClassName]) VALUES (6, N'assign', N'分配权限', 0, N'icon-jiaoseguanli', N'assign', N'', 0, 1, CAST(N'2019-02-28T14:44:48.000' AS DateTime), CAST(N'2019-02-28T14:45:34.000' AS DateTime), 0, 0, N'')
INSERT [dbo].[t_action] ([Id], [ActionCode], [ActionName], [Position], [Icon], [Method], [Remark], [OrderBy], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy], [ClassName]) VALUES (7, N'BatchDel', N'批量删除', 1, N'icon-shanchu', N'BatchDel', NULL, 0, 1, CAST(N'2019-06-15T23:34:15.000' AS DateTime), CAST(N'2019-10-15T23:34:15.000' AS DateTime), 1, 0, NULL)
INSERT [dbo].[t_action] ([Id], [ActionCode], [ActionName], [Position], [Icon], [Method], [Remark], [OrderBy], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy], [ClassName]) VALUES (8, N'menu_action', N'菜单权限', 0, N'icon-setting-permissions', N'menu_action', NULL, 0, 1, CAST(N'2019-06-15T23:34:15.000' AS DateTime), CAST(N'2019-10-15T23:34:15.000' AS DateTime), 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[t_action] OFF
SET IDENTITY_INSERT [dbo].[t_article] ON 

INSERT [dbo].[t_article] ([Id], [Title], [ZhaiYao], [ImgUrl], [Content], [TypeId], [ClassId], [Ding], [ReadNum], [CommentNum], [Status], [CreateOn], [UpdateOn]) VALUES (1, N'ASP.NET MVC 通用角色权限管理系统', N'RightControl 介绍 .NET 通用后台角色权限管理系统，已完成。项目地址：http://rightcontrol.baocaige.top/Admin/Login 码云地址：https://gitee.com/Liu_Cabbage/RightControl 软件架构 通用三层架构，面向接口编程。', N'/Upload/img/1260852-20190620144549201-1384742553.jpg', N'<h1 style="margin-top: 10px; margin-bottom: 10px; line-height: 1.5; font-size: 28px; font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);">RightControl</h1><h4 style="margin-top: 10px; margin-bottom: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);"><a id="介绍" class="anchor" href="https://gitee.com/Liu_Cabbage/RightControl#%E4%BB%8B%E7%BB%8D" style="color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);"></a>介绍</h4><p style="margin-top: 10px; margin-right: auto; margin-left: auto; color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);">.NET 通用后台角色权限管理系统，已完成。<br>项目地址：<a href="http://rightcontrol.baocaige.top/Admin/Login" target="_blank" style="color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);">http://rightcontrol.baocaige.top/Admin/Login</a><br>码云地址：<a href="https://gitee.com/Liu_Cabbage/RightControl" target="_blank" style="color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);">https://gitee.com/Liu_Cabbage/RightControl</a></p><h4 style="margin-top: 10px; margin-bottom: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);"><a id="软件架构" class="anchor" href="https://gitee.com/Liu_Cabbage/RightControl#%E8%BD%AF%E4%BB%B6%E6%9E%B6%E6%9E%84" style="color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);"></a>软件架构</h4><p style="margin-top: 10px; margin-right: auto; margin-left: auto; color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);">通用三层架构，面向接口编程。</p><h4 style="margin-top: 10px; margin-bottom: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);"><a id="技术选型" class="anchor" href="https://gitee.com/Liu_Cabbage/RightControl#%E6%8A%80%E6%9C%AF%E9%80%89%E5%9E%8B" style="color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);"></a>技术选型</h4><ol class="task-list" style="padding-left: 50px; color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);"><li style="list-style: decimal;">MVC5</li><li style="list-style: decimal;">Mysql</li><li style="list-style: decimal;">Dapper</li><li style="list-style: decimal;">Autofac</li><li style="list-style: decimal;">Layui</li><li style="list-style: decimal;">阿里巴巴矢量库</li></ol><h4 style="margin-top: 10px; margin-bottom: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);"><a id="使用说明" class="anchor" href="https://gitee.com/Liu_Cabbage/RightControl#%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E" style="color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);"></a>使用说明</h4><ol class="task-list" style="padding-left: 50px; color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);"><li style="list-style: decimal;">先创建数据库，然后执行sql目录下面的rightcontrol.sql即可。</li><li style="list-style: decimal;">账号：admin</li><li style="list-style: decimal;">密码：123456</li></ol><h4 style="margin-top: 10px; margin-bottom: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);"><a id="项目由来" class="anchor" href="https://gitee.com/Liu_Cabbage/RightControl#%E9%A1%B9%E7%9B%AE%E7%94%B1%E6%9D%A5" style="color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);"></a>项目由来</h4><p style="margin-top: 10px; margin-right: auto; margin-left: auto; color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);">邹琼俊 .net项目驱动学习&nbsp;<a href="https://edu.csdn.net/course/detail/8137" target="_blank" style="color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);">https://edu.csdn.net/course/detail/8137&nbsp;</a>由于是付费课程，我这里不贴出博主的项目git地址<br>第一次自己动手做一个通用权限管理后台，看视频一步步完成。 各位看官大佬觉得还可以的话，麻烦点个Star。</p><h4 style="margin-top: 10px; margin-bottom: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);"><a id="个人新增及修改的bug" class="anchor" href="https://gitee.com/Liu_Cabbage/RightControl#%E4%B8%AA%E4%BA%BA%E6%96%B0%E5%A2%9E%E5%8F%8A%E4%BF%AE%E6%94%B9%E7%9A%84bug" style="color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);"></a>个人新增及修改的Bug</h4><ol class="task-list" style="padding-left: 50px; color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);"><li style="list-style: decimal;">基本资料性别更改后后台数据不更新</li><li style="list-style: decimal;">菜单管理没有删除功能</li><li style="list-style: decimal;">菜单管理没有操作按钮设置功能</li><li style="list-style: decimal;">没有批量删除</li><li style="list-style: decimal;">角色管理分配权限里不显示新增的菜单</li><li style="list-style: decimal;">删除菜单同时清除菜单权限，菜单角色权限</li><li style="list-style: decimal;">删除按钮同时清除菜单权限，菜单角色权限</li><li style="list-style: decimal;">删除角色同时清除菜单角色权限</li></ol><h4 style="margin-top: 10px; margin-bottom: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);"><a id="项目截图" class="anchor" href="https://gitee.com/Liu_Cabbage/RightControl#%E9%A1%B9%E7%9B%AE%E6%88%AA%E5%9B%BE" style="color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);"></a>项目截图</h4><p style="margin-top: 10px; margin-right: auto; margin-left: auto; color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);"><img src="/Upload/img/1260852-20190620144549201-1384742553_1.jpg" alt="undefined"><br></p><p style="margin-top: 10px; margin-right: auto; margin-left: auto; color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);"><img src="/Upload/img/1260852-20190620144600057-1249279035.png" alt="undefined"><br></p>', 1, 1, 1, 107, 0, 1, CAST(N'2019-07-29T17:01:39.000' AS DateTime), CAST(N'2019-07-29T17:04:18.000' AS DateTime))
INSERT [dbo].[t_article] ([Id], [Title], [ZhaiYao], [ImgUrl], [Content], [TypeId], [ClassId], [Ding], [ReadNum], [CommentNum], [Status], [CreateOn], [UpdateOn]) VALUES (2, N'码云 VS首次提交代码报错：failed to push some refs to ''https://gitee.com/Liu_Cabbage/ASP.NET-MVC-QQ-Connect.git''', N'打开命令提示符： 执行合并命令： git pull --rebase origin master 最后总结： 1、多为第一次提交代码，本地和码云仓库不一致，README.md文件不在本地代码目录中 2、可以通过如下命令进行代码合并【注：pull=fetch+merge] git pull --rebase origin master  3、执行上面代码后可以看到本地代码库中多了README.md文件  4、此时再执行语句 git push 或者用VS的推送', N'/Upload/img/u=2715563049,865769039&fm=26&gp=0.jpg', N'<p><img src="/Upload/img/1.jpg" alt="undefined"><br></p><p>打开命令提示符：</p><p><img src="/Upload/img/2.jpg" alt="undefined"><br></p><p>执行合并命令：</p><p>git pull --rebase origin master</p><p>最后总结：</p><p>1、多为第一次提交代码，本地和码云仓库不一致，README.md文件不在本地代码目录中</p><p>2、可以通过如下命令进行代码合并【注：pull=fetch+merge]</p><p>git pull --rebase origin master</p><p>3、执行上面代码后可以看到本地代码库中多了README.md文件</p><p>4、此时再执行语句&nbsp;git push 或者用VS的推送</p>', 1, 7, 0, 16, 0, 1, CAST(N'2019-07-29T17:13:45.000' AS DateTime), CAST(N'2019-07-29T17:14:04.000' AS DateTime))
INSERT [dbo].[t_article] ([Id], [Title], [ZhaiYao], [ImgUrl], [Content], [TypeId], [ClassId], [Ding], [ReadNum], [CommentNum], [Status], [CreateOn], [UpdateOn]) VALUES (3, N'Mysql 随机获得表的几条记录', N'在做博客文章详情的时候，有一个拓展阅读的功能： 想法一：根据当前文章Id，写死两条链接，Id+1，Id-1，但是文章Id可能被删除，Id不连续，不可取。× 想法二：获得当前文章记录的前一条和后一条记录，好像有点难受，要查询两次。查询两次，可行。√ 想法三：直接获取文章表两条随机的记录。一次查询，舒服。√', N'/Upload/img/1260852-20190717163824398-638143940.png', N'<p>在做博客文章详情的时候，有一个拓展阅读的功能：</p><p><img src="/Upload/img/1260852-20190717163824398-638143940_1.png" alt="undefined"><br></p><p>想法一：根据当前文章Id，写死两条链接，Id+1，Id-1，但是文章Id可能被删除，Id不连续，不可取。×</p><p>想法二：获得当前文章记录的前一条和后一条记录，好像有点难受，要查询两次。查询两次，可行。√</p><p>想法三：直接获取文章表两条随机的记录。一次查询，舒服。√</p><div class="cnblogs_code"><pre>SELECT *<span>
FROM t_article
WHERE Id </span>&gt;= ((SELECT MAX(Id) FROM t_article)-(SELECT MIN(Id) FROM t_article)) * RAND() +<span> (SELECT MIN(Id) FROM t_article)
LIMIT </span><span>2</span></pre></div><p>ArticleService对应的方法</p><div class="cnblogs_code"><pre><span>        ///</span> <span>&lt;summary&gt;</span>
        <span>///</span><span> 延伸阅读-获取两条随机文章
        </span><span>///</span> <span>&lt;/summary&gt;</span>
        <span>///</span> <span>&lt;param name="num"&gt;&lt;/param&gt;</span>
        <span>///</span> <span>&lt;returns&gt;&lt;/returns&gt;</span>
        <span>public</span> IEnumerable&lt;ArticleModel&gt; GetRandomArticleList(<span>int</span><span> num)
        {
            </span><span>string</span> _where = <span>"</span><span>WHERE Id &gt;= ((SELECT MAX(Id) FROM t_article)-(SELECT MIN(Id) FROM t_article)) * RAND() + (SELECT MIN(Id) FROM t_article) LIMIT </span><span>"</span>+<span>num;
            </span><span>return</span> repository.GetByWhere(_where,<span>null</span>,<span>null</span>,<span>null</span><span>); ;
        }</span></pre></div><p>&nbsp;</p>', 1, 3, 0, 16, 0, 1, CAST(N'2019-07-29T17:16:24.000' AS DateTime), CAST(N'2019-07-29T17:16:32.000' AS DateTime))
INSERT [dbo].[t_article] ([Id], [Title], [ZhaiYao], [ImgUrl], [Content], [TypeId], [ClassId], [Ding], [ReadNum], [CommentNum], [Status], [CreateOn], [UpdateOn]) VALUES (4, N'ASP.NET MVC 使用分部视图制作公共头部，尾部，并通过ViewBag传值', N' 一：新建分部视图 二：布局页_Layout.cshtml上调用 不灵活，不能传递数据，引用静态公共部分 通过控制器方法引入分部视图，控制器里可以向分部视图传递数据，引用动态公共部分 三：代码展示： 布局页_Layout.cshtml，因为@RenderSection只能放在布局页，所以@Html.Action("Foot", "Home")下面的一坨就没放在_Foot里面，会报错。', N'/Upload/img/1260852-20190712145504706-1458531772.jpg', N'<p>一：新建分部视图</p><p><img src="/Upload/img/2019071215113829.jpg" alt="undefined"><br></p><p>二：布局页_Layout.cshtml上调用</p><p>不灵活，不能传递数据，引用静态公共部分</p><p>@Html.Partial("_Head")</p><p>@Html.Partial("~/Views/Shared/_Head.cshtml")</p><p>通过控制器方法引入分部视图，控制器里可以向分部视图传递数据，引用动态公共部分</p><p>@Html.Action("Head", "Home")</p><p>三：代码展示：</p><p>布局页_Layout.cshtml，因为@RenderSection只能放在布局页，所以@Html.Action("Foot", "Home")下面的一坨就没放在_Foot里面，会报错。</p><p></p><p></p><p></p><p>&lt;!DOCTYPE html&gt;</p><p>&lt;html&gt;</p><p>&lt;head&gt;</p><p>&nbsp; &nbsp; &lt;meta charset="utf-8" /&gt;</p><p>&nbsp; &nbsp; &lt;meta name="viewport" content="width=device-width, initial-scale=1.0"&gt;</p><p>&nbsp; &nbsp; &lt;title&gt;@ViewBag.Title&lt;/title&gt;</p><p>&nbsp; &nbsp; @Html.Action("Meta", "Home")</p><p>&nbsp; &nbsp; &lt;link rel="stylesheet" href="~/Content/font-awesome/css/font-awesome.min.css"&gt;</p><p>&nbsp; &nbsp; &lt;link rel="stylesheet" href="~/Content/layui/css/layui.css" /&gt;</p><p>&nbsp; &nbsp; &lt;link rel="stylesheet" href="~/Content/css/master.css" /&gt;</p><p>&nbsp; &nbsp; &lt;link rel="stylesheet" href="~/Content/css/gloable.css" /&gt;</p><p>&nbsp; &nbsp; &lt;link rel="stylesheet" href="~/Content/css/nprogress.css" /&gt;</p><p>&nbsp; &nbsp; @RenderSection("css", required: false)</p><p>&lt;/head&gt;</p><p>&lt;body&gt;</p><p>&nbsp; &nbsp; @Html.Action("Head", "Home")</p><p>&nbsp; &nbsp; @RenderBody()</p><p>&nbsp; &nbsp; @Html.Action("Foot", "Home")</p><p>&nbsp; &nbsp; &lt;script src="~/Content/layui/layui.js"&gt;&lt;/script&gt;</p><p>&nbsp; &nbsp; &lt;script src="~/Content/js/yss/gloable.js"&gt;&lt;/script&gt;</p><p>&nbsp; &nbsp; &lt;script src="~/Content/js/plugins/nprogress.js"&gt;&lt;/script&gt;</p><p>&nbsp; &nbsp; &lt;script&gt;NProgress.start();&lt;/script&gt;</p><p>&nbsp; &nbsp; @RenderSection("js", required: false)</p><p>&nbsp; &nbsp; &lt;script&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; window.onload = function () {</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; NProgress.done();</p><p>&nbsp; &nbsp; &nbsp; &nbsp; };</p><p>&nbsp; &nbsp; &lt;/script&gt;</p><p>&nbsp; &nbsp; &lt;script&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; (function () {</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; var bp = document.createElement(''script'');</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; var curProtocol = window.location.protocol.split('':'')[0];</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (curProtocol === ''https'') {</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bp.src = ''https://zz.bdstatic.com/linksubmit/push.js'';</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; else {</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bp.src = ''http://push.zhanzhang.baidu.com/push.js'';</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; var s = document.getElementsByTagName("script")[0];</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; s.parentNode.insertBefore(bp, s);</p><p>&nbsp; &nbsp; &nbsp; &nbsp; })();</p><p>&nbsp; &nbsp; &lt;/script&gt;</p><p>&lt;/body&gt;</p><p>&lt;/html&gt;</p><p></p><p></p><p></p><p>我把控制器方法写在了首页，因为博客首页头部尾部不公共的，其实写哪里都一样，返回分部视图就ok。</p><p>首页控制器：/Home</p><p>返回分部视图千万不要用 return View(model.GetWebSiteInfo());&nbsp; 会默认找~Views/Home/ 下面的视图，严重错误，IIS Express直接崩掉自动退出</p><p>using RightControl.IService;</p><p>using RightControl.WebApp.Models;</p><p>using System.Web.Mvc;</p><p><br></p><p>namespace RightControl.WebApp.Controllers</p><p>{</p><p>&nbsp; &nbsp; public class HomeController : Controller</p><p>&nbsp; &nbsp; {</p><p>&nbsp; &nbsp; &nbsp; &nbsp; public IArticleService service { get; set; }</p><p>&nbsp; &nbsp; &nbsp; &nbsp; WebSiteInfo model = new WebSiteInfo();</p><p>&nbsp; &nbsp; &nbsp; &nbsp; // GET: Home</p><p>&nbsp; &nbsp; &nbsp; &nbsp; public ActionResult Index()</p><p>&nbsp; &nbsp; &nbsp; &nbsp; {</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ViewBag.HotArtileList = service.GetHotArticle(3);</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return View(model.GetWebSiteInfo());</p><p>&nbsp; &nbsp; &nbsp; &nbsp; }</p><p>&nbsp; &nbsp; &nbsp; &nbsp; public ActionResult Meta()</p><p>&nbsp; &nbsp; &nbsp; &nbsp; {</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ViewBag.Site = model.GetWebSiteInfo();</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return PartialView("~/Views/Shared/_Meta.cshtml");</p><p>&nbsp; &nbsp; &nbsp; &nbsp; }</p><p>&nbsp; &nbsp; &nbsp; &nbsp; public ActionResult Head()</p><p>&nbsp; &nbsp; &nbsp; &nbsp; {</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ViewBag.Site = model.GetWebSiteInfo();</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return PartialView("~/Views/Shared/_Head.cshtml");</p><p>&nbsp; &nbsp; &nbsp; &nbsp; }</p><p>&nbsp; &nbsp; &nbsp; &nbsp; public ActionResult Foot()</p><p>&nbsp; &nbsp; &nbsp; &nbsp; {</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ViewBag.Site = model.GetWebSiteInfo();</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return PartialView("/Views/Shared/_Foot.cshtml");</p><p>&nbsp; &nbsp; &nbsp; &nbsp; }</p><p>&nbsp; &nbsp; }</p><p>}</p><p>_Meta.cshtml</p><p>&lt;meta name="keywords" content="@ViewBag.Site.MetaKey" /&gt;</p><p>&lt;meta name="description" content="@ViewBag.Site.MetaDescribe"&gt;</p><p>_Head.cshtml</p><p>&lt;div class="header"&gt;</p><p>&lt;/div&gt;</p><p>&lt;header class="gird-header"&gt;</p><p>&nbsp; &nbsp; &lt;div class="header-fixed"&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &lt;div class="header-inner"&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;a href="javascript:void(0)" class="header-logo" id="logo"&gt;@ViewBag.Site.SiteName&lt;/a&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;nav class="nav" id="nav"&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;ul&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;li&gt;&lt;a href="/Home"&gt;首页&lt;/a&gt;&lt;/li&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;li&gt;&lt;a href="/Article"&gt;博客&lt;/a&gt;&lt;/li&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;li&gt;&lt;a href="/Feedback"&gt;留言&lt;/a&gt;&lt;/li&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;li&gt;&lt;a href="/Diarys"&gt;日记&lt;/a&gt;&lt;/li&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;li&gt;&lt;a href="/Links"&gt;友链&lt;/a&gt;&lt;/li&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;li&gt;&lt;a href="/About"&gt;关于&lt;/a&gt;&lt;/li&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;/ul&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;/nav&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;a href="/User/QQLogin" class="blog-user"&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;i class="fa fa-qq"&gt;&lt;/i&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;/a&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;a class="phone-menu"&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;i&gt;&lt;/i&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;i&gt;&lt;/i&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;i&gt;&lt;/i&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;/a&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &lt;/div&gt;</p><p>&nbsp; &nbsp; &lt;/div&gt;</p><p>&lt;/header&gt;</p><p>_Foot.cshtml</p><p></p><p>最终效果：</p><pre>&lt;footer <span>class</span>=<span>"</span><span>grid-footer</span><span>"</span>&gt;
    &lt;div <span>class</span>=<span>"</span><span>footer-fixed</span><span>"</span>&gt;
        &lt;div <span>class</span>=<span>"</span><span>copyright</span><span>"</span>&gt;
            &lt;div <span>class</span>=<span>"</span><span>info</span><span>"</span>&gt;
                &lt;div <span>class</span>=<span>"</span><span>contact</span><span>"</span>&gt;
                    &lt;a href=<span>"</span><span>@ViewBag.Site.Gitee</span><span>"</span> <span>class</span>=<span>"</span><span>github</span><span>"</span> target=<span>"</span><span>_blank</span><span>"</span>&gt;&lt;i <span>class</span>=<span>"</span><span>fa fa-github</span><span>"</span>&gt;&lt;/i&gt;&lt;/a&gt;
                    &lt;a href=<span>"</span><span>https://wpa.qq.com/msgrd?v=3&amp;uin=@ViewBag.Site.QQ&amp;site=qq&amp;menu=yes</span><span>"</span> <span>class</span>=<span>"</span><span>qq</span><span>"</span> target=<span>"</span><span>_blank</span><span>"</span> title=<span>"</span><span>@ViewBag.Site.QQ</span><span>"</span>&gt;&lt;i <span>class</span>=<span>"</span><span>fa fa-qq</span><span>"</span>&gt;&lt;/i&gt;&lt;/a&gt;
                    &lt;a href=<span>"</span><span>https://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&amp;email=@ViewBag.Site.Mail</span><span>"</span> <span>class</span>=<span>"</span><span>email</span><span>"</span> target=<span>"</span><span>_blank</span><span>"</span> title=<span>"</span><span>@ViewBag.Site.Mail</span><span>"</span>&gt;&lt;i <span>class</span>=<span>"</span><span>fa fa-envelope</span><span>"</span>&gt;&lt;/i&gt;&lt;/a&gt;
                    &lt;a href=<span>"</span><span>javascript:void(0)</span><span>"</span> <span>class</span>=<span>"</span><span>weixin</span><span>"</span>&gt;&lt;i <span>class</span>=<span>"</span><span>fa fa-weixin</span><span>"</span>&gt;&lt;/i&gt;&lt;/a&gt;
                &lt;/div&gt;
                &lt;p <span>class</span>=<span>"</span><span>mt05</span><span>"</span>&gt;<span>
                    @ViewBag.Site.CopyRight
                </span>&lt;/p&gt;
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/footer&gt;</pre><p><img src="https://www.baocaige.top/Upload/img/1260852-20190712145453950-818976929.jpg" alt="undefined"><br></p><p><img src="https://www.baocaige.top/Upload/img/1260852-20190712145504706-1458531772_1.jpg" alt="undefined"><br></p><p>头部尾部提取公共部分还有一种做法，不用分部视图，直接用布局页：</p><p>新建BaseController控制器，里面获取网站头部尾部需要的WebSiteInfo信息，除开博客首页每个页面的控制器都继承它，布局页直接使用BaseController的WebSiteInfo信息，通过ViewBag的方式给布局页头尾赋值。</p><p>最后总结，个人还是喜欢用分部视图来抽出头部尾部的，继承BaseController的方法虽然不用新建部分视图，但是也要每个有公共头尾的页面控制器去继承它，想想也有点膈应。</p>', 1, 1, 0, 87, 0, 1, CAST(N'2019-07-29T17:20:34.000' AS DateTime), CAST(N'2019-08-10T10:36:52.000' AS DateTime))
INSERT [dbo].[t_article] ([Id], [Title], [ZhaiYao], [ImgUrl], [Content], [TypeId], [ClassId], [Ding], [ReadNum], [CommentNum], [Status], [CreateOn], [UpdateOn]) VALUES (5, N'Dapper+Mysql 使用LIKE模糊查询写法踩坑', N'LIKE ''%@Title%'' 会解析成''%''@Title''%'' 这里用拼接也是不行的''%''+@Title+''%'' 只能用MySQL函数方法拼接', N'/Upload/img/temo123.jpg', N'<p><span>LIKE ''%@Title%'' 会解析成''%''@Title''%'' 这里用拼接也是不行的''%''+@Title+''%'' 只能用MySQL函数方法拼接</span></p><div><div class="cnblogs_Highlighter sh-gutter"><div id="highlighter_940382" class="syntaxhighlighter  csharp"><table border="0" cellpadding="0" cellspacing="0" class="layui-table"><tbody><tr><td class="gutter"><div class="line number1 index0 alt2" style="text-align: right;">1</div><div class="line number2 index1 alt1" style="text-align: right;">2</div><div class="line number3 index2 alt2" style="text-align: right;">3</div><div class="line number4 index3 alt1" style="text-align: right;">4</div><div class="line number5 index4 alt2" style="text-align: right;">5</div><div class="line number6 index5 alt1" style="text-align: right;">6</div><div class="line number7 index6 alt2" style="text-align: right;">7</div><div class="line number8 index7 alt1" style="text-align: right;">8</div><div class="line number9 index8 alt2" style="text-align: right;">9</div><div class="line number10 index9 alt1" style="text-align: right;">10</div><div class="line number11 index10 alt2" style="text-align: right;">11</div><div class="line number12 index11 alt1" style="text-align: right;">12</div><div class="line number13 index12 alt2" style="text-align: right;">13</div><div class="line number14 index13 alt1" style="text-align: right;">14</div></td><td class="code"><div class="container"><div class="line number1 index0 alt2"><code class="csharp keyword">public</code>&nbsp;<code class="csharp plain">dynamic GetListByFilter(ArticleModel filter, PageInfo pageInfo)</code></div><div class="line number2 index1 alt1"><code class="csharp spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="csharp plain">{</code></div><div class="line number3 index2 alt2"><code class="csharp spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="csharp keyword">string</code>&nbsp;<code class="csharp plain">_where =&nbsp;</code><code class="csharp string">" where 1=1"</code><code class="csharp plain">;</code></div><div class="line number4 index3 alt1"><code class="csharp spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="csharp keyword">if</code>&nbsp;<code class="csharp plain">(!</code><code class="csharp keyword">string</code><code class="csharp plain">.IsNullOrEmpty(filter.Title))</code></div><div class="line number5 index4 alt2"><code class="csharp spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="csharp plain">{</code></div><div class="line number6 index5 alt1"><code class="csharp spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="csharp comments">//LIKE ''%@Title%'' 会解析成''%''@Title''%'' 这里用拼接也是不行的''%''+@Title+''%'' 只能用MySQL函数方法拼接</code></div><div class="line number7 index6 alt2"><code class="csharp spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="csharp plain">_where +=&nbsp;</code><code class="csharp string">" and Title LIKE CONCAT(''%'',@Title,''%'')"</code><code class="csharp plain">;</code></div><div class="line number8 index7 alt1"><code class="csharp spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="csharp plain">}</code></div><div class="line number9 index8 alt2"><code class="csharp spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="csharp keyword">if</code>&nbsp;<code class="csharp plain">(filter.Status !=&nbsp;</code><code class="csharp keyword">null</code><code class="csharp plain">)</code></div><div class="line number10 index9 alt1"><code class="csharp spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="csharp plain">{</code></div><div class="line number11 index10 alt2"><code class="csharp spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="csharp plain">_where +=&nbsp;</code><code class="csharp string">" and Status=@Status"</code><code class="csharp plain">;</code></div><div class="line number12 index11 alt1"><code class="csharp spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="csharp plain">}</code></div><div class="line number13 index12 alt2"><code class="csharp spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="csharp keyword">return</code>&nbsp;<code class="csharp plain">GetListByFilter(filter, pageInfo, _where);</code></div><div class="line number14 index13 alt1"><code class="csharp spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="csharp plain">}</code></div></div></td></tr></tbody></table></div></div></div>', 1, 3, 0, 20, 0, 1, CAST(N'2019-07-29T17:24:18.000' AS DateTime), CAST(N'2019-07-29T17:24:22.000' AS DateTime))
INSERT [dbo].[t_article] ([Id], [Title], [ZhaiYao], [ImgUrl], [Content], [TypeId], [ClassId], [Ding], [ReadNum], [CommentNum], [Status], [CreateOn], [UpdateOn]) VALUES (6, N'Mysql开启远程连接', N'首先登录mysql： 然后执行下面两条命令就可开启mysql远程连接： 最后成功连上服务器的MySQL，ლ(•̀ _ •́ ლ)', N'/Upload/img/mysql.jpg', N'<p>首先登录mysql：</p><p><img src="/Upload/img/1260852-20190620183134180-861990751.png" alt="undefined"><br></p><p>然后执行下面两条命令就可开启mysql远程连接：</p><div class="cnblogs_code"><pre><span>#允许所有用户远程访问 修改用户名和密码为你自己的
mysql</span>&gt; GRANT ALL PRIVILEGES ON *.* TO <span>''</span><span>USERNAME</span><span>''</span>@<span>''</span><span>%</span><span>''</span> IDENTIFIED BY <span>''</span><span>PASSWORD</span><span>''</span><span> WITH GRANT OPTION;
#允许单个ip 修改用户名和密码为你自己的
mysql</span>&gt; GRANT ALL PRIVILEGES ON *.* TO <span>''</span><span>USERNAME</span><span>''</span>@<span>''</span><span>1.2.3.4</span><span>''</span> IDENTIFIED BY <span>''</span><span>PASSWORD</span><span>''</span><span> WITH GRANT OPTION;
#最后
mysql</span>&gt; FLUSH PRIVILEGES;</pre></div><p><img src="/Upload/img/1260852-20190620182652975-893533851.png" alt="undefined"><br></p><p>最后成功连上服务器的MySQL，ლ(•̀ _ •́ ლ)</p>', 1, 3, 0, 53, 0, 1, CAST(N'2019-07-29T17:32:11.000' AS DateTime), CAST(N'2019-08-01T09:30:50.000' AS DateTime))
INSERT [dbo].[t_article] ([Id], [Title], [ZhaiYao], [ImgUrl], [Content], [TypeId], [ClassId], [Ding], [ReadNum], [CommentNum], [Status], [CreateOn], [UpdateOn]) VALUES (7, N'ASP.NET MVC Liu_Cabbage 个人博客', N'RightControl_Blog 介绍 前台使用燕十三博客前端模板，后台基于RightControl .NET通用角色权限管理系统搭建，已完成。 项目地址：http://www.baocaige.top 码云地址：https://gitee.com/Liu_Cabbage/RightControl_Blog', N'/Upload/img/bkfm.jpg', N'<h1>RightControl_Blog</h1><h4><a id="介绍" class="anchor" href="https://gitee.com/Liu_Cabbage/RightControl_Blog#%E4%BB%8B%E7%BB%8D"></a>介绍</h4><p>前台使用燕十三博客前端模板，后台基于RightControl .NET通用角色权限管理系统搭建，已完成。<br>项目地址：<a href="http://www.baocaige.top/">http://www.baocaige.top</a><br>码云地址：<a href="https://gitee.com/Liu_Cabbage/RightControl_Blog" target="_blank">https://gitee.com/Liu_Cabbage/RightControl_Blog</a></p><p>使用说明</p><p>1.先创建数据库，然后执行sql目录下面的CMS.sql即可。</p><p>2.账号：admin</p><p>3.密码：123456</p><p>项目说明</p><p>1.前台使用燕十三博客前端模板，美观大气。</p><p>2.后台基于RightControl .NET通用角色权限管理系统搭建，节省开发时间。</p><p>3.接入QQ互联，一键登录，降低注册门槛。</p><p>4.网站设置使用XML配置，新增开启评论，开启留言开关。</p><p>5.关于Layui流加载文章列表，评论，留言都是后台拼接，且每页显示数量在对应控制器里可修改。</p><p>6.新增今日评论，留言最大数量配置，每日提交超过后台设置的数量将自动锁定QQ用户。</p><p>项目的其他想法</p><p>1.由于QQ互联不返回QQ号，所以t_qq_user里的Email为空，评论留言的回复邮件通知我没做（要做的话回复的时候判断一下，让用户补充邮箱。）</p><p>2.文章编辑器用的是Layedit，功能有点弱，但是Layui文档全，用的比较舒服（我试过改用wangEditor，只需要引用一个js，但是它上传的图片也是不能右键修改图片大小的，还要重写图片上传方法，我枯了，就退回了Layedit的版本。）</p><p>3.编辑器推荐：KindEditor，UEditor。</p><p>4.流加载文章列表，评论，留言后台拼接代码可优化，双重foreach+if，怎么看都有点沙雕。</p><p><b>项目截图</b></p><p><img src="/Upload/img/20190730002458976.png" alt="undefined"></p><p><img src="/Upload/img/20190730002517995.png" alt="undefined"><br></p><p><img src="/Upload/img/20190730002531922.png" alt="undefined"><br></p><p><img src="/Upload/img/1_1.jpg" alt="undefined"><br></p>', 1, 1, 1, 32, 0, 1, CAST(N'2019-08-10T00:00:00.000' AS DateTime), CAST(N'2019-08-11T19:33:38.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[t_article] OFF
SET IDENTITY_INSERT [dbo].[t_article_class] ON 

INSERT [dbo].[t_article_class] ([Id], [Name], [OrderNo], [CreateOn]) VALUES (1, N'ASP.NET MVC', 0, CAST(N'2019-07-09T15:05:08.000' AS DateTime))
INSERT [dbo].[t_article_class] ([Id], [Name], [OrderNo], [CreateOn]) VALUES (2, N'ORM', 0, CAST(N'2019-07-09T15:08:46.000' AS DateTime))
INSERT [dbo].[t_article_class] ([Id], [Name], [OrderNo], [CreateOn]) VALUES (3, N'MySQL', 0, CAST(N'2019-07-09T15:09:14.000' AS DateTime))
INSERT [dbo].[t_article_class] ([Id], [Name], [OrderNo], [CreateOn]) VALUES (4, N'SQL Server', 0, CAST(N'2019-07-09T15:09:38.000' AS DateTime))
INSERT [dbo].[t_article_class] ([Id], [Name], [OrderNo], [CreateOn]) VALUES (5, N'WEB前端', 0, CAST(N'2019-07-09T15:09:40.000' AS DateTime))
INSERT [dbo].[t_article_class] ([Id], [Name], [OrderNo], [CreateOn]) VALUES (6, N'IIS', 0, CAST(N'2019-07-09T15:09:48.000' AS DateTime))
INSERT [dbo].[t_article_class] ([Id], [Name], [OrderNo], [CreateOn]) VALUES (7, N'BUG记录', 0, CAST(N'2019-07-09T15:09:58.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[t_article_class] OFF
SET IDENTITY_INSERT [dbo].[t_article_type] ON 

INSERT [dbo].[t_article_type] ([Id], [Name], [CreateOn]) VALUES (1, N'原创', CAST(N'2019-06-25T18:32:10.000' AS DateTime))
INSERT [dbo].[t_article_type] ([Id], [Name], [CreateOn]) VALUES (2, N'转载', CAST(N'2019-06-25T18:32:13.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[t_article_type] OFF
SET IDENTITY_INSERT [dbo].[t_diarys] ON 

INSERT [dbo].[t_diarys] ([Id], [Content], [CreateOn]) VALUES (1, N'<p><img src="https://www.baocaige.top/Areas/Admin/plugins/layui/images/face/70.gif" alt="[蜡烛]">2019.7.29 Liu_Cabbage 博客正式上线啦！！！<img src="https://www.baocaige.top/Areas/Admin/plugins/layui/images/face/70.gif" alt="[蜡烛]"></p>', CAST(N'2019-07-29T12:18:33.000' AS DateTime))
INSERT [dbo].[t_diarys] ([Id], [Content], [CreateOn]) VALUES (2, N'<img src="https://www.baocaige.top/Areas/Admin/plugins/layui/images/face/66.gif" alt="[奥特曼]">欢迎大家留言评论，不要玩XSS哦！！！', CAST(N'2019-07-29T16:38:28.000' AS DateTime))
INSERT [dbo].[t_diarys] ([Id], [Content], [CreateOn]) VALUES (3, N'<p><img src="https://www.baocaige.top/Areas/Admin/plugins/layui/images/face/39.gif" alt="[鼓掌]">修复文章评论和留言关闭还可回复</p><p><img src="https://www.baocaige.top/Areas/Admin/plugins/layui/images/face/39.gif" alt="[鼓掌]">web.config 添加400 505页面</p><p><img src="https://www.baocaige.top/Areas/Admin/plugins/layui/images/face/39.gif" alt="[鼓掌]">web.config 添加https woff2</p><p><img src="https://www.baocaige.top/Areas/Admin/plugins/layui/images/face/39.gif" alt="[鼓掌]">修复城市js https</p><p><img src="https://www.baocaige.top/Areas/Admin/plugins/layui/images/face/39.gif" alt="[鼓掌]">修复默认隐藏登录头像属性title="</p>', CAST(N'2019-08-01T12:33:26.000' AS DateTime))
INSERT [dbo].[t_diarys] ([Id], [Content], [CreateOn]) VALUES (4, N'<p><img src="https://www.baocaige.top/Areas/Admin/plugins/layui/images/face/62.gif" alt="[浮云]">竹杖芒鞋轻胜马，一蓑烟雨任平生<img src="https://www.baocaige.top/Areas/Admin/plugins/layui/images/face/62.gif" alt="[浮云]"></p>', CAST(N'2019-08-03T17:41:42.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[t_diarys] OFF
SET IDENTITY_INSERT [dbo].[t_feedback] ON 

INSERT [dbo].[t_feedback] ([Id], [SendId], [AcceptId], [Content], [ParentId], [City], [Equip], [CreateOn]) VALUES (1, 1, 0, N'<img src="https://www.baocaige.top/Content/layui/images/face/66.gif" alt="[奥特曼]">少年来一发，看我奥特激光<img src="https://www.baocaige.top/Content/layui/images/face/66.gif" alt="[奥特曼]">', 0, N'江西省南昌市', N'Chrome浏览器', CAST(N'2019-07-30T00:29:47.000' AS DateTime))
INSERT [dbo].[t_feedback] ([Id], [SendId], [AcceptId], [Content], [ParentId], [City], [Equip], [CreateOn]) VALUES (2, 6, 0, N'<p><img src="https://www.baocaige.top/Content/layui/images/face/64.gif" alt="[围观]">围观小怪兽打奥特曼<img src="https://www.baocaige.top/Content/layui/images/face/64.gif" alt="[围观]"></p>', 0, N'江西省', N'Chrome浏览器', CAST(N'2019-07-30T10:14:03.000' AS DateTime))
INSERT [dbo].[t_feedback] ([Id], [SendId], [AcceptId], [Content], [ParentId], [City], [Equip], [CreateOn]) VALUES (3, 5, 0, N'<p>&lt;javascript type=''''text/<span>javascript"&gt;alert("这是xxs？")&lt;/</span>javascript&gt;</p>', 0, N'CHINA', N'Chrome浏览器', CAST(N'2019-07-30T10:17:08.000' AS DateTime))
INSERT [dbo].[t_feedback] ([Id], [SendId], [AcceptId], [Content], [ParentId], [City], [Equip], [CreateOn]) VALUES (4, 1, 6, N'爱了爱了，走位走位，蛇皮怪！！！', 2, N'江西省南昌市', N'Chrome浏览器', CAST(N'2019-07-30T10:17:22.000' AS DateTime))
INSERT [dbo].[t_feedback] ([Id], [SendId], [AcceptId], [Content], [ParentId], [City], [Equip], [CreateOn]) VALUES (39, 1, 1, N'0.0', 2, N'江西省南昌市', N'Chrome浏览器', CAST(N'2019-07-31T12:16:17.000' AS DateTime))
INSERT [dbo].[t_feedback] ([Id], [SendId], [AcceptId], [Content], [ParentId], [City], [Equip], [CreateOn]) VALUES (40, 8, 0, N'<p>名称：洋芋 &amp; 土豆<br>网址：www.love208.vip<br>图标：http://cdn.love208.vip/logo.png<br></p><p>描述：用来记录我们两人相识、相恋过程中的点点滴滴，留住两个人的美好回忆。上班后这里也变成了有技术文章的笔记站，如果你喜欢我们的情侣博客，记得留言互动！</p><p><br></p><p>注: 友链已添加</p>', 0, N'CHINA', N'Chrome浏览器', CAST(N'2019-08-03T10:57:12.000' AS DateTime))
INSERT [dbo].[t_feedback] ([Id], [SendId], [AcceptId], [Content], [ParentId], [City], [Equip], [CreateOn]) VALUES (41, 1, 8, N'已添加，没做回复邮箱提醒，扎心', 40, N'江西省南昌市', N'Chrome浏览器', CAST(N'2019-08-03T14:53:46.000' AS DateTime))
INSERT [dbo].[t_feedback] ([Id], [SendId], [AcceptId], [Content], [ParentId], [City], [Equip], [CreateOn]) VALUES (42, 1, 1, N'我回复我自己，(｡･∀･)ﾉﾞ嗨', 1, N'江西省南昌市', N'Edge浏览器', CAST(N'2019-08-03T16:26:51.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[t_feedback] OFF
SET IDENTITY_INSERT [dbo].[t_links] ON 

INSERT [dbo].[t_links] ([Id], [Name], [Url], [Icon], [Describe], [CreateOn]) VALUES (1, N'一款简洁优雅的hexo主题', N'https://zhousiwei.gitee.io', N'https://zhousiwei.gitee.io/img/head.jpg', N'一个简洁优雅的hexo主题 A simple and elegant theme for hexo.可以快速使用上手。（我徒弟，多多支持）', CAST(N'2019-07-28T11:09:03.000' AS DateTime))
INSERT [dbo].[t_links] ([Id], [Name], [Url], [Icon], [Describe], [CreateOn]) VALUES (2, N'燕十三', N'https://www.yanshisan.cn', N'https://www.yanshisan.cn/logo.png', N'剑气纵横三万里，一剑光寒十九洲。', CAST(N'2019-07-29T08:16:49.000' AS DateTime))
INSERT [dbo].[t_links] ([Id], [Name], [Url], [Icon], [Describe], [CreateOn]) VALUES (3, N'Mr.LUCK', N'http://www.zhyjohn.cn', N'https://www.zhyjohn.cn/image/head.jpg', N'想法总是美好的，现实往往都是残酷的', CAST(N'2019-07-30T09:59:09.000' AS DateTime))
INSERT [dbo].[t_links] ([Id], [Name], [Url], [Icon], [Describe], [CreateOn]) VALUES (4, N'柒情博客', N'http://www.ityw.club/blog/showArticle', N'http://www.ityw.club/favicon.ico', N'个人博客', CAST(N'2019-07-30T10:03:02.000' AS DateTime))
INSERT [dbo].[t_links] ([Id], [Name], [Url], [Icon], [Describe], [CreateOn]) VALUES (5, N'洋芋 & 土豆', N'https://love208.vip', N'http://cdn.love208.vip/logo.png', N'用来记录我们两人相识、相恋过程中的点点滴滴，留住两个人的美好回忆。上班后这里也变成了有技术文章的笔记站，如果你喜欢我们的情侣博客，记得留言互动！', CAST(N'2019-08-03T14:49:48.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[t_links] OFF
SET IDENTITY_INSERT [dbo].[t_log] ON 

INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (1, N'Login', N'admin', N'超级管理员', N'系统登录', N'登录成功', CAST(N'2019-07-29T22:12:18.000' AS DateTime), N'182.85.213.199', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (2, N'Login', N'admin', N'admin', N'系统登录', N'登录失败，用户名或密码错误。', CAST(N'2019-07-29T23:33:33.000' AS DateTime), N'182.85.213.199', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (3, N'Login', N'admin', N'admin', N'系统登录', N'登录失败，用户名或密码错误。', CAST(N'2019-07-29T23:33:39.000' AS DateTime), N'182.85.213.199', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (4, N'Login', N'admin', N'admin', N'系统登录', N'登录失败，用户名或密码错误。', CAST(N'2019-07-29T23:33:48.000' AS DateTime), N'182.85.213.199', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (5, N'Login', N'admin', N'admin', N'系统登录', N'登录失败，验证码错误，请重新输入', CAST(N'2019-07-29T23:33:56.000' AS DateTime), N'182.85.213.199', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (6, N'Login', N'admin', N'超级管理员', N'系统登录', N'登录成功', CAST(N'2019-07-29T23:34:01.000' AS DateTime), N'182.85.213.199', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (7, N'Exit', N'admin', N'超级管理员', N'', N'安全退出系统', CAST(N'2019-07-30T00:14:26.000' AS DateTime), N'182.85.213.199', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (8, N'Login', N'admin', N'超级管理员', N'系统登录', N'登录成功', CAST(N'2019-07-30T09:47:02.000' AS DateTime), N'59.53.221.240', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (9, N'Exit', N'admin', N'超级管理员', N'', N'安全退出系统', CAST(N'2019-07-30T09:49:17.000' AS DateTime), N'59.53.221.240', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (10, N'Login', N'admin', N'超级管理员', N'系统登录', N'登录成功', CAST(N'2019-07-30T09:58:16.000' AS DateTime), N'59.53.221.240', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (11, N'Exit', N'admin', N'超级管理员', N'', N'安全退出系统', CAST(N'2019-07-30T10:28:37.000' AS DateTime), N'59.53.221.240', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (12, N'Login', N'admin', N'admin', N'系统登录', N'登录失败，用户名或密码错误。', CAST(N'2019-07-30T15:13:40.000' AS DateTime), N'59.53.221.240', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (13, N'Login', N'admin', N'超级管理员', N'系统登录', N'登录成功', CAST(N'2019-07-30T15:13:49.000' AS DateTime), N'59.53.221.240', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (14, N'Exit', N'admin', N'超级管理员', N'', N'安全退出系统', CAST(N'2019-07-30T15:16:14.000' AS DateTime), N'59.53.221.240', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (15, N'Login', N'admin', N'admin', N'系统登录', N'登录失败，用户名或密码错误。', CAST(N'2019-07-30T15:16:28.000' AS DateTime), N'59.53.221.240', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (16, N'Login', N'lsy', N'lsy', N'系统登录', N'登录成功', CAST(N'2019-07-30T15:16:37.000' AS DateTime), N'59.53.221.240', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (17, N'Exit', N'lsy', N'lsy', N'', N'安全退出系统', CAST(N'2019-07-30T15:19:44.000' AS DateTime), N'59.53.221.240', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (18, N'Login', N'lsy', N'lsy', N'系统登录', N'登录成功', CAST(N'2019-07-31T11:07:51.000' AS DateTime), N'59.53.221.240', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (19, N'Exit', N'lsy', N'lsy', N'', N'安全退出系统', CAST(N'2019-07-31T11:26:28.000' AS DateTime), N'59.53.221.240', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (20, N'Login', N'lsy', N'lsy', N'系统登录', N'登录成功', CAST(N'2019-07-31T12:00:47.000' AS DateTime), N'59.53.221.240', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (21, N'Exit', N'lsy', N'lsy', N'', N'安全退出系统', CAST(N'2019-07-31T12:08:17.000' AS DateTime), N'59.53.221.240', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (22, N'Login', N'lsy', N'lsy', N'系统登录', N'登录成功', CAST(N'2019-07-31T14:11:51.000' AS DateTime), N'59.53.221.240', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (23, N'Login', N'lsy', N'lsy', N'系统登录', N'登录成功', CAST(N'2019-08-01T00:46:14.000' AS DateTime), N'182.85.212.205', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (24, N'Login', N'lsy', N'lsy', N'系统登录', N'登录成功', CAST(N'2019-08-01T09:30:03.000' AS DateTime), N'59.53.221.240', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (25, N'Exit', N'lsy', N'lsy', N'', N'安全退出系统', CAST(N'2019-08-01T09:55:39.000' AS DateTime), N'59.53.221.240', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (26, N'Login', N'lsy', N'lsy', N'系统登录', N'登录成功', CAST(N'2019-08-01T11:51:31.000' AS DateTime), N'59.52.205.69', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (27, N'Login', N'lsy', N'lsy', N'系统登录', N'登录成功', CAST(N'2019-08-02T18:29:21.000' AS DateTime), N'59.52.205.69', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (28, N'Login', N'lsy', N'lsy', N'系统登录', N'登录成功', CAST(N'2019-08-03T14:48:39.000' AS DateTime), N'59.52.205.69', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (29, N'Login', N'lsy', N'lsy', N'系统登录', N'登录成功', CAST(N'2019-08-03T17:41:05.000' AS DateTime), N'59.52.205.69', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (30, N'Login', N'lsy', N'lsy', N'系统登录', N'登录成功', CAST(N'2019-08-06T09:10:52.000' AS DateTime), N'59.53.220.199', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (31, N'Login', N'lsy', N'lsy', N'系统登录', N'登录成功', CAST(N'2019-08-08T16:29:45.000' AS DateTime), N'59.52.206.18', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (32, N'Login', N'lsy', N'lsy', N'系统登录', N'登录成功', CAST(N'2019-08-10T09:19:34.000' AS DateTime), N'59.52.206.18', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (33, N'Login', N'lsy', N'lsy', N'系统登录', N'登录成功', CAST(N'2019-08-10T09:34:49.000' AS DateTime), N'59.52.206.18', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (34, N'Login', N'lsy', N'lsy', N'系统登录', N'登录成功', CAST(N'2019-08-10T09:46:28.000' AS DateTime), N'59.52.206.18', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (35, N'Login', N'lsy', N'lsy', N'系统登录', N'登录失败，验证码错误，请重新输入', CAST(N'2019-08-10T14:49:33.000' AS DateTime), N'59.53.223.243', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (36, N'Login', N'lsy', N'lsy', N'系统登录', N'登录成功', CAST(N'2019-08-10T14:49:37.000' AS DateTime), N'59.53.223.243', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (37, N'Exit', N'lsy', N'lsy', N'', N'安全退出系统', CAST(N'2019-08-10T15:15:05.000' AS DateTime), N'59.53.223.243', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (38, N'Login', N'lsy', N'lsy', N'系统登录', N'登录失败，用户名或密码错误。', CAST(N'2019-08-11T18:52:30.000' AS DateTime), N'59.53.224.68', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (39, N'Login', N'lsy', N'lsy', N'系统登录', N'登录成功', CAST(N'2019-08-11T18:52:38.000' AS DateTime), N'59.53.224.68', N'江西省南昌市 电信', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (40, N'Login', N'lsy', N'lsy', N'系统登录', N'登录成功', CAST(N'2019-08-11T23:22:46.000' AS DateTime), N'192.168.1.2', N'本地局域网', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (41, N'Exit', N'lsy', N'lsy', N'', N'安全退出系统', CAST(N'2019-08-11T23:24:04.000' AS DateTime), N'192.168.1.2', N'本地局域网', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (42, N'Login', N'admin', N'admin', N'系统登录', N'登录成功', CAST(N'2019-08-11T23:24:14.000' AS DateTime), N'192.168.1.2', N'本地局域网', 1)
SET IDENTITY_INSERT [dbo].[t_log] OFF
SET IDENTITY_INSERT [dbo].[t_menu] ON 

INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (1, N'权限管理', N'', N'icon-setting-permissions', 1, 0, 1, CAST(N'2019-02-28T15:03:14.000' AS DateTime), CAST(N'2019-06-17T17:11:25.000' AS DateTime), 0, 1)
INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (2, N'菜单管理', N'/permissions/menu', N'icon-caidan', 1, 1, 1, CAST(N'2019-02-28T15:03:20.000' AS DateTime), CAST(N'2019-02-28T15:03:23.000' AS DateTime), 0, 0)
INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (3, N'角色管理', N'/permissions/role', N'icon-jiaoseguanli', 2, 1, 1, CAST(N'2019-02-28T15:03:25.000' AS DateTime), CAST(N'2019-02-28T15:03:29.000' AS DateTime), 0, 0)
INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (4, N'用户管理', N'/permissions/user', N'icon-yonghu', 3, 1, 1, CAST(N'2019-02-28T15:03:32.000' AS DateTime), CAST(N'2019-02-28T15:03:35.000' AS DateTime), 0, 0)
INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (5, N'操作管理', N'/permissions/action', N'icon-shezhi', 4, 1, 1, CAST(N'2019-02-28T15:03:39.000' AS DateTime), CAST(N'2019-02-28T15:03:43.000' AS DateTime), 0, 0)
INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (6, N'系统设置', N'', N'icon-xitong', 2, 0, 1, CAST(N'2019-02-28T15:03:46.000' AS DateTime), CAST(N'2019-02-28T15:03:48.000' AS DateTime), 0, 0)
INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (7, N'网站设置', N'/sysset/website', N'icon-ditu', 1, 6, 1, CAST(N'2019-02-28T15:03:51.000' AS DateTime), CAST(N'2019-02-28T15:03:53.000' AS DateTime), 0, 0)
INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (8, N'基本资料', N'/SysSet/info', N'icon-jibenziliao', 2, 6, 1, CAST(N'2019-02-28T15:03:56.000' AS DateTime), CAST(N'2019-02-28T15:03:58.000' AS DateTime), 0, 0)
INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (9, N'修改密码', N'/SysSet/password', N'icon-xiugaimima', 3, 6, 1, CAST(N'2019-02-28T15:04:02.000' AS DateTime), CAST(N'2019-02-28T15:04:05.000' AS DateTime), 0, 0)
INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (10, N'日志管理', N'/SysSet/Log', N'icon-xitongrizhi', 4, 6, 1, CAST(N'2019-02-28T15:04:07.000' AS DateTime), CAST(N'2019-02-28T15:04:10.000' AS DateTime), 0, 0)
INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (11, N'博客管理', N'', N'icon-zhuye', 0, 0, 1, CAST(N'2019-06-24T14:24:51.000' AS DateTime), CAST(N'2019-06-30T14:24:51.000' AS DateTime), 1, 0)
INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (12, N'文章类型', N'/Blog/ArticleType', N'icon-jibenziliao', 7, 11, 1, CAST(N'2019-06-24T14:32:31.000' AS DateTime), CAST(N'2019-06-29T17:41:30.000' AS DateTime), 1, 1)
INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (13, N'文章分类', N'/Blog/ArticleClass', N'icon-jibenziliao', 6, 11, 1, CAST(N'2019-06-24T14:51:05.000' AS DateTime), CAST(N'2019-06-25T18:06:46.000' AS DateTime), 1, 1)
INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (14, N'友情链接', N'/Blog/Links', N'icon-jibenziliao', 4, 11, 1, CAST(N'2019-06-24T14:55:33.000' AS DateTime), CAST(N'2019-06-29T18:12:35.000' AS DateTime), 1, 1)
INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (15, N'日记管理', N'/Blog/Diarys', N'icon-jibenziliao', 3, 11, 1, CAST(N'2019-06-24T15:00:40.000' AS DateTime), CAST(N'2019-06-29T23:19:47.000' AS DateTime), 1, 1)
INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (16, N'文章管理', N'/Blog/Article', N'icon-jibenziliao', 0, 11, 1, CAST(N'2019-06-24T15:02:17.000' AS DateTime), CAST(N'2019-07-01T11:11:49.000' AS DateTime), 1, 1)
INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (17, N'评论管理', N'/Blog/Comment', N'icon-jibenziliao', 1, 11, 1, CAST(N'2019-06-25T15:45:24.000' AS DateTime), CAST(N'2019-07-01T11:11:08.000' AS DateTime), 1, 1)
INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (18, N'留言管理', N'/Blog/Feedback', N'icon-jibenziliao', 2, 11, 1, CAST(N'2019-06-25T15:45:49.000' AS DateTime), CAST(N'2019-07-01T11:10:29.000' AS DateTime), 1, 1)
INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (19, N'用户管理', N'/Blog/QQUser', N'icon-jibenziliao', 5, 11, 1, CAST(N'2019-06-25T15:46:43.000' AS DateTime), CAST(N'2019-06-30T19:52:18.000' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[t_menu] OFF
SET IDENTITY_INSERT [dbo].[t_menu_action] ON 

INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (2, 1)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (2, 2)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (2, 4)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (2, 8)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (3, 1)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (3, 2)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (3, 3)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (3, 4)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (3, 6)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (4, 1)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (4, 2)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (4, 3)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (4, 4)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (4, 5)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (5, 1)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (5, 2)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (5, 3)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (5, 4)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (10, 4)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (10, 7)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (12, 1)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (12, 2)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (12, 3)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (12, 4)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (13, 1)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (13, 2)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (13, 3)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (13, 4)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (14, 1)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (14, 2)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (14, 3)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (14, 4)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (15, 1)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (15, 2)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (15, 3)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (15, 4)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (16, 1)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (16, 2)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (16, 3)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (16, 4)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (17, 3)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (17, 4)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (18, 3)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (18, 4)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (19, 2)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (19, 3)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (19, 4)
SET IDENTITY_INSERT [dbo].[t_menu_action] OFF
SET IDENTITY_INSERT [dbo].[t_menu_role_action] ON 

INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (1, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (2, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (2, 1, 1)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (2, 1, 2)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (2, 1, 4)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (2, 1, 8)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (3, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (3, 1, 1)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (3, 1, 2)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (3, 1, 3)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (3, 1, 4)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (3, 1, 6)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (4, 0, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (4, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (4, 1, 1)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (4, 1, 2)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (4, 1, 3)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (4, 1, 4)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (4, 1, 5)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (5, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (5, 1, 1)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (5, 1, 2)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (5, 1, 3)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (5, 1, 4)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (6, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (7, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (8, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (9, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (10, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (10, 1, 4)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (10, 1, 7)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (11, 0, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (11, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (12, 0, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (12, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (12, 1, 1)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (12, 1, 2)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (12, 1, 3)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (12, 1, 4)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (13, 0, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (13, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (13, 1, 1)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (13, 1, 2)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (13, 1, 3)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (13, 1, 4)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (14, 0, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (14, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (14, 1, 1)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (14, 1, 2)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (14, 1, 3)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (14, 1, 4)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (15, 0, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (15, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (15, 1, 1)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (15, 1, 2)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (15, 1, 3)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (15, 1, 4)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (16, 0, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (16, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (16, 1, 1)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (16, 1, 2)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (16, 1, 3)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (16, 1, 4)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (17, 0, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (17, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (17, 1, 3)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (17, 1, 4)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (18, 0, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (18, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (18, 1, 3)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (18, 1, 4)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (19, 0, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (19, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (19, 1, 2)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (19, 1, 3)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (19, 1, 4)
SET IDENTITY_INSERT [dbo].[t_menu_role_action] OFF
SET IDENTITY_INSERT [dbo].[t_qq_user] ON 

INSERT [dbo].[t_qq_user] ([Id], [OpenId], [NickName], [Gender], [HeadShot], [Email], [Status], [LastLogin], [CreateOn]) VALUES (1, N'5DB22905E4DA3582E221CE85737059C1', N'蚯蚓', 1, N'http://thirdqq.qlogo.cn/g?b=oidb&k=q8BmhyWUTZEpo7Us6QTqhA&s=140&t=1557712926', N'', 1, CAST(N'2019-08-11T18:54:03.000' AS DateTime), CAST(N'2019-07-29T21:49:52.000' AS DateTime))
INSERT [dbo].[t_qq_user] ([Id], [OpenId], [NickName], [Gender], [HeadShot], [Email], [Status], [LastLogin], [CreateOn]) VALUES (2, N'FBAE41D869FA327AB33AA16D9D9C5E97', N'小蚯蚓', 1, N'https://thirdqq.qlogo.cn/g?b=oidb&k=g4LbktibR4Q0eC4RIjiagmvw&s=140&t=1552461721', N'', 1, CAST(N'2019-07-29T22:34:54.000' AS DateTime), CAST(N'2019-07-29T21:50:35.000' AS DateTime))
INSERT [dbo].[t_qq_user] ([Id], [OpenId], [NickName], [Gender], [HeadShot], [Email], [Status], [LastLogin], [CreateOn]) VALUES (3, N'D4092B8AFE758DB49252E8B7AEFDC2AC', N'煜昕网络工作室', 1, N'https://thirdqq.qlogo.cn/g?b=oidb&k=diaDg89owmSJCjiaxqSJL54Q&s=140&t=1556350484', N'', 1, CAST(N'2019-07-29T21:51:21.000' AS DateTime), CAST(N'2019-07-29T21:51:21.000' AS DateTime))
INSERT [dbo].[t_qq_user] ([Id], [OpenId], [NickName], [Gender], [HeadShot], [Email], [Status], [LastLogin], [CreateOn]) VALUES (4, N'7AE01F1862D52C452B296158F17AF25E', N'小小小蚯蚓', 1, N'https://thirdqq.qlogo.cn/g?b=oidb&k=TI6MEZXl7gGtkTribiah3icvA&s=140&t=1552461754', N'', 1, CAST(N'2019-07-29T21:55:44.000' AS DateTime), CAST(N'2019-07-29T21:55:44.000' AS DateTime))
INSERT [dbo].[t_qq_user] ([Id], [OpenId], [NickName], [Gender], [HeadShot], [Email], [Status], [LastLogin], [CreateOn]) VALUES (5, N'2D8289F875ECA7FF64C388A336E7D2DC', N'--', 1, N'https://thirdqq.qlogo.cn/g?b=oidb&k=VFjtC0gWn9YLqQaoBOfWEw&s=100&t=1557278201', N'', 1, CAST(N'2019-07-30T10:13:33.000' AS DateTime), CAST(N'2019-07-30T10:13:33.000' AS DateTime))
INSERT [dbo].[t_qq_user] ([Id], [OpenId], [NickName], [Gender], [HeadShot], [Email], [Status], [LastLogin], [CreateOn]) VALUES (6, N'3AC542CEB2BDB3261F98691E1F851CC8', N'莫ღ汐白丶', 1, N'https://thirdqq.qlogo.cn/g?b=oidb&k=4dfr86UrnVsAbaYxZ4IYOA&s=140&t=1556771291', N'', 1, CAST(N'2019-07-30T10:14:01.000' AS DateTime), CAST(N'2019-07-30T10:14:01.000' AS DateTime))
INSERT [dbo].[t_qq_user] ([Id], [OpenId], [NickName], [Gender], [HeadShot], [Email], [Status], [LastLogin], [CreateOn]) VALUES (7, N'E3133C803C5DACA8AB13F000769E5787', N'試毅-思伟✅已认证', 1, N'https://thirdqq.qlogo.cn/g?b=oidb&k=dtcicI20RLTIMFQlqJ3txuA&s=140&t=1557096682', N'', 1, CAST(N'2019-07-31T11:44:20.000' AS DateTime), CAST(N'2019-07-31T11:44:20.000' AS DateTime))
INSERT [dbo].[t_qq_user] ([Id], [OpenId], [NickName], [Gender], [HeadShot], [Email], [Status], [LastLogin], [CreateOn]) VALUES (8, N'9587B49F81E6C2141B1128288F13EA1E', N'洋芋', 1, N'http://thirdqq.qlogo.cn/g?b=oidb&k=9yqHfWPhCjxice8ZtqETsUg&s=140&t=1556092932', N'', 1, CAST(N'2019-08-03T10:57:05.000' AS DateTime), CAST(N'2019-08-03T10:57:05.000' AS DateTime))
INSERT [dbo].[t_qq_user] ([Id], [OpenId], [NickName], [Gender], [HeadShot], [Email], [Status], [LastLogin], [CreateOn]) VALUES (9, N'ED7CE034D044B3759ED7D78EF15F837F', N'沧海大叔', 1, N'http://thirdqq.qlogo.cn/g?b=oidb&k=rVvtgxNp4qTTmR90kPI5hA&s=140&t=1555941697', N'', 1, CAST(N'2019-08-09T17:25:44.000' AS DateTime), CAST(N'2019-08-09T17:25:44.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[t_qq_user] OFF
SET IDENTITY_INSERT [dbo].[t_role] ON 

INSERT [dbo].[t_role] ([Id], [RoleCode], [RoleName], [Remark], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (1, N'SysAdmin', N'超级管理员', N'', 1, CAST(N'2019-02-28T15:34:59.000' AS DateTime), CAST(N'2019-02-28T15:35:03.000' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[t_role] OFF
SET IDENTITY_INSERT [dbo].[t_user] ON 

INSERT [dbo].[t_user] ([Id], [UserName], [RealName], [PassWord], [RoleId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy], [Gender], [Phone], [Email], [Remark], [HeadShot]) VALUES (1, N'admin', N'admin', N'e10adc3949ba59abbe56e057f20f883e', 1, 1, CAST(N'2019-02-28T16:18:52.000' AS DateTime), CAST(N'2019-08-11T23:23:57.000' AS DateTime), 0, 1, 1, N'11111111111', N'178899573@qq.com', N'最高权限', N'/Upload/img/502.jpg')
SET IDENTITY_INSERT [dbo].[t_user] OFF
ALTER TABLE [dbo].[t_menu] ADD  CONSTRAINT [DF__t_menu__OrderNo__52593CB8]  DEFAULT ('0') FOR [OrderNo]
GO
ALTER TABLE [dbo].[t_menu] ADD  CONSTRAINT [DF__t_menu__ParentId__534D60F1]  DEFAULT ('0') FOR [ParentId]
GO
USE [master]
GO
ALTER DATABASE [CMS] SET  READ_WRITE 
GO
