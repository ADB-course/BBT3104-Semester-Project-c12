-- Write your SQL code here

--Function to calculate customer lifetime value
DELIMITER //

CREATE FUNCTION CalculateCustomerLifetimeValue(customerID INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_spent DECIMAL(10,2);
    DECLARE total_purchases INT;

    --Calculate total spent by the customer
    SELECT SUM(Purchase_Amount) INTO total_spent
    FROM Purchase p

    JOIN Purchase_Details pd ON p.Purchase_ID = pd.Purchase_ID

    WHERE p.Customer_ID = customer_id;

    --calculate total purchases made by the customer
    SELECT COUNT(p.Purchase_ID) INTO total_purchases

    FROM Purchase p

    WHERE p.Customer_ID = customer_id;

    --Calculate customer lifetime value
    RETURN IF(total_purchases > 0, total_spent / total_purchases, 0);
END //

DELIMITER;

-- Function to Calculate Infrastructure Efficiendy
DELIMITER //

CREATE FUNCTION CalculateInfrastructureEfficiency(infrastructure_id INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE total_capacity INT;
    DECLARE used_resources INT;

    --Calculate total capacity of the infrastructure
    SELECT ic.Capacity INTO total_capacity

    FROM Infrastructure i

    JOIN Infrastructure_Capacity ic ON i.Infrastructure_ID = ic.Infrastructure_ID

    WHERE i.Infrastructure_ID = infrastructure_id;

    --calculate number of used resources
    SELECT COUNT(r.Resource_ID) INTO used_resources

    FROM Resource r

    WHERE r.Infrastructure_ID = infrastructure_id;

    --calculate Infrastructure efficiency
    RETURN IF(total_capacity > 0, (used_resources / total_capacity) * 100, 0);
END //

DELIMITER;