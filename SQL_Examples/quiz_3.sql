-- QUIZ 2, Sean Wendladnt -- 
-- 1 --
SELECT cust_name
FROM candy_customer
WHERE cust_type =
(SELECT cust_type
FROM candy_cust_type
WHERE cust_type_desc = 'Retail');


-- 2 --
select cust_name 
from candy_customer
JOIN candy_cust_type
ON candy_customer.cust_type = candy_cust_type.cust_type
WHERE cust_type_desc = 'Retail';

-- 3 --
-- List the name of all candy customers who have unpaid accounts.  Use nested queries instead of joins to do this. --
SELECT cust_name
FROM candy_customer
WHERE cust_id IN
(Select DISTINCT(cust_id)
FROM candy_purchase
WHERE status = 'NOT PAID');

-- 4 --
SELECT cust_name
FROM candy_customer
WHERE cust_id IN
(SELECT DISTINCT(cust_id)
FROM candy_purchase
WHERE prod_id IN
(SELECT prod_id
FROM candy_product
WHERE prod_desc = 'Celestial Cashew Crunch'));


-- 5 --
-- List all the candy product descriptions that have purchases which are bigger than the average pounds purchased by all customers. --
SELECT prod_desc
FROM candy_product
JOIN candy_purchase
ON candy_product.prod_id = candy_purchase.prod_id
GROUP BY candy_product.prod_id
HAVING sum(pounds) >
(SELECT avg(pounds)
FROM candy_purchase);

select distinct prod_desc from candy_product
join candy_purchase on candy_product.prod_id = candy_purchase.prod_id
where pounds > 5.07;