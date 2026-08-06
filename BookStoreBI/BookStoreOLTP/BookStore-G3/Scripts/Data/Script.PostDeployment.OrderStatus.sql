MERGE INTO order_status AS Target
USING (VALUES 
    (1,'Order Received'),
    (2,'Pending Delivery'),
    (3,'Delivery In Progress'),
    (4,'Delivered'),
    (5,'Cancelled'),
    (6,'Returned')
) AS Source (status_id, status_value)
ON (Target.status_id = Source.status_id)

WHEN MATCHED THEN 
    UPDATE SET 
        Target.status_value = Source.status_value
    
WHEN NOT MATCHED BY TARGET THEN 
    INSERT (status_id, status_value)
    VALUES (Source.status_id, Source.status_value);
