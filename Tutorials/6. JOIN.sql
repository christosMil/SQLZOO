-- JOIN
-- ====


-- 1. The first example shows the goal scored by a player with the last name 'Bender'.
--    The * says to list all the columns in the table - a shorter way of saying matchid,
--    teamid, player, gtime. Modify it to show the matchid and player name for all goals
--    scored by Germany. To identify German players, check for: teamid = 'GER'
-- -------------------------------------------------------------------------------------
SELECT matchid, player
FROM goal 
WHERE teamid = 'GER';


-- 2. Show id, stadium, team1, team2 for just game 1012
-- ----------------------------------------------------
SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012;


-- 3. You can combine the two steps into a single query with a JOIN. The code below shows
--    the player (from the goal) and stadium name (from the game table) for every goal
--    scored. Modify it to show the player, teamid, stadium and mdate for every German goal.
-- -----------------------------------------------------------------------------------------
SELECT player, teamid, stadium, mdate
FROM game, goal
WHERE id = matchid AND teamid = 'GER';


-- 4. Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
-- -------------------------------------------------------------------------------------------------------
SELECT team1, team2, player
FROM game, goal
WHERE id = matchid AND player LIKE 'Mario%';


-- 5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
-- -------------------------------------------------------------------------------------------
SELECT player, teamid, coach, gtime
FROM goal, eteam
WHERE teamid = id AND gtime <= 10;


-- 6. List the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
-- -------------------------------------------------------------------------------------------------------------
SELECT g.mdate, e.teamname
FROM game g, eteam e
WHERE g.team1 = e.id AND coach = 'Fernando Santos';


-- 7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'.
-- ----------------------------------------------------------------------------------------------------
SELECT player
FROM game, goal
WHERE id = matchid AND stadium = 'National Stadium, Warsaw';


-- 8. The example query shows all goals scored in the Germany-Greece quarterfinal.
--    Instead show the name of all players who scored a goal against Germany.
-- -------------------------------------------------------------------------------
SELECT DISTINCT player
FROM game, goal
WHERE id = matchid AND (team1 = 'GER' OR team2 = 'GER') AND teamid <> 'GER';


-- 9. Show teamname and the total number of goals scored.
-- ------------------------------------------------------
SELECT teamname, COUNT(player)
FROM goal, eteam
WHERE teamid = id
GROUP BY teamname;


-- 10. Show the stadium and the number of goals scored in each stadium.
-- --------------------------------------------------------------------
SELECT stadium, COUNT(player)
FROM game, goal
WHERE id = matchid
GROUP BY stadium;


-- 11. For every match involving 'POL', show the matchid, date and the number of goals scored.
-- -------------------------------------------------------------------------------------------
SELECT matchid, mdate, COUNT(player)
FROM game, goal
WHERE id = matchid AND (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate;


-- 12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'.
-- ---------------------------------------------------------------------------------------------------------
SELECT matchid, mdate, COUNT(player)
FROM game, goal
WHERE id = matchid AND teamid = 'GER'
GROUP BY matchid, mdate;


-- 13. List every match with the goals scored by each team as shown.
-- -----------------------------------------------------------------
SELECT mdate, team1, SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS 'score1', team2, SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS 'score2'
FROM game LEFT JOIN goal ON matchid = id
GROUP BY mdate, matchid, team1, team2;