CREATE DATABASE IF NOT EXISTS ecommers;

USE ecommers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(15),
    address VARCHAR(50),
    registration_date DATE
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(50),
    category_id INT,
    price DECIMAL(10,2),
    stock_quantity INT,
    added_date DATE,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE orderitems (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
        ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
        ON DELETE CASCADE
);

CREATE TABLE shipping (
    shipping_id INT PRIMARY KEY,
    order_id INT,
    shipping_date DATE,
    delivery_date DATE,
    shipping_status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
        ON DELETE CASCADE
);


INSERT INTO customers VALUES
(1, 'Dhruv', 'dhruv@gmail.com', '9876501234', 'Surat', '2026-02-01'),
(2, 'Kavya', 'kavya@gmail.com', '9876501235', 'Ahmedabad', '2026-02-03'),
(3, 'Arjun', 'arjun@gmail.com', '9876501236', 'Vadodara', '2026-02-05'),
(4, 'Meera', 'meera@gmail.com', '9876501237', 'Rajkot', '2026-02-07'),
(5, 'Vivaan', 'vivaan@gmail.com', '9876501238', 'Mumbai', '2026-02-09'),
(6, 'Anaya', 'anaya@gmail.com', '9876501239', 'Gandhinagar', '2026-02-11');


INSERT INTO categories VALUES
(1,'Electronics'),
(2,'Clothing'),
(3,'Books'),
(4,'Furniture'),
(5,'Accessories');


INSERT INTO products VALUES
(1,'Laptop',1,55000,10,'2026-07-09'),
(2,'Shirt',2,800,50,'2026-07-12'),
(3,'Python Book',3,500,30,'2026-07-05'),
(4,'Chair',4,2500,15,'2026-07-03'),
(5,'Headphones',5,1500,25,'2026-07-12'),
(6,'Smartphone',1,25000,20,'2026-07-11');


INSERT INTO orders VALUES
(101,1,'2026-02-01',55000,'Completed'),
(102,2,'2026-02-02',800,'Pending'),
(103,3,'2026-02-03',500,'Processing'),
(104,4,'2026-02-04',2500,'Shipped'),
(105,5,'2026-02-05',1500,'Cancelled'),
(106,6,'2026-02-06',25000,'Completed');


INSERT INTO orderitems VALUES
(1,101,1,1,55000),
(2,102,2,1,800),
(3,103,3,1,500),
(4,104,4,1,2500),
(5,105,5,1,1500),
(6,106,6,1,25000);


INSERT INTO payments VALUES
(1,101,'2026-02-01','UPI','Paid'),
(2,102,'2026-02-02','Cash','Pending'),
(3,103,'2026-02-03','Credit Card','Paid'),
(4,104,'2026-02-04','Debit Card','Paid'),
(5,105,'2026-02-05','UPI','Failed'),
(6,106,'2026-02-06','UPI','Paid');


INSERT INTO shipping VALUES
(1,101,'2026-02-02','2026-02-05','Delivered'),
(2,102,'2026-02-03','2026-02-06','Pending'),
(3,103,'2026-02-04','2026-02-07','Processing'),
(4,104,'2026-02-05','2026-02-08','Shipped'),
(5,105,'2026-02-06','2026-02-09','Cancelled'),
(6,106,'2026-02-07','2026-02-10','Delivered');


SELECT * FROM customers;
SELECT * FROM categories;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM orderitems;
SELECT * FROM payments;
SELECT * FROM shipping;


SELECT *
FROM orders
WHERE status = 'Cancelled'
AND order_date < DATE_SUB(CURDATE(), INTERVAL 30 DAY);

SELECT *
FROM orders
WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
AND order_date <= CURDATE();

SELECT *
FROM products
ORDER BY price DESC
LIMIT 5;

SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 3;

SELECT o.order_id, o.status, p.payment_status
FROM orders o
JOIN payments p ON o.order_id = p.order_id
WHERE o.status = 'Pending'
AND p.payment_status = 'Paid';

