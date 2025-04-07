-- Create View: Top 10 Best Selling Products
CREATE OR REPLACE VIEW top_10_best_sellers AS
SELECT 
    p.product_id,
    p.product_name,
    SUM(si.quantity) AS total_sold,
    COUNT(si.sale_item_id) AS times_sold
FROM 
    products p
JOIN 
    sale_items si ON p.product_id = si.product_id
GROUP BY 
    p.product_id, p.product_name
ORDER BY 
    total_sold DESC
LIMIT 10;

-- --------------------------------------------------------

-- Create Stored Procedure: Insert a Sale Item
CREATE OR REPLACE PROCEDURE insert_sale_item(
    p_product_id INT,
    p_quantity INT,
    p_sale_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO sale_items (product_id, quantity, sale_id)
    VALUES (p_product_id, p_quantity, p_sale_id);
END;
$$;

-- --------------------------------------------------------

-- Example Call to Stored Procedure
-- CALL insert_sale_item(1, 3, 101);
