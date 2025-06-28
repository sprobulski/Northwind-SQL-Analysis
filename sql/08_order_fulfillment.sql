WITH Avg_shipping_time AS(
	SELECT 
		company_name,
		AVG(shipped_date - order_date) as avg_shipping
	FROM orders o
		INNER JOIN customers c
			ON o.customer_id = c.customer_id
	GROUP BY company_name
),

Delayed_orders AS(
	SELECT
		order_id,
		shipped_date,
		order_date,
		shipped_date - order_date AS shipping_delay_days ,
		CASE
			WHEN (shipped_date - order_date) > 5 THEN 1
			ELSE 0
		END AS delayed_order
	FROM orders
)



SELECT *
FROM Delayed_orders;

