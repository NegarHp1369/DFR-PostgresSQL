/*
برگردوندن نام مشتری بر اساس id
*/
CREATE OR REPLACE FUNCTION get_customer_name(cust_id bigint)
RETURNS text AS $$
DECLARE
    cname text;
BEGIN
    SELECT name INTO cname
    FROM api_customer
    WHERE id = cust_id;

    RETURN cname;
END;
$$ LANGUAGE plpgsql;

/*
محاسبه تعداد سفارش‌های یک مشتری
*/
CREATE OR REPLACE FUNCTION order_count(cust_id bigint)
RETURNS integer AS $$
DECLARE
    cnt integer;
BEGIN
    SELECT COUNT(*) INTO cnt
    FROM api_order
    WHERE customer_id = cust_id;

    RETURN cnt;
END;
$$ LANGUAGE plpgsql;

/*
محاسبه مجموع هزینه سفارش بر اساس id سفارش
*/
CREATE OR REPLACE FUNCTION order_total(orderid bigint)
RETURNS numeric AS $$
DECLARE
    total numeric;
BEGIN
    SELECT SUM(p.price * oi.quantity) INTO total
    FROM api_orderitem oi
    INNER JOIN api_product p ON oi.product_id = p.id
    WHERE oi.order_id = orderid;

    RETURN COALESCE(total, 0);
END;
$$ LANGUAGE plpgsql;

/*
تابعی که گرون‌ترین محصول رو برمی‌گردونه
*/
CREATE OR REPLACE FUNCTION most_expensive_product()
RETURNS text AS $$
DECLARE
    pname text;
BEGIN
    SELECT name INTO pname
    FROM api_product
    ORDER BY price DESC
    LIMIT 1;

    RETURN pname;
END;
$$ LANGUAGE plpgsql;
