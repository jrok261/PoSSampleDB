--CREATE TABLE employee(
--  employee_id INT,
--  last_name VARCHAR(20) NOT NULL,
--  first_name VARCHAR(20) NOT NULL,
--  role VARCHAR(15) NOT NULL,
--  wage NUMERIC(4, 2) NOT NULL,
--  PRIMARY KEY(employee_id),
--  CHECK (wage > 0)
--);

--CREATE TABLE punch(
--  employee_id INT,
--  time_in DATETIME,
--  time_out DATETIME,
--  PRIMARY KEY(employee_id, time_in),
--  FOREIGN KEY(employee_id) REFERENCES employee,
--  CHECK (time_out > time_in)
--);

--CREATE TABLE menu_item(
--  item_name VARCHAR(30),
--  course_name VARCHAR(10),
--  price NUMERIC(5, 2) NOT NULL,
--  PRIMARY KEY(item_name),
--  CHECK (price > 0)
--);

--CREATE TABLE order_data(
--  order_number INT,
--  table_number INT,
--  number_of_guests INT NOT NULL,
--  PRIMARY KEY(order_number)
--);

--CREATE TABLE sale(
--  order_number INT,
--  employee_id INT,
--  when_sold DATETIME NOT NULL,
--  total NUMERIC(7,2) NOT NULL,
--  PRIMARY KEY(order_number, employee_id),
--  FOREIGN KEY(order_number) REFERENCES order_data,
--  FOREIGN KEY(employee_id) REFERENCES employee,
--  CHECK (total > 0)
--);

--CREATE TABLE ordered_items(
--  order_number INT,
--  item_name VARCHAR(30),
--  item_number INT NOT NULL,
--  PRIMARY KEY(item_number, order_number),
--  FOREIGN KEY(item_name) REFERENCES menu_item,
--  FOREIGN KEY(order_number) REFERENCES order_data
--);

--INSERT INTO employee VALUES ('1956', 'Bourdain', 'Anthony', 'Executive Chef', 30.00);
--INSERT INTO employee VALUES ('1875', 'Brown', 'Alton', 'Cook', 13.50);
--INSERT INTO employee VALUES ('1854', 'Goldman', 'Duff', 'Cook', 12.00);
--INSERT INTO employee VALUES ('1971', 'Reynolds', 'Dee', 'Server', 7.25);
--INSERT INTO employee VALUES ('1902', 'Randleman', 'Randy', 'Bartender', 8.00);
--INSERT INTO employee VALUES ('1963', 'Bluth', 'George Oscar', 'Server', 7.25);
--INSERT INTO employee VALUES ('1896', 'Scott', 'Michael', 'Server', 9.00);
--INSERT INTO employee VALUES ('1799', 'Reynolds', 'Frank', 'General Manager', 33.00);

--INSERT INTO menu_item VALUES ('6-oz Filet', 'Entree', 15.95);
--INSERT INTO menu_item VALUES ('Shrimp Cocktail', 'Appetizer', 8.95);
--INSERT INTO menu_item VALUES ('Signature Cheeseburger', 'Entree', 10.95);
--INSERT INTO menu_item VALUES ('Penne Vodka', 'Entree', 13.95);
--INSERT INTO menu_item VALUES ('Boneless Chicken Bites', 'Appetizer', 7.95);
--INSERT INTO menu_item VALUES ('Soup du Jour', 'Soup/Salad', 3.75);
--INSERT INTO menu_item VALUES ('House Salad', 'Soup/Salad', 4.25);
--INSERT INTO menu_item VALUES ('Chicken Francaise', 'Entree', 14.95);
--INSERT INTO menu_item VALUES ('Lump Crab Cakes', 'Entree', 21.95);
--INSERT INTO menu_item VALUES ('Fountain Soda', 'Beverage', 2.00);
--INSERT INTO menu_item VALUES ('Pint Draft', 'Beverage', 3.00);
--INSERT INTO menu_item VALUES ('House Wine', 'Beverage', 5.50);
--INSERT INTO menu_item VALUES ('House Liquor', 'Beverage', 6.50);
--INSERT INTO menu_item VALUES ('Premium Liquor', 'Beverage', 8.50);
--INSERT INTO menu_item VALUES ('Top-Shelf Liquor', 'Beverage', 10.00);  

