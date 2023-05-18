--UPDATE menu_item SET price = 26.95 WHERE item_name = '6-oz Filet';

--UPDATE menu_item SET price = 29.95 WHERE item_name = 'Lump Crab Cakes';

--UPDATE menu_item SET price +=2  WHERE course_name = 'Appetizer';

--UPDATE menu_item SET price +=1  WHERE item_name LIKE '%Wine%' OR item_name LIKE '%Liquor%' AND item_name NOT LIKE '%House%';

--ALTER TABLE menu_item ADD course_number INT;

--UPDATE menu_item SET course_number = 1 WHERE course_name = 'Appetizer';
--UPDATE menu_item SET course_number = 2 WHERE course_name = 'Soup/Salad';
--UPDATE menu_item SET course_number = 3 WHERE course_name = 'Entree';

SELECT * FROM menu_item;