-- SQL Challenge Day 40/50


DROP table if exists order_data;
-- Create the table
CREATE TABLE order_data (
    order_id SERIAL PRIMARY KEY,
    order_time TIMESTAMP,
    customer_id INT,
    total_amount DECIMAL(10, 2)
);

https://github.com/harold-kumar/World_Population_Analysis-SQL-and-PowerBI/blob/main/Screenshot%20(247).png
-- Add records

-- Add records
INSERT INTO order_data (order_time, customer_id, total_amount) VALUES
    ('2024-03-31 08:30:00', 1001, 25.50),
    ('2024-03-31 09:15:00', 1002, 32.75),
    ('2024-03-31 10:00:00', 1003, 20.00),
    ('2024-03-31 11:45:00', 1004, 18.50),
    ('2024-03-31 12:30:00', 1005, 27.80),
    ('2024-03-31 13:15:00', 1006, 35.20),
    ('2024-03-31 14:00:00', 1007, 40.00),
    ('2024-03-31 15:45:00', 1008, 22.90),
    ('2024-03-31 16:30:00', 1009, 28.75),
    ('2024-03-31 17:15:00', 1010, 30.60),
    ('2024-03-31 18:00:00', 1011, 24.95),
    ('2024-03-31 19:45:00', 1012, 38.25),
    ('2024-03-31 20:30:00', 1013, 42.80),
    ('2024-03-31 21:15:00', 1014, 26.40),
    ('2024-03-31 22:00:00', 1015, 33.10),
    ('2024-03-31 23:45:00', 1016, 20.50),
    ('2024-03-31 00:15:00', 1017, 28.75),
    ('2024-03-31 01:00:00', 1018, 18.90),
    ('2024-03-31 22:45:00', 1019, 23.25),
    ('2024-03-31 22:30:00', 1020, 30.00),
    ('2024-03-31 22:15:00', 1021, 35.80),
    ('2024-03-31 23:00:00', 1022, 38.50),
    ('2024-03-31 06:45:00', 1023, 21.20),
    ('2024-03-31 09:30:00', 1024, 27.95),
    ('2024-03-31 23:15:00', 1025, 32.70),
    ('2024-03-31 09:00:00', 1026, 25.45),
    ('2024-03-31 10:45:00', 1027, 37.80),
    ('2024-03-31 21:30:00', 1028, 40.90),
    ('2024-03-31 23:15:00', 1029, 24.60),
    ('2024-03-31 13:00:00', 1030, 31.75),
    ('2024-03-31 22:45:00', 1031, 22.50),
    ('2024-03-31 22:30:00', 1032, 30.25),
    ('2024-03-31 23:15:00', 1033, 19.80),
    ('2024-03-31 23:00:00', 1034, 24.75),
    ('2024-03-31 20:45:00', 1035, 32.50),
    ('2024-03-31 20:30:00', 1036, 38.20),
    ('2024-03-31 20:15:00', 1037, 41.75),
    ('2024-03-31 22:00:00', 1038, 23.80),
    ('2024-03-31 22:45:00', 1039, 29.95),
    ('2024-03-31 22:30:00', 1040, 31.60);



/*
Swiggy Data Analyst Interview Question:

Write a SQL query to analyze the order patterns
throughout the day, providing insights into each 
hour's total orders and their respective 
percentages of the total orders. 

The output should include the hour, total orders,
and order percentage. 
Order by % order in decending

%orders = hourly order/total_orders * 100
*/

select * from order_data

select 
count(2) as cnt
from order_data

select
extract(hour from order_time) as hours,
count(*) as count
from order_data
group by hours

select order_time,
extract(hour from order_time) as hour,
customer_id
from order_data
order by order_time


select 
extract(hour from order_time) as hours,
customer_id
from order_data
group by hours, customer_id
order by hours


select
extract(hour from order_time) as hours,
customer_id,
count(*) as count
from order_data
group by hours , customer_id
order by hours

select
extract(hours from order_time) as hours,
count(customer_id) as customer_count
from order_data
group by hours
order by hours ----instead of count(customer_id) can also be count(*)

select
extract(hour from order_time) as hours
count(customer_id) as ---- order_id , *, 1 anything can


-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------

-- Day 41/50 SQL Challenge


-- Create the user_purchases table
CREATE TABLE user_purchases (
    user_id INT,
    date DATE,
    amount_spent FLOAT,
    day_name VARCHAR(20)
);

