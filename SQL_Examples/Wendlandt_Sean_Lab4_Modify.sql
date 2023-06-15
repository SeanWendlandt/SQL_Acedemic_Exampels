-- Lab 4 Modify --

CREATE TABLE MUSIC_GENRE
(
	GENRE_ID BIGINT AUTO_INCREMENT PRIMARY KEY,
	GENRE_NAME VARCHAR(25)
);


INSERT INTO MUSIC_GENRE (GENRE_NAME)
(SELECT GENRE_NAME FROM MUSIC_ARTIST);

SELECT * FROM MUSIC_GENRE;

ALTER TABLE MUSIC_ARTIST
ADD column GENRE_ID BIGINT;

ALTER TABLE MUSIC_ARTIST
ADD foreign key (GENRE_ID) REFERENCES MUSIC_GENRE(GENRE_ID);

UPDATE MUSIC_ARTIST art
JOIN MUSIC_GENRE gen
ON art.GENRE_NAME = gen.GENRE_NAME 
SET art.GENRE_ID = gen.GENRE_ID;

SELECT * FROM MUSIC_ARTIST;


-- Delete lil wayne --
DELETE FROM MUSIC_ALBUM WHERE ARTIST_ID = 4; -- Use nested query --
DELETE FROM MUSIC_ARTIST WHERE ARTIST_NAME = "Lil' Wayne";

SELECT * FROM MUSIC_ALBUM;
SELECT * FROM MUSIC_ARTIST;