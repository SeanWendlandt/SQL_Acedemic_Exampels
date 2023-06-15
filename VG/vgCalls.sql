-- Matt Krzewinski and Sean Wendlandt --

-- Calls to game profit by region --
call gameProfitByRegion(35, 'WD'); 
-- # vg_name, WD_PROFIT --
-- Wii Sports	82.74000000000001 --
-- Super Mario Bros.	45.31 --
-- Mario Kart Wii	35.830000000000005 --
-- Tetris	35.839999999999996 --
-- Grand Theft Auto V	55.92 --


call gameProfitByRegion(12, 'EU'); 
-- vg_name, EU_PROFIT --
-- Wii Sports	29.02 --
-- Mario Kart Wii	12.88 --
-- Grand Theft Auto V	23.04 --
-- FIFA 15	12.4 --

call gameProfitByRegion(10, 'JP'); 
-- vg_name	JP_PROFIT --
-- Pokemon Red/Pokemon Blue	10.22 --


-- Calls to genre ranking by region --
call genreRankingByRegion('Sports', 'WD'); 
-- 2 --
call genreRankingByRegion('Role-playing', 'NA'); 
-- 7 --
call genreRankingByRegion('Role-playing', 'JP');
-- 1 -- 

-- Calls to published releases 
call publishedReleases('Electronic Arts', 'Sports'); 
-- 212 --
call publishedReleases('Electronic Arts', 'Action'); 
-- 63 --


-- Calls to add new release  --
call addNewRelease('Foo Attacks', 'X360', 'Strategy', 'Stevenson Studios'); 


-- Select statements to check if everything was added correctly --
SELECT *
FROM vg_video_game
WHERE vg_name = 'Foo Attacks';
-- GAME_ID	VG_NAME	GENRE_ID --
-- 16384	Foo Attacks	12 --


SELECT * 
FROM VG_PLATFORM
WHERE platform_name = 'X360';
-- PLATFORM_ID	PLATFORM_NAME --
-- 5	X360 --


SELECT *
FROM vg_genre
WHERE genre_name = 'Strategy';
-- GENRE_ID	GENRE_NAME --
-- 12	Strategy --


SELECT *
FROM vg_publisher
WHERE publisher_name = 'Stevenson Studios';
-- PUBLISHER_ID	PUBLISHER_NAME --
-- 1024	Stevenson Studios --


SELECT *
FROM vg_info
WHERE game_id = (SELECT game_id
FROM vg_video_game
WHERE vg_name = 'Foo Attacks');
-- RELEASE_ID	YEAR	NA_SALES	EU_SALES	JP_SALES	OTHER_SALES	GAME_ID	PUBLISHER_ID	PLATFORM_ID --
-- 32768																16384		1024			5 --

