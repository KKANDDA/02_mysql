USE CINEMA;

-- 영화관 테이블
DROP TABLE IF EXISTS CINEMA_TBL;
CREATE TABLE IF NOT EXISTS CINEMA_TBL(
		CINEMA_ID INT AUTO_INCREMENT PRIMARY KEY,
        CINEMA_NAME VARCHAR(255) NOT NULL,
        CINEMA_LOCATION VARCHAR(255) NOT NULL
)ENGINE = INNODB;
INSERT INTO CINEMA_TBL
	(CINEMA_NAME, CINEMA_LOCATION)
VALUES
		("CGV", "서초구"),
        ("롯데시네마", "강남구"),
        ("씨네큐", "영등포구");

-- 영화 테이블
DROP TABLE IF EXISTS MOVIE_TBL;
CREATE TABLE IF NOT EXISTS MOVIE_TBL(
		MOVIE_ID INT AUTO_INCREMENT PRIMARY KEY, -- 영화 고유 번호
        MOVIE_TITLE VARCHAR(255) NOT NULL, -- 영화 제목
        MOVIE_SHOW_TIME TIMESTAMP NOT NULL, -- 영화 상영 시각
        MOVIE_TOTAL_SEATS INT NOT NULL, -- 배정된 총 좌석 수
        MOVIE_RESERVED_SEATS INT, -- 예약된 좌석 수
        CINEMA_ID INT NOT NULL, -- 영화관 고유 번호
        FOREIGN KEY (CINEMA_ID)
        REFERENCES CINEMA_TBL (CINEMA_ID)
)ENGINE = INNODB;
INSERT INTO MOVIE_TBL
	(MOVIE_TITLE, MOVIE_SHOW_TIME, MOVIE_TOTAL_SEATS, MOVIE_RESERVED_SEATS, CINEMA_ID)
VALUES
		("늘봄가든", "2024-08-23 14:00:00", 100, 45, 1),
		("에어리언", "2024-08-23 17:00:00", 150, 90, 1),
		("행복의나라", "2024-08-24 20:00:00", 120, 30, 2),
		("파일럿", "2024-08-25 19:00:00", 200, 50, 3);

-- 예약 테이블
DROP TABLE IF EXISTS RESERVATION_TBL;
CREATE TABLE IF NOT EXISTS RESERVATION_TBL(
		RESERVATION_NUM INT AUTO_INCREMENT PRIMARY KEY,
        USER_NAME VARCHAR(255) NOT NULL UNIQUE,
        SEAT_RESERVATION INT NOT NULL,
        MOVIE_ID INT NOT NULL,
        FOREIGN KEY (MOVIE_ID)
        REFERENCES MOVIE_TBL(MOVIE_ID)
)ENGINE = INNODB;
INSERT INTO RESERVATION_TBL
	(USER_NAME, MOVIE_ID, SEAT_RESERVATION)
VALUES
		("철수", 1, 2),
		("영희", 2, 4),
		("길동", 1, 3),
		("관순", 3, 1),
		("민식", 4, 5);

SELECT
	















        
		