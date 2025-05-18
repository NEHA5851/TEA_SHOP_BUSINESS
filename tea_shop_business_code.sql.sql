
-- 1. Total revenue from all branches
SELECT SUM(p.price * o.quantity) AS total_revenue
FROM Orders o
JOIN Products p ON o.product_id = p.product_id;

-- 2. Top 5 most selling tea products
SELECT p.name, SUM(o.quantity) AS total_sold
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
GROUP BY p.name
ORDER BY total_sold DESC
LIMIT 5;

-- 3. List of orders with ZIP code '700001'
SELECT o.order_id, c.name AS customer, p.name AS product, b.pin_code
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Products p ON o.product_id = p.product_id
JOIN Branches b ON o.branch_id = b.branch_id
WHERE b.pin_code = '700001';

-- 4. Branch-wise total number of orders
SELECT b.city, COUNT(o.order_id) AS total_orders
FROM Orders o
JOIN Branches b ON o.branch_id = b.branch_id
GROUP BY b.city;

-- 5. Employee who handled the most orders
SELECT e.name, COUNT(*) AS total_orders
FROM Orders o
JOIN Employees e ON o.employee_id = e.employee_id
GROUP BY e.name
ORDER BY total_orders DESC
LIMIT 1;

-- 6. Average quantity of tea ordered per order
SELECT AVG(quantity) AS avg_quantity_per_order
FROM Orders;

-- 7. Orders placed in the last 7 days
SELECT * FROM Orders
WHERE order_date >= CURRENT_DATE - INTERVAL '7 days';

-- 8. Customers who ordered more than 5 times
SELECT c.name, COUNT(o.order_id) AS total_orders
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.name
HAVING COUNT(o.order_id) > 5;

-- 9. Revenue by product
SELECT p.name, SUM(p.price * o.quantity) AS revenue
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
GROUP BY p.name;

-- 10. Orders handled by each employee role
SELECT e.role, COUNT(o.order_id) AS total_orders
FROM Orders o
JOIN Employees e ON o.employee_id = e.employee_id
GROUP BY e.role;
