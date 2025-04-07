-- 🛍️ Top 5 Best-Selling Products
SELECT 
  p.product_name, 
  SUM(si.quantity) AS total_sold
FROM sale_items si
JOIN products p ON si.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 5;

-- 🧠 Why this matters: Shows which items are most popular = useful for marketing + inventory decisions.



--👨‍💼 Sales by Employee
SELECT 
  e.first_name || ' ' || e.last_name AS employee_name,
  COUNT(s.sale_id) AS total_sales,
  SUM(s.total_amount) AS total_revenue
FROM sales s
JOIN employees e ON s.employee_id = e.employee_id
GROUP BY employee_name
ORDER BY total_revenue DESC;

--🧠 Why this matters: Shows which employees are high performers (helpful for HR, bonuses, or training).




-- 📆 Monthly Sales Summary
SELECT 
  DATE_TRUNC('month', sale_date) AS month,
  COUNT(*) AS total_sales,
  SUM(total_amount) AS revenue
FROM sales
GROUP BY month
ORDER BY month;

-- 🧠 Why this matters: Helps detect growth or seasonal patterns. (e.g., December sales peak?)




--👥 Top 5 Customers by Spending
SELECT 
  c.first_name || ' ' || c.last_name AS customer_name,
  COUNT(s.sale_id) AS purchases,
  SUM(s.total_amount) AS total_spent
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 5;

-- 🧠 Why this matters: Identify VIP customers to reward or target for loyalty programs.





-- 📉 Products Running Low on Stock
SELECT 
  product_name,
  stock_quantity
FROM products
WHERE stock_quantity < 20
ORDER BY stock_quantity ASC;

-- 🧠 Why this matters: Prevents stockouts — alerts staff to re-order before it's too late.

