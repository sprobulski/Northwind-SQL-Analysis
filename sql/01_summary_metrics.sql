WITH Summary_metrics AS(
SELECT
	count(c.customer_id) as Total_customers,
	count(o.order_id) as Total_orders,
	sum(d.unit_price*d.quantity) Total_sales
FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id
	INNER JOIN order_details d ON o.order_id = d.order_id	
)

SELECT *
FROM Summary_metrics