-- 1. Creer la table dans db-blackfriday.
-- Correspond a SQL query 1. A executer uniquement si la table est absente.
CREATE TABLE dbo.BlackFriday (
    Transaction_ID INT NOT NULL PRIMARY KEY,
    User_ID INT NOT NULL,
    Product_ID VARCHAR(20) NOT NULL,
    Gender CHAR(1) NOT NULL,
    Age VARCHAR(10) NOT NULL,
    Occupation INT NOT NULL,
    City_Category CHAR(1) NOT NULL,
    Stay_In_Current_City_Years NVARCHAR(30) NOT NULL,
    Marital_Status INT NOT NULL,
    Product_Category_1 INT NOT NULL,
    Product_Category_2 INT NULL,
    Product_Category_3 INT NULL,
    Purchase INT NOT NULL,
    Gender_Label NVARCHAR(20) NOT NULL,
    Marital_Status_Label NVARCHAR(30) NOT NULL
);
