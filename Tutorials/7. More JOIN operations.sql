#More JOIN operations
#====================


#1. 1962 movies
#--------------
SELECT id, title
FROM movie
WHERE yr = 1962;


#2. When was Citizen Kane released?
#----------------------------------
SELECT yr
FROM movie
WHERE title = 'Citizen Kane';


#3. Star Trek movies
#-------------------
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;


#4. id for actor Glenn Close
#---------------------------
SELECT id
FROM actor
WHERE name = 'Glenn Close';


#5. id for Casablanca
#--------------------
SELECT id
FROM movie
WHERE title = 'Casablanca';


#6. Cast list for Casablanca
#---------------------------
SELECT a.name
FROM movie m, casting c, actor a
WHERE m.id = c.movieid AND c.actorid = a.id AND m.title = 'Casablanca';


#7. Alien cast list
#------------------
SELECT a.name
FROM movie m, casting c, actor a
WHERE m.id = c.movieid AND c.actorid = a.id AND m.title = 'Alien';


#8. Harrison Ford movies
#-----------------------
SELECT m.title
FROM movie m, casting c, actor a
WHERE m.id = c.movieid AND c.actorid = a.id AND a.name = 'Harrison Ford';


#9. Harrison Ford as a supporting actor
#--------------------------------------
SELECT m.title
FROM movie m, casting c, actor a
WHERE m.id = c.movieid AND c.actorid = a.id AND a.name = 'Harrison Ford' AND c.ord <> 1;


#10. Lead actors in 1962 movies
#------------------------------
SELECT m.title, a.name
FROM movie m, casting c, actor a
WHERE m.id = c.movieid AND c.actorid = a.id AND m.yr = 1962 AND c.ord = 1;


#11. Busy years for John Travolta
#--------------------------------
SELECT m.yr, COUNT(m.title)
FROM movie m, casting c, actor a
WHERE m.id = c.movieid AND c.actorid = a.id AND a.name = 'John Travolta'
GROUP BY m.yr
HAVING COUNT(m.title) = (SELECT MAX(c)
                         FROM (SELECT m.yr, COUNT(m.title) AS c
                               FROM movie m, casting c, actor a
                               WHERE m.id = c.movieid AND c.actorid = a.id AND a.name = 'John Travolta'
                               GROUP BY m.yr) AS t);


#12. Lead actor in Julie Andrews movies
#--------------------------------------
SELECT DISTINCT m2.title, a2.name
FROM movie m1, movie m2, actor a1, actor a2, casting c1, casting c2
WHERE m1.id = c1.movieid AND c1.actorid = a1.id AND m2.id = c2.movieid AND c2.actorid = a2.id AND a1.name = 'Julie Andrews' AND m1.id = m2.id AND c2.ord = 1;


#13. Actors with 30 leading roles
#--------------------------------
SELECT name
FROM casting, actor
WHERE actorid = id AND ord = 1
GROUP BY name
HAVING COUNT(*) >= 30
ORDER BY name;


#14. List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
#--------------------------------------------------------------------------------------------------------
SELECT title, COUNT(actorid)
FROM movie, casting
WHERE id = movieid AND yr = 1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title;


#15. List all the people who have worked with 'Art Garfunkel'.
#-------------------------------------------------------------
SELECT DISTINCT a1.name
FROM movie m, casting c, actor a, casting c1, actor a1
WHERE m.id = c.movieid AND c.actorid = a.id AND c1.actorid = a1.id AND (a.name = 'Art Garfunkel' OR m.director = 'Art Garfunkel') AND c.movieid = c1.movieid AND a1.name <> 'Art Garfunkel';

#Note: We use DISTINCT because someone might have worked with 'Art Garfunkel' more than once in the past.