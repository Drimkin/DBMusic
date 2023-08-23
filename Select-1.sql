SELECT name, duration
FROM track
ORDER BY duration DESC
LIMIT 1

SELECT name, duration
FROM track
WHERE duration >= '00:03:30'
ORDER BY duration DESC 

SELECT title, year 
FROM collection
WHERE year >= 2018 AND year <= 2020

SELECT nickname 
FROM musician
WHERE NOT nickname LIKE '%% %%'

SELECT name 
FROM track
WHERE name LIKE '%%my%%' OR name LIKE '%%мой%%'