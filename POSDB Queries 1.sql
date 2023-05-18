----When giving a customer their check, a server would need to know the total for an entire bill of items.

SELECT SUM(price) AS order_total 
	FROM ordered_items JOIN menu_item ON ordered_items.item_name = menu_item.item_name 
	WHERE order_number = 18653;

----In addition, it would be useful for the customer to see a breakdown of the items ordered, how many of each were ordered, 
----and the subtotal of each item.

SELECT DISTINCT ordered_items.item_name, COUNT(*) AS quantity, SUM(price) AS subtotal
	FROM ordered_items JOIN menu_item ON ordered_items.item_name = menu_item.item_name
	WHERE order_number = '18653' 
	GROUP BY ordered_items.item_name;

