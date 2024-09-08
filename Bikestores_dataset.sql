Select 
	ord.order_id,
	concat(cus.first_name,' ', cus.last_name) as 'customer_name',
	cus.city,
	cus.state,
	ord.order_date,
	sum(ite.quantity) as 'total_units',
	sum(ite.quantity * ite.list_price) as 'revenue',
	pro.product_name,
	cat.category_name,
	bra.brand_name,
	sto.store_name,
	concat(sta.first_name,' ',sta.last_name) as 'sales_rep'
from sales.orders as ord
inner join sales.customers as cus
on ord.customer_id = cus.customer_id
join sales.order_items as ite
on ite.order_id = ord.order_id
join production.products as pro
on ite.product_id = pro.product_id
join production.categories as cat
on pro.category_id = cat.category_id
join production.brands as bra
on pro.brand_id = bra.brand_id
join sales.stores as sto
on ord.store_id = sto.store_id
join sales.staffs as sta
on ord.staff_id = sta.staff_id
group by
	ord.order_id,
	concat(cus.first_name,' ', cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	cat.category_name,
	bra.brand_name,
	sto.store_name,
	concat(sta.first_name,' ',sta.last_name)