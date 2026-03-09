1. How many Movies vs TV Shows are there?

Select type , COUNT(*) As Total_Titles
From netflix_titles
Group by type
Order by Total_Titles Desc;



2. Which countries produce the most content?

Select country, Count(*) As top_Countries
from netflix_titles
where country IS NOT NULL AND country <> ''
Group by country
Order by top_Countries DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY; 


3. What are the top 10 genres by count?

Select listed_in AS Genre, Count(*) As top_Genres
from netflix_titles
where listed_in IS NOT NULL AND listed_in <> ''
Group by listed_in
Order by top_Genres DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY; 


4. How has the number of releases changed by year?

Select release_year , Count(*) AS year_change
from netflix_titles
where release_year IS NOT NULL AND release_year <> ''
Group by release_year
Order by release_year;




5. What are the most common ratings?

Select rating, Count(*) As Ratings
from netflix_titles
where rating IS NOT NULL AND rating <> ''
Group by rating
Order by Ratings;



6. Who are the top 10 directors with the most titles?

Select director AS Director, Count(*) As top_directors
from netflix_titles
where director IS NOT NULL AND director <> ''
Group by director
Order by top_directors DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY; 


7. Average number of titles per year


SELECT 
    AVG(title_count) AS avg_titles_per_year
FROM (
    SELECT release_year, COUNT(*) AS title_count
    FROM netflix_titles
    WHERE release_year IS NOT NULL
    GROUP BY release_year
) AS yearly;


8. Total titles per country and type (Movies vs TV Shows by Country)


SELECT 
    country,
    type,
    COUNT(*) AS total_titles
FROM netflix_titles
WHERE country IS NOT NULL
GROUP BY country, type
ORDER BY country, total_titles DESC;
