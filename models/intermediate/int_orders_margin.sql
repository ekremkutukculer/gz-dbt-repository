select
orders_id,
date_date,
ROUND(SUM(revenue),2) as total_revenue,
ROUND(SUM(quantity),2) as total_quantity,
ROUND(SUM(purchase_cost),2) as total_purchase_cost,
ROUND(SUM(margin),2) as total_margin
from {{ ref("int_sales_margin") }}
GROUP BY orders_id,date_date
ORDER BY orders_id DESC