-- Insert records into the user_purchases table
INSERT INTO user_purchases (user_id, date, amount_spent, day_name) VALUES
(1047, '2023-01-01', 288, 'Sunday'),
(1099, '2023-01-04', 803, 'Wednesday'),
(1055, '2023-01-07', 546, 'Saturday'),
(1040, '2023-01-10', 680, 'Tuesday'),
(1052, '2023-01-13', 889, 'Friday'),
(1052, '2023-01-13', 596, 'Friday'),
(1016, '2023-01-16', 960, 'Monday'),
(1023, '2023-01-17', 861, 'Tuesday'),
(1010, '2023-01-19', 758, 'Thursday'),
(1013, '2023-01-19', 346, 'Thursday'),
(1069, '2023-01-21', 541, 'Saturday'),
(1030, '2023-01-22', 175, 'Sunday'),
(1034, '2023-01-23', 707, 'Monday'),
(1019, '2023-01-25', 253, 'Wednesday'),
(1052, '2023-01-25', 868, 'Wednesday'),
(1095, '2023-01-27', 424, 'Friday'),
(1017, '2023-01-28', 755, 'Saturday'),
(1010, '2023-01-29', 615, 'Sunday'),
(1063, '2023-01-31', 534, 'Tuesday'),
(1019, '2023-02-03', 185, 'Friday'),
(1019, '2023-02-03', 995, 'Friday'),
(1092, '2023-02-06', 796, 'Monday'),
(1058, '2023-02-09', 384, 'Thursday'),
(1055, '2023-02-12', 319, 'Sunday'),
(1090, '2023-02-15', 168, 'Wednesday'),
(1090, '2023-02-18', 146, 'Saturday'),
(1062, '2023-02-21', 193, 'Tuesday'),
(1023, '2023-02-24', 259, 'Friday'),
(1023, '2023-02-24', 849, 'Friday'),
(1009, '2023-02-27', 552, 'Monday'),
(1012, '2023-03-02', 303, 'Thursday'),
(1001, '2023-03-05', 317, 'Sunday'),
(1058, '2023-03-08', 573, 'Wednesday'),
(1001, '2023-03-11', 531, 'Saturday'),
(1034, '2023-03-14', 440, 'Tuesday'),
(1096, '2023-03-17', 650, 'Friday'),
(1048, '2023-03-20', 711, 'Monday'),
(1089, '2023-03-23', 388, 'Thursday'),
(1001, '2023-03-26', 353, 'Sunday'),
(1016, '2023-03-29', 833, 'Wednesday');


/*
SQL Challenge: Friday Purchases

Scenario:
IBM wants to analyze user purchases for Fridays
in the first quarter of the year. 

Calculate the average amount users spent
per order for each Friday.

Table:
Table Name: user_purchases

Columns:
user_id (int)
date (datetime)
amount_spent (float)
day_name (varchar)

Question:
Write an SQL query to find the average amount
spent by users per order for each Friday 
in the first quarter of the year.
*/


--- GOOD FOR UNDERSTANDIN GROUP BY AND ALL *******************************

select * from user_purchases


select
extract(week from date) as week_num,
avg(amount_spent) as avg_spent
from user_purchases
group by week_num
order by week_num

select
extract(week from date) as week_num,
user_id,
sum(amount_spent) amount_spent
from user_purchases
group by week_num, user_id
order by week_num  ---- if there is two times of same user then it will add otherwise 

select
*
from user_purchases
where user_id = '1099'


select
extract(week from date) as week_num,
count(user_id)
from user_purchases
group by week_num
order by week_num


select
extract(week from date) as week_num,
avg(amount_spent) as avg_amoun_spend
from user_purchases
where extract (year from date) =2023
  and extract (quarter from date) =1
  and extract (dow from date) = 5 ---- friday
group by week_num   ---- or 1
order by week_num


SELECT 
    EXTRACT(WEEK FROM date) as week_num,
    AVG(amount_spent) as avg_spend_friday
FROM user_purchases
    where 
        EXTRACT(YEAR FROM date) = 2023
        AND
        EXTRACT(quarter FROM date) = 1
        AND
        EXTRACT(DOW FROM date) = 5
GROUP BY 1


-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------

-- SQL Challenge 43/50

CREATE TABLE forbes_global (
    company VARCHAR(100),
    sector VARCHAR(100),
    industry VARCHAR(100),
    country VARCHAR(100),
    sales FLOAT,
    profits FLOAT,
    rank INT
);


