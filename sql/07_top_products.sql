WITH top_products AS(
	SELECT 
		p.product_name,
		SUM(d.unit_price*d.quantity) as total_revenue_per_product,
		RANK() OVER (ORDER BY SUM(d.unit_price*d.quantity) DESC)
	FROM products p 
		LEFT JOIN order_details d 
			ON p.product_id = d.product_id
	GROUP BY p.product_name
	ORDER BY total_revenue_per_product DESC
),

not_sold_last_month AS(
	SELECT 
		p.product_name,
		MAX(o.order_date)
	FROM products p 
		LEFT JOIN order_details d 
			ON p.product_id = d.product_id
		LEFT JOIN orders o
			ON o.order_id = d.order_id
	GROUP BY p.product_id
	HAVING (SELECT MAX(order_date) FROM orders) - INTERVAL '1 month' > MAX(o.order_date)


)
SELECT *
FROM not_sold_last_month

