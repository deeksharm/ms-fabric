Row level security





 CREATE TABLE dbo.Sales  

(  

    OrderID INT,  

    SalesRep VARCHAR(60),  

    Product VARCHAR(10),  

    Quantity INT  

);

   

--Populate the table with 6 rows of data, showing 3 orders for each test user.

INSERT dbo.Sales (OrderID, SalesRep, Product, Quantity) VALUES

(1, 'Student21@specntlabs.onmicrosoft.com', 'Valve', 5),  

(2, 'Student21@specntlabs.onmicrosoft.com', 'Wheel', 2),  

(3, 'Student6@specntlabs.onmicrosoft.com', 'Valve', 4),  

(4, 'Student6@specntlabs.onmicrosoft.com', 'Bracket', 2),  

(5, 'Student14@specntlabs.onmicrosoft.com', 'Wheel', 5),  

(6, 'Student2@specntlabs.onmicrosoft.com', 'Seat', 5);  

  ----------------------> 

SELECT * FROM dbo.Sales;  



------------------------------------->



--Create a separate schema to hold the row-level security objects (the predicate function and the security policy)

CREATE SCHEMA rls1;

GO



--Create a function to evaluate who is querying the table

CREATE FUNCTION rls1.fn_securitypredicate(@SalesRep AS VARCHAR(60))

    RETURNS TABLE  

WITH SCHEMABINDING  

AS  

    RETURN SELECT 1 AS fn_securitypredicate_result  

WHERE @SalesRep = USER_NAME();

GO  

-----------------------------

CREATE  SECURITY POLICY SalesFilter  

ADD FILTER PREDICATE rls1.fn_securitypredicate(SalesRep)  

ON   dbo.Sales  

WITH (STATE = ON);

GO
