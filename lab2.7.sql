/*--
1.How many films are there for each of the categories in the category table. Use appropriate join to write this query.
*/ 
use sakila;

select* from sakila.film as f 
left join  sakila.category as c
on c.last_update =f.last_update;

select c.category_id, count(*) from sakila.film as f 
left join  sakila.category as c
on c.last_update =f.last_update
group by c.category_id;

/*2. Display the total amount rung up by each staff member in August of 2005.
*/

SELECT s.first_name, COUNT(p.amount)
from sakila.staff as s
left join  sakila.payment as p
on s.last_update =p.last_update
group by s.first_name
order by s.first_name;

/*3.Which actor has appeared in the most films?
*/
select a.last_name, count(*) from sakila.actor as a
left join  sakila.film as f
on a.last_update =f.last_update
group by  a.last_name
ORDER BY a.last_name
limit 1;

/*
4. Most active customer (the customer that has rented the most number of films)
*/
 select*, c.customer_id from sakila.customer as c
left join  sakila.film as f
on c.last_update =f.last_update
order by c.active desc;

/*
5. Display the first and last names, as well as the address, of each staff member.
*/ 
select staff_id, first_name, last_name, address_id from sakila.staff;
/*
6. List each film and the number of actors who are listed for that film.
*/-- 
select f.title, count(a.actor_id)  from sakila.film as f 
left join  sakila.actor as a
on a.last_update =f.last_update
group by f.title;

select* from sakila.film as f 
left join  sakila.actor as a
on a.last_update =f.last_update;

/*/*
7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
List the customers alphabetically by last name.
*/-- 
SELECT c.last_name, sum(p.amount)
From sakila.payment as p left join  sakila.customer as c
on p.customer_id =c.customer_id
group by c.last_name
order by c.last_name asc;
/*
8. List number of films per category.
*/
SELECT c.category_id, COUNT(f.title)
from sakila.film as f 
left join  sakila.category as c
on c.last_update =f.last_update
group by c.category_id
order by c.category_id;