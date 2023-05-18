----When giving a customer their check, a server would need to know the total for an entire bill of items.

--SELECT SUM(price) AS order_total 
--	FROM ordered_items JOIN menu_item ON ordered_items.item_name = menu_item.item_name 
--	WHERE order_number = 18653;

----In addition, it would be useful to show a breakdown of the items ordered, how many of each were ordered, 
----and the subtotal of each item.

--SELECT DISTINCT ordered_items.item_name, COUNT(*) AS quantity, SUM(price) AS subtotal
--	FROM ordered_items JOIN menu_item ON ordered_items.item_name = menu_item.item_name
--	WHERE order_number = '18653' 
--	GROUP BY ordered_items.item_name;

----In order to analyze sales for a given night, management might want to display all order numbers from a specific date 
----with their totals and the number of items on each order.

--SELECT sale.order_number, total, COUNT(item_number) AS number_of_items 
--	FROM sale JOIN ordered_items ON sale.order_number = ordered_items.order_number
--	WHERE when_sold >= '2019-07-25 00:00:00' AND when_sold < '2019-07-26 00:00:00' 
--	GROUP BY sale.order_number, total ORDER BY order_number ASC;

----Management might want to know how many orders were sold on a given night, and how many items were sold of a specific 
----type among all the orders in order to highlight specials for certain items.

--SELECT COUNT(order_number) AS orders_sold, 
--(SELECT COUNT(*) FROM sale JOIN ordered_items ON sale.order_number = ordered_items.order_number WHERE item_name = 'Premium Liquor' ) AS quantity_of_item_sold
--	FROM sale 
--	WHERE when_sold >= '2019-07-26 00:00:00' AND when_sold < '2019-07-27 00:00:00';

----Say the restaurant has just added a new unique item to the menu - they may want to see its contribution 
----to total sales for the week to decide whether to keep it on the menu; if the item were food, they 
----wouldn't want to include sales for beverages in this result.

--SELECT (SUM(price) / (SELECT(SUM(total)) 
--		FROM sale s JOIN ordered_items oi ON s.order_number = oi.order_number JOIN menu_item m ON oi.item_name = m.item_name 
--		WHERE course_name != 'Beverage')) * 100 AS percentage_of_food_sales
--	FROM menu_item m JOIN ordered_items oi ON m.item_name = oi.item_name JOIN sale s ON oi.order_number = s.order_number 
--	WHERE m.item_name = 'Signature Cheeseburger';

----A query could be used to display orders which ordered more than one of a specific item along with the number of 
----guests on that check in order to analyze patterns in sales based on party size.

--SELECT oi.order_number, COUNT(oi.item_name) AS drinks_sold, number_of_guests FROM order_data od JOIN ordered_items oi ON od.order_number = oi.order_number
--JOIN menu_item m ON oi.item_name = m.item_name WHERE oi.item_name LIKE '%Liquor%' GROUP BY oi.order_number, number_of_guests HAVING COUNT(*) > 1;

----The servers at this resaturant are able to auto-gratuity any table over a certain number of guests 
----(in this case it was 4 guests because the highest data available was 5).

--SELECT od.order_number, e.employee_id, total * .18 AS gratuity 
--	FROM employee e JOIN sale s ON e.employee_id = s.employee_id JOIN order_data od ON s.order_number = od.order_number 
--	WHERE number_of_guests >= 4 
--	GROUP BY od.order_number, e.employee_id, total;

----The following query would be used as a simple way to retrieve the amount of time each employee worked each 
----shift for a given week, and convert the datetime values for the punch in and punch out times to simpler decimal values. 
----This would be necessary to determine how many hours they should be payed for. The query rounds these results to 15 minute 
----intervals, and I also attempted below to calculate wages to be payed based on the employees' pay rates. The first commented query displays only hours worked without rounding.
----The second rounds these values to the nearest .25. The third query is my attempt to calculate wages earned using the alias hours_worked*wage. 
----The final calculates wages but uses repetitive code.

--SELECT employee_id, CAST(DATEPART(HOUR, time_out - time_in) + DATEPART(MINUTE, time_out - time_in)/ 60.00 AS DECIMAL(5, 2)) AS hours_worked FROM punch GROUP BY employee_id, time_in, time_out;

SELECT punch.employee_id, CAST(time_out AS DATE) AS shift_date, CAST(ROUND((DATEPART(HOUR, time_out - time_in) + DATEPART(MINUTE, time_out - time_in) / 60.00) / 25, 2) * 25 AS DECIMAL(5, 2)) AS hours_worked 
	FROM punch GROUP BY punch.employee_id, time_in, time_out;

--SELECT employee.employee_id, hours_worked, hours_worked * wage
--	FROM (SELECT CAST(ROUND((DATEPART(HOUR, time_out - time_in) + DATEPART(MINUTE, time_out - time_in) / 60.00) / 25, 2) * 25 AS DECIMAL(5, 2)) AS hours_worked
--	FROM punch JOIN employee ON punch.employee_id = employee.employee_id 
--	GROUP BY punch.employee_id, time_in, time_out) AS hours_worked;

--SELECT punch.employee_id, CAST(ROUND((DATEPART(HOUR, time_out - time_in) + DATEPART(MINUTE, time_out - time_in) / 60.00) / 25, 2) * 25 AS DECIMAL(5, 2)) AS hours_worked, 
--	CAST(ROUND((DATEPART(HOUR, time_out - time_in) + DATEPART(MINUTE, time_out - time_in) / 60.00) / 25, 2) * 25 AS DECIMAL(5, 2)) * wage AS wages_earned
--	FROM punch JOIN employee ON punch.employee_id = employee.employee_id GROUP BY punch.employee_id, time_in, time_out, wage;





