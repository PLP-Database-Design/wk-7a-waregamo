-- Question 1: Achieving 1NF (First Normal Form)

-- Transforming the ProductDetail table into 1NF
WITH SplitProducts AS (
    SELECT OrderID, CustomerName, TRIM(value) AS Product
    FROM ProductDetail
    CROSS APPLY STRING_SPLIT(Products, ',')
)

SELECT OrderID, CustomerName, Product
FROM SplitProducts
WHERE Product IS NOT NULL
ORDER BY OrderID;


-- Question 2: Achieving 2NF (Second Normal Form)

-- Step 1: Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Step 2: Insert distinct OrderID and CustomerName into Orders table
INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

-- Step 3: Create the OrderItems table
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 4: Insert data into OrderItems table
INSERT INTO OrderItems (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;