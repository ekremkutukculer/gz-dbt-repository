Select 
date_date,
operational_margin - ads_cost AS ads_margin,
ROUND(average_basket, 2) AS average_basket,
operational_margin,
ads_cost,
impression,
click,
quantity,
revenue,
purchase_cost,
margin,
shipping_fee,
log_cost,
ship_cost
from {{ ref("int_campaigns_day")}}
full outer join {{ref("finance_days")}}
using(date_date)
order by date_date desc