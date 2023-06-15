-- QUIZ 2, Sean Wendladnt -- 
-- 1 --
select cust_name 
from candy_customer
JOIN candy_cust_type
ON candy_customer.cust_type = candy_cust_type.cust_type
WHERE cust_type_desc = 'Retail';

-- 2 --
SELECT cust_type, count(cust_id)
FROM candy_customer
GROUP BY cust_type;

-- 3 --
SELECT cust_name
FROM candy_customer
JOIN candy_purchase
ON candy_customer.cust_id = candy_purchase.cust_id
JOIN candy_product
ON candy_purchase.prod_id=candy_product.prod_id
WHERE prod_desc = 'Celestial Cashew Crunch';

-- 4 --
SELECT prod_id, avg(pounds)
FROM candy_purchase
GROUP BY prod_id
HAVING count(distinct(cust_id)) > 3;

-- 5 --
SELECT prod_desc
FROM candy_product
LEFT JOIN candy_purchase
ON candy_product.prod_id = candy_purchase.prod_id
WHERE candy_purchase.prod_id IS NULL;
