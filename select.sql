-- SELECT
/* MYSQL 에서 가장 기본적인 명령어로 특정 테이블에서 원하는 데이터를 조회해 가져오는데 사용 된다.*/

-- 단일 쿼리 실행 crtl + enter
-- 페이지 전체 쿼리 실행 crtl + shift + enter
use menudb;

-- 단일 컴럼 데이터 검색
SELECT
	menu_name
  FROM tbl_menu;
  
  -- 여러 컬럼 데이터 검색
  SELECT
	menu_code,
	menu_name,
    menu_price
 FROM tbl_menu;
 
 -- 모든 컬럼 데이터 검색
 SELECT
	*
  FROM tbl_menu;
  
  
  -- SELECT 단독 사용
  SELECT 6+3;
  SELECT 6*3;
  
  SELECT NOW();