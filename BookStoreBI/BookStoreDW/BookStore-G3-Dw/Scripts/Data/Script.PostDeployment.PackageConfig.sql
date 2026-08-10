INSERT INTO [dbo].[PackageConfig] ([TableName], [LastRowVersion])
SELECT 'Book', 0
WHERE NOT EXISTS (
    SELECT 1 
    FROM [dbo].[PackageConfig] 
    WHERE [TableName] = 'Book'
);


INSERT INTO [dbo].[PackageConfig] ([TableName], [LastRowVersion])
SELECT 'Customer', 0
WHERE NOT EXISTS (
    SELECT 1 
    FROM [dbo].[PackageConfig] 
    WHERE [TableName] = 'Customer'
);


INSERT INTO [dbo].[PackageConfig] ([TableName], [LastRowVersion])
SELECT 'Address', 0
WHERE NOT EXISTS (
    SELECT 1 
    FROM [dbo].[PackageConfig] 
    WHERE [TableName] = 'Address'
);

INSERT INTO [dbo].[PackageConfig] ([TableName], [LastRowVersion])
SELECT 'Shipping', 0
WHERE NOT EXISTS (
    SELECT 1 
    FROM [dbo].[PackageConfig] 
    WHERE [TableName] = 'Shipping'
);


INSERT INTO [dbo].[PackageConfig] ([TableName], [LastRowVersion])
SELECT 'Orders', 0
WHERE NOT EXISTS (
    SELECT 1 
    FROM [dbo].[PackageConfig] 
    WHERE [TableName] = 'Orders'
);