SELECT *
FROM products
WHERE stock_quantity > 0;

SELECT DISTINCT c.*
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE c.registration_date > '2022-12-31'
OR o.total_amount > 10000;

SELECT *
FROM products
ORDER BY price ASC;

SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id;

SELECT c.name AS category_name,
       SUM(oi.subtotal) AS total_revenue
FROM categories c
JOIN products p ON c.category_id = p.category_id
JOIN orderitems oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status != 'Cancelled'
GROUP BY c.category_id, c.name;

SELECT SUM(total_amount) AS total_revenue
FROM orders
WHERE status != 'Cancelled';

SELECT product_id,
       SUM(quantity) AS total_purchased
FROM orderitems
GROUP BY product_id
ORDER BY total_purchased DESC
LIMIT 5;

SELECT AVG(total_amount) AS average_order_value
FROM orders
WHERE status != 'Cancelled';


SELECT p.product_id,
       p.name AS product_name,
       c.name AS category_name,
       p.price,
       p.stock_quantity
FROM products p
INNER JOIN categories c
ON p.category_id = c.category_id;

SELECT o.order_id,
       o.order_date,
       o.total_amount,
       o.status,
       c.name,
       c.email
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id;

SELECT o.order_id,
       o.customer_id,
       o.order_date
FROM shipping s
RIGHT JOIN orders o
ON s.order_id = o.order_id
WHERE s.shipping_id IS NULL;

SELECT c.customer_id,
       c.name,
       c.email
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

SELECT o.order_id,
       c.name,
       c.registration_date,
       o.total_amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE c.registration_date > '2022-12-31';


SELECT customer_id,
       SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 1;

SELECT *
FROM products
WHERE product_id NOT IN (
    SELECT product_id FROM orderitems
);

SELECT MONTH(order_date) AS month,
       COUNT(order_id) AS total_orders
FROM orders
GROUP BY MONTH(order_date);

SELECT shipping_id,
       DATEDIFF(delivery_date, shipping_date) AS delivery_days
FROM shipping;

SELECT order_id,
       DATE_FORMAT(order_date,'%d/%m/%Y') AS formatted_date
FROM orders;


UPDATE products
SET name = UPPER(name);

UPDATE customers
SET name = TRIM(name);

UPDATE customers
SET email = 'Not Provided'
WHERE email IS NULL OR email = '';

SELECT customer_id,
       SUM(total_amount) AS total_spending,
       RANK() OVER (
           ORDER BY SUM(total_amount) DESC
       ) AS customer_rank
FROM orders
GROUP BY customer_id;

SELECT MONTH(order_date) AS month,
       SUM(total_amount) AS monthly_revenue,
       SUM(SUM(total_amount)) OVER (
           ORDER BY MONTH(order_date)
       ) AS cumulative_revenue
FROM orders
WHERE status != 'Cancelled'
GROUP BY MONTH(order_date);

SELECT order_id,
       order_date,
       COUNT(*) OVER (
           ORDER BY order_date, order_id
       ) AS running_total
FROM orders;

SELECT p.product_id,
       p.name,
       SUM(oi.quantity) AS total_units_sold,
       CASE
           WHEN SUM(oi.quantity) > 500 THEN 'Best Seller'
           WHEN SUM(oi.quantity) BETWEEN 200 AND 500 THEN 'Popular'
           ELSE 'Regular'
       END AS product_category
FROM products p
JOIN orderitems oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.name;

SELECT c.customer_id,
       c.name,
       SUM(o.total_amount) AS total_spending,
       CASE
           WHEN SUM(o.total_amount) > 50000 THEN 'Gold'
           WHEN SUM(o.total_amount) BETWEEN 20000 AND 50000 THEN 'Silver'
           ELSE 'Bronze'
       END AS loyalty_status
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;