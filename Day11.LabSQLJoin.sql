/*Lab | SQL Join
In this lab, you will be using the Sakila database of movie rentals.

Instructions
List number of films per category.*/

USE sakila;

select  c.name, count(f.film_id) AS n_of_films
from sakila.category as c
join sakila.film_category as f -- default type of join is INNER JOIN. 
on c.category_id = f.category_id
group by c.name;
#return16


#Display the first and last names, as well as the address, of each staff member.
select  s.staff_id, s.first_name, s.last_name, s.address_id, a.address
from sakila.staff as s
join sakila.address as a 
on a.address_id = s.address_id
Order by s.first_name ASC;

#Display the total amount rung up by each staff member in August of 2005.
select  s.staff_id, s.first_name, s.last_name, sum(p.amount) AS 'Rung Amount'
from sakila.staff as s
join sakila.payment as p 
on p.staff_id = s.staff_id
where month (p.payment_date) = 08 and year(p.payment_date) = 2005
group by s.staff_id
Order by s.first_name ASC;

#List each film and the number of actors who are listed for that film.
SELECT f.film_id, f.title, count(a.actor_id) AS 'N_Actors'
FROM sakila.film_actor as a
JOIN sakila.film AS f
on a.film_id = f.film_id
group by f.film_id
ORDER BY count(a.actor_id) DESC;
#997 returned

/*Using the tables payment and customer and the JOIN command, list the total paid by each customer.
List the customers alphabetically by last name.*/
select  c.customer_id, c.first_name, c.last_name, sum(p.amount) AS 'PaymentAmount'
from sakila.customer c
join sakila.payment as p 
on p.customer_id = c.customer_id
group by c.customer_id
Order by c.last_name ASC;
#return 599
