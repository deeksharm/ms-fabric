CREATE  TABLE Sales.Customers3
(   
    CustomerID INT NOT NULL,   
    FirstName varchar(50) MASKED WITH (FUNCTION = 'partial(1,"XXXXXXX",0)') NULL,     
    LastName varchar(50) NOT NULL,     
    Phone varchar(20) MASKED WITH (FUNCTION = 'default()') NULL,     
    Email varchar(50) MASKED WITH (FUNCTION = 'email()') NULL   
);
   
INSERT Sales.Customers3 (CustomerID, FirstName, LastName, Phone, Email) VALUES
(29485,'Catherine','Abel','555-555-5555','catherine0@adventure-works.com'),
(29486,'Kim','Abercrombie','444-444-4444','kim2@adventure-works.com'),
(29489,'Frances','Adams','333-333-3333','frances0@adventure-works.com');
   
SELECT * FROM Sales.Customers3;
--------------------------------------------

 GRANT UNMASK ON Sales.Customers3 TO [Student6@specntlabs.onmicrosoft.com];
 -----------------------------
  SELECT * FROM dbo.Customers;