-- Inserting the data
insert into forbes_global
VALUES  
('Walmart', 'Consumer Discretionary', 'General Merchandisers', 'United States', 482130.0, 14694.0, 1),
('Sinopec-China Petroleum', 'Energy', 'Oil & Gas Operations', 'China', 448452.0, 7840.0, 2),
('Royal Dutch Shell', 'Energy', 'Oil & Gas Operations', 'Netherlands', 396556.0, 15340.0, 3),
('China National Petroleum', 'Energy', 'Oil & Gas Operations', 'China', 392976.0, 2837.0, 4),
('State Grid', 'Utilities', 'Electric Utilities', 'China', 387056.0, 9573.0, 5),
('Saudi Aramco', 'Energy', 'Oil & Gas Operations', 'Saudi Arabia', 355905.0, 11002.0, 6),
('Volkswagen', 'Consumer Discretionary', 'Auto & Truck Manufacturers', 'Germany', 283565.0, 17742.4, 7),
('BP', 'Energy', 'Oil & Gas Operations', 'United Kingdom', 282616.0, 3591.0, 8),
('Amazon.com', 'Consumer Discretionary', 'Internet Services and Retailing', 'United States', 280522.0, 5362.0, 9),
('Toyota Motor', 'Consumer Discretionary', 'Auto & Truck Manufacturers', 'Japan', 275288.0, 18499.3, 10),
('Apple', 'Information Technology', 'Computers, Office Equipment', 'United States', 265595.0, 55256.0, 11),
('Exxon Mobil', 'Energy', 'Oil & Gas Operations', 'United States', 263910.0, 15850.0, 12),
('Berkshire Hathaway', 'Financials', 'Diversified Financials', 'United States', 247837.0, 8971.0, 13),
('Samsung Electronics', 'Information Technology', 'Electronics', 'South Korea', 245898.0, 19783.3, 14),
('McKesson', 'Health Care', 'Health Care: Pharmacy and Other Services', 'United States', 231091.0, 5070.0, 15),
('Glencore', 'Materials', 'Diversified Metals & Mining', 'Switzerland', 219754.0, 5436.0, 16),
('UnitedHealth Group', 'Health Care', 'Health Care: Insurance and Managed Care', 'United States', 201159.0, 13650.0, 17),
('Daimler', 'Consumer Discretionary', 'Auto & Truck Manufacturers', 'Germany', 197515.0, 8245.1, 18),
('CVS Health', 'Health Care', 'Health Care: Pharmacy and Other Services', 'United States', 194579.0, 6634.0, 19),
('AT&T', 'Telecommunication Services', 'Telecommunications', 'United States', 181193.0, 13906.0, 20),
('Foxconn', 'Technology', 'Electronics', 'Taiwan', 175617.0, 4103.4, 21),
('General Motors', 'Consumer Discretionary', 'Auto & Truck Manufacturers', 'United States', 174049.0, 6710.0, 22),
('Verizon Communications', 'Telecommunication Services', 'Telecommunications', 'United States', 170756.0, 19225.0, 23),
('Total', 'Energy', 'Oil & Gas Operations', 'France', 149769.0, 7480.0, 24),
('IBM', 'Information Technology', 'Information Technology Services', 'United States', 141682.0, 6606.0, 25),
('Ford Motor', 'Consumer Discretionary', 'Auto & Truck Manufacturers', 'United States', 140545.0, 6471.0, 26),
('Hon Hai Precision Industry', 'Technology', 'Electronics', 'Taiwan', 135129.0, 4493.3, 27),
('Trafigura Group', 'Energy', 'Trading', 'Singapore', 131638.0, 975.0, 28),
('General Electric', 'Industrials', 'Diversified Industrials', 'United States', 126661.0, 5136.0, 29),
('AmerisourceBergen', 'Health Care', 'Wholesalers: Health Care', 'United States', 122848.0, 1605.5, 30),
('Fannie Mae', 'Financials', 'Diversified Financials', 'United States', 120472.0, 18418.0, 31),
('Trafigura Group', 'Energy', 'Trading', 'Switzerland', 120438.0, 975.0, 32),
('Koch Industries', 'Diversified', 'Diversified', 'United States', 115095.0, 5142.0, 33),
('Cardinal Health', 'Health Care', 'Wholesalers: Health Care', 'United States', 113982.0, 1377.0, 34),
('Alphabet', 'Technology', 'Internet Services and Retailing', 'United States', 110855.0, 18616.0, 35),
('Chevron', 'Energy', 'Oil & Gas Operations', 'United States', 110360.0, 5520.0, 36),
('Costco Wholesale', 'Consumer Discretionary', 'General Merchandisers', 'United States', 110215.0, 2115.0, 37),
('Cardinal Health', 'Health Care', 'Health Care: Pharmacy and Other Services', 'United States', 109838.0, 1718.0, 38),
('Ping An Insurance Group', 'Financials', 'Insurance', 'China', 109254.0, 2047.4, 39),
('Walgreens Boots Alliance', 'Consumer Staples', 'Food and Drug Stores', 'United States', 109026.0, 4563.0, 40),
('Costco Wholesale', 'Consumer Discretionary', 'Retailing', 'United States', 105156.0, 2115.0, 41),
('JPMorgan Chase', 'Financials', 'Diversified Financials', 'United States', 105153.0, 30615.0, 42),
('Verizon Communications', 'Telecommunication Services', 'Telecommunications', 'United States', 104887.0, 13568.0, 43),
('China Construction Bank', 'Financials', 'Banks', 'China', 104693.0, 38369.0, 44),
('China Construction Bank', 'Financials', 'Major Banks', 'China', 104692.9, 38369.2, 45),
('Trafigura Group', 'Energy', 'Trading', 'Netherlands', 103752.0, 975.0, 46),
('Exor Group', 'Financials', 'Diversified Financials', 'Netherlands', 103606.6, -611.2, 47),
('Anheuser-Busch InBev', 'Consumer Staples', 'Beverages', 'Belgium', 101541.0, 9536.0, 48),
('Bank of America', 'Financials', 'Banks', 'United States', 100264.0, 18724.0, 49),
('Bank of China', 'Financials', 'Banks', 'China', 99237.3, 28202.1, 50),
('Trafigura Group', 'Energy', 'Trading', 'Switzerland', 97296.0, 975.0, 51),
('Dell Technologies', 'Technology', 'Computers, Office Equipment', 'United States', 94477.0, 2743.0, 52),
('CVS Health', 'Health Care', 'Health Care: Insurance and Managed Care', 'United States', 94005.0, 6239.0, 53),
('Trafigura Group', 'Energy', 'Trading', 'United Kingdom', 90345.0, 975.0, 54),
('Trafigura Group', 'Energy', 'Trading', 'Switzerland', 88265.0, 975.0, 55),
('Trafigura Group', 'Energy', 'Trading', 'Netherlands', 88111.0, 975.0, 56),
('Trafigura Group', 'Energy', 'Trading', 'Switzerland', 87044.0, 975.0, 57),
('Trafigura Group', 'Energy', 'Trading', 'Switzerland', 84795.0, 975.0, 58),
('Trafigura Group', 'Energy', 'Trading', 'Switzerland', 84361.0, 975.0, 59),
('Trafigura Group', 'Energy', 'Trading', 'Switzerland', 83156.0, 975.0, 60),
('Trafigura Group', 'Energy', 'Trading', 'Switzerland', 82276.0, 975.0, 61);

