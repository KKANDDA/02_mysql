-- 1. 모든 영화관에서 총 몇개의 좌석이 예약되었나요?
-- 2. 가장 많이 예약된 영화는 어떤거고 몇석이 되었나요?
-- 3. 특정 영화의 남은 좌석 수를 확인 해주세요 (아무거나 골라서)

USE CINEMA;

-- 1. 모든 영화관에서 총 몇개의 좌석이 예약되었나요?
SELECT
	SUM(MOVIE_RESERVED_SEATS)
  FROM
	MOVIE_TBL;
    
SELECT
	MOVIE_TITLE,
    SUM(MOVIE_RESERVED_SEATS)
  FROM
	MOVIE_TBL
GROUP BY
	MOVIE_TITLE;
    
    

-- 2. 가장 많이 예약된 영화는 어떤거고 몇석이 되었나요?
SELECT
	MOVIE_TITLE,
    MOVIE_RESERVED_SEATS
  FROM
	MOVIE_TBL
WHERE
	MOVIE_RESERVED_SEATS =(
    SELECT
    MAX(MOVIE_RESERVED_SEATS)
	  FROM MOVIE_TBL);
      
SELECT
	MOVIE_TITLE,
    MOVIE_RESERVED_SEATS
  FROM
	MOVIE_TBL
ORDER BY
	MOVIE_RESERVED_SEATS DESC
LIMIT 1;
  
  
-- 3. 특정 영화의 남은 좌석 수를 확인 해주세요 (아무거나 골라서)
SELECT
	MOVIE_TITLE,
	(MOVIE_TOTAL_SEATS - MOVIE_RESERVED_SEATS) AS REMAINING_SEATS
  FROM
	MOVIE_TBL
WHERE
	MOVIE_ID = 1;


















