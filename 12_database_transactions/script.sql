-- Write your SQL code here
START TRANSACTION;
-- Insert a new customer
INSERT INTO Customer (Customer_ID, Customer_Name, Customer_Address, Contact_Information) VALUES
(001, 'Jin woe', 'Tokyo', '011234444');

-- Get the ID of the newly inserted customer
SET @NewCustomerID = LAST_INSERT_ID();

--Insert a purchase of new customer
INSERT INTO Purchase (Purchase_ID, Customer_ID, Purchase_Date, Purchase_Amount) VALUES
(001, @NewCustomerID, '2024-11-01', 250.00);

-- Check if the transaction was successful
IF ROW_COUNT() = 2 THEN
    -- If successful, commit the transaction
    COMMIT;
    SELECT 'Transaction Successful'.AS Message;
ELSE
    -- If not successful, rollback the transaction
    ROLLBACK;
    SELECT 'Transaction Failed. Changes have been rolled back'.AS Message;
END IF;