-- Lab 3, Sean Wendlandt, 9/29/2022 --


-- 1 --
SELECT name_last as lastname
FROM mlb_master INNER JOIN mlb_batting
	ON mlb_master.player_id = mlb_batting.player_id
WHERE stint = 1 AND doubles > 45;


-- 2 --
SELECT name_last as lastname
from mlb_master
WHERE player_id IN
(SELECT player_id
FROM mlb_batting 
WHERE doubles > 45
AND stint = 1);


-- NOTE: When joinging 'using' will remove duplicate column while 'on' will return the repeated rows --
-- 3 -- 
SELECT name_last as lasname, doubles
FROM mlb_master INNER JOIN mlb_batting
	ON mlb_master.player_id = mlb_batting.player_id
WHERE stint = 1 AND doubles > 45;

-- 4 --
SELECT name, wins
FROM mlb_team
WHERE wins >
(SELECT avg(wins)
FROM mlb_team)
ORDER BY wins desc;

-- 5 -- 
SELECT name_first, name_last, hit_by_pitch
FROM mlb_pitching
JOIN mlb_master
ON mlb_pitching.player_id = mlb_master.player_id
WHERE hit_by_pitch =
(SELECT max(hit_by_pitch)
FROM mlb_pitching);

-- 6 --
SELECT name_first, name_last, height, name
FROM mlb_master 
JOIN mlb_manager
ON mlb_master.player_id = mlb_manager.player_id
JOIN mlb_team
ON mlb_manager.team_id = mlb_team.team_id
WHERE height = 
(SELECT min(height)
	FROM mlb_master
    JOIN mlb_manager
	ON mlb_master.player_id = mlb_manager.player_id);

-- 7 -- 

SELECT name_first, name_last, (strikeouts / walks) as MLBB
FROM mlb_master 
JOIN mlb_pitching
ON mlb_master.player_id = mlb_pitching.player_id
WHERE (strikeouts) >= 1 AND (games) >= 25
ORDER BY MLBB desc
LIMIT 10;

SELECT name_first, name_last, SUM(strikeouts) / SUM(walks) as MLBB
FROM mlb_master 
JOIN mlb_pitching
ON mlb_master.player_id = mlb_pitching.player_id
WHERE strikeouts >= 1 AND GAMES >=25
GROUP BY mlb_pitching.player_id
ORDER BY MLBB desc
LIMIT 10;

-- 8 -- 
SELECT team_id
FROM mlb_batting
WHERE homeruns > 35
UNION
SELECT team_id
FROM mlb_batting
WHERE stolen_bases > 40;


-- 9 --
SELECT DISTINCT player_id
FROM mlb_pitching
WHERE player_id in
(select player_id
FROM mlb_batting
WHERE homeruns > 10);


-- 10 --
CREATE VIEW mlb_nmlb_nationalational AS
SELECT *
FROM mlb_team
WHERE league = 'NL';
