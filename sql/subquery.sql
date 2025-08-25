/*
مشتریانی که بیشتر از ۵ سفارش ثبت کرده‌اند
*/

SELECT name
FROM api_customer
WHERE id IN (
    SELECT customer_id
    FROM api_order
    GROUP BY customer_id
    HAVING COUNT(*) > 5
);

/*
مشتریانی که بیشتر از ۵ سفارش ثبت کرده‌اند با جوین
*/
SELECT c.name
FROM api_customer c
LEFT JOIN api_order o ON o.customer_id = c.id
GROUP BY c.id, c.name
HAVING COUNT(o.id) > 5;


/*
 محصولاتی که هیچ‌وقت سفارش داده نشده‌اند
*/
SELECT name
FROM api_product
WHERE id NOT IN (
    SELECT product_id FROM api_orderitem
);

/*
  با جوین محصولاتی که هیچ‌وقت سفارش داده نشده‌اند
*/

SELECT p.name
FROM api_product p
LEFT JOIN api_orderitem oi ON p.id = oi.product_id
WHERE oi.product_id IS NULL;