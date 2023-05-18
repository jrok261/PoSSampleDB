----The servers at this resaturant are able to auto-gratuity any table over a certain number of guests 
----(in this case it was 4 guests because the highest data available was 5).

SELECT od.order_number, e.employee_id, total * .18 AS gratuity 
	FROM employee e JOIN sale s ON e.employee_id = s.employee_id JOIN order_data od ON s.order_number = od.order_number 
	WHERE number_of_guests >= 4 
	GROUP BY od.order_number, e.employee_id, total;

----The following query would be used as a simple way to retrieve the amount of time each employee worked each 
----shift for a given week, and convert the datetime values for the punch in and punch out times to simpler decimal values. 
----This would be necessary to determine how many hours they should be payed for. The query rounds these results to 15 minute 
----intervals, and I also attempted below to calculate wages to be payed based on the employees' pay rates. The first commented query displays only hours worked without rounding.
----The second rounds these values to the nearest .25. The third query is my attempt to calculate wages earned using the alias hours_worked*wage. 
----The final calculates wages but uses repetitive code.

--SELECT employee_id, CAST(DATEPART(HOUR, time_out - time_in) + DATEPART(MINUTE, time_out - time_in)/ 60.00 AS DECIMAL(5, 2)) AS hours_worked FROM punch GROUP BY employee_id, time_in, time_out;

SELECT punch.employee_id, CAST(time_out AS DATE) AS shift_date, CAST(ROUND((DATEPART(HOUR, time_out - time_in) + DATEPART(MINUTE, time_out - time_in) / 60.00) / 25, 2) * 25 AS DECIMAL(4, 2)) AS hours_worked 
	FROM punch GROUP BY punch.employee_id, time_in, time_out;

--SELECT employee.employee_id, hours_worked, hours_worked * wage
--	FROM (SELECT CAST(ROUND((DATEPART(HOUR, time_out - time_in) + DATEPART(MINUTE, time_out - time_in) / 60.00) / 25, 2) * 25 AS DECIMAL(5, 2)) AS hours_worked
--	FROM punch JOIN employee ON punch.employee_id = employee.employee_id 
--	GROUP BY punch.employee_id, time_in, time_out) AS hours_worked;

--SELECT punch.employee_id, CAST(ROUND((DATEPART(HOUR, time_out - time_in) + DATEPART(MINUTE, time_out - time_in) / 60.00) / 25, 2) * 25 AS DECIMAL(5, 2)) AS hours_worked, 
--	CAST(ROUND((DATEPART(HOUR, time_out - time_in) + DATEPART(MINUTE, time_out - time_in) / 60.00) / 25, 2) * 25 AS DECIMAL(5, 2)) * wage AS wages_earned
--	FROM punch JOIN employee ON punch.employee_id = employee.employee_id GROUP BY punch.employee_id, time_in, time_out, wage;