/*
-- Most Profitable Companies
You are given a table called
forbes_global with columns
company, sector, industry, country, 
sales, profit, rank

Find out each country's most 
most profitable company details
*/

select *
from forbes_global

select
country,
company
from forbes_global
group by country, company    ---- cause companies is in group by thats why cannot group by country like i want


select
country,
count(*) as count
from forbes_global
group by country   -------------like i wanted group by country
---------------------------------------------------------------------

---partition by company
select
country,
company,
rn
from (
select 
	country,
	company,
	row_number() over(partition by company order by profits desc) as rn
	from forbes_global 
	group by country, company, profits
	
) as subquery
where rn= 1;
------------------------------------------------------------

select distinct(country) from forbes_global

------------------------------------------------------------

----partition by country
select
country,
company,
rn
from (
select 
	country,
	company,
	row_number() over(partition by country order by profits desc) as rn
	from forbes_global 
	group by country, company, profits
	
) as subquery
where rn= 1;

---------------------------------------------------------------

SELECT *
FROM
(    
    SELECT *,
            RANK() OVER(PARTITION BY 
            country ORDER BY profits DESC) as rn
    FROM forbes_global
)
WHERE rn = 1


-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------

-- SQL Challenge 44/50

-- Create the table
CREATE TABLE house_price (
    id INT,
    state VARCHAR(255),
    city VARCHAR(255),
    street_address VARCHAR(255),
    mkt_price INT
);
-- Insert all the records
INSERT INTO house_price (id, state, city, street_address, mkt_price) VALUES
(1, 'NY', 'New York City', '66 Trout Drive', 449761),
(2, 'NY', 'New York City', 'Atwater', 277527),
(3, 'NY', 'New York City', '58 Gates Street', 268394),
(4, 'NY', 'New York City', 'Norcross', 279929),
(5, 'NY', 'New York City', '337 Shore Ave.', 151592),
(6, 'NY', 'New York City', 'Plainfield', 624531),
(7, 'NY', 'New York City', '84 Central Street', 267345),
(8, 'NY', 'New York City', 'Passaic', 88504),
(9, 'NY', 'New York City', '951 Fulton Road', 270476),
(10, 'NY', 'New York City', 'Oxon Hill', 118112),
(11, 'CA', 'Los Angeles', '692 Redwood Court', 150707),
(12, 'CA', 'Los Angeles', 'Lewiston', 463180),
(13, 'CA', 'Los Angeles', '8368 West Acacia Ave.', 538865),
(14, 'CA', 'Los Angeles', 'Pearl', 390896),
(15, 'CA', 'Los Angeles', '8206 Old Riverview Rd.', 117754),
(16, 'CA', 'Los Angeles', 'Seattle', 424588),
(17, 'CA', 'Los Angeles', '7227 Joy Ridge Rd.', 156850),
(18, 'CA', 'Los Angeles', 'Battle Ground', 643454),
(19, 'CA', 'Los Angeles', '233 Bedford Ave.', 713841),
(20, 'CA', 'Los Angeles', 'Saint Albans', 295852),
(21, 'IL', 'Chicago', '8830 Baker St.', 12944),
(22, 'IL', 'Chicago', 'Watertown', 410766),
(23, 'IL', 'Chicago', '632 Princeton St.', 160696),
(24, 'IL', 'Chicago', 'Waxhaw', 464144),
(25, 'IL', 'Chicago', '7773 Tailwater Drive', 129393),
(26, 'IL', 'Chicago', 'Bonita Springs', 174886),
(27, 'IL', 'Chicago', '31 Summerhouse Rd.', 296008),
(28, 'IL', 'Chicago', 'Middleburg', 279000),
(29, 'IL', 'Chicago', '273 Windfall Avenue', 424846),
(30, 'IL', 'Chicago', 'Graham', 592268),
(31, 'TX', 'Houston', '91 Canterbury Dr.', 632014),
(32, 'TX', 'Houston', 'Dallas', 68868),
(33, 'TX', 'Houston', '503 Elmwood St.', 454184),
(34, 'TX', 'Houston', 'Kennewick', 186280),
(35, 'TX', 'Houston', '739 Chapel Street', 334474),
(36, 'TX', 'Houston', 'San Angelo', 204460),
(37, 'TX', 'Houston', '572 Parker Dr.', 678443),
(38, 'TX', 'Houston', 'Bellmore', 401090),
(39, 'TX', 'Houston', '8653 South Oxford Street', 482214),
(40, 'TX', 'Houston', 'Butler', 330868),
(41, 'AZ', 'Phoenix', '8667 S. Joy Ridge Court', 316291),
(42, 'AZ', 'Phoenix', 'Torrance', 210392),
(43, 'AZ', 'Phoenix', '35 Harvard St.', 167502),
(44, 'AZ', 'Phoenix', 'Nutley', 327554),
(45, 'AZ', 'Phoenix', '7313 Vermont St.', 285135),
(46, 'AZ', 'Phoenix', 'Lemont', 577667),
(47, 'AZ', 'Phoenix', '8905 Buttonwood Dr.', 212301),
(48, 'AZ', 'Phoenix', 'Lafayette', 317504);



