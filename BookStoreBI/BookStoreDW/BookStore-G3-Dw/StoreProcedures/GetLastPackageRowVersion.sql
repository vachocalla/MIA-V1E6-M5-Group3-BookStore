CREATE PROCEDURE [dbo].[GetLastPackageRowVersion]
	@tableName VARCHAR(50)
AS
	SELECT LastRowVersion
	FROM [dbo].[PackageConfig]
	WHERE TableName = @tableName;
