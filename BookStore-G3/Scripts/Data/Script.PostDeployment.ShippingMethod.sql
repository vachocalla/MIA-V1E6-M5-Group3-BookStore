MERGE INTO shipping_method AS Target
USING (VALUES 
    (1,'Standard',5.90),
    (2,'Priority',8.90),
    (3,'Express',11.90),
    (4,'International',24.50)
) AS Source (method_id, method_name, cost)
ON (Target.method_id = Source.method_id)

WHEN MATCHED THEN 
    UPDATE SET 
        Target.method_name = Source.method_name,
        Target.cost = Source.cost
    
WHEN NOT MATCHED BY TARGET THEN 
    INSERT (method_id, method_name, cost) 
    VALUES (Source.method_id, Source.method_name, Source.cost);
