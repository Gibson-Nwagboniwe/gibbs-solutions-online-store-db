-- =========================================
-- SAMPLE REPORTS AND ANALYTICS FOR GIBBS SOLUTIONS
-- =========================================

-- 🏆 1. Top 5 Best-Selling Products
SELECT 
    p.product_name, 
    SUM(si.quantity) AS total_units_sold
FROM sale_items si
JOIN products p ON si.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_units_sold DESC
LIMIT 5;

-- 📅 2. Monthly Sales Revenue Report
SELECT 
    TO_CHAR(sale_date, 'YYYY-MM') AS month,
    SUM(total_amount) AS total_revenue
FROM sales
GROUP BY month
ORDER BY month;

-- 💸 3. Highest Spending Customers
SELECT 
    c.first_name || ' ' || c.last_name AS customer_name,
    COUNT(s.sale_id) AS number_of_orders,
    SUM(s.total_amount) AS total_spent
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 5;

-- 📉 4. Products Low in Stock (less than 10 units)
SELECT 
    product_name,
    stock_quantity
FROM products
WHERE stock_quantity < 10
ORDER BY stock_quantity ASC;

-- 👩‍💼 5. Employee Sales Performance
SELECT 
    e.first_name || ' ' || e.last_name AS employee_name,
    COUNT(s.sale_id) AS sales_made,
    SUM(s.total_amount) AS total_revenue
FROM sales s
JOIN employees e ON s.employee_id = e.employee_id
GROUP BY employee_name
ORDER BY total_revenue DESC;

-- 🧾 6. Detailed Sales Transactions (Joined Report)
SELECT 
    s.sale_id,
    s.sale_date,
    c.first_name || ' ' || c.last_name AS customer,
    e.first_name || ' ' || e.last_name AS employee,
    p.product_name,
    si.quantity,
    si.unit_price,
    (si.quantity * si.unit_price) AS line_total
FROM sale_items si
JOIN sales s ON si.sale_id = s.sale_id
JOIN customers c ON s.customer_id = c.customer_id
JOIN employees e ON s.employee_id = e.employee_id
JOIN products p ON si.product_id = p.product_id
ORDER BY s.sale_date DESC
LIMIT 20;

-- 📦 7. Supplier Product Summary
SELECT 
    sup.name AS supplier_name,
    COUNT(p.product_id) AS total_products_supplied,
    SUM(p.stock_quantity) AS total_stock
FROM suppliers sup
JOIN products p ON p.supplier_id = sup.supplier_id
GROUP BY supplier_name
ORDER BY total_stock DESC;
