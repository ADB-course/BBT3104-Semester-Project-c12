-- Write your SQL code here
DELIMITER //
CREATE TRIGGER UpdateCustomerInfo
BEFORE UPDATE ON Customer
FOR EACH ROW
BEGIN
    IF @is_authorized_user IS NULL OR @is_authorized_user = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'You are not authorized to update customer information';
    END IF;

END; //
DELIMITER ;

DELIMITER //
CREATE TRIGGER ValidatePurchaseDataBeforeInsert
BEFORE INSERT ON Purchase
FOR EACH ROW
BEGIN
    IF NEW.Purchase_Date > CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Purchase date cannot be in the future';
    END IF;
END; //
DELIMITER ;