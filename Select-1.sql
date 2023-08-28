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
WHERE name ILIKE 'My %' 
OR name ILIKE '% my %'
OR name ILIKE 'My'
OR name ILIKE '% my'
OR name ILIKE 'Мой'
OR name ILIKE 'Мой %'
OR name ILIKE '% мой %'
OR name ILIKE '% мой'

SELECT name
FROM track
WHERE string_to_array(lower(name), ' ') && ARRAY['My', 'my', 'Мой', 'мой'] 