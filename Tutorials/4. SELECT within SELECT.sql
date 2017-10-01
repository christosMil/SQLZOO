#SELECT within SELECT
#====================


#1. Bigger than Russia
#---------------------
SELECT name
FROM world
WHERE population > (SELECT population
                    FROM world
                    WHERE name = 'Russia');


#2. Richer than UK
#-----------------
SELECT name
FROM world
WHERE continent = 'Europe' AND gdp/population > (SELECT gdp/population
                                                 FROM world
                                                 WHERE name = 'United Kingdom');


#3. Neighbours of Argentina and Australia
#----------------------------------------
SELECT name, continent
FROM world
WHERE continent = (SELECT continent
                   FROM world
                   WHERE name = 'Argentina') OR continent = (SELECT continent
                                                             FROM world
                                                             WHERE name = 'Australia')
ORDER BY name;


#4. Between Canada and Poland
#----------------------------
SELECT name, population
FROM world
WHERE population > (SELECT population
                    FROM world
                    WHERE name = 'Canada') AND population < (SELECT population
                                                             FROM world
                                                             WHERE name = 'Poland');


#5. Percentages of Germany
#-------------------------
SELECT name, CONCAT(ROUND(100*population/(SELECT population FROM world WHERE name = 'Germany'), 0), '%')
FROM world
WHERE continent = 'Europe';


#6. Bigger than every country in Europe
#--------------------------------------
SELECT name
FROM world
WHERE gdp > ALL (SELECT gdp
                 FROM world
                 WHERE continent = 'Europe' AND gdp > 0);


#7. Largest in each continent
#----------------------------
SELECT continent, name, area
FROM world x
WHERE area >= ALL (SELECT area
                   FROM world y
                   WHERE y.continent = x.continent AND area > 0);


#8. First country of each continent (alphabetically)
#---------------------------------------------------
SELECT continent, name
FROM world x
WHERE name <= ALL (SELECT name
                   FROM world y
                   WHERE x.continent = y.continent);


#Difficult Questions That Utilize Techniques Not Covered In Prior Sections
#-------------------------------------------------------------------------

#9. Find the continents where all countries have a population <= 25000000. Then find the names
#   of the countries associated with these continents. Show name, continent and population.
#---------------------------------------------------------------------------------------------
SELECT name, continent, population
FROM world x
WHERE 25000000 >= ALL (SELECT population
                       FROM world y
                       WHERE x.continent = y.continent);


#10. Some countries have populations more than three times that of any of their
#    neighbours (in the same continent). Give the countries and continents.
#------------------------------------------------------------------------------
SELECT name, continent
FROM world x
WHERE population >= ALL (SELECT 3*population
                         FROM world y
                         WHERE x.continent = y.continent AND x.name != y.name);