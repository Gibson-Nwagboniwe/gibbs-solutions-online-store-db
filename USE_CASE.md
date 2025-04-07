📘 Use Case: Retail Sales Analytics for GIBBS SOLUTIONS

Company Background

GIBBS SOLUTIONS is a fictional online retail company that specializes in selling computers, mobile devices, and accessories. With hundreds of products and daily transactions, the company needs a centralized system to store, manage, and analyze its sales and inventory data.

🧹 Problem Statement

Before the database was implemented, GIBBS SOLUTIONS struggled with:

Scattered data across spreadsheets

No visibility into real-time stock levels

Difficulty tracking top-selling products or employee performance

No automated way to identify high-value customers

💡 The Solution

I designed and implemented a cloud-based PostgreSQL database to solve these issues. The database structure includes well-normalized tables for customers, employees, products, suppliers, sales, and sale items.

The solution allows:

Tracking every sale with accurate timestamps

Recording which employee closed which sale

Managing stock levels in real time

Linking each product to a supplier for restocking analysis

📊 Sample Queries & Results

1. Top 5 Best-Selling Products

SELECT p.product_name, SUM(si.quantity) AS total_units_sold
FROM sale_items si
JOIN products p ON si.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_units_sold DESC
LIMIT 5;

product_name

total_units_sold

MacBook Pro 14"

137

iPhone 14 Pro Max

121

Dell XPS 13

114

iPad Air

109

Logitech MX Mouse

98

2. Monthly Sales Revenue

SELECT TO_CHAR(sale_date, 'YYYY-MM') AS month,
       SUM(total_amount) AS revenue
FROM sales
GROUP BY month
ORDER BY month;

month

revenue

2024-11

$18,900.00

2024-12

$22,550.00

2025-01

$27,840.00

2025-02

$25,410.00

2025-03

$30,220.00

3. Customers with the Highest Lifetime Value

SELECT c.first_name || ' ' || c.last_name AS customer_name,
       COUNT(s.sale_id) AS orders,
       SUM(s.total_amount) AS total_spent
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 5;

customer_name

orders

total_spent

Sarah Johnson

12

$3,850.00

Ahmed Musa

9

$3,210.00

Jane Doe

11

$3,000.00

Victor Adebayo

7

$2,860.00

Chidi Okafor

8

$2,500.00

4. Low Stock Alerts

SELECT product_name, stock_quantity
FROM products
WHERE stock_quantity < 10
ORDER BY stock_quantity ASC;

product_name

stock_quantity

HP Envy 15

3

iPhone 13

4

Galaxy Buds Pro

5

MacBook Air

6

Logitech Keyboard

7

5. Employee Sales Performance

SELECT e.first_name || ' ' || e.last_name AS employee_name,
       COUNT(s.sale_id) AS sales_handled,
       SUM(s.total_amount) AS total_revenue
FROM sales s
JOIN employees e ON s.employee_id = e.employee_id
GROUP BY employee_name
ORDER BY total_revenue DESC;

employee_name

sales_handled

total_revenue

Grace Obi

45

$12,540.00

Kelvin Smith

39

$10,870.00

Nneka Okocha

32

$9,610.00

Tunde Balogun

29

$8,430.00

Chioma Williams

27

$7,950.00

✅ Skills Demonstrated

Relational Database Design (ERD)

PostgreSQL SQL DDL & DML

Data Analysis with SQL Queries

Linux-based DBMS Deployment

Git & GitHub for version control

🚀 Real-World Readiness

This project simulates what I would do in a real entry-level Database Administrator role—turning business needs into data-driven solutions.
