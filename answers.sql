-- Question 1: Achieving 1NF (First Normal Form)
-- Transforming the ProductDetail table into 1NF
CREATE TABLE ProductDetail (

    OrderID INT,

    CustomerName VARCHAR(100),

    Products VARCHAR(100)

);

INSERT INTO ProductDetail(OrderID, CustomerName, Products)

VALUES

(101, 'John Doe', 'Laptop'),

(101, 'John Doe', 'Mouse'),

(102, 'Jane Smith', 'Tablet'),

(102, 'Jane Smith', 'Keyboard'),

(102, 'Jane Smith', 'Mouse'),

(103, 'Emily Clark', 'Phone');

-- Question 2: Achieving 2NF (Second Normal Form)

-- Step 1: Create the Orders table
CREATE TABLE Orders (

    OrderID INT PRIMARY KEY,

    CustomerName VARCHAR(100)

);

-- Step 2: Inserting value into the Orders table
INSERT INTO Orders (OrderID, CustomerName)

VALUES

(101, 'John Doe'),

(102, 'Jane Smith'),

(103, 'Emily Clark');

-- Step 3: Create the product table
CREATE TABLE Product (

    OrderID INT,

    Product VARCHAR(100),

    Quantity INT,

    PRIMARY KEY (OrderID, Product),

    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)

);

-- Step 4: Inserting value into the product table
INSERT INTO Product (OrderID, Product, Quantity)

VALUES

(101, 'Laptop', 2),

(101, 'Mouse', 1),

(102, 'Tablet', 3),

(102, 'Keyboard', 1),

(102, 'Mouse', 2),

(103, 'Phone', 1);