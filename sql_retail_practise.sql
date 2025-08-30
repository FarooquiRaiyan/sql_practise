create database sqlpractise;
use sqlpractise;
create table retail_sales
(
transactions_id	int Primary Key,
sale_date	date,
sale_time	time,
customer_id	int,
gender	varchar(20),
age	      int,
category	varchar(30),
quantiy	    int,
price_per_unit	float,
cogs	  float,
total_sale    float
);
select *From retail_sales;

select * from retail_sales
where category ='Clothing'  and date_format(sale_date,'%Y-%m') = '2022-11'
group by 1;


SELECT category, SUM(quantiy) AS total_quantity
FROM retail_sales
WHERE category = 'Clothing' AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
GROUP BY category;



SELECT category, SUM(quantiy) AS total_quantity
FROM retail_sales
WHERE category = 'Clothing'
  AND DATE_FORMAT(sale_date, '%Y-%m') = '2023-11'
GROUP BY category;

select * from retail_sales;
select distinct(category) from retail_sales;

-- Q3: calculate total_sale for each category
 select category,sum(total_sale) as totals
 from retail_sales
 where category = 'Clothing'  or category = 'Beauty' or category ='Electronics'
 group by category
 order by  totals desc;
 
 select category,sum(total_sale) as totals, count(*) as total_orders
 from retail_sales
 group by category;
 
 
 
 -- q4 :   find the average age of customers who purchase items from the 'Beauty' category.
 select ROUND(avg(age),2) as ages
 from retail_sales
 where category='Beauty';
 
 
 
 --  q5 find transactions where total_sale>1000
 select 
 * from retail_sales
 where total_sale>1000;
 
 --  q6total number of tansactions made by each gender in each categeory
 select count(*), gender, category
 from retail_sales
 group by category,gender
 order by category;
 
 --   q7 average sale for each month. best selling month in each year
 
select year(sale_date),
month(sale_date) ,
sum(total_sale)
from retail_sales
group by 1,2;


-- q8 top 5 cutomers based on higesht total saels;

select customer_id, sum(total_sale) as highest_sales
from retail_sales 
group by customer_id
order by 2 desc limit 5;

-- q9 number of unique customers from each categry;
select category, count(distinct(customer_id))
from retail_sales
group by category;
 
 
 --  q10 
 
 
 
 










