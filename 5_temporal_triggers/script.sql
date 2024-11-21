-- Write your SQL code here
SET GLOBAL event_scheduler = ON;

--Event for Daily Data Backup
CREATE EVENT DailyDataBackup
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP
DO
BEGIN
    --Backup Product Table
    INSERT INTO Customer_Backup SELECT * FROM Customer;

    --Backup Purchase Table
    INSERT INTO Purchase_Backup SELECT * FROM Purchase;
END;

--Event for Weekly Data Analysis
CREATE EVENT WeeklyDataAnalysis
ON SCHEDULE EVERY 1 WEEK
STARTS CURRENT_TIMESTAMP
DO
BEGIN
    --Calculate total purchases per customer
    INSERT INTO Weekly_Analysis (Customer_ID, Total_Purchases)
    SELECT Customer_ID, COUNT(*) FROM Total_Purchases
    FROM Purchase
    GROUP BY Customer_ID;
END;