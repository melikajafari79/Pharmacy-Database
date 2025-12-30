CREATE PROCEDURE usp_Customer_Soft_Delete
    @CustomerID INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- بررسی وجود مشتری
        IF NOT EXISTS (
            SELECT 1 FROM Customer WHERE CustomerID = @CustomerID
        )
        BEGIN
            RAISERROR (N'مشتری مورد نظر وجود ندارد.', 16, 1);
            RETURN;
        END

        -- بررسی وابستگی به نسخه یا پرداخت
        IF EXISTS (
            SELECT 1 FROM Prescription WHERE CustomerID = @CustomerID
        )
        OR EXISTS (
            SELECT 1 FROM Payment WHERE CustomerID = @CustomerID
        )
        BEGIN
            RAISERROR (N'امکان حذف مشتری به دلیل وجود سوابق مرتبط وجود ندارد.', 16, 1);
            RETURN;
        END

        UPDATE Customer
		SET IsActive = 0
		WHERE CustomerID = @CustomerID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

EXEC usp_Customer_Soft_Delete
	@CustomerID = 1;
GO

SELECT * FROM Customer