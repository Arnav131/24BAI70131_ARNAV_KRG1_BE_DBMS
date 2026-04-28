
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,           
    SupplierName VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL
);


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,            
    ProductName VARCHAR(100) NOT NULL,
    SupplierID INT,
    FOREIGN KEY (SupplierID) 
        REFERENCES Suppliers(SupplierID)  
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,              
    OrderDate DATE NOT NULL
);

CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    PRIMARY KEY (OrderID, ProductID),     
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);



INSERT INTO Suppliers (SupplierID, SupplierName, City) VALUES
(1, 'TechCorp', 'Delhi'),
(2, 'GlobalSupplies', 'Mumbai');

INSERT INTO Products (ProductID, ProductName, SupplierID) VALUES
(101, 'Laptop', 1),
(102, 'Mouse', 1),
(103, 'Keyboard', 2),
(104, 'Monitor', 2); 

INSERT INTO Orders (OrderID, OrderDate) VALUES
(1001, '2026-04-20'),
(1002, '2026-04-21');

INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1001, 101, 2), 
(1001, 102, 5),  
(1002, 101, 1);  


SELECT * FROM Suppliers;
SELECT * FROM Products;
SELECT * FROM OrderDetails;



-- MAIN QUERRY --

SELECT  p.ProductName, 
    COUNT(DISTINCT od.OrderID) AS TotalOrders
FROM Products p LEFT JOIN 
    OrderDetails od ON p.ProductID = od.ProductID
GROUP BY 
    p.ProductID, 
    p.ProductName;







