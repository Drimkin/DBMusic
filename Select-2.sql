SELECT  g.title, count(m.nickname)
FROM genre g
LEFT JOIN genremusician gm ON g.genre_id = gm.genre_id
LEFT JOIN musician m ON gm.musician_id = m.musician_id 
GROUP BY g.title
ORDER BY count(m.musician_id) DESC

SELECT t.name, a.year
FROM album a
LEFT JOIN track t ON t.album_id = a.album_id
WHERE (a.year >= 2019) AND (a.year <= 2020)

SELECT a.title, avg(t.duration)
FROM album a
LEFT JOIN track t ON t.album_id = a.album_id 
GROUP BY a.title 
ORDER BY AVG(t.duration)

SELECT DISTINCT m.nickname
FROM musician m
WHERE m.nickname NOT IN (
	SELECT DISTINCT m.nickname
	FROM musician m
	LEFT JOIN musicianalbum ma ON m.musician_id = ma.musician_id
	LEFT JOIN album a ON a.album_id = ma.album_id
	WHERE a.YEAR = 2020)
ORDER BY m.nickname 

SELECT DISTINCT c.title
FROM collection c 
LEFT JOIN trackcollection tc ON c.collection_id = tc.collection_id 
LEFT JOIN track t ON t.track_id = tc.track_id 
LEFT JOIN album a ON a.album_id = t.album_id 
LEFT JOIN musicianalbum ma ON ma.album_id = a.album_id 
LEFT JOIN musician m ON m.musician_id = ma.musician_id 
WHERE m.nickname LIKE '%%Пелагея%%'
ORDER BY c.title 