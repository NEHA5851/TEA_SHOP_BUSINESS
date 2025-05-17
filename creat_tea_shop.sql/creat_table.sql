
-- Table: Branches
CREATE TABLE Branches (
    branch_id INT PRIMARY KEY,
    city VARCHAR(50),
    state VARCHAR(50),
    pin_code VARCHAR(10)
);

-- Table: Products
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(50),
    price DECIMAL(10,2)
);

-- Table: Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    phone VARCHAR(15)
);

-- Table: Employees
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    role VARCHAR(30),
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);

-- Table: Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    product_id INT,
    branch_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);
