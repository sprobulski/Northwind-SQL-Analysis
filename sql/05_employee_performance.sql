WITH Employee_performance AS (
	SELECT
		CONCAT(e.last_name,' ', e.first_name) as employee,
		COUNT(DISTINCT o.order_id) as Sales_amount,
		SUM(d.unit_price*d.quantity) as Total_sales_value,
		SUM(d.unit_price * d.quantity) / COUNT(DISTINCT o.order_id) avg_order_value

	FROM employees e 
		INNER JOIN orders o 
			ON e.employee_id = o.employee_id
		INNER JOIN order_details d
			ON d.order_id = o.order_id 
	GROUP BY employee
)

SELECT *
FROM Employee_performance;
