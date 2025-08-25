/*
تعداد محصولاتی که هر دسته‌بندی دارد
*/

SELECT cat.name AS category, COUNT(p.id) AS product_count
FROM api_category cat
LEFT JOIN api_product p ON cat.id = p.category_id
GROUP BY cat.name;

/*
تعداد محصولاتی که هر تأمین‌کننده داده
*/
SELECT s.name AS supplier, COUNT(p.id) AS product_count
FROM api_supplier s
LEFT JOIN api_product p ON s.id = p.supplier_id
GROUP BY s.name;


/*
پرطرفدارترین محصول (بیشترین تعداد سفارش
*/
SELECT p.name, SUM(oi.quantity) AS total_sold
FROM api_product p
LEFT JOIN api_orderitem oi ON p.id = oi.product_id
GROUP BY p.name
ORDER BY total_sold DESC
LIMIT 1;