WITH cohort AS (
  SELECT user_pseudo_id,
  DATE_TRUNC(PARSE_DATE('%Y%m%d', MIN(event_date)), WEEK) AS cohort_week
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  GROUP BY user_pseudo_id
),
activity AS (
  SELECT user_pseudo_id,
  DATE_TRUNC(PARSE_DATE('%Y%m%d', event_date), WEEK) AS activity_week
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  GROUP BY user_pseudo_id, activity_week
)

SELECT
cohort.cohort_week,
DATE_DIFF(activity.activity_week, cohort.cohort_week, WEEK) AS weeks_since_joining,
COUNT(DISTINCT activity.user_pseudo_id) AS active_users
FROM cohort
JOIN activity
ON cohort.user_pseudo_id = activity.user_pseudo_id
GROUP BY cohort_week, weeks_since_joining
ORDER BY cohort_week, weeks_since_joining
