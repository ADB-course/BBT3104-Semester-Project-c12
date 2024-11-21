-- Write your SQL code here
INSERT INTO Network_Device (Device_ID, Device_Type, IP_Address,Location) VALUES
(1, 'Router', '192.168.1.1', 'office');
(2, 'Switch', '192.168.1.2', 'office');

INSERT INTO Server (Server_ID, Server_Type, Operating_System, Storage_Capacity) VALUES
(1, 'Web Server', 'Linux', 1000);
(2, 'Database Server', 'Windows', 2000);

INSERT INTO Customer (Customer_ID, Customer_Name, Address, Contact_Information) VALUES
(001, 'Thiery Henry','New York', '1234567890' ),
(002, 'David Beckham','Los Angeles', '0987654321');

INSERT INTO Purchase (Purchase_ID, Customer_ID, Purchase_Date, Purchase_Amount) VALUES
(1, 001, '2020-01-01', 150.00),
(2, 002, '2020-01-02', 200.00);