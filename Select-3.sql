SELECT a.title
FROM album a 
LEFT JOIN musicianalbum ma ON a.album_id = ma.album_id 
LEFT JOIN musician m ON m.musician_id = ma.musician_id 
LEFT JOIN genremusician gm ON m.musician_id = gm.musician_id 
LEFT JOIN genre g ON g.genre_id = gm.genre_id 
GROUP BY a.title 
HAVING count(DISTINCT g.title) > 1
ORDER BY a.title 

SELECT t.name
FROM track t 
LEFT JOIN trackcollection tc ON t.track_id = tc.track_id 
WHERE tc.track_id IS NULL 

SELECT m.nickname,t."name", t.duration 
FROM track t 
LEFT JOIN album a ON a.album_id = t.album_id 
LEFT JOIN musicianalbum ma ON ma.album_id = a.album_id 
LEFT JOIN musician m ON m.musician_id = ma.musician_id 
GROUP BY m.nickname,t."name", t.duration 
HAVING t.duration = (SELECT min(duration) FROM track)
ORDER BY m.nickname 

SELECT DISTINCT a.title
FROM album a
LEFT JOIN track t ON a.album_id = t.album_id 
WHERE t.album_id IN (
	SELECT album_id FROM track
	GROUP BY album_id
	HAVING count(album_id) = (
		SELECT count(album_id) FROM track
		GROUP BY album_id 
		ORDER BY count
		LIMIT 1
	)
)
ORDER BY a.title 