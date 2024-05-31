##Segment 1: Database - Tables, Columns, Relationships

-- 1. What are the different tables in the database and how are they connected to each other in the database?

-- There are 6 tables, named as movies, genre(1), ratings, names, director_mapping, role_mapping
-- In this movies and genre(1) have many-to-many relationship on movie.id and genre.movie_id
-- Movies and role_mapping are in one-to-many relationship on movie.id and role_mapping.movie_id
-- Movies and ratings are in many-to-many relationship on movie.id and ratings.movie_id
-- Movies and director_mapping are in one-to-many relationship on movie.id and director_mapping.movie_id
-- Names and role_mapping are in one-to-many relationship on names.id and role_mapping.name_id
-- Names and director_mapping are in one-to-many relationship on names.id and director_mapping.name_id

####Find the total number of rows in each table of the schema.
select count(*)from`genre (1)`;  -- 14662
select count(*)from movies ; -- 7997
select count(*)from names ; -- 4260
select count(*)from ratings; --  7997
select count(*)from role_mapping ; -- 172 

###Identify which columns in the movie table have null values
select sum(case when id is null then 1 else 0 end) as id_nulls,
sum(case when title is null then 1 else 0 end) as title_nulls,
sum(case when year is null then 1 else 0 end) as year_nulls,
sum(case when date_published is null then 1 else 0 end) as date_published_nulls,
sum(case when duration is null then 1 else 0 end) as duration_nulls,
sum(case when country is null then 1 else 0 end) as country_nulls,
sum(case when worlwide_gross_income is null then 1 else 0 end) as worlwide_gross_income_nulls,
sum(case when languages is null then 1 else 0 end) as languages_nulls,
sum(case when production_company is null then 1 else 0 end) as production_company_nulls
from movies;

-- country, worlwide_gross_income, languages, production_company columns contains nullsmovies