--INSERT INTO punch VALUES ('1971', '2019-07-25 16:01:23', '2019-07-25 23:03:45');
--INSERT INTO punch VALUES ('1956', '2019-07-25 15:07:26', '2019-07-26 00:04:23');
--INSERT INTO punch VALUES ('1799', '2019-07-25 13:00:54', '2019-07-25 21:05:56');
--INSERT INTO punch VALUES ('1902', '2019-07-25 14:02:45', '2019-07-26 01:02:44');
--INSERT INTO punch VALUES ('1963', '2019-07-26 16:05:43', '2019-07-26 23:00:22');
--INSERT INTO punch VALUES ('1902', '2019-07-26 14:01:33', '2019-07-27 01:01:12');
--INSERT INTO punch VALUES ('1799', '2019-07-26 13:02:23', '2019-07-26 21:07:13');
--INSERT INTO punch VALUES ('1854', '2019-07-26 15:04:13', '2019-07-27 00:01:24');
--INSERT INTO punch VALUES ('1896', '2019-07-27 16:03:55', '2019-07-27 23:01:46');
--INSERT INTO punch VALUES ('1902', '2019-07-27 14:05:27', '2019-07-28 01:06:59');
--INSERT INTO punch VALUES ('1799', '2019-07-27 13:07:37', '2019-07-27 21:35:34');
--INSERT INTO punch VALUES ('1875', '2019-07-27 15:03:44', '2019-07-28 00:22:32');
--INSERT INTO punch VALUES ('1956', '2019-07-27 14:59:59', '2019-07-28 00:26:22');
--INSERT INTO punch VALUES ('1902', '2019-07-28 14:04:11', '2019-07-29 01:31:28');
--INSERT INTO punch VALUES ('1971', '2019-07-28 16:00:06', '2019-07-28 23:55:48');
--INSERT INTO punch VALUES ('1799', '2019-07-28 13:03:44', '2019-07-28 21:00:37');
--INSERT INTO punch VALUES ('1956', '2019-07-28 14:55:49', '2019-07-29 00:03:26');
--INSERT INTO punch VALUES ('1854', '2019-07-29 15:09:23', '2019-07-30 00:34:21');
--INSERT INTO punch VALUES ('1963', '2019-07-29 16:01:56', '2019-07-29 23:45:32');
--INSERT INTO punch VALUES ('1896', '2019-07-29 16:05:41', '2019-07-29 23:57:11');
--INSERT INTO punch VALUES ('1799', '2019-07-29 13:15:10', '2019-07-29 21:09:43');
--INSERT INTO punch VALUES ('1902', '2019-07-29 13:57:32', '2019-07-30 01:50:25');

--INSERT INTO order_data VALUES ('18651', '8', 3);
--INSERT INTO order_data VALUES ('18652', '12', 2);
--INSERT INTO order_data VALUES ('18653', '4', 4);
--INSERT INTO order_data VALUES ('18654', '2', 3);
--INSERT INTO order_data VALUES ('18655', '9', 4);
--INSERT INTO order_data VALUES ('18656', '11', 2);
--INSERT INTO order_data VALUES ('18657', '5', 5);
--INSERT INTO order_data VALUES ('18658', '7', 2);
--INSERT INTO order_data VALUES ('18659', '9', 3);
--INSERT INTO order_data VALUES ('18660', '4', 3);
--INSERT INTO order_data VALUES ('18661', '10', 4);
--INSERT INTO order_data VALUES ('18662', '8', 1);
--INSERT INTO order_data VALUES ('18663', '7', 2);
--INSERT INTO order_data VALUES ('18664', '2', 1);
--INSERT INTO order_data VALUES ('18665', '3', 1);
--INSERT INTO order_data VALUES ('18666', '1', 1);
--INSERT INTO order_data VALUES ('18667', '5', 3);
--INSERT INTO order_data VALUES ('18668', '12', 2);
--INSERT INTO order_data VALUES ('18669', '4', 1);
--INSERT INTO order_data VALUES ('18670', '9', 1);
--INSERT INTO order_data VALUES ('18671', '8', 2);
--INSERT INTO order_data VALUES ('18672', '11', 3);
--INSERT INTO order_data VALUES ('18673', '1', 2);
--INSERT INTO order_data VALUES ('18674', '6', 2);

