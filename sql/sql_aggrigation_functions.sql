/*
تعداد سفارش‌های هر مشتری
*/
SELECT c.name, COUNT(o.id) AS total_orders
FROM api_customer c
LEFT JOIN api_order o ON c.id = o.customer_id
GROUP BY c.name;


/*
مجموع پولی که هر مشتری خرج کرده
*/
SELECT c.name, SUM(p.price * oi.quantity) AS total_spent
FROM api_customer c
LEFT JOIN api_order o ON c.id = o.customer_id
LEFT JOIN api_orderitem oi ON o.id = oi.order_id
LEFT JOIN api_product p ON oi.product_id = p.id
GROUP BY c.name
ORDER BY total_spent DESC;

/*
گران‌ترین و ارزان‌ترین محصول
*/
SELECT MAX(price) AS max_price, MIN(price) AS min_price
FROM api_product;