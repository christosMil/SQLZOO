#Music Tutorial
#==============


#1. Find the title and artist who recorded the song 'Alison'.
#------------------------------------------------------------
SELECT title, artist
FROM album, track
WHERE asin = album AND song = 'Alison';


#2. Which artist recorded the song 'Exodus'?
#-------------------------------------------
SELECT artist
FROM album, track
WHERE asin = album AND song = 'Exodus';


#3. Show the song for each track on the album 'Blur'.
#----------------------------------------------------
SELECT song
FROM album, track
WHERE asin = album AND title = 'Blur';


#4. For each album show the title and the total number of track.
#---------------------------------------------------------------
SELECT title, COUNT(song)
FROM album, track
WHERE asin = album
GROUP BY title;


#5. For each album show the title and the total number of tracks containing the word 'Heart' (albums with no such tracks need not be shown).
#-------------------------------------------------------------------------------------------------------------------------------------------
SELECT title, COUNT(song)
FROM album, track
WHERE asin = album AND song LIKE '%Heart%'
GROUP BY title;


#6. A "title track" is where the song is the same as the title. Find the title tracks.
#-------------------------------------------------------------------------------------
SELECT song
FROM album, track
WHERE asin = album AND title = song;


#7. An "eponymous" album is one where the title is the same as the artist (for example the album 'Blur' by the band 'Blur'). Show the eponymous albums.
#------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT DISTINCT title
FROM album
WHERE title = artist;


#8. Find the songs that appear on more than 2 albums. Include a count of the number of times each shows up.
#----------------------------------------------------------------------------------------------------------
SELECT song, COUNT(DISTINCT album)
FROM track
GROUP BY song
HAVING COUNT(DISTINCT album) > 2;


#9. A "good value" album is one where the price per track is less than 50 pence. Find the good value album - show the title, the price and the number of tracks.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT title, price, COUNT(song)
FROM album, track
WHERE asin = album
GROUP BY title, price
HAVING price/COUNT(song) < 0.50;


#10. List albums so that the album with the most tracks is first. Show the title and the number of tracks.
#---------------------------------------------------------------------------------------------------------
SELECT title, COUNT(song)
FROM album, track
WHERE asin = album
GROUP BY title
ORDER BY COUNT(song) DESC, title ASC;

#Alternate solution:
SELECT title, COUNT(asin)
FROM album, track
WHERE asin = album
GROUP BY title
ORDER BY COUNT(asin) DESC, title ASC;
