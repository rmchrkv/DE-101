select
	sum(sales) as revenue,
	sum(profit) as profit,
	count(distinct customer_id) as customers,
	count(distinct order_id) as orders,
	sum(profit)/sum(sales) as profit_ratio,
	sum(profit)/count(distinct order_id) as profit_per_order,
	sum(sales)/count(distinct customer_id) as sales_per_customer,
	avg(discount) as avg_discount
from orders o;

select
	date_part('year', order_date) as year,
	date_part('month', order_date) as month, 
	sum(sales) as revenue,
	sum(profit) as profit,
	count(distinct customer_id) as customers,
	count(distinct order_id) as orders,
	sum(profit)/sum(sales) as profit_ratio,
	sum(profit)/count(distinct order_id) as profit_per_order,
	sum(sales)/count(distinct customer_id) as sales_per_customer,
	sum(profit)/count(distinct customer_id) as profit_per_customer,
	avg(discount) as avg_discount
from orders o
group by 1,2
order by 7 desc;

select 
	date_part('year', order_date) as year,
	date_part('month', order_date) as month,
	segment,
	sum(sales) as revenue,
	sum(profit) as profit,
	count(distinct customer_id) as customers,
	sum(profit)/count(distinct order_id) as profit_per_order
from orders o 
group by 1,2,3;

select 
	date_part('year', order_date) as year,
	date_part('month', order_date) as month,
	category,
	sum(sales) as revenue,
	sum(profit) as profit,
	count(distinct customer_id) as customers,
	sum(profit)/count(distinct order_id) as profit_per_order
from orders o
group by 1,2,3;

select 
	date_part('year', order_date) as year,
	date_part('month', order_date) as month,
	count (distinct o.order_id) total_orders,
	count (distinct r.order_id) returned,
	100.0 * count (distinct r.order_id)/count (distinct o.order_id) as returned_percentage
from orders o
left join returns r 
	on o.order_id = r.order_id
group by 1,2;

select
	date_part('year', order_date) as year,
	date_part('month', order_date) as month,
	sum(sales) revenue_lost,
	count (distinct order_id) orders_returned
from orders o
where order_id in (select distinct order_id from returns)
group by 1,2
order by sum(sales) desc;

select
	date_part('year', order_date) as year,
	date_part('month', order_date) as month,
	region,
	sum(sales) as revenue
from orders o 
group by 1,2,3
order by 4 desc;

select
	date_part('year', order_date) as year,
	date_part('month', order_date) as month,
	person,
	sum(sales) as revenue,
	sum(sales)/count(distinct customer_id) as sales_per_customer
from orders o 
left join people p 
	on o.region = p.region 
group by 1,2,3
order by 4 desc;

select 
	distinct(customer_id),
	sum(sales) as revenue,
	sum(profit) as profit
from orders o 
group by 1
order by 3 desc;