/*
رده‌بندی مشتری‌ها بر اساس بیشترین خرید
*/
SELECT c.name, SUM(p.price * oi.quantity) AS total_spent,
       RANK() OVER (ORDER BY SUM(p.price * oi.quantity) DESC) AS rank
FROM api_customer c
LEFT JOIN api_order o ON c.id = o.customer_id
LEFT JOIN api_orderitem oi ON o.id = oi.order_id
LEFT JOIN api_product p ON oi.product_id = p.id
GROUP BY c.name;

/*
میانگین خرید هر مشتری و مقایسه با کل میانگین
*/

SELECT c.name,
       AVG(p.price * oi.quantity) AS avg_customer_spent,
       (SELECT AVG(p2.price * oi2.quantity)
        FROM api_orderitem oi2
        INNER JOIN api_product p2 ON oi2.product_id = p2.id) AS global_avg
FROM api_customer c
LEFT JOIN api_order o ON c.id = o.customer_id
LEFT JOIN api_orderitem oi ON o.id = oi.order_id
LEFT JOIN api_product p ON oi.product_id = p.id
GROUP BY c.name;