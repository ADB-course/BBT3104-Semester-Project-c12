-- Write your SQL code here
ALTER TABLE Customer
ADD CONSTRAINT chk_CustomerID
CHECK (Customer_ID IS NOT NULL AND
         Customer_ID NOT IN (SELECT Customer_ID FROM Customer WHERE Customer_ID IS NULL));

ALTER TABLE Purchase
ADD CONSTRAINT chk_PurchaseAmount
CHECK (Purchase_Amount > 0);