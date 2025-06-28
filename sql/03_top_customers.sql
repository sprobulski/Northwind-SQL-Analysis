WITH Top_customers AS (
  SELECT 
  	o.customer_id,
	COUNT(o.order_id) as total_sales,
  	AVG(d.unit_price*d.quantity) as average_order_value,
	RANK() OVER (ORDER BY COUNT(o.order_id) DESC) as customer_rank
  FROM orders o 
  	INNER JOIN order_details d
	  	ON o.order_id = d.order_id
  GROUP BY o.customer_id
)
SELECT *
FROM Top_customers
WHERE customer_rank <= 10;