select event_name,count(*) as event_count
from `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
where event_name in ('view_item','add_to_cart','begin_checkout', 'purchase')
group by event_name
order by event_count desc;
