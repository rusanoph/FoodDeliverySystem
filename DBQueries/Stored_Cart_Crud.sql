CREATE PROCEDURE Cart_Crud
@Action VARCHAR(10),
@ProductId INT = NULL,
@Quantity INT = NULL,
@UserId INT = null

AS
BEGIN
	SET NOCOUNT ON;

	--SELECT
	IF @Action  = 'SELECT'
		BEGIN
			SELECT c.ProductId, 
			p.Name, p.ImageUrl, p.Price, 
			c.Quantity AS 'Кол.' ,
			p.Quantity AS 'Прод. Кол.'
			FROM dbo.Carts c
			INNER JOIN dbo.Products p ON p.ProductId = c.ProductId
			WHERE c.UserId = @UserId
		END

	--INSERT 
	IF @Action = 'INSERT'
		BEGIN
			INSERT INTO dbo.Carts(ProductId, Quantity, UserId)
			VALUES(@ProductId, @Quantity, @UserId)
		END

	--UPDETE
	IF @Action = 'UPDATE'
		BEGIN
			UPDATE dbo.Carts
			SET Quantity = @Quantity
			WHERE ProductId = @ProductId AND UserId = @UserId
		END

	--DELETE
	IF @Action = 'DELETE'
		BEGIN
			DELETE FROM  dbo.Carts
			WHERE ProductId = @ProductId AND UserId = @UserId
		END

	--GET BY ID (ProductId & UserId)
	IF @Action = 'GETBYID'
		BEGIN
			SELECT * FROM dbo.Carts
			WHERE ProductId = @ProductId AND UserId = @UserId
		END

END