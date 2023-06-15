SELECT *
FROM candy_purchase;

SELECT *
FROM candy_customer;

SELECT cust_id, cust_name
FROM candy_customer
WHERE cust_type = 'W';

SELECT username
FROM candy_customer
WHERE cust_phone like '434%';

SELECT prod_desc, prod_price-prod_cost
FROM candy_product
order by prod_price-prod_cost desc;


SELECT count(distinct(delivery_date))
FROM candy_purchase;

-- Notes from 9/21 --
-- to tie tables togeather you need a forign key and primary key between tables --