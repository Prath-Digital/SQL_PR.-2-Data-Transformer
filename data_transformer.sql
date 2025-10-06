-- ======================================================
-- 💾 DATA TRANSFORMER PROJECT
-- ======================================================
-- Author: Student
-- Purpose: Combined SQL script including schema creation,
-- sample data insertion, and all query tasks.
-- ======================================================
-- ======================================
-- 🧱 SCHEMA CREATION
-- ======================================
CREATE TABLE
    Customers (
        CustomerID INT PRIMARY KEY,
        FirstName VARCHAR(100),
        LastName VARCHAR(100),
        Email VARCHAR(255),
        RegistrationDate DATE
    );

CREATE TABLE
    Orders (
        OrderID INT PRIMARY KEY,
        CustomerID INT,
        OrderDate DATE,
        TotalAmount DECIMAL(10, 2),
        FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
    );

CREATE TABLE
    Employees (
        EmployeeID INT PRIMARY KEY,
        FirstName VARCHAR(100),
        LastName VARCHAR(100),
        Department VARCHAR(100),
        HireDate DATE,
        Salary DECIMAL(12, 2)
    );

-- ======================================
-- 🌱 SAMPLE DATA INSERTION
-- ======================================
INSERT INTO
    Customers (
        CustomerID,
        FirstName,
        LastName,
        Email,
        RegistrationDate
    )
VALUES
    (
        1,
        'John',
        'Doe',
        'john.doe@email.com',
        '2022-03-15'
    ),
    (
        2,
        'Jane',
        'Smith',
        'jane.smith@email.com',
        '2021-11-02'
    );

INSERT INTO
    Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (101, 1, '2023-07-01', 150.50),
    (102, 2, '2023-07-03', 200.75);

INSERT INTO
    Employees (
        EmployeeID,
        FirstName,
        LastName,
        Department,
        HireDate,
        Salary
    )
VALUES
    (
        1,
        'Mark',
        'Johnson',
        'Sales',
        '2020-01-15',
        50000.00
    ),
    (2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000.00);

-- ======================================
-- ⚙️ SQL TASKS / QUERIES
-- ======================================
-- 1️⃣ INNER JOIN: Retrieve all orders and customer details where orders exist.
SELECT
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email
FROM
    Orders o
    INNER JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY
    o.OrderID;

-- 2️⃣ LEFT JOIN: Retrieve all customers and their corresponding orders (if any).
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM
    Customers c
    LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
ORDER BY
    c.CustomerID;

-- 3️⃣ RIGHT JOIN: Retrieve all orders and their corresponding customers (if any).
SELECT
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    c.CustomerID,
    c.FirstName,
    c.LastName
FROM
    Orders o
    RIGHT JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY
    o.OrderID;

-- 4️⃣ FULL OUTER JOIN: Retrieve all customers and all orders, regardless of matching.
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM
    Customers c
    FULL OUTER JOIN Orders o ON c.CustomerID = o.CustomerID
ORDER BY
    c.CustomerID NULLS LAST,
    o.OrderID NULLS LAST;

-- 5️⃣ Subquery: Find customers who have placed orders worth more than the average amount.
SELECT DISTINCT
    c.CustomerID,
    c.FirstName,
    c.LastName
FROM
    Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE
    o.TotalAmount > (
        SELECT
            AVG(TotalAmount)
        FROM
            Orders
    );

-- 6️⃣ Subquery: Find employees with salaries above the average salary.
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Department,
    Salary
FROM
    Employees
WHERE
    Salary > (
        SELECT
            AVG(Salary)
        FROM
            Employees
    );

-- 7️⃣ Extract the year and month from the OrderDate.
SELECT
    OrderID,
    OrderDate,
    EXTRACT(
        YEAR
        FROM
            OrderDate
    ) AS Year,
    EXTRACT(
        MONTH
        FROM
            OrderDate
    ) AS Month
FROM
    Orders;

-- 8️⃣ Calculate the difference in days between order date and current date.
SELECT
    OrderID,
    OrderDate,
    CURRENT_DATE AS Today,
    (CURRENT_DATE - OrderDate) AS DaysSinceOrder
FROM
    Orders;

-- 9️⃣ Format the OrderDate to 'DD-MMM-YYYY'.
SELECT
    OrderID,
    TO_CHAR (OrderDate, 'DD-MON-YYYY') AS FormattedDate
FROM
    Orders;

-- 🔟 Concatenate FirstName and LastName to form a full name.
SELECT
    CustomerID,
    FirstName || ' ' || LastName AS FullName
FROM
    Customers;

-- 1️⃣1️⃣ Replace part of a string: replace 'John' with 'Jonathan'.
SELECT
    CustomerID,
    REPLACE (FirstName, 'John', 'Jonathan') AS ReplacedFirstName
FROM
    Customers;

-- 1️⃣2️⃣ Convert FirstName to uppercase and LastName to lowercase.
SELECT
    CustomerID,
    UPPER(FirstName) AS FirstUpper,
    LOWER(LastName) AS LastLower
FROM
    Customers;

-- 1️⃣3️⃣ Trim extra spaces from the Email field.
SELECT
    CustomerID,
    TRIM(Email) AS TrimmedEmail
FROM
    Customers;

-- 1️⃣4️⃣ Calculate the running total of TotalAmount for each order.
SELECT
    OrderID,
    CustomerID,
    OrderDate,
    TotalAmount,
    SUM(TotalAmount) OVER (
        ORDER BY
            OrderDate ROWS BETWEEN UNBOUNDED PRECEDING
            AND CURRENT ROW
    ) AS RunningTotal
FROM
    Orders
ORDER BY
    OrderDate;

-- 1️⃣5️⃣ Rank orders based on TotalAmount using RANK().
SELECT
    OrderID,
    CustomerID,
    TotalAmount,
    RANK() OVER (
        ORDER BY
            TotalAmount DESC
    ) AS AmountRank
FROM
    Orders;

-- 1️⃣6️⃣ Assign a discount based on TotalAmount in orders.
SELECT
    OrderID,
    TotalAmount,
    CASE
        WHEN TotalAmount > 1000 THEN TotalAmount * 0.10
        WHEN TotalAmount > 500 THEN TotalAmount * 0.05
        ELSE 0
    END AS DiscountAmount
FROM
    Orders;

-- 1️⃣7️⃣ Categorize employees' salaries as high, medium, or low.
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    CASE
        WHEN Salary >= 70000 THEN 'High'
        WHEN Salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM
    Employees;

-- ======================================================
-- ✅ END OF DATA TRANSFORMER PROJECT
-- ======================================================