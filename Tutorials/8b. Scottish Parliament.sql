#Scottish Parliament
#===================


#1. One MSP was kicked out of the Labour party and has no party. Find him.
#-------------------------------------------------------------------------
SELECT name
FROM msp
WHERE party IS NULL;


#2. Obtain a list of all parties and leaders.
#--------------------------------------------
SELECT name, leader
FROM party;


#3. Give the party and the leader for the parties which have leaders.
#--------------------------------------------------------------------
SELECT name, leader
FROM party
WHERE leader IS NOT NULL;


#4. Obtain a list of all parties which have at least one MSP.
#------------------------------------------------------------
SELECT p.name
FROM msp m, party p
WHERE m.party = p.code
GROUP BY p.name
HAVING COUNT(m.name) > 0;


#5. Obtain a list of all MSPs by name, give the name of the MSP and the name of the party where available.
#Be sure that Canavan MSP, Dennis is in the list. Use ORDER BY msp.name to sort your output by MSP.
#---------------------------------------------------------------------------------------------------------
SELECT m.name, p.name
FROM msp m LEFT JOIN party p ON m.party = p.code;


#6. Obtain a list of parties which have MSPs, include the number of MSPs.
#------------------------------------------------------------------------
SELECT p.name, COUNT(m.name)
FROM msp m, party p
WHERE m.party = p.code
GROUP BY p.name;


#7. A list of parties with the number of MSPs; include parties with no MSPs.
#---------------------------------------------------------------------------
SELECT p.name, COUNT(m.name)
FROM msp m RIGHT JOIN party p ON m.party = p.code
GROUP BY p.name;