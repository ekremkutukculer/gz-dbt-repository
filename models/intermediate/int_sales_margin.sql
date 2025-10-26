select
*,
ROUND(s.quantity*p.purchase_price,2) as purchase_cost,
ROUND(s.revenue - s.quantity*p.purchase_price,2) as margin
from {{ ref("stg_raw__sales") }} s 
left join {{ ref("stg_raw__product") }} p
using (products_id)