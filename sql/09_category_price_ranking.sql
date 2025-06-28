WITH category_price_extremes AS(
	SELECT
		category_id,
		product_id,
		product_name,
		unit_price,
		FIRST_VALUE(unit_price) OVER (
			PARTITION BY category_id ORDER BY unit_price) AS min_price,
		LAST_VALUE(unit_price) OVER (
			PARTITION BY category_id ORDER BY unit_price
			ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS max_price
	FROM products
)

SELECT *
FROM category_price_extremes
WHERE unit_price = min_price OR unit_price = max_price
