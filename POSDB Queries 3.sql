----Say the restaurant has just added a new unique item to the menu - they may want to see its contribution 
----to total sales for the week to decide whether to keep it on the menu; if the item were food, they 
----wouldn't want to include sales for beverages in this result.

SELECT (SUM(price) / (SELECT(SUM(total)) 
		FROM sale s JOIN ordered_items oi ON s.order_number = oi.order_number JOIN menu_item m ON oi.item_name = m.item_name 
		WHERE course_name != 'Beverage')) * 100 AS percentage_of_food_sales
	FROM menu_item m JOIN ordered_items oi ON m.item_name = oi.item_name JOIN sale s ON oi.order_number = s.order_number 
	WHERE m.item_name = 'Signature Cheeseburger';

----A query could be used to display orders which ordered more than one of a specific item along with the number of 
----guests on that check in order to analyze patterns in sales based on party size.

SELECT oi.order_number, COUNT(oi.item_name) AS drinks_sold, number_of_guests FROM order_data od JOIN ordered_items oi ON od.order_number = oi.order_number
JOIN menu_item m ON oi.item_name = m.item_name WHERE oi.item_name LIKE '%Liquor%' GROUP BY oi.order_number, number_of_guests HAVING COUNT(*) > 1;