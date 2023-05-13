CREATE DATABASE FooddeliveryDB;

USE FooddeliveryDB;

CREATE TABLE [Users] (
	[UserId] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Username] [varchar](50) NULL UNIQUE,
	[Mobile] [varchar](50) NULL, 
	[Email] [varchar](50) NULL UNIQUE,
	[Address] [varchar](max) NULL,
	[PostCode] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[ImageUrl] [varchar](max) NULL,
	[CreatedDate] [datetime] NULL
)

CREATE TABLE [Contacts] (
	[ContactId] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Subject] [varchar](200) NULL ,
	[Message] [varchar](max) NULL,
	[CreatedDate] [datetime] NULL
)

CREATE TABLE [Categories] (
	[CategoryId] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[ImageUrl] [varchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL
)

CREATE TABLE [Products] (
	[ProductId] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](max) NULL,
	[Price] [decimal] NULL,
	[Quantity] [int] NULL,
	[ImageUrl] [varchar](max) NULL,
	[CategoryId] [int] NULL, --FK
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL
)

CREATE TABLE [Carts] (
	[CartId] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL, --FK
	[Quantity] [int] NULL,
	[UserId] [int] NULL, --FK
)

CREATE TABLE [Orders] (
	[OrderDetailsId] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[OrderNumber] [varchar](max) ,
	[ProductId] [int] NULL, --FK
	[Quantity] [int] NULL,
	[UserId] [int] NULL, --FK
	[Status] [varchar](50) NULL,
	[PaymentId] [int] NULL, --FK
	[OrderDate] [datetime] NULL
)

CREATE TABLE [Payment] (
	[PaymentId] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[CardNumber] [varchar](50) NULL,
	[ExpireDate] [varchar](50) NULL,
	[Cvc] [int] NULL, 
	[Address] [varchar](max) NULL,
	[PaymentMode] [varchar](50) NULL 
)