/*

You are given a table of New York housing 
price called house_transactions with columns
id, state, city, street_address, mkt_price

Identify properites where the mkt_price of the house 
exceeds the city's average mkt_price.

*/
--- city avg
select
city,
avg(mkt_price) as city_avg
from house_price
group by city

select
id,
state
city,
street_address,
mkt_price,
avg(mkt_price) as city_avg
from house_price
group by city
having mkt_price > city_avg;


-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

-- SQL Challenge 45/50

DROP TABLE IF EXISTS orders;
-- Create Orders table
CREATE TABLE Orders (
    Order_id INT PRIMARY KEY,
    Customer_id INT,
    Order_Date DATE,
    Amount DECIMAL(10, 2)
);


DROP TABLE IF EXISTS Customers;
-- Create Customers table
CREATE TABLE Customers (
    Customer_id INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    Join_Date DATE
);

-- Insert records into Orders table
INSERT INTO Orders (Order_id, Customer_id, Order_Date, Amount)
VALUES
    (1, 1, '2024-05-01', 100),
    (2, 2, '2024-05-02', 150),
    (3, 3, '2023-12-15', 200),
    (4, 1, '2024-05-03', 120),
    (5, 2, '2024-01-20', 180),
    (6, 4, '2024-03-10', 90);

