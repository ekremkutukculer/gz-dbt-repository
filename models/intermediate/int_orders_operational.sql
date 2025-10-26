select
o.orders_id,
o.date_date,
ROUND(o.total_margin + s.shipping_fee - (s.logcost + s.ship_cost),2) AS operational_margin,
o.total_quantity,
o.total_revenue,
o.total_purchase_cost,
o.total_margin,
s.shipping_fee,
s.logcost,
s.ship_cost
from  {{ ref ("int_orders_margin")}} o
left join {{ ref ("stg_raw__ship")}} s
using(orders_id)
order by orders_id desc
