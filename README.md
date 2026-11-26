🛒 E-COMMERCE DATABASE MANAGEMENT SYSTEM
SQL Project Documentation
Project goal: Organise and analyse the information of an online
shopping platform using a relational database.

📌 1. Project Overview
The E-Commerce Database Management System stores and manages
information about customers, products, categories, orders, order items,
payments, and shipping.

It helps an online store understand customer activity, monitor product
stock, track orders, review payments, and analyse sales performance.
<details>
<summary>
<strong>{=html}Project at a glance`</strong>`{=html}
</summary>
  Item                Details
  Project type        Database Management System
Database name       ecommers
Database language   SQL
Number of tables    7
Main purpose        Manage and analyse e-commerce data
</details>
🗂️ 2. Database Structure
The database contains seven connected tables.
No. Table             Purpose

 01 **Customers**     Stores customer details
 02 **Categories**    Stores product categories
 03 **Products**      Stores product and stock details
 04 **Orders**        Stores customer orders
 05 **Order Items**   Stores products included in orders
 06 **Payments**      Stores payment information
 07 **Shipping**      Stores delivery information
📋 3. Table Descriptions
👤 3.1 Customers
Stores information about people registered on the shopping platform.

  Column              Description
  Customer ID         Unique customer number
Name                Customer's name
Email               Email address
Phone Number        Contact number
Address             Customer's city or address
Registration Date   Date of registration
🏷️ 3.2 Categories
Stores the different product categories available in the store.

  Column        Description
  Category ID   Unique category number
Name          Category name

Sample categories: Electronics, Clothing, Books, Furniture,
Accessories.
📦 3.3 Products
Stores product details and available stock.

  Column           Description
  Product ID       Unique product number
Name             Product name
Category ID      Related category
Price            Product price
Stock Quantity   Available units
Added Date       Date product was added
🧾 3.4 Orders
Stores details of orders placed by customers.

  Column         Description
  Order ID       Unique order number
Customer ID    Customer who placed the order
Order Date     Date of the order
Total Amount   Total order value
Status         Current order status

Order statuses: Completed, Pending, Processing, Shipped, Cancelled.
🛍️ 3.5 Order Items
Stores the products included in each order.

  Column          Description
  Order Item ID   Unique order-item number
Order ID        Related order
Product ID      Ordered product
Quantity        Number of units
Subtotal        Total price for that product
💳 3.6 Payments
Stores payment details for customer orders.

  Column           Description
  Payment ID       Unique payment number
Order ID         Related order
Payment Date     Date of payment
Payment Method   Method used for payment
Payment Status   Current payment result

Payment methods: UPI, Cash, Credit Card, Debit Card.
🚚 3.7 Shipping
Stores shipping and delivery information.

  Column            Description
  Shipping ID       Unique shipping number
Order ID          Related order
Shipping Date     Date of shipping
Delivery Date     Expected or recorded delivery date
Shipping Status   Current delivery status

Shipping statuses: Delivered, Pending, Processing, Shipped,
Cancelled.
🔗 4. Table Relationships
Primary keys and foreign keys connect the tables and help maintain data
consistency.

  Main table   Related table   Relationship
  Customers    Orders          One customer can place many orders
Categories   Products        One category can contain many products
Orders       Order Items     One order can contain many items
Products     Order Items     One product can appear in many order items
Orders       Payments        Payment records are linked to orders
Orders       Shipping        Shipping records are linked to orders
🔑 Primary Keys
A primary key uniquely identifies each record.
- Customers --- Customer ID
- Categories --- Category ID
- Products --- Product ID
- Orders --- Order ID
- Order Items --- Order Item ID
- Payments --- Payment ID
- Shipping --- Shipping ID
🔗 Foreign Keys
A foreign key connects one table to another.
- Products → Categories
- Orders → Customers
- Order Items → Orders and Products
- Payments → Orders
- Shipping → Orders
Cascading deletion: The database is configured to delete related
order items, payment records, and shipping records when their parent
order is deleted, wherever ON DELETE CASCADE is defined.
📊 5. Sample Data Summary
The database includes the following sample records:

  Table           Number of records
  Customers                       6
Categories                      5
Products                        6
Orders                          6
Order Items                     6
Payments                        6
Shipping                        6
Total                  41

The sample products include a laptop, shirt, Python book, chair,
headphones, and smartphone.
⚙️ 6. SQL Concepts Practised
6.1 Basic Data Retrieval
Displays records from individual tables to view customer, product,
order, payment, and shipping information.
6.2 Filtering Records
Finds records that match specific conditions, such as cancelled orders,
recent orders, available products, and customers registered after a
given date.
6.3 Sorting and Limiting
Arranges products by price and displays a limited number of results,
such as the five most expensive products.
6.4 Grouping and Aggregate Functions
Summarises data using:
- COUNT() --- Counts records.
- SUM() --- Calculates totals.
- AVG() --- Calculates averages.
- MAX() --- Finds the highest value.
- MIN() --- Finds the lowest value.
- GROUP BY --- Groups similar records.
- HAVING --- Filters grouped results.
6.5 Joins
Combines information from multiple tables.
  Join                                Use in this project
  INNER JOIN                          Displays products with category
names

  LEFT JOIN                           Displays customers with their
orders and helps find customers
without orders

  RIGHT JOIN                          Helps identify orders without
matching shipping records
Multiple-table JOIN                 Calculates category-wise revenue
6.6 Subqueries
Uses the result of one query inside another query. For example, finding
products that have never appeared in an order item.
6.7 Date and Time Functions
Analyses order and delivery dates.
- MONTH() --- Extracts the month.
- DATEDIFF() --- Finds the difference between dates.
- DATE_FORMAT() --- Changes date display format.
- DATE_SUB() --- Subtracts a time interval from a date.
6.8 Data Cleaning and Transformation
Improves consistency in stored data.
- UPPER() --- Converts text to uppercase.
- TRIM() --- Removes extra spaces.
- Missing or blank email values are replaced with a standard label.
6.9 Window Functions
Performs calculations across related rows.
- RANK() --- Ranks customers by spending.
- SUM() OVER() --- Calculates cumulative revenue.
- COUNT() OVER() --- Calculates a running count of orders.
6.10 CASE Statements
Applies conditions to classify records.
- Product classification based on units sold.
- Customer loyalty classification into Gold, Silver, and Bronze levels
  based on spending.
💡 7. Business Questions Answered
This database can help answer important business questions:
1. Which customers have placed the most orders?
2. Which products have the highest prices?
3. Which products are currently in stock?
4. Which products have never been ordered?
5. Which product categories generate the most revenue?
6. What is the total revenue excluding cancelled orders?
7. What is the average order value?
8. Which customer has spent the most money?
9. Which orders are pending or cancelled?
10. Which payments are paid, pending, or failed?
11. Which orders do not have shipping records?
12. How many days does delivery take?
13. How many orders are placed each month?
14. Which customers belong to each loyalty level?
🎯 8. Project Objectives
- To understand relational database design.
- To organise e-commerce information into related tables.
- To practise primary keys and foreign keys.
- To retrieve and analyse data using SQL.
- To understand sales, customer, product, and delivery information.
- To practise SQL concepts using a real-world business example.
🏁 9. Conclusion
The E-Commerce Database Management System provides a structured way
to manage online shopping information. It connects customers, products,
orders, payments, and shipping records in one relational database.

This project provides practical experience with SQL and demonstrates how
database concepts can be used to answer real-world business questions.
<small>{=html}Project: E-Commerce Database Management System ·
Database: ecommers · Documentation: SQL concepts and database
design (without query code)`</small>`{=html}
