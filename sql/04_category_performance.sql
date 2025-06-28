WITH Category_performance AS (
	SELECT 
		c.category_name,
		SUM(d.unit_price*d.quantity) as Total_sales,
		COUNT(DISTINCT p.product_id) as Total_products,
		AVG(d.unit_price) as Avg_unit_price
	FROM products p
	INNER JOIN categories c
		ON p.category_id = c.category_id
	INNER JOIN order_details d
		ON d.product_id = p.product_id
	GROUP BY c.category_name
)
SELECT *
FROM Category_performance;
