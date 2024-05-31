-- Segment 3: Production Statistics and Genre Analysis

###Retrieve the unique list of genres present in the dataset.
select distinct genre from `genre (1)`;

-- it gives all the unique genres, such as Drama, Fantasy, Thriller etc.


####Identify the genre with the highest number of movies produced overall.

select genre ,count(movie_id) from `genre (1)`  group by genre  order by count(movie_id) desc;

-- Top Genre is Drama with total movies of 4285

###Determine the count of movies that belong to only one genre.

select count(*)from (select movie_id,count(genre) from `genre (1)` group by movie_id having count(genre) = 1) t;

----- 3289 movies!!


#####Calculate the average duration of movies in each genre.

select g.genre,avg(m.duration) as duration  
from `genre (1)` g 
left join movies m on g.movie_id=m.id 
group by g.genre 
order by 2 desc;

-- It gives average duration of all gneres. For Drama, it is 106.7746. For Fantasy, it is 105.1404, and so on.

####Find the rank of the 'thriller' genre among all genres in terms of the number of movies produced

select *  from (select distinct genre, count(id) as movies_produced, rank() over (order by count(id) desc) as genre_rank
from movies
left join `genre (1)` on movie_id=id
group by genre) a where genre='Thriller';

-- Rank of thriller genre is 3














