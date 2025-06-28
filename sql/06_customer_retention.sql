WITH customer_lags  AS (
	SELECT
		customer_id,
		order_date,
		order_date - LAG(order_date)
			OVER (PARTITION BY customer_id ORDER BY order_date)
			AS days_since_last_order	
	FROM orders
),

one_time_customers AS (
  SELECT customer_id
  FROM orders
  GROUP BY customer_id
  HAVING COUNT(order_id) = 1
),

average_gap AS (
  SELECT
    customer_id,
	AVG(days_since_last_order) AS avg_days_between_orders,
	CASE
		WHEN AVG(days_since_last_order) <= 60 THEN 1
		ELSE 0
	END AS loyal_customer
  FROM customer_lags
  GROUP BY customer_id
)


SELECT customer_id, avg_days_between_orders, loyal_customer
FROM average_gap;

