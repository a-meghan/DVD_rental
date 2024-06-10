select district, customer.first_name, customer.last_name
from address
left join customer
on address.address_id = customer.customer_id
where district = 'Texas';


select payment.amount, payment.customer_id, customer.first_name, customer.last_name
from payment
join customer
on payment.customer_id = customer.customer_id
group by payment.amount, payment.customer_id, customer.first_name, customer.last_name 
having payment.amount > 6.99;


select first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175
);



select max(amount), staff_id
from payment
group by staff_id;


select rating, count(rating)
from film
group by rating;

select *
from customer
where customer_id in (
	select count(customer_id)
	from payment
	where amount > 6.99
);

select rental_rate
from film
where rental_rate = 0.00