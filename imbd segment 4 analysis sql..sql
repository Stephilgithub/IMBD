-- Segment 4: Ratings Analysis and Crew Members

####Retrieve the minimum and maximum values in each column of the ratings table (except movie_id).

select max(avg_rating) as max_rating ,
min(avg_rating) as min_rating,
max(median_rating) as max_median_rating,
min(median_rating) as min_median_rating ,
max(total_votes) as max_vote,
min(total_votes) as min_votes
from ratings ;

-- minimum_rating=1, maximum_rating=10
-- minimum_votes=100, maximum_votes=725138
-- minimum_median_rating=1, maximum_median_ratings=10

###Identify the top 10 movies based on average rating.

select * from (select title,avg_rating as average_rating, 
row_number() over (order by avg_rating desc) as ranks
 from movies
left join ratings on movie_id=id) a where ranks<=10;

-- It gives a list of top 10 movies along with their average_rating. 
-- Love in Kilnerry is ranked 1 with average rating of 10, android kunkappan  is ranked 2 and so on.

###Summarise the ratings table based on movie counts by median ratings
select median_rating , count(movie_id) as movie_count
from ratings
group by median_rating
order by median_rating;

-- It gives movie count for each median rating. For 1, the movie count is 94. For 2, the movie count is 119 and so on.

#####Identify the production house that has produced the most number of hit movies (average rating > 8).


select m.production_company,count(id) as no_of_hits, rank() over(order by count(id) ) as ent  from movies m 
inner join ratings r on m.id=r.movie_id 
where avg_rating > 8 and production_company is not null
group by  production_company
order by  no_of_hits desc ;

###Determine the number of movies released in each genre during March 2017 in the USA with more than 1,000 votes.

select genre,count(g.movie_id) as no_of_movie
from `genre (1)` g 
inner join movies m on g.movie_id=m.id
inner join  ratings r on r.movie_id= g.movie_id
where year = 2017 and month(date_published) = 3 and country = 'USA' and total_votes > 1000
group by genre 
order by no_of_movie desc;

-- It gives a list of genres along with their movie_count in 2017 March for USA.
-- It is 16 in Drama, 8 in Comedy and so on.

####etrieve movies of each genre starting with the word 'The' and having an average rating > 8.

select genre ,title,avg_rating as no_of_movie
from `genre (1)` as g
inner join movies m on m.id=g.movie_id 
inner join ratings r on r.movie_id=g.movie_id
where title like 'The%' and avg_rating > 8 
ORDER BY genre;

-- it gives a list of all the movies starting with 'The' along with their genres. 
--  The irishman belongs to crime and so on.