-- Insert records into Customers table
INSERT INTO Customers (Customer_id, Customer_Name, Join_Date)
VALUES
    (1, 'Alice', '2024-01-15'),
    (2, 'Bob', '2024-02-20'),
    (3, 'Charlie', '2023-12-01'),
    (4, 'David', '2024-03-01');



/*
-- Amazon Data Analyst interview 
questions for exp 1-3 year!

You have two tables: Orders and Customers.

 - Orders Table Columns: 
Order_id, Customer_id, Order_Date, Amount

- Customers Table Columns: 
Customer_id, Customer_Name, Join_Date
 
Write an SQL query to calculate the total 
order amount for each customer who joined 
in the current year. 

The output should contain Customer_Name and 
the total amount.

*/

select * from Customers
select * from Orders

select
extract(year from current_date) as currentyear
from Customers

select
c.customer_name,
sum(o.amount) as total_amount
from Orders o
join Customers c
on o.customer_id = c.customer_id
where extract(year from c.join_date) = extract(year from current_date)
group by customer_name



SELECT
    c.customer_name,
    SUM(o.amount)
FROM orders as o
JOIN 
customers as c
on c.customer_id = o.customer_id    
WHERE EXTRACT(YEAR FROM c.join_date) = 
    EXTRACT(YEAR FROM CURRENT_DATE)
GROUP by 1

-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------


-- SQL Challenge 46/50

DROP TABLE IF EXISTS orders;
-- Create table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount FLOAT
);

-- Insert records
INSERT INTO orders (customer_id, order_date, total_amount)
VALUES
    (1001, '2024-01-01', 120.25),
    (1002, '2024-01-03', 80.99),
    (1003, '2024-01-05', 160.00),
    (1004, '2024-01-07', 95.50),
    (1001, '2024-02-09', 70.75),
    (1002, '2024-02-11', 220.00),
    (1003, '2024-02-13', 130.50),
    (1004, '2024-02-15', 70.25),
    (1001, '2024-02-17', 60.75),
    (1002, '2024-03-19', 180.99),
    (1003, '2024-03-21', 140.00),
    (1004, '2024-03-23', 110.50),
    (1001, '2024-03-25', 90.25),
    (1002, '2024-03-27', 200.00),
    (1003, '2024-03-29', 160.50),
    (1004, '2024-03-31', 120.75),
    (1001, '2024-03-02', 130.25),
    (1002, '2024-03-04', 90.99),
    (1003, '2024-03-06', 170.00),
    (1004, '2024-04-08', 105.50),
    (1001, '2024-04-10', 80.75),
    (1002, '2024-04-12', 240.00),
    (1003, '2024-04-14', 150.50),
    (1004, '2024-04-16', 80.25),
    (1001, '2024-04-18', 70.75);

/*
-- Amazon Data Analyst Interview Question
You have orders table with columns
order_id, customer_id, order_date, total_amount

Calculate the running total of orders for each
customer. 

Return the customer ID, order date, 
total amount of each order, and the 
cumulative total of orders for each customer
sorted by customer ID and order date.
*/

SELECT *,
     SUM(total_amount) OVER(PARTITION BY 
    customer_id ORDER BY order_date)
    as running_total
FROM orders
ORDER BY customer_id, order_date

---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------

-- SQL Challenge 47/50

DROP TABLE IF EXISTS inventory;
CREATE TABLE inventory (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    quantity INT,
    price_per_unit FLOAT
);


