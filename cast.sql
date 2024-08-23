-- SQL 형변환
-- 명시적 형변환과 암시적 형변환이 있다.

-- 명시적 형변환

-- CAST : 어지간하면 다 있다.
-- CONVERT : MYSQL 에서 지원하는 키워드, 다른 프로그램에선 없을 수도 있다.

SELECT AVG(MENU_PRICE) FROM tbl_menu;

SELECT 
	CAST(AVG(MENU_PRICE) AS SIGNED INTEGER) AS "평균 메뉴 가격" 
  FROM TBL_MENU;
  
SELECT
	CONVERT(AVG(MENU_PRICE), SIGNED INTEGER) AS "평균 메뉴 가격"
  FROM TBL_MENU;
  
-- 가능한 데이터 형식
-- BINARY, CHAR, DATE, DATETIME, DECIMAL, JSON, TIME, INTGER

SELECT
	CAST("2023&5&30" AS DATE),
    CAST("2023/5/30" AS DATE),
    CAST("2023%5%30" AS DATE),
    CAST("2023@5@30" AS DATE);
    
-- 메뉴 가격 구하기
SELECT
	CONCAT(CAST(MENU_PRICE AS CHAR(5)), "원") -- 콘캣은 문자열을 더해주는 함수 키워드
  FROM
	TBL_MENU;
    
-- 카테고리별로 메뉴 가격의 합계를 구해서
-- (카테고리 ~~원) 으로 표시해 주세요.

SELECT
	CATEGORY_CODE,
    CONCAT(CAST(SUM(MENU_PRICE) AS CHAR(10)), "원") AS "가격 합계"
  FROM
	TBL_MENU
GROUP BY 
	CATEGORY_CODE;
    
    
-- 암시적 형변환
-- 자동으로 내부에서 이루어지는 형변환
SELECT '1'+'2'; -- 각 문자가 정수로 변환됨.
SELECT concat(MENU_PRICE, "원")FROM TBL_MENU; -- 문자로 변환
SELECT 3>"TEXT"; -- 문자는 0으로 변환
SELECT 3>"4TEXT"; -- 문자 앞에 숫자가 나오면 1으로 변환 -- 1: TRUE, 0: FALSE

    
    











