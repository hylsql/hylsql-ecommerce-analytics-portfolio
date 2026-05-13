-- PostgreSQL import examples. Update the file paths to where you saved the CSV files.

\copy customers FROM 'customers.csv' WITH (FORMAT csv, HEADER true);
\copy products FROM 'products.csv' WITH (FORMAT csv, HEADER true);
\copy orders FROM 'orders.csv' WITH (FORMAT csv, HEADER true);
\copy order_items FROM 'order_items.csv' WITH (FORMAT csv, HEADER true);
\copy payments FROM 'payments.csv' WITH (FORMAT csv, HEADER true);
\copy shipments FROM 'shipments.csv' WITH (FORMAT csv, HEADER true);
\copy returns FROM 'returns.csv' WITH (FORMAT csv, HEADER true);
\copy inventory FROM 'inventory.csv' WITH (FORMAT csv, HEADER true);
\copy ad_spend FROM 'ad_spend.csv' WITH (FORMAT csv, HEADER true);
