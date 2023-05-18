----In order to analyze sales for a given night, management might want to display all order numbers from a specific date 
----with their totals and the number of items on each order.

SELECT sale.order_number, total, COUNT(item_number) AS number_of_items 
	FROM sale JOIN ordered_items ON sale.order_number = ordered_items.order_number
	WHERE when_sold >= '2019-07-25 00:00:00' AND when_sold < '2019-07-26 00:00:00' 
	GROUP BY sale.order_number, total ORDER BY order_number ASC;

----Management might want to know how many orders were sold on a given night, and how many items were sold of a specific 
----type among all the orders in order to highlight specials for certain items.

SELECT COUNT(order_number) AS orders_sold, 
(SELECT COUNT(*) FROM sale JOIN ordered_items ON sale.order_number = ordered_items.order_number WHERE item_name = 'Premium Liquor' ) AS quantity_of_item_sold
	FROM sale 
	WHERE when_sold >= '2019-07-26 00:00:00' AND when_sold < '2019-07-27 00:00:00';