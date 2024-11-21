-- Write your SQL code here
--view 1: CustomerInsightDashboard
CREATE VIEW CustomerInsightDashboard AS
SELECT
    c.Customer_ID,
    c.Customer_Name,
    c.Email,
    c.Phone,
    SUM(pd.Purchase_Amount) AS Total_Spent,
    COUNT(p.Purchase_ID) AS Total_Purchases,
    AVG(pd.Purchase_Amount) AS Average_Spent,
    CASE 
        WHEN SUM(pd.Purchase_Amount) >= 1000 THEN 'High Value'
        WHEN SUM(pd.Purchase_Amount) BETWEEN 500 AND 999 THEN 'Medium Value '
        ELSE 'Low Value'
    END AS Customer_Segment
    MAX(p.Purchase_Date) AS Last_Purchase_Date
FROM
    Customers c
LEFT JOIN Purchases p ON c.Customer_ID = p.Customer_ID

LEFT JOIN PurchaseDetails pd ON p.Purchase_ID = pd.Purchase_ID

GROUP BY c.Customer_ID, c.Customer_Name, c.Email, c.Phone;


--view 2: InfrastructureMonitoringDashboard
CREATE VIEW InfrastructureMonitoringDashboard AS
SELECT
    i.Infrastructure_ID,
    i.Infrastructure_Type,
    il.Location,
    1c.Capacity,
    COUNT(r.Resource_ID) AS Used_Resources,
    (ic.Capacity - COUNT(r.Resource_ID)) AS Available_Capacity,
    CASE 
        WHEN (ic.Capacity - COUNT(r.Resource_ID)) <(ic.Capacity * 0.1)  THEN  'Critical'
        WHEN (ic.Capacity - COUNT(r.Resource_ID)) <(ic.Capacity * 0.3)  THEN  'Warning'
        ELSE  'Normal'
    END AS Capacity_Status
    AVG(r.Performance_Metric) AS Average_Performance

FROM Infrastructure i

JOIN Infrastructure_Location il ON i.Infrastructure_ID = il.Infrastructure_ID

JOIN InfrastructureCapacity ic ON i.Infrastructure_ID = ic.Infrastructure_ID

LEFT JOIN Resources r ON i.Infrastructure_ID = r.Infrastructure_ID

GROUP BY i.Infrastructure_ID, i.Infrastructure_Type, il.Location, ic.Capacity;