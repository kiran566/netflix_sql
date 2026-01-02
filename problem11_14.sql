-- 11. List all movies that are documentaries
select * from netflix where listed_in ilike '%documentaries%';

-- 12. Find all content without a director
select count(*) from netflix where director is null;
select count(*) from netflix where director is null group by type;

select type,show_id,title ,director,
   date_added  from netflix where director is null;

-- 13. Find how many movies actor 'Salman Khan' appeared in last 10 years!
select count(*) as salman_movies_in_last_10years from netflix 
where type='Movie' and casts ilike '%Salman Khan%' and
to_date(date_added,'Month DD,YYYY')>=current_date-interval
' 10 years';

-- 14. Find the top 10 actors who have appeared in the highest number of movies produced in India.

select unnest(string_to_array(casts,',')) ,count(*)as acted 
from netflix
where country='India' and type ='Movie' group by 1 order by 2 desc limit 10;


   

