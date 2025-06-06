CREATE TABLE dbo.Orders
(  
    OrderID INT,  
    CustomerID INT,  
    CreditCard VARCHAR(20)      
);  
INSERT dbo.Orders (OrderID, CustomerID, CreditCard) VALUES
(1234, 5678, '111111111111111'),
(2341, 6785, '222222222222222'),
(3412, 7856, '333333333333333');  
SELECT * FROM dbo.Orders;
 
DENY SELECT ON dbo.Orders (CreditCard) TO [Student2@specntlabs.onmicrosoft.com];
 
SELECT USER_NAME()
