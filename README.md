# Google E-Commerce Funnel & Retention Analysis

Analysis of real e-commerce event data to find where users drop off in
the purchase journey and whether they return — paired with an
AI-assisted business memo summarizing the findings for a stakeholder.

## Data
Google's public GA4 e-commerce sample dataset in BigQuery
(`bigquery-public-data.ga4_obfuscated_sample_ecommerce`) — ~4.3M real
anonymized events from the Google Merchandise Store, 92 days.

## Approach
1. Funnel analysis in BigQuery SQL (view_item → add_to_cart →
   begin_checkout → purchase)
2. Cohort retention analysis using SQL window functions (DATE_TRUNC,
   DATE_DIFF, cohort self-join) — see `queries/`
3. Interactive Power BI dashboard built from the query outputs —
   see `dashboard/`
4. AI-assisted business memo translating the findings into a
   stakeholder-ready recommendation — see `business_memo.md`

## Key Findings
- Only 1.5% of users who view a product ever purchase
- 85% never add to cart (merchandising/demand signal)
- 85% of checkout-starters never complete purchase (friction signal)
- Only 4% of new users return the week after their first visit —
  consistent across all 8 cohorts analyzed

## Tools
SQL (BigQuery/GoogleSQL, window functions) · Power BI · Python · Claude

## Files
- `queries/` — all SQL, numbered in build order
- `dashboard/` — Power BI file and dashboard screenshot
- `business_memo.md` — stakeholder-facing findings and recommendations
