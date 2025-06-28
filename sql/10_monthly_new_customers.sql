WITH month_of_first_order AS(
	SELECT
		customer_id,
		EXTRACT(YEAR FROM MIN(order_date)) AS year,
		EXTRACT(MONTH FROM MIN(order_date)) AS month
	FROM orders
	GROUP BY customer_id
),

new_customers_per_month AS(
	SELECT
		year,
		month,
		COUNT(month) AS total_new_customers
	FROM month_of_first_order
	GROUP BY year, month
),

new_customers_trend AS(
	SELECT
		year,
		month,
		total_new_customers - LAG(total_new_customers)
			OVER(ORDER BY year, month) AS new_customers_trend
	FROM new_customers_per_month
)

SELECT
  year,
  month,
  total_new_customers,
  new_customers_trend
FROM new_customers_trend;