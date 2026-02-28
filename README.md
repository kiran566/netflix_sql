
# 🎬 Netflix Data Analysis (SQL Project)

##  Project Overview

This project focuses on analyzing Netflix dataset using **SQL (PostgreSQL)** to extract meaningful business insights.

The goal of this project is to explore content distribution, trends, ratings, genres, and global presence using advanced SQL queries including aggregation, filtering, subqueries, and window functions.

---

## Tools & Technologies Used

*  PostgreSQL
*  SQL (CTE, Window Functions, Aggregations)
*  Netflix Dataset (Movies & TV Shows)

---

##  Dataset Description

The dataset contains information about Netflix content including:

* `show_id`
* `type` (Movie / TV Show)
* `title`
* `director`
* `cast`
* `country`
* `date_added`
* `release_year`
* `rating`
* `duration`
* `listed_in` (Genre)
* `description`

---

##  Project Objectives

* Analyze content distribution between Movies and TV Shows
* Identify top contributing countries
* Find most common ratings
* Determine yearly content growth
* Analyze genre trends
* Extract insights using SQL window functions

---

## 📊 Key Business Questions Solved

###  1️⃣Total Movies vs TV Shows

```sql
select type, count(*) as total_count
from netflix
group by type;
```

---

###  2️⃣ Top 5 Countries with Most Content

```sql
select country, count(*) as total_titles
from netflix
where country is not null
group by country
order by total_titles desc
limit 5;
```

---

###  3️⃣ Most Common Rating

```sql
select rating, count(*) as count_rating
from netflix
group by rating
order by count_rating desc;
```

---

###  4️⃣ Content Added Per Year

```sql
select extract(year from to_date(date_added, 'Month DD, YYYY')) as year,
       count(*) as total_added
from netflix
where date_added is not null
group by year
order by year;
```

---

###  5️⃣ Top 3 Genres Using Window Function

```sql
with genre_counts as (
    select listed_in,
           count(*) as total_count
    from netflix
    group by listed_in
),
ranked_genres as (
    select *,
           dense_rank() over (order by total_count desc) as rank_position
    from genre_counts
)
select *
from ranked_genres
where rank_position <= 3;
```

---

## SQL Concepts Demonstrated

* ✔ SELECT, WHERE, GROUP BY, ORDER BY
* ✔ Aggregate Functions (COUNT, SUM, AVG)
* ✔ CTE (WITH clause)
* ✔ Window Functions (DENSE_RANK)
* ✔ Date Conversion using `TO_DATE()`
* ✔ Filtering NULL values
* ✔ Subqueries

---

##  Key Insights

* Netflix has more Movies compared to TV Shows.
* Content growth significantly increased after 2015.
* United States contributes the highest number of titles.
* Certain genres dominate the platform.
* Most content falls under TV-MA and TV-14 ratings.

---

##  Future Enhancements

* Perform data visualization using Python
* Build dashboard using Power BI / Tableau
* Perform sentiment analysis on descriptions
* Create recommendation system

---

##  Conclusion

This project demonstrates strong SQL skills including:

* Data aggregation
* Analytical queries
* Window functions
* Date handling
* Business insight generation

---

##  Author

Kiran
CSE Student | Data Analytics & Data Science Enthusiast

---

