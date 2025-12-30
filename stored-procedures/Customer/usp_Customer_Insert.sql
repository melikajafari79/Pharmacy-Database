CREATE OR ALTER PROCEDURE usp_Customer_Insert
    @NationalCode     CHAR(10),
    @CustomerName     NVARCHAR(50),
    @CustomerFamily   NVARCHAR(50),
    @CustomerPhone    CHAR(12)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- جلوگیری از ثبت مشتری تکراری
        IF EXISTS (
            SELECT 1
            FROM Customer
            WHERE NationalCode = @NationalCode
        )
        BEGIN
            RAISERROR (N'مشتری با این کد ملی قبلاً ثبت شده است.', 16, 1);
            RETURN;
        END

        INSERT INTO Customer
        (
            NationalCode,
            CustomerName,
            CustomerFamily,
            CustomerPhone
        )
        VALUES
        (
            @NationalCode,
            @CustomerName,
            @CustomerFamily,
            @CustomerPhone
        );

        -- برگرداندن ID ایجاد شده
        SELECT SCOPE_IDENTITY() AS NewCustomerID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO


EXEC usp_Customer_Insert
    @NationalCode = '1234567890',
    @CustomerName = N'ملیکا',
    @CustomerFamily = N'جعفری',
    @CustomerPhone = '09123456789';
