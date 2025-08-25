/*
بیشترین فروش در هر ماه
*/

SELECT DATE_TRUNC('month', o.created_at) AS month,
       SUM(p.price * oi.quantity) AS revenue
FROM api_order o
INNER JOIN api_orderitem oi ON o.id = oi.order_id
INNER JOIN api_product p ON oi.product_id = p.id
GROUP BY DATE_TRUNC('month', o.created_at)
ORDER BY month;



/*
محصولات هر دسته‌بندی همراه با پرطرفدارترین محصول آن دسته
*/
SELECT cat.name AS category, p.name AS product, SUM(oi.quantity) AS total_sold
FROM api_category cat
INNER JOIN api_product p ON cat.id = p.category_id
LEFT JOIN api_orderitem oi ON p.id = oi.product_id
GROUP BY cat.name, p.name
ORDER BY cat.name, total_sold DESC;




/*
 تأمین‌کننده‌ای که بیشترین درآمد ایجاد کرده
*/

SELECT s.name AS supplier, SUM(p.price * oi.quantity) AS revenue
FROM api_supplier s
INNER JOIN api_product p ON s.id = p.supplier_id
INNER JOIN api_orderitem oi ON p.id = oi.product_id
GROUP BY s.name
ORDER BY revenue DESC
LIMIT 1;