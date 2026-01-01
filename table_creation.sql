drop table if exists netflix;
create table netflix
(
	show_id	VARCHAR(10),
	type    VARCHAR(10),
	title	VARCHAR(250),
	director VARCHAR(550),
	casts	VARCHAR(1050),
	country	VARCHAR(550),
	date_added	VARCHAR(55),
	release_year	VARCHAR(20),
	rating	VARCHAR(15),
	duration	VARCHAR(15),
	listed_in	VARCHAR(250),
	description VARCHAR(550)
);

select * from netflix
--updating release year column changing type to int
--check for alpha characters
select *
from netflix
where release_year ='release_year';

delete from netflix where show_id='show_id';

--changing

alter table netflix
alter column release_year
type INT
using release_year::INT;


select count(*) as total_movies_count from netflix;

select distinct type from netflix;