INSERT INTO inventory (product_name, quantity, price_per_unit)
VALUES
    ('Laptop', 20, 999.99),
    ('Smartphone', 15, 699.99),
    ('Tablet', 8, 399.99),
    ('Headphones', 25, 149.99),
    ('Mouse', 30, 29.99),
    ('Wireless Earbuds', 12, 79.99),
    ('Portable Charger', 10, 49.99),
    ('Bluetooth Speaker', 18, 129.99),
    ('Fitness Tracker', 7, 89.99),
    ('External Hard Drive', 9, 149.99),
    ('Gaming Mouse', 14, 59.99),
    ('USB-C Cable', 22, 19.99),
    ('Smart Watch', 6, 199.99),
    ('Desk Lamp', 11, 34.99),
    ('Power Bank', 16, 39.99),
    ('Wireless Mouse', 13, 29.99),
    ('Bluetooth Headset', 20, 59.99),
    ('MicroSD Card', 5, 24.99),
    ('USB Flash Drive', 8, 14.99),
    ('HDMI Cable', 17, 9.99);


/*
Question:
Write an SQL query to display inventory details 
including the product name, quantity in stock, 
remaining stock level ('Medium' if quantity is
more than 10, 'Low' otherwise), and supplier ID. 

Assume each product has a unique 
supplier ID associated with it.
*/

select
*,
case 
when quantity >10
	 then 'Medium'
	 else 'Low'
	 end as remaining_stock
from inventory


-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

-- SQL Challenge 48/50

DROP TABlE IF EXISTS Customers;
DROP TABlE IF EXISTS Orders;


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50),
    Country VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert records into the 'Customers' table
INSERT INTO Customers (CustomerID, CustomerName, City, Country) 
VALUES 
(1, 'John Doe', 'New York', 'USA'),
(2, 'Jane Smith', 'Los Angeles', 'USA'),
(3, 'Michael Johnson', 'Chicago', 'USA'),
(4, 'Emily Brown', 'Houston', 'USA');

-- Insert records into the 'Orders' table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) 
VALUES 
(101, 1, '2024-05-10', 150.00),
(102, 2, '2024-05-11', 200.00),
(103, 1, '2024-05-12', 100.00),
(104, 3, '2024-05-13', 300.00);



/*
-- Question
You are given customers and orders table with
columns
customers has columns 
cx_id, cx_name, city, country

orders table has COLUMNS
order_id, cx_id, order_date, totalamount

Write an SQL query to retrive 
customer details along with their total order amounts
(if any). 
    
Include the customer's name, city, country, and total order amount. 
    
If a customer hasn't placed any orders, 
display 'NULL' for the total order amount."

*/

select
c.CustomerName,
c.City,
c.Country,
sum(o.TotalAmount)
from Customers c
join orders o
on c.CustomerID = o.CustomerID
group by c.CustomerName,
c.City,
c.Country

select
c.CustomerName,
c.City,
c.Country,
sum(o.TotalAmount)
from Customers c
left join orders o
on c.CustomerID = o.CustomerID
group by c.CustomerName,
c.City,
c.Country

SELECT 
    c.*,
    SUM(o.totalamount) as total_orders
FROM customers as c
LEFt JOIN
orders as o
ON o.customerid = c.customerid
GROUP BY 1

--------------------------------------------------------------------------
--------------------------------------------------------------------------

-- SQL Challenge 49/50

DROP TABLE IF EXISTS orders;
-- Create table for orders
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE
);

-- Insert sample records for orders
INSERT INTO orders (order_date)
VALUES
    ('2024-05-01'),
    ('2024-05-01'),
    ('2024-05-01'),
    ('2024-05-02'),
    ('2024-05-02'),
    ('2024-05-02'),
    ('2024-05-03'),
    ('2024-05-03'),
    ('2024-05-03'),
    ('2024-05-03'),
    ('2024-05-03'),
    ('2024-05-04'),
    ('2024-05-04'),
    ('2024-05-04'),
    ('2024-05-04'),
    ('2024-05-04'),
    ('2024-05-05'),
    ('2024-05-05'),
    ('2024-05-05'),
    ('2024-05-05'),
    ('2024-05-06'),
    ('2024-05-06'),
    ('2024-05-06'),
    ('2024-05-06'),
    ('2024-05-06');

-- Display the records to verify


/*
-- Question:
You are given a orders table with
columns order_id, order_date

Identify the busiest day for orders along 
with the total number of orders placed on that day. 
*/

