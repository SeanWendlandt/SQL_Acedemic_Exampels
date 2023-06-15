-- Lab 4 Create --

CREATE TABLE MUSIC_ARTIST
(
	ARTIST_ID BIGINT AUTO_INCREMENT PRIMARY KEY,
	ARTIST_NAME VARCHAR(100),
    ORGIN_CITY VARCHAR(50),
    GENRE_NAME VARCHAR(7)
);

CREATE TABLE MUSIC_LABEL
(
	LABEL_ID BIGINT AUTO_INCREMENT PRIMARY KEY,
	LABEL_NAME VARCHAR(75) UNIQUE
);

CREATE TABLE MUSIC_FORMAT
(
	FORMAT_ID CHAR(1) PRIMARY KEY, 
    FORMAT_NAME VARCHAR(50)
);

CREATE TABLE MUSIC_ALBUM
(
	ALBUM_ID BIGINT AUTO_INCREMENT PRIMARY KEY,
	ALBUM_NAME VARCHAR(100),
    ARTIST_ID BIGINT,
    RELEASE_DATE DATE,
    RECORDS_SOLD INT (10),
    ORIGINAL_FORMAT CHAR (1),
    LABEL_ID BIGINT,
    constraint MUSIC_ALBUM_ARTIST_ID_fk FOREIGN KEY (ARTIST_ID) REFERENCES MUSIC_ARTIST(ARTIST_ID),
    constraint MUSIC_ALBUM_LABEL_ID_fk FOREIGN KEY (LABEL_ID) REFERENCES MUSIC_LABEL(LABEL_ID),
    constraint MUSIC_ALBUM_ORIGINAL_FORMAT_fk FOREIGN KEY (ORIGINAL_FORMAT) REFERENCES MUSIC_FORMAT(FORMAT_ID)
);