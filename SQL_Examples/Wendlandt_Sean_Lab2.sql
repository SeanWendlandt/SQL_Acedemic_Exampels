-- Lab 2, Sean Wendlandt, Databases1 --

-- 1 --
SELECT name_first, name_last, shut_outs
FROM mlb_master INNER JOIN mlb_pitching
	ON mlb_master.player_id = mlb_pitching.player_id
WHERE shut_outs > 0
ORDER BY shut_outs desc, name_last asc;

-- 2 --
SELECT name_first, name_last, ((homeruns*4)+(triples*3)+(doubles*2)+(hits-(triples+doubles+homeruns))) as "total bases"
FROM mlb_master INNER JOIN mlb_batting
	ON mlb_master.player_id = mlb_batting.player_id
WHERE name_last = 'Smith';


-- NOTE: When joinging 'using' will remove duplicate column while 'on' will return the repeated rows --
SELECT *
from mlb_master
join mlb_batting using (player_id)
where name_last = 'Smith';



-- 3 -- 
SELECT name, name_first, name_last
FROM mlb_team INNER JOIN mlb_manager
	ON mlb_team.team_id = mlb_manager.team_id
    INNER JOIN mlb_master
    ON mlb_manager.player_id = mlb_master.player_id
WHERE league = 'NL' AND division = 'C';

-- 4 --
SELECT throws, count(throws), count(distinct(mlb_pitching.player_id))
FROM mlb_pitching INNER JOIN mlb_master
	ON mlb_pitching.player_id = mlb_master.player_id
group by throws;

-- 5 -- 
SELECT name, avg(weight)
FROM mlb_pitching
JOIN mlb_master
ON mlb_pitching.player_id = mlb_master.player_id
JOIN mlb_team
ON mlb_pitching.team_id = mlb_team.team_id
GROUP BY mlb_team.team_id, mlb_team.name
ORDER BY avg(weight) desc;

-- 6 --
SELECT name_first, name_last, height, name
FROM mlb_master 
JOIN mlb_manager
ON mlb_master.player_id = mlb_manager.player_id
JOIN mlb_team
ON mlb_manager.team_id = mlb_team.team_id
WHERE height < 70;

-- 7 -- 
SELECT mlb_pitching.player_id, name_first, name_last, (sum(outs_pitched)/3) as "Total Innings Pitched" --
FROM mlb_pitching
JOIN mlb_master
ON mlb_pitching.player_id = mlb_master.player_id
GROUP BY mlb_pitching.player_id
HAVING count(stint) > 1
ORDER BY (sum(outs_pitched)/3) desc;

-- 8 -- 
SELECT concat(name_first,' ', name_last) as fullname, (wild_pitches) as "Wild Pitches"
FROM mlb_pitching
JOIN mlb_master
ON mlb_pitching.player_id = mlb_master.player_id
WHERE wild_pitches >= 13
AND outs_pitched >= 500
ORDER BY wild_pitches desc;

-- 9 --
SELECT name_last, (mlb_batting.hits / mlb_batting.at_bats) as "Batting Avg", (outs_pitched / 3) as "Innings Pitched"
FROM mlb_master
LEFT JOIN mlb_pitching
ON mlb_master.player_id = mlb_pitching.player_id 
JOIN mlb_batting
ON mlb_master.player_id = mlb_batting.player_id
WHERE name_last LIKE "Z%";
