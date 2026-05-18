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
- No-Sale Inventory Value
- Stockout Risk

## SQL Skills Demonstrated
- JOIN
- GROUP BY
- HAVING
- CTEs
- Window Functions

## Key Findings
- Focus inventory investment on categories with higher turnover.
- Monitor high-value SKUs more closely to minimize excess working capital.
- Review slow-moving SKUs and reduce future purchase quantities.
- Investigate no-sale inventory for potential liquidation, promotion, or discontinuation.
- Use inventory turnover and days on hand to guide purchasing decisions by category.

## Recommendations
- Review products with inventory but no sales.
- Monitor inventory value by category and warehouse.
- Use turnover and days on hand to improve purchasing decisions.

  
