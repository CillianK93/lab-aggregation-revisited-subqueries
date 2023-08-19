-- Question 1

SELECT s.store_id, sum(p.amount) FROM store s
join staff st on s.store_id = st.store_id
join payment p on p.staff_id = st.staff_id
GROUP BY s.store_id;

-- Question 2/3

DELIMITER //
create procedure amount_by_store(in param1 char(10))

begin

SELECT s.store_id, sum(p.amount) FROM store s
JOIN staff st ON s.store_id = st.store_id
JOIN payment p ON p.staff_id = st.staff_id
WHERE s.store_id = param1
GROUP BY s.store_id;

end //
DELIMITER ;

call amount_by_store(2)

-- Question 3 and 4
DELIMITER //
create procedure amount_by_store(in param1 char(10), out param2 float, out param3 char(10)) 

begin

	declare total_sales_value float default 0.0;
	declare flag varchar(20) default "";

SELECT sum(p.amount) INTO total_sales_value 
FROM store s
JOIN staff st ON s.store_id = st.store_id
JOIN payment p ON p.staff_id = st.staff_id
WHERE s.store_id = param1
GROUP BY s.store_id;

IF total_sales_value > 30000 THEN
	SET flag = 'green_flag';
ELSE
	SET flag = 'red_flag';
END IF;

SET param2 = total_sales_value;
SET param3 = flag;

SELECT total_sales_value, flag;

end //
DELIMITER ;

call amount_by_store(1, @total_sales_value, @flag);












