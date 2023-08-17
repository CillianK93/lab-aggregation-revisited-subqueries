-- Question 1 
DELIMITER //
create procedure category_check(in param1 char(100))
begin

  select first_name, last_name, email
  from customer
  join rental on customer.customer_id = rental.customer_id
  join inventory on rental.inventory_id = inventory.inventory_id
  join film on film.film_id = inventory.film_id
  join film_category on film_category.film_id = film.film_id
  join category on category.category_id = film_category.category_id
  where category.name = param1
  group by first_name, last_name, email;
  
  end //
  DELIMITER ;
  
  call category_check('Children');
  
  -- Question 2
  
  SELECT c.name, count(fc.film_id) as number_of_films FROM category c
  JOIN film_category fc on fc.category_id = c.category_id
  GROUP BY c.name
  HAVING number_of_films > 70;
  
  DELIMITER //
  
  create procedure films_released(in x int)
  begin
  
  SELECT c.name, count(fc.film_id) as number_of_films FROM category c
  JOIN film_category fc on fc.category_id = c.category_id
  GROUP BY c.name
  HAVING number_of_films > x;
  
  end //
  DELIMITER ;
  
  call films_released(65);
  
  
  
  
  
  
