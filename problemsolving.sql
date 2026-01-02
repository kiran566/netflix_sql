-- problem solving
select * from netflix;

-- 1. Count the number of Movies vs TV Shows
select type,count(*) as total_count from netflix group by type;

-- 2. Find the most common rating for movies and TV shows
select t.type,t.rating from 
(select type,rating,count(*) as total_count,
rank() over(partition by type order by count(*) desc) 
   as rank from netflix group by rating,type)
as t
where t.rank=1;

-- 3. List all movies released in a specific year (e.g., 2020)
select * from netflix;

select * from netflix where 
(type='Movie' and release_year=2020);

-- 4. Find the top 5 countries with the most content on Netflix

select  unnest(string_to_array(country,',')) as cont,
count(*)as released_by_them
from netflix where 1 is not null
group by 1 order by 2 desc limit 5;

-- 5. Identify the longest movie
select title, duration
from netflix
where type = 'Movie' and duration is not null
order by  cast(SPLIT_PART(duration, ' ', 1) as INT) desc
limit 1;
-- 6. Find content added in the last 5 years
select * from netflix;
select * from netflix where to_date(date_added,'Month DD,YYYY')>=current_date-interval
' 5 years' and date_added is not null;





