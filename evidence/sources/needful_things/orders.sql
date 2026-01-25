-- Run in DuckDB
CREATE TABLE orders (
    order_id INTEGER,
    customer_id INTEGER,
    amount DOUBLE
);

INSERT INTO orders VALUES
(1, 101, 500),
(2, 102, 1500),
(3, 101, 2000);
-- --- IGNORE ---fixe