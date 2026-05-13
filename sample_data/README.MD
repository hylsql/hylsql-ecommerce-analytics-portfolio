## Setup

1. Create a PostgreSQL database.
2. Run `schema.sql`.
3. Update file paths in `load_postgres.sql`.
4. Run `load_postgres.sql`.
5. Explore the SQL projects.


Files:
customers.csv: 100 customers.
products.csv: 51 products/SKUs.
orders.csv: 300 orders.
order_items.csv: 899 order lines.
payments.csv: 287 payments.
shipments.csv: 261 shipments.
returns.csv: 114 returns.
inventory.csv: 255 inventory by warehouse.
ad_spend.csv: 800 advertising spend rows.
schema.sql: table creation script.
load_postgres.sql: PostgreSQL import template.
