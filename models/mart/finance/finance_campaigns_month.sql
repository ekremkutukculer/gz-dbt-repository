SELECT 
date_trunc(date_date, month) as datemonth,
sum(operational_margin - ads_cost) as ads_margin,
ROUND(SUM(average_basket),2) AS average_basket,
sum(operational_margin) as operational_margin,
sum(ads_cost) as ads_cost,
sum(impression) as impression,
sum(click) as click,
sum(quantity) as quantity,
sum(revenue) as revenue,
sum(purchase_cost) as purchase_cost,
sum(margin) as margin,
sum(shipping_fee) as shipping_fee,
sum(log_cost) as log_cost,
sum(ship_cost) as ship_cost
FROM {{ref("finance_campaigns_day")}}
GROUP by datemonth
order by datemonth
