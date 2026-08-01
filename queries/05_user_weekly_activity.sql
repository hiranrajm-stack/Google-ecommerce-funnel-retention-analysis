SELECT
  user_pseudo_id,
  DATE_TRUNC(PARSE_DATE('%Y%m%d', event_date), WEEK) AS activity_week
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
GROUP BY user_pseudo_id, activity_week
