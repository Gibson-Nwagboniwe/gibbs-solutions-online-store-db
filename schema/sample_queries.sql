-- Top 5 best-selling products
SELECT p.product_name, SUM(si.quantity) AS total_sold
FROM sale_items si
JOIN products p ON si.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 5;

-- Monthly sales summary
SELECT DATE_TRUNC('month', sale_date) AS month, SUM(total_amount) AS revenue
FROM sales
GROUP BY month
ORDER BY month;

-- Low stock alert
SELECT product_name, stock_quantity
FROM products
WHERE stock_quantity < 10;