select
extract(dow from order_date) as days,
count(*) as total_orders
from orders
group by days
order by total_orders desc
-- limit 1;

SELECT 
    order_date,
    COUNT(1)  
FROM orders
GROUP by 1
ORDER BY 2 DESC
LIMIT 1

---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
-- Day 15/50 SQL Challenge 


-- Creating the orders table
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2)
);

-- Inserting records for the current month
INSERT INTO orders (order_date, product_id, quantity, price) VALUES
    ('2024-04-01', 1, 10, 50.00),
    ('2024-04-02', 2, 8, 40.00),
    ('2024-04-03', 3, 15, 30.00),
    ('2024-04-04', 4, 12, 25.00),
    ('2024-04-05', 5, 5, 60.00),
    ('2024-04-06', 6, 20, 20.00),
    ('2024-04-07', 7, 18, 35.00),
    ('2024-04-08', 8, 14, 45.00),
    ('2024-04-09', 1, 10, 50.00),
    ('2024-04-10', 2, 8, 40.00);

-- Inserting records for the last month
INSERT INTO orders (order_date, product_id, quantity, price) VALUES
    ('2024-03-01', 1, 12, 50.00),
    ('2024-03-02', 2, 10, 40.00),
    ('2024-03-03', 3, 18, 30.00),
    ('2024-03-04', 4, 14, 25.00),
    ('2024-03-05', 5, 7, 60.00),
    ('2024-03-06', 6, 22, 20.00),
    ('2024-03-07', 7, 20, 35.00),
    ('2024-03-08', 8, 16, 45.00),
    ('2024-03-09', 1, 12, 50.00),
    ('2024-03-10', 2, 10, 40.00);

-- Inserting records for the previous month
INSERT INTO orders (order_date, product_id, quantity, price) VALUES
    ('2024-02-01', 1, 15, 50.00),
    ('2024-02-02', 2, 12, 40.00),
    ('2024-02-03', 3, 20, 30.00),
    ('2024-02-04', 4, 16, 25.00),
    ('2024-02-05', 5, 9, 60.00),
    ('2024-02-06', 6, 25, 20.00),
    ('2024-02-07', 7, 22, 35.00),
    ('2024-02-08', 8, 18, 45.00),
    ('2024-02-09', 1, 15, 50.00),
    ('2024-02-10', 2, 12, 40.00);


/*

Write an SQL query to retrieve the product details for items whose revenue 
decreased compared to the previous month. 

Display the product ID, quantity sold, 
and revenue for both the current and previous months.

*/

select * from orders

with currentmonth
as
(
	select
	product_id,
	sum(quantity) as total_quantity,
	sum(price * quantity) as currrent_month_revenue
	from orders
	where extract(month from order_date) = extract(month from current_date)
	group by product_id
),
previousmonth
as
(
	select
	product_id,
	sum(quantity) as total_quantity,
	sum(price * quantity) as previous_month_revenue
	from orders
	where extract(month from order_date) = extract(month from current_date) -1
	group by product_id
)

select
cr.proudct_id,
cr.total_quantity as current_month_count,
pr.total_quantity as previous_month_count,
cr.current_month_revenue,
cr.previou_month_revenue 
from currentmonth as cr
join previousmonth as pr
on cr.product_id = pr.product_id
where current_month_revenue < previous_month_revenue


WITH current_month_revenue
AS
(    
    SELECT
        product_id,
        SUM(quantity) as qty_sold,
        SUM(price * quantity) as current_month_rev
    FROM orders
    WHERE EXTRACT(MONTH FROM order_date) = EXTRACT(MONTH FROM CURRENT_DATE) 
    GROUP BY product_id
),
prev_month_revenue
AS    
(
    SELECT
        product_id,
        SUM(quantity) as qty_sold,
        SUM(price * quantity) as prev_month_rev
    FROM orders
    WHERE EXTRACT(MONTH FROM order_date) = EXTRACT(MONTH FROM CURRENT_DATE)-1 
    GROUP BY product_id
)

SELECT
    cr.product_id,
    cr.qty_sold as cr_month_qty,
     pr.qty_sold as pr_month_qty,
    cr.current_month_rev,
    pr.prev_month_rev
FROM current_month_revenue as cr
JOIN 
prev_month_revenue as pr
ON cr.product_id = pr.product_id
WHERE cr.current_month_rev < pr.prev_month_rev