--INSERT INTO ordered_items VALUES ('18651', 'Fountain Soda', '1');
--INSERT INTO ordered_items VALUES ('18651', 'House Wine', '2');
--INSERT INTO ordered_items VALUES ('18651', 'Pint Draft', '3');
--INSERT INTO ordered_items VALUES ('18651', 'Soup du Jour', '4');
--INSERT INTO ordered_items VALUES ('18651', 'House Salad', '5');
--INSERT INTO ordered_items VALUES ('18651', 'Pint Draft', '6');
--INSERT INTO ordered_items VALUES ('18651', '6-oz Filet', '7');
--INSERT INTO ordered_items VALUES ('18651', 'Lump Crab Cakes', '8');
--INSERT INTO ordered_items VALUES ('18651', 'Signature Cheeseburger', '9');
--INSERT INTO ordered_items VALUES ('18652', 'Pint Draft', '1');
--INSERT INTO ordered_items VALUES ('18652', 'Top-Shelf Liquor', '2');
--INSERT INTO ordered_items VALUES ('18652', 'House Salad', '3');
--INSERT INTO ordered_items VALUES ('18652', 'Penne Vodka', '4');
--INSERT INTO ordered_items VALUES ('18652', 'Top-Shelf Liquor', '5');
--INSERT INTO ordered_items VALUES ('18652', 'Pint Draft', '6');
--INSERT INTO ordered_items VALUES ('18653', 'Fountain Soda', '1');
--INSERT INTO ordered_items VALUES ('18653', 'House Wine', '2');
--INSERT INTO ordered_items VALUES ('18653', 'House Liquor', '3');
--INSERT INTO ordered_items VALUES ('18653', 'Premium Liquor', '4');
--INSERT INTO ordered_items VALUES ('18653', '6-oz Filet', '5');
--INSERT INTO ordered_items VALUES ('18653', 'Lump Crab Cakes', '6');
--INSERT INTO ordered_items VALUES ('18653', 'Signature Cheeseburger', '7');
--INSERT INTO ordered_items VALUES ('18653', 'Soup du Jour', '8');
--INSERT INTO ordered_items VALUES ('18653', 'House Wine', '9');
--INSERT INTO ordered_items VALUES ('18653', 'Pint Draft', '10');
--INSERT INTO ordered_items VALUES ('18653', 'House Liquor', '11');
--INSERT INTO ordered_items VALUES ('18653', 'Premium Liquor', '12');
--INSERT INTO ordered_items VALUES ('18654', 'Top-Shelf Liquor', '1');
--INSERT INTO ordered_items VALUES ('18654', 'Top-Shelf Liquor', '2');
--INSERT INTO ordered_items VALUES ('18654', 'Top-Shelf Liquor', '3');
--INSERT INTO ordered_items VALUES ('18654', 'Top-Shelf Liquor', '4');
--INSERT INTO ordered_items VALUES ('18654', 'Top-Shelf Liquor', '5');
--INSERT INTO ordered_items VALUES ('18654', 'Top-Shelf Liquor', '6');
--INSERT INTO ordered_items VALUES ('18655', 'Top-Shelf Liquor', '1');
--INSERT INTO ordered_items VALUES ('18655', 'Pint Draft', '2');
--INSERT INTO ordered_items VALUES ('18655', 'Pint Draft', '3');
--INSERT INTO ordered_items VALUES ('18655', 'Soup du Jour', '4');
--INSERT INTO ordered_items VALUES ('18655', 'Signature Cheeseburger', '5');
--INSERT INTO ordered_items VALUES ('18656', 'Fountain Soda', '1');
--INSERT INTO ordered_items VALUES ('18656', 'House Wine', '2');
--INSERT INTO ordered_items VALUES ('18656', 'House Salad', '3');
--INSERT INTO ordered_items VALUES ('18656', 'Penne Vodka', '4');
--INSERT INTO ordered_items VALUES ('18656', 'Lump Crab Cakes', '5');
--INSERT INTO ordered_items VALUES ('18657', 'Top-Shelf Liquor', '1');
--INSERT INTO ordered_items VALUES ('18657', 'House Liquor', '2');
--INSERT INTO ordered_items VALUES ('18657', 'Premium Liquor', '3');
--INSERT INTO ordered_items VALUES ('18657', 'Premium Liquor', '4');
--INSERT INTO ordered_items VALUES ('18657', 'Soup du Jour', '5');
--INSERT INTO ordered_items VALUES ('18657', 'House Salad', '6');
--INSERT INTO ordered_items VALUES ('18657', 'Penne Vodka', '7');
--INSERT INTO ordered_items VALUES ('18657', '6-oz Filet', '8');
--INSERT INTO ordered_items VALUES ('18657', 'Chicken Francaise', '9');
--INSERT INTO ordered_items VALUES ('18657', 'Shrimp Cocktail', '10');
--INSERT INTO ordered_items VALUES ('18658', 'Premium Liquor', '1');
--INSERT INTO ordered_items VALUES ('18658', 'Pint Draft', '2');
--INSERT INTO ordered_items VALUES ('18658', 'Boneless Chicken Bites', '3');
--INSERT INTO ordered_items VALUES ('18658', 'Shrimp Cocktail', '4');
--INSERT INTO ordered_items VALUES ('18659', 'Top-Shelf Liquor', '1');
--INSERT INTO ordered_items VALUES ('18659', 'House Liquor', '2');
--INSERT INTO ordered_items VALUES ('18659', 'Signature Cheeseburger', '3');
--INSERT INTO ordered_items VALUES ('18659', 'Boneless Chicken Bites', '4');
--INSERT INTO ordered_items VALUES ('18660', 'Fountain Soda', '1');
--INSERT INTO ordered_items VALUES ('18660', 'Shrimp Cocktail', '2');
--INSERT INTO ordered_items VALUES ('18660', 'Pint Draft', '3');
--INSERT INTO ordered_items VALUES ('18661', 'Top-Shelf Liquor', '1');
--INSERT INTO ordered_items VALUES ('18662', 'House Wine', '1');
--INSERT INTO ordered_items VALUES ('18662', 'House Liquor', '2');
--INSERT INTO ordered_items VALUES ('18662', 'Lump Crab Cakes', '3');

