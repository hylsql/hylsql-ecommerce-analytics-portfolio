# Returns & Refund Analysis

## Objective
Analyze product returns, refund exposure, and return rates by SKU, category, customer, and sales channel to identify operational improvement opportunities and reduce refund costs.

## Tables Used
- returns
- order_items
- orders
- products
- customers

## Key Metrics
- Units Sold
- Units Returned
- Return Rate = Units Returned / Units Sold
- Refund Amount
- Refund Rate = Refund Amount / Revenue
- Return Count

## SQL Skills Demonstrated
- JOIN and LEFT JOIN
- GROUP BY and HAVING
- CTEs
- Date Analysis with DATE_TRUNC
- COALESCE and NULLIF

## Dashboard Visuals
1. Total Refund Amount KPI
2. Overall Return Rate KPI
3. Refund Amount by Return Reason
4. Return Rate by Category
5. Return Rate by Sales Channel
6. Monthly Refund Trend
7. Top Returned Products
8. High-Return SKU Table

## Key Findings
- Refunds were concentrated in a small number of products and return reasons.
- Certain categories had significantly higher return rates, indicating potential product quality or listing issues.
- Several SKUs had both meaningful sales volume and elevated return rates, making them strong candidates for review.
- Return rates varied by sales channel, suggesting differences in customer behavior and marketplace expectations.
- Monthly refund trends highlighted periods of increased refund exposure.

