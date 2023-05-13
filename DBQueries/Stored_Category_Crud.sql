USE [FooddeliveryDB]
GO
/****** Object:  StoredProcedure [dbo].[Category_Crud]    Script Date: 15.01.2023 6:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Category_Crud]
	@Action VARCHAR(10),
	@CategoryId INT = NULL,
	@Name VARCHAR(100) = NULL,
	@IsActive BIT = false,
	@ImageUrl VARCHAR(MAX) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--SELECT
	IF @Action = 'SELECT'
		BEGIN
			SELECT * FROM dbo.Categories ORDER BY CreatedDate DESC
		END

	--SELECT ACTIVE
	IF @Action = 'ACTIVECAT'
		BEGIN
			SELECT * FROM dbo.Categories 
			WHERE IsActive = 1
			ORDER BY CreatedDate DESC
		END

	--INSERT
	IF @Action = 'INSERT'
		BEGIN
			INSERT INTO dbo.Categories(Name, ImageUrl, IsActive, CreatedDate)
			VALUES(@Name, @ImageUrl, @IsActive, GETDATE())
		END

	--UPDATE
	IF @Action = 'UPDATE'
		BEGIN
			DECLARE @UPDATE_IMAGE VARCHAR(20)
			SELECT @UPDATE_IMAGE = (CASE WHEN @ImageUrl IS NULL THEN 'NO' ELSE 'YES' END)
			IF @UPDATE_IMAGE = 'NO'
				BEGIN 
					UPDATE dbo.Categories
					SET Name = @Name, IsActive = @IsActive
					WHERE CategoryId = @CategoryId
				END
			ELSE 
				BEGIN
					UPDATE dbo.Categories
					SET Name = @Name, ImageUrl = @ImageUrl, IsActive = @IsActive
					WHERE CategoryId = @CategoryId
				END
		END

	--DELETE
	IF @Action = 'DELETE'
		BEGIN
			DELETE FROM dbo.Categories WHERE CategoryId = @CategoryId
		END

	--GETBYID
	IF @Action = 'GETBYID'
		BEGIN 
			SELECT * FROM dbo.Categories WHERE CategoryId = @CategoryId
		END
   
END
