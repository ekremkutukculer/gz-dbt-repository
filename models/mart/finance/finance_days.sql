with orders_per_day as(
select 
date_date,
count(distinct orders_id) as islem_sayisi,
round(sum(total_revenue),0) as revenue,
ROUND(SUM(total_margin),0) AS margin,
round(sum(operational_margin),0) as operational_margin,
ROUND(SUM(total_purchase_cost),0) AS purchase_cost,
ROUND(SUM(shipping_fee),0) AS shipping_fee,
ROUND(SUM(logcost),0) AS log_cost,
ROUND(SUM(ship_cost),0) AS ship_cost,
SUM(total_quantity) AS quantity
FROM {{ref("int_orders_operational")}}
GROUP BY date_date
)
select
date_date,
revenue,
margin,
operational_margin,
purchase_cost,
shipping_fee,
log_cost,
ship_cost,
quantity,
ROUND(revenue/NULLIF(islem_sayisi, 0), 2) AS average_basket
from orders_per_day
order by date_date DESC