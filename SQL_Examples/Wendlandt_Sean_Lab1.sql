-- 1 --
SELECT team_id, league, division, name
FROM mlb_team;

-- 2 --
SELECT MAX(complete_games) as "MOST_CGS"
FROM mlb_pitching;

-- 3 --
SELECT COUNT(debut) AS "NUM_CALLUPS"
FROM mlb_master
WHERE debut BETWEEN "2014-09-10" AND "2014-09-30";

-- 4 --
SELECT MAX(DATEDIFF(final_game, debut)) as "NUM_DAYS"
FROM mlb_master;

-- 5 --
SELECT avg(opp_batting_avg) as "AVG_OPP_BATTING_AVG"
FROM mlb_pitching
WHERE games >= 25;

-- 6 --
SELECT MAX(attendance) AS "MOST_POPULAR",
MIN(attendance) AS "LEAST_POPULAR",
MAX(attendance)-MIN(attendance) AS "DIFFERENCE"
FROM mlb_team;

-- 7 --
-- not right --
SELECT park AS "PARK"
FROM mlb_team
WHERE lower(park) LIKE "%park%" OR lower(park) LIKE "%field%" OR lower(park) LIKE "%stadium%"
ORDER BY park;

-- 8 --
SELECT COUNT(stint)
FROM mlb_manager
WHERE stint >= 2;

-- 9 --
SELECT MAX((stolen_bases)/(stolen_bases+caught_stealing)) as "SB_PERCENTAGE"
FROM mlb_batting
WHERE (stolen_bases+caught_stealing) > 20;
-- NOTE: multiple stints where combined number doesn't reach 20 not counted. Because of this there is a better way to cound, not covered yet--
-- but probably covered by GROUP BY functionality which would combine stints and then remeasure the metric. --
-- EX: somthing like this --
SELECT player_id, sum(caught_stealing) as caught, sum(stolen_bases) as stolen, (sum(stint))
FROM mlb_batting
GROUP BY player_id
HAVING (stolen + caught) >= 20;




-- 10 --
SELECT name AS "NAME", league AS "LEAGUE", won_ws AS "WON_WS", won_lg AS "WON_LG", won_div as "WON_DIV", won_wc AS "WON_WC"
FROM mlb_team
WHERE won_div = 'y' OR won_wc = 'y'
ORDER BY won_ws DESC, won_lg DESC, won_div DESC, won_wc DESC, name;