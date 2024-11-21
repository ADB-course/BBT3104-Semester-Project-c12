-- Write your SQL code here
DELIMITER $$

--Trigger to validate Customer ID
CREATE TRIGGER ValidateCustomerIDBeforeInsert
BEFORE INSERT ON Customer
FOR EACH ROW
BEGIN
    --Check if Customer ID is NULL
    IF NEW.Customer_ID IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Customer ID cannot be NULL';
    END IF;
    --Check if Customer ID already exists   
    IF EXISTS (SELECT 1 FROM Customer WHERE Customer_ID = NEW.Customer_ID) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Customer ID already exists';
    END IF;
END; $$

CREATE TRIGGER ValidateCustomerIDBeforeUpdate
BEFORE UPDATE ON Customer
FOR EACH ROW
BEGIN

    --Check if Customer ID is NULL
    IF NEW.Customer_ID IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Customer ID cannot be NULL';
    END IF;

    --Check if Customer ID already exists 
    IF EXISTS (SELECT 1 FROM Customer WHERE Customer_ID = NEW.Customer_ID) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Customer ID already exists';
    END IF;
END; $$

--Trigger to validate Purchase Amount
CREATE TRIGGER ValidatePurchaseAmountBeforeInsert
BEFORE INSERT ON Purchase
FOR EACH ROW
BEGIN
    --Check if Purchase Amount is less than zero
    IF NEW.Purchase_Amount < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Purchase Amount must be graeter than zero';
    END IF;
END; $$

CREATE TRIGGER ValidatePurchaseAmountBeforeUpdate
BEFORE UPDATE ON Purchase
FOR EACH ROW
BEGIN
    --Check if Purchase Amount is greater than zero
    IF NEW.Purchase_Amount < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Purchase Amount must be greater than zero';
    END IF;
END; $$

DELIMITER ;