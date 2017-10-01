#Nobel Prizes: Aggregate functions
#=================================


#1. Show the total number of prizes awarded
#------------------------------------------
SELECT COUNT(winner)
FROM nobel;


#2. List each subject - just once
#--------------------------------
SELECT DISTINCT subject
FROM nobel;


#3. Show the total number of prizes awarded for Physics
#------------------------------------------------------
SELECT COUNT(yr)
FROM nobel
WHERE subject = 'Physics';


#4. For each subject show the subject and the number of prizes
#-------------------------------------------------------------
SELECT subject, COUNT(yr)
FROM nobel
GROUP BY subject;


#5. For each subject show the first year that the prize was awarded
#------------------------------------------------------------------
SELECT subject, MIN(yr)
FROM nobel
GROUP BY subject;


#6. For each subject show the number of prizes awarded in the year 2000
#----------------------------------------------------------------------
SELECT subject, COUNT(winner)
FROM nobel
WHERE yr = 2000
GROUP BY subject;


#7. Show the number of different winners for each subject
#--------------------------------------------------------
SELECT subject, COUNT(DISTINCT winner)
FROM nobel
GROUP BY subject;


#8. For each subject show how many years have had prizes awarded
#---------------------------------------------------------------
SELECT subject, COUNT(DISTINCT yr)
FROM nobel
GROUP BY subject;


#9. Show the years in which three prizes were given for Physics
#--------------------------------------------------------------
SELECT yr
FROM nobel
WHERE subject = 'Physics'
GROUP BY yr
HAVING COUNT(winner) = 3;


#10. Show winners who have won more than once
#--------------------------------------------
SELECT winner
FROM nobel
GROUP BY winner
HAVING COUNT(DISTINCT yr) > 1 OR COUNT(DISTINCT subject) > 1;

#Note: One laureate might have won 2 nobel prizes in different fields in the same year.
#      (Although that has never happened till today - in fact only two persons have won
#      nobel prizes in multiple categories (both did it in different years): 1. Marie
#      Curie shared the award with her husband Pierre Curie and Antoine Henri Becquerel
#      in Physics in 1903 and won the Chemistry nobel in 1911, 2. Linus Pauling won the
#      Chemistry nobel in 1954 and the Peace nobel in 1962.)


#11. Show winners who have won more than one subject
#---------------------------------------------------
SELECT winner
FROM nobel
GROUP BY winner
HAVING COUNT(DISTINCT subject) > 1;


#12. Show the year and subject where 3 prizes were given. Show only years 2000 onwards
#-------------------------------------------------------------------------------------
SELECT yr, subject
FROM nobel
WHERE yr >= 2000
GROUP BY yr, subject
HAVING COUNT(DISTINCT winner) = 3;