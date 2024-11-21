-- Write your SQL code here

--procedure to create Infeastructure Utilization Report
DELIMITER //

CREATE PROCEDURE GenerateInfastructureUtilizationReport()
BEGIN

    --This procedure monitors infrastructure capacity utilization 
    SELECT 
        i.InfrastructureID,
        i.InfrastructureType,
        il.Location,
        ic.Capacity
        SUM(CASE WHEN r.Resource_ID IS NOT NULL THEN 1 ELSE 0 END) AS Used_Resources,
        (ic.Capacity - SUM(CASE WHEN r.Resource_ID IS NOT NULL THEN 1 ELSE 0 END)) AS Available_Capacity,
        CASE
            WHEN(ic.Capacity - SUM(CASE WHEN r.Resource_ID IS NOT NULL THEN 1 ELSE 0 END)) < (ic.Capacity *0.1) THEN 'Critical'
            WHEN(ic.Capacity - SUM(CASE WHEN r.Resource_ID IS NOT NULL THEN 1 ELSE 0 END)) < (ic.Capacity *0.3) THEN 'Warning'
            ELSE 'Normal'
        END AS Capacity_Status
    FROM
        Infrastructure i
    JOIN Infrastructure_Location il ON i.InfrastructureID = il.InfrastructureID
    
    JOIN Infrastructure_Capacity ic ON i.InfrastructureID = ic.InfrastructureID
    
    LEFT JOIN Resource r ON i.InfrastructureID = r.InfrastructureID
    
    GROUP BY i.InfrastructureID, i.Infrastructure_Type, ic.Capacity;
END //

DELIMITER;

--procedure to Generate Customer Analytics Report
DELIMITER //

CREATE PROCEDURE GenerateCustomerAnalyticsReport()
BEGIN
    -- This procedure analyzes the customer purchasing behavior and segments them based on their total purchase amount

    SELECT 
        c.CustomerID,
        c.CustomerName,
        c.CustomerType,
        COUNT(p.Purchase_ID) AS Total_Purchase,
        SUM(pd.Purchase_Amount) AS Total_Spent,
        AVG(pd.Purchase_Amount) AS AVG_Spent
        CASE
            WHEN SUM(pd.Purchase_Amount) > 10000 THEN 'High Value'
            WHEN SUM(pd.Purchase_Amount) BETWEEN 500 AND 999 THEN 'Medium Value'
            ELSE 'Low Value'
        END AS Customer_Segement
    FROM
        Customer c
    LEFT JOIN Purchase p ON c.CustomerID = p.CustomerID

    LEFT JOIN Purchase_Details pd ON p.Purchase_ID = pd.Purchase_ID

    GROUP BY c.CustomerID, c.CustomerName

    ORDER BY Total_Spent DESC;
END //

DELIMITER;