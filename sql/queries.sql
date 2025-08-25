/*
مجموع خرید هر مشتری:
*/

SELECT c.name, SUM(p.price * o.quantity) AS total_spent
FROM api_order o
JOIN api_product p ON o.product_id = p.id
JOIN api_customer c ON o.customer_id = c.id
GROUP BY c.name
ORDER BY total_spent DESC;

/*
پرفروش‌ترین محصول:
*/
SELECT p.name, SUM(o.quantity) AS total_sold
FROM api_order o
JOIN api_product p ON o.product_id = p.id
GROUP BY p.name
ORDER BY total_sold DESC
LIMIT 1;

/*
تعداد سفارش‌ها به تفکیک مشتری
*/

SELECT c.name, COUNT(o.quantity) AS num_orders
FROM api_order o
JOIN api_customer c ON o.customer_id = c.id
GROUP BY c.name;

/*
اضافه کردن یک محصول جدید
*/
INSERT INTO api_product(name, price, created_at)
VALUES ('Pro1', 3300, NOW());

/*
سفارش‌ها همراه نام مشتری و محصول:
*/

SELECT c.name AS customer, p.name AS product, o.quantity
FROM api_order o
INNER JOIN api_customer c ON o.customer_id = c.id
INNER JOIN api_product p ON o.product_id = p.id;

/*
همه مشتری‌ها + تعداد سفارش‌هاشون (حتی کسایی که سفارش ندادن):
*/
SELECT c.name, COUNT(o.quantity) AS total_order
FROM api_customer c
LEFT JOIN api_order o ON o.customer_id = c.id
GROUP BY c.name;

/*
همه محصولات + تعداد دفعاتی که سفارش داده شدن (حتی محصولاتی که کسی نخریده):
*/
SELECT c.name, COUNT(o.quantity) AS total_order
FROM api_customer c
LEFT JOIN api_order o ON o.customer_id = c.id
GROUP BY c.name;

/*
محصولاتی که هم مشتری‌ها سفارش داده‌اند و هم تأمین‌کننده‌ها دارند
*/
SELECT DISTINCT p.name
FROM api_product p
INNER JOIN api_orderitem oi ON p.id = oi.product_id
INTERSECT
SELECT name FROM api_product
WHERE supplier_id IS NOT NULL;

/*
محصولاتی که هیچ وقت فروخته نشده‌اند
*/
SELECT name FROM api_product
EXCEPT
SELECT DISTINCT p.name
FROM api_product p
INNER JOIN api_orderitem oi ON p.id = oi.product_id;
