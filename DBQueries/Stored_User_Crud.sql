CREATE PROCEDURE [dbo].[User_Crud]
	@Action VARCHAR(20),
	@UserId INT = NULL,
	@Name VARCHAR(50) = NULL,
	@Username VARCHAR(50) = NULL,
	@Mobile VARCHAR(50) = NULL,
	@Email VARCHAR(50) = NULL,
	@Address VARCHAR(max) = NULL,
	@Postcode VARCHAR(50) = NULL,
	@Password VARCHAR(50) = NULL,
	@ImageUrl VARCHAR(max) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	--SELECT FOR LOGIN
	IF @Action = 'SELECTFORLOGIN'
		BEGIN
			SELECT * FROM dbo.Users WHERE Username = @Username and Password = @Password
		END

	--SELECT FOR USER PROFILE
	IF @Action = 'SELECTFORPROFILE'
		BEGIN
			SELECT * FROM dbo.Users WHERE UserId = @UserId
		END

	--INSERT (REGISTRATION)
	IF @Action = 'INSERT'
		BEGIN
			INSERT INTO dbo.Users(Name, Username, Mobile, Email, Address, PostCode, Password, ImageUrl, CreatedDate)
			VALUES (@Name, @Username, @Mobile, @Email, @Address, @Postcode, @Password, @ImageUrl, GETDATE())
		END

	--UPDATE USER PROFILE
	IF @Action = 'UPDATE'
		BEGIN
			DECLARE @UPDATE_IMAGE VARCHAR(20)
			SELECT @UPDATE_IMAGE = (CASE WHEN @ImageUrl IS NULL THEN 'NO' ELSE 'YES' END)

			IF @UPDATE_IMAGE = 'NO'
				BEGIN
					UPDATE dbo.Users
					SET Name = @Name,
					Username = @Username,
					Mobile = @Mobile,
					Email = @Email,
					Address = @Address,
					PostCode = @Postcode
					WHERE UserId = @UserId
				END
			ELSE
				BEGIN
					UPDATE dbo.Users
					SET Name = @Name,
					Username = @Username,
					Mobile = @Mobile,
					Email = @Email,
					Address = @Address,
					PostCode = @Postcode,
					ImageUrl = @ImageUrl
					WHERE UserId = @UserId
				END
		END

	--SELECT FOR ADMIN
	IF @Action = 'SELECTFORADMIN'
		BEGIN
			SELECT ROW_NUMBER() OVER(ORDER BY (SELECT 1)) AS [SrNo], 
			UserId, 
			Name,
			Username, 
			Email,
			CreatedDate
			FROM Users
		END

	--DELETE BY ADMIN
	IF @Action = 'DELETE'
		BEGIN
			DELETE FROM dbo.Users WHERE UserId = @UserId
		END
END

