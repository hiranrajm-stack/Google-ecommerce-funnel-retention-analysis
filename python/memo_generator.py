from google import genai
client = genai.Client(api_key="YOUR_GEMINI_KEY")

findings = """
Analysis: E-commerce funnel and retention (Google Merchandise Store data, GA4)
Purchase conversion rate: 1.5% (view_item to purchase)
Funnel drop-off: 85% of viewers never add to cart (demand/merchandising signal)
Funnel drop-off: 85% of users who begin checkout never complete purchase (friction signal)
Week 1 retention: only 4% of new users return the week after their first visit
Pattern consistent across all 8 cohorts analyzed (Nov 2020 - Jan 2021)
"""

prompt = f"""Write a concise business memo (under 250 words) for a product
leadership team, based on this funnel and retention data:
{findings}
Include: headline finding, what the funnel drop-off means (separate the
merchandising issue from the checkout friction issue), what the retention
finding means, and 3 specific recommendations."""

response = client.models.generate_content(
    model="gemini-flash-latest",
    contents=prompt
)
print(response.text)
with open("business_memo.md", "w") as f:
    f.write(response.text)
