-- E-commerce SQL Practice Project
-- Recommended: PostgreSQL. This also works with minor edits in MySQL/SQLite.

DROP TABLE IF EXISTS ad_spend;
DROP TABLE IF EXISTS returns;
DROP TABLE IF EXISTS shipments;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(100),
  email VARCHAR(150),
  city VARCHAR(80),
  state VARCHAR(20),
  created_date DATE
);

CREATE TABLE products (
  product_id INT PRIMARY KEY,
  sku VARCHAR(20),
  product_name VARCHAR(100),
  category VARCHAR(50),
  standard_cost NUMERIC(10,2),
  selling_price NUMERIC(10,2),
  weight_lbs NUMERIC(10,2),
  size VARCHAR(20)
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT REFERENCES customers(customer_id),
  order_date DATE,
  order_status VARCHAR(30),
  sales_channel VARCHAR(50)
);

CREATE TABLE order_items (
  order_item_id INT PRIMARY KEY,
  order_id INT REFERENCES orders(order_id),
  product_id INT REFERENCES products(product_id),
  quantity INT,
  unit_price NUMERIC(10,2),
  discount_amount NUMERIC(10,2)
);

CREATE TABLE payments (
  payment_id INT PRIMARY KEY,
  order_id INT REFERENCES orders(order_id),
  payment_method VARCHAR(50),
  payment_amount NUMERIC(10,2),
  tax_amount NUMERIC(10,2),
  shipping_fee NUMERIC(10,2),
  payment_date DATE
);

CREATE TABLE shipments (
  shipment_id INT PRIMARY KEY,
  order_id INT REFERENCES orders(order_id),
  warehouse VARCHAR(20),
  carrier VARCHAR(50),
  ship_date DATE,
  delivery_date DATE,
  freight_cost NUMERIC(10,2)
);

CREATE TABLE returns (
  return_id INT PRIMARY KEY,
  order_item_id INT REFERENCES order_items(order_item_id),
  return_date DATE,
  return_reason VARCHAR(80),
  return_quantity INT,
  refund_amount NUMERIC(10,2)
);

CREATE TABLE inventory (
  inventory_id INT PRIMARY KEY,
  product_id INT REFERENCES products(product_id),
  warehouse VARCHAR(20),
  quantity_on_hand INT,
  reorder_point INT,
  snapshot_date DATE
);

CREATE TABLE ad_spend (
  ad_id INT PRIMARY KEY,
  ad_date DATE,
  sales_channel VARCHAR(50),
  spend NUMERIC(10,2),
  impressions INT,
  clicks INT
);
