CREATE OR ALTER PROCEDURE usp_Customer_Update
    @CustomerID       INT,
    @NationalCode     CHAR(10),
    @CustomerName     NVARCHAR(50),
    @CustomerFamily   NVARCHAR(50),
    @CustomerPhone    CHAR(12)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- بررسی وجود مشتری
        IF NOT EXISTS (
            SELECT 1 FROM Customer WHERE CustomerID = @CustomerID
        )
        BEGIN
            RAISERROR (N'مشتری مورد نظر یافت نشد.', 16, 1);
            RETURN;
        END

        -- جلوگیری از تکرار کد ملی
        IF EXISTS (
            SELECT 1
            FROM Customer
            WHERE NationalCode = @NationalCode
              AND CustomerID <> @CustomerID
        )
        BEGIN
            RAISERROR (N'کد ملی وارد شده متعلق به مشتری دیگری است.', 16, 1);
            RETURN;
        END

        UPDATE Customer
        SET
            NationalCode   = @NationalCode,
            CustomerName   = @CustomerName,
            CustomerFamily = @CustomerFamily,
            CustomerPhone  = @CustomerPhone
        WHERE CustomerID = @CustomerID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO


EXEC usp_Customer_Update
    @CustomerID = 1,
    @NationalCode = '1234567890',
    @CustomerName = N'ملیکا',
    @CustomerFamily = N'جعفری',
    @CustomerPhone = '09120000000';
