
-- PLP DATABASE SYSTEMS
-- WEEK 7: DATABASE DESIGN AND NORMALIZATION

-- ==========================================
-- QUESTION 1: FIRST NORMAL FORM (1NF)
-- ==========================================

-- Create a new table with one product per row.
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    PRIMARY KEY (OrderID, Product)
);

-- Insert normalized records.
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Display the 1NF table.
SELECT * FROM ProductDetail_1NF;


-- ==========================================
-- QUESTION 2: SECOND NORMAL FORM (2NF)
-- ==========================================

-- Partial dependency:
-- CustomerName depends only on OrderID,
-- not on the complete composite key
-- (OrderID, Product).

-- Create Orders table.
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);

-- Create OrderItems table.
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT NOT NULL,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert order information.
INSERT INTO Orders (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Insert product and quantity information.
INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

-- Display the Orders table.
SELECT * FROM Orders;

-- Display the OrderItems table.
SELECT * FROM OrderItems;

-- Display combined order information.
SELECT
    Orders.OrderID,
    Orders.CustomerName,
    OrderItems.Product,
    OrderItems.Quantity
FROM Orders
INNER JOIN OrderItems
ON Orders.OrderID = OrderItems.OrderID
ORDER BY Orders.OrderID, OrderItems.Product;
