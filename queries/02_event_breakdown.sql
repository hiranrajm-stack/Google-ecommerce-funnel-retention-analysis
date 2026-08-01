SELECT event_name, COUNT(*) AS how_many_times
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
GROUP BY event_name
ORDER BY how_many_times DESC
LIMIT 15
