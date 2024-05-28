## Questions and Answers ##
# Data analysis for Pizza Shop
Use pizza_sales;
## Basic:
-- 1. Retrieve the total number of orders placed.
 select count(order_id) as Total_Order_Count from orders;

-- 2. Calculate the total revenue generated from pizza sales.
select round(sum(ODS.quantity * PZ.price)) as Total_Revenue 
from order_details as ODS
join pizzas as PZ 
on ODS.pizza_id = PZ.pizza_id;

-- 3. Identify the highest-priced pizza.
select pizza_types.name as Name, pizzas.price as Price from pizza_types
join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id
order by pizzas.price desc limit 1;

-- 4. Identify the most common pizza size ordered.
select sum(quantity) as Order_Count, size as Size from order_details
join pizzas on order_details.pizza_id = pizzas.pizza_id
group by size order by Order_count desc limit 1;

-- 5. List the top 5 most ordered pizza types along with their quantities. 
select name as Name, sum(quantity) as Order_Count 
from order_details
join pizzas on order_details.pizza_id = pizzas.pizza_id
join pizza_types on pizzas.pizza_type_id = Pizza_types.pizza_type_id
group by name order by Order_Count desc limit 5;

## Intermediate:
-- 6. Join the necessary tables to find the total quantity of each pizza category ordered
select category as Category, sum(quantity) as Quantity from order_details
join pizzas on order_details.pizza_id = pizzas.pizza_id
join pizza_types on pizzas.pizza_type_id = pizza_types.pizza_type_id
 group by category order by Quantity desc;
 
-- 7. Determine the distribution of orders by hour of the day. 
Select hour(time) as Hour, count(order_details.order_id) as Order_Count from order_details
join orders on order_details.order_id = orders.order_id
group by Hour order by Hour;

-- 8.  Join relevant tables to find the category-wise distribution of pizzas.
select category as Category, count(pizza_type_id) as Count from pizza_types
group by Category;

-- 9. Group the orders by date and calculate the average number of pizzas ordered per day.
select date as Date, round(avg(order_id)) as Average_Orders
from orders
group by Date;

-- 10. Determine the top 3 most ordered pizza types based on revenue.
select name as Name, round(sum(quantity * price)) as Revenue 
from order_details
join pizzas on order_details.pizza_id = pizzas.pizza_id
join pizza_types on pizzas.pizza_type_id = pizza_types.pizza_type_id
group by Name
order by Revenue limit 3;
 
 ## Advanced:
-- 11. Calculate the percentage contribution of each pizza type to total revenue.
select pizza_types.name as Name,
round(sum(order_details.quantity * pizzas.price) / 
(select round(sum(order_details.quantity * pizzas.price),2) as total_sales
from order_details
join pizzas 
on pizzas.pizza_id = order_details.pizza_id) *100,2) as Revenue_Percentage
from pizza_types 
join pizzas 
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name order by Revenue_Percentage desc;

-- 12. Analyze the cumulative revenue generated over time.
select date as Date,
round(sum(revenue) over(order by date)) as Cumulative_Revenue
from
(select orders.date,
sum(order_details.quantity * pizzas.price) as revenue
from order_details 
join pizzas
on order_details.pizza_id = pizzas.pizza_id
join orders
on orders.order_id = order_details.order_id
group by orders.date) as sales;

-- 13. Determine the top 3 most ordered pizza types based on revenue for each pizza category.
select name as Name, revenue as Revenue from
(select category, name, revenue,
rank() over (partition by category order by revenue desc) as rn
from
(select pizza_types.category, pizza_types.name,
round(sum((order_details.quantity) * pizzas.price)) as revenue
from pizza_types 
join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.category, pizza_types.name) as tbl1) as tbl2
where rn <= 3;
