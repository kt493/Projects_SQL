Use Museums ;
show tables;


-- Joining Tables:
-- 1. Retrieve the full name of artists along with the names of the museums where their works are displayed.

select full_name as Artist_Name, museum.name as Museum_Name from artist
join work 
on artist.artist_id = work.artist_id
join museum
on museum.museum_id = work.museum_id
group by Artist_Name, Museum_Name; 


-- 2. Group By and Count:
-- How many works does each artist have in the database? 
-- Display the artist's full name along with the count of their works, ordered by the count in descending order.

select full_name as Artist_Name, count(work.work_id) as Count_of_Works from artist
join work 
on artist.artist_id = work.artist_id
group by Artist_Name 
order by Count_of_Works desc
; 



-- 3. Order By and Limit:
-- List the top 5 museums with the highest number of works displayed in the database, along with their respective counts.

select museum.name as Museum_Name, count(work.work_id) as Count_of_Works from museum
join work
on museum.museum_id = work.museum_id
group by Museum_Name
order by Count_of_Works desc
limit 5;




-- 4. Join, Order By, and Limit:
-- Display the names and styles of the works along with the corresponding museum names, 
-- ordered by the museum name in ascending order. Limit the results to 10.

select museum.name as Museum_Name, work.name as Painting_Name, work.style as Style from museum
join work
on museum.museum_id = work.museum_id
order by Museum_Name asc
limit 10;




-- 5.Join, Group By, and Sum:
-- Show the total sale price for each artist's works. 
-- Display the artist's full name along with the total sale price, ordered by the total sale price in descending order.

select full_name as Artist_Name, sum(sale_price) as Sales_Price from artist
join work 
on artist.artist_id = work.artist_id
join product_size
on work.work_id = product_size.work_id
group by Artist_Name
order by Sales_Price desc; 



-- 6. Join, Group By, and Having:
-- List artists who have more than 3 works in the database, along with the count of their works.

select artist.full_name as Artist_Name, count(work.work_id) as Work_Count from artist
join work
on artist.artist_id = work.artist_id
group by Artist_Name
having Work_Count > 3;



-- 7. Join, Where, and Order By:
-- Retrieve the names of works and their corresponding artists' full names for works 
-- that have a sale price smaller than their regular price. 

select full_name as Artist_Name, work.name as Work_Name, sale_price as Sales_Price, regular_price as Regular_Price from artist
join work 
on artist.artist_id = work.artist_id
join product_size
on work.work_id = product_size.work_id
where sale_price < regular_price; 



-- 8. Join, Group By, and Average:
-- Calculate the average height and width of the artworks in the database. Display the average height and width.

select work.name as Work_Name,  
round(avg(canvas_size.height), 2) as Avg_Height,
round(avg(canvas_size.width), 2) as Avg_Width 
from work join product_size on 
work.work_id = product_size.work_id
join canvas_size on
product_size.size_id = canvas_size.size_id
group by Work_Name
;

-- Join, Group By, and Max:
-- 9 Find the maximum sale price among all the works in each museum. 
-- Display the museum name along with the maximum sale price.

select museum.name as Museum_Name, max(product_size.sale_price) as Maximum_Sales_Price
from museum join work 
on museum.museum_id = work.museum_id
join product_size
on work.work_id = product_size.work_id
group by Museum_Name;


-- Join, Group By, and Concatenate:
-- 10. Concatenate the first name and last name of artists along with their nationality, separated by a comma. 
-- Display the concatenated string along with the count of works by each artist, ordered by the count in descending order.

select concat(artist.first_name, ',', artist.last_name, ',', artist.nationality) as Artist_Info, count(work.artist_id) as Work_Count
from artist join work
on artist.artist_id = work.artist_id
group by Artist_Info
order by Work_Count desc;




