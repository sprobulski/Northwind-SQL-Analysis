WITH Monthly_sales AS (
  SELECT
    EXTRACT(YEAR FROM o.order_date) AS year,
	EXTRACT(MONTH FROM o.order_date) AS month,
    SUM(d.unit_price * d.quantity) AS Sales
  FROM orders o
  INNER JOIN order_details d ON o.order_id = d.order_id
  GROUP BY EXTRACT(YEAR FROM o.order_date), 
  	EXTRACT(MONTH FROM o.order_date)
  ORDER BY year, month
)

SELECT *,
  Sales - LAG(Sales) OVER (ORDER BY year, month) AS Sales_diff,
  COALESCE(
    100 * (sales - LAG(sales) OVER (ORDER BY year, month)) /
          NULLIF(LAG(sales) OVER (ORDER BY year, month), 0),
  0) AS percentage_change
FROM Monthly_sales;