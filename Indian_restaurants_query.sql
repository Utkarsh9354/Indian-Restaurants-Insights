CREATE DATABASE RESTAURANTS;
USE RESTAURANTS;

SELECT*FROM ind_restaurants;

DESCRIBE ind_restaurants;

ALTER TABLE ind_restaurants
	MODIFY COLUMN name varchar(100),
	MODIFY COLUMN location varchar(255),
	MODIFY COLUMN locality varchar(100),
	MODIFY COLUMN city varchar(100),
	MODIFY COLUMN cuisine varchar(255),
    MODIFY COLUMN rating decimal(3,1);
   
   
-- Questions    
   

-- 1)Find the top 5 cities with the most restaurants and show the average rating for restaurants in those cities.

		SELECT city, COUNT(*) as restaurant_count, AVG(rating) as average_rating
		FROM ind_restaurants
		GROUP BY city
		ORDER BY restaurant_count DESC
		LIMIT 5;
    

-- 2)List the names and localities of restaurants that offer "North Indian" cuisine and have a rating above the city average.

		SELECT name , locality 
		FROM ind_restaurants r1
		WHERE cuisine LIKE '%North Indian%'
			AND rating > ( SELECT  avg(rating)
							FROM ind_restaurants r2
                            WHERE r1.city = r2.city);
                            
                     
-- 3)Select the restaurant names, Localities, and Cuisine types where the Location contains the word 'Connaught'.		
		
		SELECT name, locality, cuisine
		FROM ind_restaurants
		WHERE location LIKE '%Connaught%';


-- 4)Select the restaurant names, Localities, and Cuisine types, and rank the restaurants within each Locality based on their Rating.

		SELECT name, locality , cuisine , rating,
        RANK() OVER(PARTITION BY locality ORDER BY rating DESC) AS Locality_with_rank
        FROM ind_restaurants;
        

-- 5)Calculate the running total of Votes for each restaurant within each Locality using a window function.
        
		SELECT name , locality , votes , SUM(votes) OVER (PARTITION BY locality, name ORDER BY name) AS Running_Total
		FROM ind_restaurants;
        
	
-- 6) List the names and ratings of restaurants that are in the top 10% of ratings in each city.

		WITH cte AS (
			SELECT name , city , rating , PERCENT_RANK() OVER (PARTITION BY city ORDER BY rating DESC) AS percentile_rank
			FROM ind_restaurants)
					
		SELECT name , rating , city
		FROM cte
		WHERE percentile_rank <= 0.10;


-- 7)Analyze the average restaurant ratings grouped by city.
		
		SELECT city, AVG(rating) AS average_rating
		FROM ind_restaurants
		GROUP BY city
		ORDER BY average_rating DESC;


-- 8)Find the percentage of restaurants in each city that offer "Chinese" cuisine, and the average rating of those restaurants.

		SELECT city,
        COUNT(CASE WHEN cuisine LIKE '%Chinese%' THEN 1 END)/COUNT(*)*100 as Chinese_cuisene_percentage,
		AVG(CASE WHEN cuisine LIKE '%Chinese%' THEN rating END) AS avg_chinese_rating
		FROM ind_restaurants
		GROUP BY city;


-- 9)Calculate the average rating and cost for two people for each locality within each city, and rank the localities by average rating.

		SELECT city,locality,
        AVG(rating) as avg_rating, AVG(cost) as avg_cost,
        RANK() OVER(PARTITION BY city ORDER BY AVG(rating) DESC) AS rank_within_city
        FROM ind_restaurants
        GROUP BY city, locality
		ORDER BY city, rank_within_city;
        

-- 10)Find the distribution of restaurant ratings (e.g., how many restaurants have a rating of 1.0, 1.5, 2.0, etc.), and show the cumulative percentage of each rating.
		
        SELECT rating, 
        COUNT(*) AS rating_count,
        COUNT(*)*100.0/SUM(COUNT(*)) OVER() AS commulative_percentage
        FROM ind_restaurants
        GROUP BY rating
        ORDER BY rating;


-- 11) Calculate the average number of votes received by restaurants offering "Italian" cuisine in each city, and rank the cities by average number of votes.
		 
         SELECT 	city, 
		AVG(votes) AS average_votes,
		RANK() OVER (ORDER BY AVG(votes) DESC) AS rank_by_votes
		FROM ind_restaurants
		WHERE cuisine LIKE '%Italian%'
		GROUP BY city;
        
        
-- 12)Find the median cost for two people in each city, and show how it compares to the average cost for two people.
		
        SELECT city, AVG(cost) as avg_cost,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY cost) AS median_cost
        FROM ind_restaurants
        GROUP BY city;
        
	
-- 13)List the names and locations of the top 5 most frequently reviewed restaurants in each city, and their average rating.

		WITH cte as (
			SELECT name , location , city , rating ,
            ROW_NUMBER() OVER(PARTITION BY CITY ORDER BY VOTES DESC) AS rank_in_city
            FROM ind_restaurants)
		
        SELECT name , location , city , rating
        FROM cte
        WHERE rank_in_city <= 5;
	
    
    -- 14)Determine the number of restaurants that have both "North Indian" and "South Indian" cuisines and analyze their average rating compared to other cuisines.
		
			SELECT COUNT(*) AS north_and_south_indian_count,
			AVG(rating) AS avg_rating_north_and_south
			FROM ind_restaurants
			WHERE cuisine LIKE '%North Indian%' AND cuisine LIKE '%South Indian%';

			SELECT AVG(rating) AS avg_rating_other_cuisines
			FROM ind_restaurants
			WHERE cuisine NOT LIKE '%North Indian%' OR cuisine NOT LIKE '%South Indian%';


-- 15)Calculate the average rating difference between the top 10% highest-rated restaurants and the bottom 10% lowest-rated restaurants in each city.

SELECT city,
	AVG(CASE WHEN percentile_rank <= 10/100 THEN rating END) AS avg_top_10_rating,
    AVG(CASE WHEN percentile_rank >= 90/100 THEN rating END) AS avg_bottom_10_rating,
    AVG(CASE WHEN percentile_rank <= 10/100 THEN rating END) - AVG(CASE WHEN percentile_rank >= 90/100 THEN rating END) AS rating_difference
FROM (
		SELECT city , rating ,
        PERCENT_RANK() OVER (PARTITION BY city ORDER BY rating DESC) AS percentile_rank
        FROM ind_restaurants ) AS rating_percentiles
GROUP BY city;


-- 16)Rank the restaurants within each city by their rating, and list the top 3 in each city.

		WITH cte as(
				SELECT name, location , city , rating,
                ROW_NUMBER() OVER (PARTITION BY city ORDER BY rating DESC) AS ranking
                FROM ind_restaurants)
		
        SELECT name, location , city , rating
        FROM cte
        where ranking <= 3;


-- 17) Find restaurants with the highest cost for two people in each city, but only include restaurants with more than 200 votes.

		SELECT name, location ,city , cost , votes
        FROM ind_restaurants r1
        WHERE votes>200
        AND cost =(
			SELECT MAX(cost)
            FROM ind_restaurants r2
            WHERE r2.city = r1.city AND r2.votes > 200)
            ORDER BY city;
            


































