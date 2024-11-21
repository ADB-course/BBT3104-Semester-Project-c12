-- Write your SQL code here
CREATE INDEX idx_Device_Location ON Network_Device (Location);
CREATE INDEX idx_Server_type ON Server (Server_Type);
CREATE INDEX idx_Customer_Name ON Customer (Customer_Name);
CREATE INDEX idx_Purchase_Date ON Purchase (Purchase_Date);