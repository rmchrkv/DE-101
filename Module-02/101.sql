select 
	city,
	state,
	sum(sales) total_sales,
	count(distinct order_id) num_orders
from orders
where category in ('Office Supplies', 'Technology')
and date_part('year', order_date)  = 2018 
group by 1,2 
having sum(sales) > 10000
order by 3 desc;

/*select distinct 
	category
from orders*/

select 
	count(*) count_rows,
	count (distinct o.order_id) total_orders,
	count (distinct r.order_id) returned,
	count (distinct o.order_id) - count (distinct r.order_id) not_returned
from orders o
left join returns r 
	on o.order_id = r.order_id;

-- 9994
-- inner 3226
-- 296 orders returned

select 
	state,
	sum(sales) revenue_lost,
	count (distinct order_id) orders_returned
from orders o
where order_id in (select distinct order_id from returns)
group by 1
order by sum(sales) desc;
	