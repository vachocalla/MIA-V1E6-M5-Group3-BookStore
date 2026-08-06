CREATE PROCEDURE [dbo].[UpdateLastPackageRowVersion]
	@tableName VARCHAR(50)
	,@lastRowVersion BIGINT
AS
	UPDATE [dbo].[PackageConfig]
	SET LastRowVersion = @lastRowVersion
	WHERE TableName = @tableName;
