MERGE INTO address_status AS Target
USING (VALUES 
    (1,'Active'),
    (2,'Inactive')
) AS Source (status_id, address_status)
ON (Target.status_id = Source.status_id)

WHEN MATCHED THEN 
    UPDATE SET 
        Target.address_status = Source.address_status
    
WHEN NOT MATCHED BY TARGET THEN 
    INSERT (status_id, address_status) 
    VALUES (Source.status_id, Source.address_status);
