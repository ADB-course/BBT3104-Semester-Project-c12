-- Write your SQL code here
--Network Device table
CREATE TABLE Network_Device(
    Device_ID INT PRIMARY KEY,
    Device_Type VARCHAR(50),
    IP_address VARCHAR(15) UNIQUE,
    Device_Location VARCHAR(50)
) ENGINE=INNODB;
--Server Table
CREATE TABLE Server(
    Server_ID INT PRIMARY KEY,
    Server_Type VARCHAR(50),
    Operating_System VARCHAR(50),
    Storage_Capacity INT
) ENGINE=INNODB;

--Infrastructure Table
CREATE TABLE Infrastructure(
    Infrastructure_ID INT PRIMARY KEY,
    Infrastructure_Type VARCHAR(50),
    Location VARCHAR(100),
    Capacity INT
) ENGINE=INNODB;

--Purchase Table
CREATE TABLE Purchase(
    Purchase_ID INT PRIMARY KEY,
    Customer_ID INT,
    Purchase_Date DATE,
    Purchase_Amount DECIMAL(10,2)''
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
) ENGINE=INNODB;

--Sales Report Table
CREATE TABLE Sales_Report(
    Sales_ID INT PRIMARY KEY,
    Purchase_Date DATE,
    Purchase_Amount DECIMAL(10,2),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
) ENGINE=MyISAM;

--Employee Table
CREATE TABLE Employee(
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(50),
    Department_ID VARCHAR(50),
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
) ENGINE=INNODB;

--Department Table
CREATE TABLE Department(
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(100),
) ENGINE=INNODB;

--Customer Table
CREATE TABLE Customer(
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(1000),
    Customer_Address VARCHAR(255),
    Contact_Information VARCHAR(15)
) ENGINE=INNODB;