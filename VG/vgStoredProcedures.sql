-- Matt Krzewinski and Sean Wendlandt --

-- DROPPING PROCEDURES --
DROP PROCEDURE IF EXISTS gameProfitByRegion;
DROP PROCEDURE IF EXISTS genreRankingByRegion;
DROP PROCEDURE IF EXISTS publishedReleases;
DROP PROCEDURE IF EXISTS addNewRelease;

-- gameProfitByRegion stored procedure --
delimiter //
CREATE PROCEDURE gameProfitByRegion(IN MINPROFIT BIGINT, IN REGION VARCHAR(2))
BEGIN
	 IF REGION = 'NA' THEN
		SELECT vg_name, sum(na_sales) as NA_PROFIT
        FROM vg_video_game vg
        JOIN vg_info info
        ON vg.game_id = info.game_id
        GROUP BY vg.game_id
        HAVING sum(na_sales) > MINPROFIT;
	 ELSEIF REGION = 'EU' THEN
		SELECT vg_name, sum(eu_sales) as EU_PROFIT
        FROM vg_video_game vg
        JOIN vg_info info
        ON vg.game_id = info.game_id
        GROUP BY vg.game_id
        HAVING sum(eu_sales) > MINPROFIT;
	 ELSEIF REGION = 'JP' THEN
		SELECT vg_name, sum(jp_sales) as JP_PROFIT
        FROM vg_video_game vg
        JOIN vg_info info
        ON vg.game_id = info.game_id
        GROUP BY vg.game_id
        HAVING sum(jp_sales) > MINPROFIT;
	ELSEIF REGION = 'WD' THEN
		SELECT vg_name, (sum(jp_sales) + sum(na_sales) + sum(eu_sales) + sum(other_sales)) as WD_PROFIT
        FROM vg_video_game vg
        JOIN vg_info info
        ON vg.game_id = info.game_id
        GROUP BY vg.game_id
        HAVING (sum(jp_sales) + sum(na_sales) + sum(eu_sales) + sum(other_sales)) > MINPROFIT;
     END IF;
END //
delimiter ;

-- genreRankingByRegion stored procedure --
delimiter //
CREATE PROCEDURE genreRankingByRegion(IN GENRE VARCHAR(12), IN REGION VARCHAR(2))
BEGIN
	 IF REGION = 'NA' THEN
		SELECT ranking
		FROM 
		(SELECT genre_name, rank() over (ORDER BY sum(na_sales) DESC) as ranking
		FROM vg_video_game vg
		JOIN vg_genre g
		ON vg.genre_id = g.genre_id
		JOIN vg_info info
		ON vg.game_id = info.game_id
		GROUP BY g.genre_id) t
		WHERE genre_name = GENRE;
	 ELSEIF REGION = 'EU' THEN
		SELECT ranking
		FROM 
		(SELECT genre_name, rank() over (ORDER BY sum(eu_sales) DESC) as ranking
		FROM vg_video_game vg
		JOIN vg_genre g
		ON vg.genre_id = g.genre_id
		JOIN vg_info info
		ON vg.game_id = info.game_id
		GROUP BY g.genre_id) t
		WHERE genre_name = GENRE;	 
	 ELSEIF REGION = 'JP' THEN
		SELECT ranking
		FROM 
		(SELECT genre_name, rank() over (ORDER BY sum(jp_sales) DESC) as ranking
		FROM vg_video_game vg
		JOIN vg_genre g
		ON vg.genre_id = g.genre_id
		JOIN vg_info info
		ON vg.game_id = info.game_id
		GROUP BY g.genre_id) t
		WHERE genre_name = GENRE;
	 ELSEIF REGION = 'WD' THEN
		SELECT ranking
		FROM 
		(SELECT genre_name, rank() over (ORDER BY (sum(jp_sales) + sum(na_sales) + sum(eu_sales) + sum(other_sales)) DESC) as ranking
		FROM vg_video_game vg
		JOIN vg_genre g
		ON vg.genre_id = g.genre_id
		JOIN vg_info info
		ON vg.game_id = info.game_id
		GROUP BY g.genre_id) t
		WHERE genre_name = GENRE;
     END IF;
END //
delimiter ;

-- publishedReleases stored procedure --
delimiter //
CREATE PROCEDURE publishedReleases(IN PUB_NAME VARCHAR(38), IN GENRE VARCHAR(12))
BEGIN
	 SELECT COUNT(DISTINCT vg.game_id) AS NUM_RELEASES
		FROM vg_video_game vg
		JOIN vg_genre g
		ON vg.genre_id = g.genre_id
		JOIN vg_info info
		ON vg.game_id = info.game_id
		JOIN vg_publisher pub
		ON info.publisher_id = pub.publisher_id
		WHERE g.genre_name = GENRE AND pub.publisher_name = PUB_NAME;
END //
delimiter ;	

-- addNewRelease stored procedure --
delimiter //
CREATE PROCEDURE addNewRelease(IN GAME VARCHAR(132), IN PLATFORM VARCHAR(4), IN GENRE VARCHAR(12), IN PUBLISHER VARCHAR(38))
BEGIN
	 DECLARE return_statement VARCHAR(30) DEFAULT 'new data was added';
     DECLARE genre_exists INT DEFAULT 0;
     DECLARE publisher_exists INT DEFAULT 0;
     DECLARE platform_exists INT DEFAULT 0;
     DECLARE game_exists INT DEFAULT 0;
     IF (SELECT EXISTS(SELECT genre_name FROM vg_genre WHERE genre_name = GENRE) = 1) THEN
		SET genre_exists = 1;
     END IF;
     IF genre_exists = 0 THEN
		INSERT INTO vg_genre (genre_name) VALUES (GENRE);
	 END IF;
     
     
	 IF (SELECT EXISTS(SELECT publisher_name FROM vg_publisher WHERE publisher_name = PUBLISHER) = 1) THEN
		SET publisher_exists = 1;
     END IF;
     IF publisher_exists = 0 THEN
		INSERT INTO vg_publisher (publisher_name) VALUES (PUBLISHER);
	 END IF;
     
	 IF (SELECT EXISTS(SELECT platform_name FROM vg_platform WHERE platform_name = PLATFORM) = 1) THEN
		SET platform_exists = 1;
     END IF;
     IF platform_exists = 0 THEN
		INSERT INTO vg_platform (platform_name) VALUES (PLATFORM);
	 END IF;
     
	 IF (SELECT EXISTS(SELECT vg_name FROM vg_video_game WHERE vg_name = GAME) = 1) THEN
		SET game_exists = 1;
     END IF;
     IF game_exists = 0 THEN
		INSERT INTO vg_video_game (vg_name, genre_id) VALUES (GAME, (SELECT genre_id FROM vg_genre WHERE genre_name = GENRE));
	 END IF;
     
	INSERT INTO VG_INFO (GAME_ID, PUBLISHER_ID, PLATFORM_ID) VALUES
	((SELECT game_id FROM vg_video_game WHERE vg_name = GAME),
    (SELECT publisher_id FROM vg_publisher WHERE publisher_name = PUBLISHER),
    (SELECT platform_id FROM vg_platform WHERE platform_name = PLATFORM));
    
    SELECT return_statement;
END //
delimiter ;	
