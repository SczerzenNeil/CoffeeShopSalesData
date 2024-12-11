select * 
from coffeeshopsales;

#total sales
select ROUND(SUM(transaction_totals)) as total_sales
from coffeeshopsales;

#sales per store
select store_location, ROUND((SUM(transaction_totals))) as total_Sales
from coffeeshopsales
group by store_location
order by total_sales;

#sales per month
select Month(transaction_date) as Month, ROUND((SUM(transaction_totals)))
from coffeeshopsales
group by Month(transaction_date);

#sales per store per month 
select store_location, ROUND((SUM(transaction_totals))) as total_Sales, Month(transaction_date) as Month
from coffeeshopsales 
group by Month(transaction_date), store_location 
order by Month(transaction_date), total_Sales;

#quantity of each product sold
select product_id, product_detail, SUM(transaction_qty) as quantity_sold
from coffeeshopsales
group by product_id, product_detail
order by quantity_sold desc;

#quantity of each product sold per month
select product_id, product_detail, SUM(transaction_qty) as quantity_sold, Month(transaction_date) as Month
from coffeeshopsales
group by Month(transaction_date), product_id, product_detail
order by Month(transaction_date), quantity_sold desc;

#qunatity of sold products with unit price
select product_id, product_detail, unit_price, SUM(transaction_qty) as quantity_sold
from coffeeshopsales
group by product_id, unit_price, product_detail
order by quantity_sold desc;

#revenue per product 
select product_id, ROUND(SUM(transaction_totals)) Revenue, product_detail, SUM(transaction_qty) quantity_sold
from coffeeshopsales
group by product_id, product_detail
order by Revenue desc;

#revenue per product cateogry 
select product_category, ROUND(SUM(transaction_totals)) Revenue
from coffeeshopsales
group by product_category
order by Revenue desc;

#revenue per product type 
select product_type, ROUND(SUM(transaction_totals)) Revenue
from coffeeshopsales
group by product_type
order by Revenue desc;

#transactions per hour 
select Hour(transaction_time) as Hour, COUNT(transaction_id) as transaction_amount
from coffeeshopsales
group by Hour
order by transaction_amount desc;

#sales per hour 
select Hour(transaction_time) as Hour, ROUND(SUM(transaction_totals)) as total_sales
from coffeeshopsales
group by Hour
Order by total_sales desc; 

#sales for the morning
 select ROUND(SUM(transaction_totals)) as total_sales
 from coffeeshopsales
 where Hour(transaction_time) between 6 and 11;
 #sales for the afternoon
 select ROUND(SUM(transaction_totals)) as total_sales
 from coffeeshopsales
 where Hour(transaction_time) between 12 and 16;
 #sales for the evening
 select ROUND(SUM(transaction_totals)) as total_sales
 from coffeeshopsales
 where Hour(transaction_time) between 17 and 24;
 
 #sales per day of the month 
 select Month(transaction_date) as Month, Day(transaction_date) as Day, ROUND(SUM(transaction_totals)) total_sales
 from coffeeshopsales
 group by Month, Day;
 
 #sale per time of the month (1)
 select ROUND(SUM(transaction_totals)) total_sales
 from coffeeshopsales 
 where  Month(transaction_date) = 1 AND 
 Day(transaction_date) between 1 and 10;
 select ROUND(SUM(transaction_totals)) total_sales
 from coffeeshopsales 
 where  Month(transaction_date) = 1 AND 
 Day(transaction_date) between 11 and 20;
 select ROUND(SUM(transaction_totals)) total_sales
 from coffeeshopsales 
 where  Month(transaction_date) = 1 AND 
 Day(transaction_date) between 21 and 30;
 
  #sale per time of the month (2)
select ROUND(SUM(transaction_totals)) total_sales
 from coffeeshopsales 
 where  Month(transaction_date) = 2 AND 
 Day(transaction_date) between 1 and 10;
 select ROUND(SUM(transaction_totals)) total_sales
 from coffeeshopsales 
 where  Month(transaction_date) = 2 AND 
 Day(transaction_date) between 11 and 20;
 select ROUND(SUM(transaction_totals)) total_sales
 from coffeeshopsales 
 where  Month(transaction_date) = 2 AND 
 Day(transaction_date) between 21 and 30;
 
 
  #sale per time of the month (3)
 select ROUND(SUM(transaction_totals)) total_sales
 from coffeeshopsales 
 where  Month(transaction_date) = 3 AND 
 Day(transaction_date) between 1 and 10;
select ROUND(SUM(transaction_totals)) total_sales
 from coffeeshopsales 
 where  Month(transaction_date) = 3 AND 
 Day(transaction_date) between 11 and 20;
 select ROUND(SUM(transaction_totals)) total_sales
 from coffeeshopsales 
 where  Month(transaction_date) = 3 AND 
 Day(transaction_date) between 21 and 30;