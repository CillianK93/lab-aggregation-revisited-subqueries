-- Question 1 

SELECT DISTINCT(c.first_name), c.last_name, c.email FROM customer c
JOIN rental r
ON c.customer_id = r.customer_id
WHERE r.rental_id >= 1;

-- Question 2 
SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) as Full_Name, AVG(p.amount) FROM customer c
JOIN payment p
on c.customer_id = p.customer_id
group by c.customer_id;

-- Question 3

SELECT CONCAT(c.first_name, ' ', c.last_name) AS Full_name, c.email FROM rental r
JOIN customer c
ON r.customer_id = c.customer_id
JOIN inventory i
ON r.inventory_id = i.inventory_id
JOIN film_category fc
ON fc.film_id = i.film_id
JOIN category ca
ON fc.category_id = ca.category_id
WHERE ca.name = 'Action'
group by Full_name, c.email
order by Full_name;

-- Question 4

SELECT CONCAT(first_name, ' ', last_name) AS Full_name, email FROM customer
WHERE customer_id in
(SELECT customer_id FROM rental
WHERE inventory_id in
(SELECT inventory_id FROM inventory
WHERE film_id in
(SELECT film_id FROM film_category
WHERE category_id in
(SELECT category_id FROM category
WHERE name = 'Action'))));

-- Question 5 

SELECT *,
CASE 
	WHEN amount between 0 and 2 THEN 'Low'
	WHEN amount between 2 and 4 THEN 'Medium'
	WHEN amount > 4 THEN 'High'
END AS Amount_Type
FROM payment;