--INSERT INTO sale VALUES ('18651', '1971', '2019-07-25 17:03:23', 
--(SELECT SUM(price) FROM ordered_items JOIN menu_item ON dbo.ordered_items.item_name = dbo.menu_item.item_name WHERE order_number = '18651'));
--INSERT INTO sale VALUES ('18652', '1971', '2019-07-25 19:31:53', 
--(SELECT SUM(price) FROM ordered_items JOIN menu_item ON dbo.ordered_items.item_name = dbo.menu_item.item_name WHERE order_number = '18652'));
--INSERT INTO sale VALUES ('18653', '1902', '2019-07-25 21:56:27', 
--(SELECT SUM(price) FROM ordered_items JOIN menu_item ON dbo.ordered_items.item_name = dbo.menu_item.item_name WHERE order_number = '18653'));
--INSERT INTO sale VALUES ('18654', '1963', '2019-07-26 16:55:44', 
--(SELECT SUM(price) FROM ordered_items JOIN menu_item ON dbo.ordered_items.item_name = dbo.menu_item.item_name WHERE order_number = '18654'));
--INSERT INTO sale VALUES ('18655', '1902', '2019-07-26 15:07:33', 
--(SELECT SUM(price) FROM ordered_items JOIN menu_item ON dbo.ordered_items.item_name = dbo.menu_item.item_name WHERE order_number = '18655'));
--INSERT INTO sale VALUES ('18656', '1963', '2019-07-26 18:45:21', 
--(SELECT SUM(price) FROM ordered_items JOIN menu_item ON dbo.ordered_items.item_name = dbo.menu_item.item_name WHERE order_number = '18656'));
--INSERT INTO sale VALUES ('18657', '1896', '2019-07-27 17:24:23', 
--(SELECT SUM(price) FROM ordered_items JOIN menu_item ON dbo.ordered_items.item_name = dbo.menu_item.item_name WHERE order_number = '18657'));
--INSERT INTO sale VALUES ('18658', '1902', '2019-07-27 23:52:11', 
--(SELECT SUM(price) FROM ordered_items JOIN menu_item ON dbo.ordered_items.item_name = dbo.menu_item.item_name WHERE order_number = '18658'));
--INSERT INTO sale VALUES ('18659', '1902', '2019-07-28 22:09:16', 
--(SELECT SUM(price) FROM ordered_items JOIN menu_item ON dbo.ordered_items.item_name = dbo.menu_item.item_name WHERE order_number = '18659'));
--INSERT INTO sale VALUES ('18660', '1971', '2019-07-28 18:26:38', 
--(SELECT SUM(price) FROM ordered_items JOIN menu_item ON dbo.ordered_items.item_name = dbo.menu_item.item_name WHERE order_number = '18660'));
--INSERT INTO sale VALUES ('18661', '1896', '2019-07-29 20:49:29', 
--(SELECT SUM(price) FROM ordered_items JOIN menu_item ON dbo.ordered_items.item_name = dbo.menu_item.item_name WHERE order_number = '18661'));
--INSERT INTO sale VALUES ('18662', '1963', '2019-07-29 19:51:30', 
--(SELECT SUM(price) FROM ordered_items JOIN menu_item ON ordered_items.item_name = menu_item.item_name WHERE order_number = '18662'));

--SELECT * FROM ordered_items ORDER BY order_number, item_number;
--SELECT * FROM sale;