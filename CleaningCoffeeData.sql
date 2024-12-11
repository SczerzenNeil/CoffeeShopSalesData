select * 
from coffeeshopsales;

#checking for duplicate/misspelled entries
select distinct store_location
from coffeeshopsales;
select distinct product_category
from coffeeshopsales;
select distinct product_type
from coffeeshopsales;

#checking what Green Beans product type was
select *
from coffeeshopsales
where product_type = "Green Beans";

#gathering a total count
select count(distinct store_location) storeCount, count(distinct product_category) categoryCount, count(distinct product_type) typeCount
from coffeeshopsales;


select count(distinct product_detail)
from coffeeshopsales;
select distinct product_detail
from coffeeshopsales;

select count(distinct store_id) 
from coffeeshopsales;
select count(distinct product_id) 
from coffeeshopsales;

select count(distinct transaction_id) as countID
from coffeeshopsales
group by transaction_id
having countID > 1;

#adding a column for total sales per transaction 
select transaction_id, SUM(transaction_qty * unit_price) as transaction_amount
from coffeeshopsales
group by transaction_id;

alter table coffeeshopsales
drop column transaction_totals;

alter table coffeeshopsales
add column transaction_totals DOUBLE as (transaction_qty * unit_price);

#Changing date from string to date format 
SELECT transaction_date,
STR_TO_DATE(transaction_date, '%m/%d/%Y')
FROM coffeeshopsales;

Update coffeeshopsales
SET transaction_date = STR_TO_DATE(transaction_date, '%m/%d/%Y');

select distinct transaction_date
from coffeeshopsales;

#Changing time from string to date format 
Select transaction_time, 
str_to_date(transaction_time, '%T')
from coffeeshopsales;

Update coffeeshopsales
SET transaction_time = str_to_date(transaction_time, '%T');