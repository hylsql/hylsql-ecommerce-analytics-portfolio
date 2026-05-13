# Inventory Optimization

## Objective
- Identify excess inventory
- slow-moving products
- opportunities to improve inventory efficiency

## Tables Used
- inventory
- products
- order_items

## Key Metrics
- Inventory units by warehouse
- Inventory value by warehouse
- Inventory value by category
- Units sold by SKU
- SKUs with inventory but no sales
- Slow-moving SKUs (products with inventory on hand but fewer than 10 units sold)
- Inventory turnover by SKU (Turnover = Units Sold / Inventory Units)
- Days on Hand (Days on Hand = 365 / Inventory Turnover)
- Top 20 SKUs by inventory value
- Category-level turnover analysis

## SQL Skills Demonstrated
- JOIN
- GROUP BY
- HAVING
- CTEs
- Window Functions

## Key Findings
- Several SKUs had inventory but no recorded sales.
- Certain categories showed low turnover and high inventory value.
- A small number of products accounted for a large share of idle stock.
